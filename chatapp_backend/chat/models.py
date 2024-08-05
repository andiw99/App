from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone

# Create your models here.
class MyUser(AbstractUser):
    friends = models.ManyToManyField("self", blank=True)

class ChatGroup(models.Model):
    name = models.CharField(max_length=128)        # unique = True would ensure that only one group with the same name property exists, but I dont think I want that
    subscribers = models.ManyToManyField(MyUser)      # A chatgroup can have multiple subscribers, a user can be in multiple chatgroups

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


