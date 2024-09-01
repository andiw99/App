from rest_framework.serializers import ModelSerializer
from rest_framework import serializers
from .models import *

class AuthorSerializer(ModelSerializer):
    class Meta:
        model = MyUser
        fields = ['username']


class UserSerializer(ModelSerializer):
    class Meta:
        model = MyUser
        fields = ['username', 'first_name', 'last_name', 'email', 'phone_number', 'bio']

class GalleryPictureSerializer(ModelSerializer):
    image = serializers.ImageField(required=True)

    class Meta:
        model = GalleryPicture
        fields = ['owner', 'image']