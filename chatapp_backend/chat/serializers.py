from rest_framework.serializers import ModelSerializer
from .models import *
from django.contrib.auth.models import User


class AuthorSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['username']

class ChatMessageSerializer(ModelSerializer):
    # This class will automatically convert a set of chatmessages to one json object that we can send to flutter
    author = AuthorSerializer()

    class Meta:
        model = ChatMessage
        fields = '__all__'
        depth = 1
