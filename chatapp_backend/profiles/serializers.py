from rest_framework.serializers import ModelSerializer
from rest_framework import serializers
from .models import *
from os import path

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


class GalleryPictureNameSerializer(ModelSerializer):
    image = serializers.ImageField(required=True)

    class Meta:
        model = GalleryPicture
        fields = ['owner', 'image']

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation['image'] = path.basename(representation['image'])
        return representation
    