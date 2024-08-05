from rest_framework.serializers import ModelSerializer
from .models import *


class AuthorSerializer(ModelSerializer):
    class Meta:
        model = MyUser
        fields = ['username']

class ChatMessageSerializer(ModelSerializer):
    # This class will automatically convert a set of chatmessages to one json object that we can send to flutter
    author = AuthorSerializer()

    class Meta:
        model = ChatMessage
        fields = '__all__'
        depth = 1


class ChatGroupSerializer(ModelSerializer):
    class Meta:
        model = ChatGroup
        fields = ['id', 'name']


class FriendsSerializer(ModelSerializer):
    class Meta:
        model = MyUser
        fields = ['id', 'username']

