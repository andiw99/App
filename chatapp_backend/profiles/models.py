from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
from django.contrib.auth.models import AbstractUser
import phonenumbers

# Create your models here.
class MyUser(AbstractUser):
    friends = models.ManyToManyField("self", blank=True)
    bio = models.TextField(default="", max_length=1024)
    phone_number = PhoneNumberField(null=True, blank=True, unique=False)        # TODO add unique to this field, this somehow doesnt work if it is a new field without deleting DB which I dont want to do now
