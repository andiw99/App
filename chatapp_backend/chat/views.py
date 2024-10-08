from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import get_object_or_404
from .models import *
from .consumers import NR_LOADED_MESSAGES
from .serializers import *
from profiles.models import MyUser as User
from .models import ChatGroup

@api_view(['GET'])
def getEndpoint(request):
    response = {
        'Endpoint': '',
        'method': 'get',
        'body': 'test',
        'description': 'test api response'
    }
    return Response({"test": "test"})

def getLobby(request):
    return render(request, 'chat/lobby.html')


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def getChatMessages(request):
    # TODO IMPORTANT WE NEED SOME KIND OF VERIFICATION HERE, IF ANYONE CAN SEND THIS REQUEST, CHATROOMS WOULD BE PUBLIC
    # TODO is this done through IsAuthenticated or does this do nothing?
    group_identifier = int(request.GET.get('cr'))
    group = get_object_or_404(ChatGroup, id=group_identifier) # TODO dynamic resolve of group name
    # I think we will have to send some stuff with the request to see which messages should be loaded
    nr_existing_messages = request.GET.get('em')    # this will for sure be a string? Conversion of string to int unsafe?
    print("group:", group)
    print("request.GET in getChatMessages = ", request.GET)
    # TODO is this fishy again?
    try:
        nr_existing_messages = int(nr_existing_messages)
    except ValueError:
        nr_existing_messages = 0
    except TypeError:
        nr_existing_messages = 0
    print("nr_existing_messages = ", nr_existing_messages)
    messages = group.chatmessage_set.all()[nr_existing_messages:NR_LOADED_MESSAGES + nr_existing_messages]
    print("messages = ", messages)
    # Now we can use the serializer to convert these python objects to json data
    serializer = ChatMessageSerializer(messages, many=True)         # many=True because we serialize multiple messages 
    return Response(serializer.data)


@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def getChatrooms(request):
    # Alright, so we need to login the user or is it automatically logged in if the authentication works right?
    # Is it now using this TokenAuthMiddleWarestack or not?
    # supposed it already works, 
    user = request.user
    #print(f"User: {user}")
    chatgroups = user.chatgroup_set.all().order_by('-modified')
    serializer = ChatGroupSerializer(chatgroups, many=True)

    return Response(serializer.data)



@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def createGroup(request):
    user = request.user
    #print(request.body)
    body = request.POST #json.loads(request.body)     # The request at this URL should send the usernames of the chat parnter and a name for the group

    user_strings = body.get('users').split(', ')
    users = [user]
    for username in user_strings:
        # TODO check if user is friend to the ones he wants to chat to
        users.append(get_object_or_404(User, username=username))

    groupname = body.get('groupname')
    if not groupname:
        groupname = "Chat between " + ",".join(user_strings) + f", {user.username}"
    
    group = ChatGroup(name=groupname)    
    group.save()    # create the group and save it to DB
    group.subscribers.set(users)

    return Response(ChatGroupSerializer(group).data)



