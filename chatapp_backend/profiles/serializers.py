from rest_framework.serializers import ModelSerializer
from .models import *

class AuthorSerializer(ModelSerializer):
    class Meta:
        model = MyUser
        fields = ['username']


class UserSerializer(ModelSerializer):
    class Meta:
        model = MyUser
        fields = ['username', 'first_name', 'last_name', 'email', 'phone_number', 'bio']