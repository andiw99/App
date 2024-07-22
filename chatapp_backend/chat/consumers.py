import json
from channels.generic.websocket import WebsocketConsumer
from asgiref.sync import async_to_sync
from .models import *
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import User
from channels.auth import login, logout
import time         # TODO remove


NR_LOADED_MESSAGES = 20        # TODO put this in some suitable centralized place

class ChatConsumer(WebsocketConsumer):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.chat_group = None          # TODO is this safe? does it need to be a class attribute? Why did I do that?

    def connect(self):
        print(self.scope['headers'])
        print("#####\n#####\n#####")
        print(self.scope["subprotocols"])
        headers = dict(self.scope['headers'])
        print("#####\n#####\n#####")
        print(headers)
        print("#####\n#####\n#####")
        for key in headers:
            print(key, "  ", headers[key])

        for key in self.scope:
            print(key, "   ", self.scope[key])

        user = self.scope['user']
        print(user)

        login(self.scope, user)     # I am at the moment not sure if this is even useful? But we can get the user here and we can see if this user is alleged to join this chatroom
        # save the session (if the session backend does not access the db you can use `sync_to_async`)
        self.scope["session"].save()

        #print(headers['authorization'])
        # print(headers["Authentication"])
        # 'Best Group' is name of first chatgroup that I created in the DB
        # I think it is useful / OK if the channel_layer group and the DB group have the same name?
        self.room_group_name = "BestGroup"       # group name that would usually be a dynamic value from URL, basically on which chatroom the user clicked. Aaah doesn't really work because this group name does not allow spaces and stuff
        db_group_name = "Best Group"    # So we have to get these two names somehow seperately (from the URL?) self.room_group_name needs to be unique definitely
                # Instead of only sending connection status, we should also send the chat messages from the DB
        # in production these should also be saved on the device that is running the app so one can look at the chats without service? (internet connection) 
        # so we get the latest messages here. First, get the specific group instance
        self.chat_group = get_object_or_404(ChatGroup, name=db_group_name)        # the thing is, if we identify the chat group by its name it should be unique or it is ambiguous which group we want here
        if user in self.chat_group.subscribers.all():
            self.accept()       # This accept should in production probably only be invoked if the user is authorized to enter the chatroom. Makes me wonder how this will work eventually at all as Flutter and Django a basically decoupled and we only send json objects. Will this be some public/private key stuff? Anyway, this is a problem for future andi and I mean this has to work somehow
        else:
            print("You, good sir, are NOT logged in (or not authorized to view this chat)")
            self.close()          # TODO we just return here for now, later we might should add a message like 'not logged in' or 'no authorization for this chatroom'


        # so I think channel_layer.group_add(self.room..., self.channel) adds the channel of this consumer to the specified group, basically saying, this chat consumer is now in this chat group
        # I guess async_to_sync (which seems to be a wrapper) means something like when I connect and already see the page(I dont know when it happens), we want to wait for it to sync up here so that we get added to the group before posting something
        # stackoverflow: async_to_sync turns an awaitable into a synchronous callable
        # which would not reach the others 
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,   
            self.channel_name
        )
        

        # TODO get group idetifier from URL / request and have it unique (every DB element has a primary key(pk) but what was the reason one had not to use it?)  
        # From the group we can get the messages by
        messages = self.chat_group.chatmessage_set.all()[:NR_LOADED_MESSAGES] # This is a Queryset, we only want to send json data with author, message etc. We only retrieve the 20 latest messages
        # TODO Do we send the messages one by one? Would be easiest at the moment and probably not to crucial performance wise
        # I think an alternative would be to construct a second type of json dic that we send out with a different type than 'chat' that is handled differently by flutter


        self.send(text_data=json.dumps({
            'type': 'connection_established',
            'message': 'You are now connected!'
        }))

        for msg in messages[::-1]:      # reverse order?
            # time.sleep(0.01)
            text = msg.message
            author = msg.author
            msg_dic = {
            'type': 'chat',
            'author': author.username,       # remember that the author is not just a string but a user object
            'message': text
            }
            self.send(text_data=json.dumps(msg_dic))

    
    def receive(self, text_data):
        print("text data = ", text_data)
        text_data_json = json.loads(text_data)  # the text_data is send by the javascript script in lobby.html. It sends a json like {'message' : "actual text message content"}
        message = text_data_json['message']     # extracting the "actual text message content" into message variable
        author = text_data_json['author']

        print("json_data = ", text_data_json)   
        print("message: ", message)

        # async to sync here so that my messages keep the correct order?
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type': 'chat_message', # This is the name of the function that is supposed to handle this message. Wild, havent seen something like this yet
                'message': message,
                'author': author
            }   
        )
        # We save the message to the DB only if it passed? How do we get the author? If we just get it by username
        # cant anyone just send a json with the username and it would look like the user send it?
        # But I think this should be a problem of the handshake, unauthorized users should not even be able
        # to connect to the websocket
        user = get_object_or_404(User, username=author)         # Again usernames have to be unique
        msg = ChatMessage(group=self.chat_group, author=user, message=message)          # I think we dont have to provide the datetime as it has a default
        msg.save()          # Save the message to the DB

    def chat_message(self, event):
        message = event['message']
        author_username = event['author']

        self.send(text_data=json.dumps({
            'type': 'chat',
            'author': author_username,
            'message': message
        }))