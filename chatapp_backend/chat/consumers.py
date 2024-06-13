import json
from channels.generic.websocket import WebsocketConsumer
from asgiref.sync import async_to_sync

class ChatConsumer(WebsocketConsumer):
    def connect(self):
        self.room_group_name = 'test'       # group name that would usually be a dynamic value from URL, basically on which chatroom the user clicked

        # so I think channel_layer.group_add(self.room..., self.channel) adds the channel of this consumer to the specified group, basically saying, this chat consumer is now in this chat group
        # I guess async_to_sync means something like when I connect and already see the page(I dont know when it happens), we want to wait for it to sync up here so that we get added to the group before posting something
        # stackoverflow: async_to_sync turns an awaitable into a synchronous callable
        # which would not reach the others 
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,   
            self.channel_name
        )
        
        self.accept()
        self.send(text_data=json.dumps({
            'type': 'connection_established',
            'message': 'You are now connected!'
        }))

    
    def receive(self, text_data):
        print("text data = ", text_data)
        text_data_json = json.loads(text_data)  # the text_data is send by the javascript script in lobby.html. It sends a json like {'message' : "actual text message content"}
        message = text_data_json['message']     # extracting the "actual text message content" into message variable
        origin = text_data_json['origin']

        print("json_data = ", text_data_json)   
        print("message: ", message)

        # async to sync here so that my messages keep the correct order?
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type': 'chat_message', # This is the name of the function that is supposed to handle this message. Wild, havent seen something like this yet
                'message': message,
                'origin': origin
            }   
        )

    def chat_message(self, event):
        message = event['message']
        origin = event['origin']

        self.send(text_data=json.dumps({
            'type': 'chat',
            'origin': origin,
            'message': message
        }))