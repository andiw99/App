from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.forms import ModelForm
from .models import MyUser

class UserCreateForm(UserCreationForm):
    class Meta(UserCreationForm):
        model = MyUser
        fields = ('email', 'username', 'password1', 'password2')


class MyUserChangeForm(UserChangeForm):
    class Meta(UserChangeForm):
        model = MyUser
        fields = ('email', 'first_name', 'last_name', 'phone_number')