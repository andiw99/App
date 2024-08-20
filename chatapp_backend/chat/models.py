from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone
from django.shortcuts import get_object_or_404
from phonenumber_field.modelfields import PhoneNumberField
import phonenumbers

# Create your models here.
class MyUser(AbstractUser):
    friends = models.ManyToManyField("self", blank=True)

    bio = models.TextField(default="", max_length=1024)
    phone_number = PhoneNumberField(null=True, blank=True, unique=False)        # TODO add unique to this field, this somehow doesnt work if it is a new field without deleting DB which I dont want to do now

class ChatGroup(models.Model):
    name = models.CharField(max_length=128)        # unique = True would ensure that only one group with the same name property exists, but I dont think I want that
    subscribers = models.ManyToManyField(MyUser)      # A chatgroup can have multiple subscribers, a user can be in multiple chatgroups
    created = models.DateTimeField(default=timezone.now)
    modified = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.name            # just repjresentation stuff for admin view (or in console probably)


class ChatMessage(models.Model):
    # Every message has to be assigned to a group, if it is a 1-to-1 chat or anything else doesnt matter
    # If the ChatGroup is deleted, the messages with foreign keys to this group will also be deleted. (In other words the messages belongig to this group) -> on_delete=models.CASCADE
    # a related_name property would change the way one can access the messages starting from the group object. Atm it should be chatgroup_instance.chatmessage_set.all() (oder spezieller query statt all)
    # oder doch nur chatgroup_instance.chatmessage.all()?
    group = models.ForeignKey(ChatGroup, on_delete=models.CASCADE)
    # same stuff is true for the author of the message. As authors we use the built in django Users. Might change later but atm dont see why it would
    author = models.ForeignKey(MyUser, on_delete=models.CASCADE)
    message = models.CharField(max_length=500)          # The actual message. Has a maximum size. At the moment I dont know how one would incorporate smileys and stuff. Maybe through specific text prompts that would then be rendered specifically in flutter
    datetime = models.DateTimeField(default=timezone.now)                       # Plebs like to know when messages were send. Default value is now but it shall be able to change if the message is altered. Watch out that you have to pass the function and not call it


    def __str__(self):
        return f"{self.author.username} : {self.message}"           # username is attribute of built-in user mode
    
    class Meta:
        ordering = ['-datetime']            # default ordering when queing is newest first so that we can reload chats easier


    def save(self, *args, **kwargs):
        # This save method is supposed to update the ChatGroup's modified field if a Chatmessage is called
        # I think I have to retrieve the ChatGroup model first?
        group_instance = get_object_or_404(ChatGroup, id=self.group.id)      # this seems so wrong?
        group_instance.modified = timezone.now()        
        group_instance.save()
        super().save(*args, **kwargs)

class FriendRequest(models.Model):
    sender = models.ForeignKey(MyUser, on_delete=models.CASCADE, related_name="sent_friendrequests")
    receiver = models.ForeignKey(MyUser, on_delete=models.CASCADE, related_name="received_friendrequests")      # If either sender or receiver is deleted the friend request becomes invalid
    datetime = models.DateTimeField(default=timezone.now)

    def accept(self, user):
        # I have to pass in the user to check here that only the receiver can accept the request
        receiving_user = get_object_or_404(MyUser, username=self.receiver.username)
        if user == receiving_user:
            # If this is true we add the freinds to the sets
            sending_user = get_object_or_404(MyUser, username=self.sender.username)
            receiving_user.friends.add(sending_user)
            sending_user.friends.add(receiving_user)
            # also delete this friend request or do we just keep it
            self.delete()
    
    def decline(self, user):
        receiving_user = get_object_or_404(MyUser, username=self.receiver.username)
        if user == receiving_user:
            # I guess we just delete the request
            self.delete()

    def __str__(self):
        return f"Friendrequest from {self.sender.username} to {self.receiver.username}"

        
