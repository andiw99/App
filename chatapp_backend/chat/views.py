from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from .models import *
from .consumers import NR_LOADED_MESSAGES
from .serializers import *

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
def getChatMessages(request):
    # TODO IMPORTANT WE NEED SOME KIND OF VERIFICATION HERE, IF ANYONE CAN SEND THIS REQUEST, CHATROOMS WOULD BE PUBLIC
    group = get_object_or_404(ChatGroup, name="Best Group") # TODO dynamic resolve of group name
    # I think we will have to send some stuff with the request to see which messages should be loaded
    nr_existing_messages = request.GET.get('em')    # this will for sure be a string? Conversion of string to int unsafe?
    print(request.GET)
    # TODO is this fishy again?
    try:
        nr_existing_messages = int(nr_existing_messages)
    except ValueError:
        nr_existing_messages = 0
    except TypeError:
        nr_existing_messages = 0
    print("nr_existing_messages = ", nr_existing_messages)
    messages = group.chatmessage_set.all()[nr_existing_messages:NR_LOADED_MESSAGES + nr_existing_messages]
    # Now we can use the serializer to convert these python objects to json data
    serializer = ChatMessageSerializer(messages, many=True)         # many=True because we serialize multiple messages 
    return Response(serializer.data)

@api_view(['GET', 'POST'])
def getAuthentication(request):
    print(request.user)
    
    serializer = AuthorSerializer(request.user)

    return Response(serializer.data)
