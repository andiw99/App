from rest_framework.serializers import ModelSerializer
from .models import FriendRequest
from profiles.serializers import AuthorSerializer
from profiles.models import MyUser

class FriendsSerializer(ModelSerializer):
    class Meta:
        model = MyUser
        fields = ['id', 'username']

class FriendrequestSerializer(ModelSerializer):
    sender = AuthorSerializer()
    
    class Meta:
        model = FriendRequest
        fields = ["sender", "datetime"]


