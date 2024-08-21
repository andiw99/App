from django.db import models
from django.utils import timezone
from django.shortcuts import get_object_or_404
from profiles.models import MyUser

# Create your models here.
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

class MyImage(models.Model):
    image = models.ImageField(upload_to="media/images/full")
    preview_image = models.ImageField(upload_to="media/images/preview")     # We use a smaller version of the image to send it sometimes, for example when searching through users
    # owner = models.ForeignKey(MyUser)           # Images that are uploaded that way have a foreignkey to a user? Perspectively it might be attached to an event rather than a user..
    # 
    class Meta:
        abstract = True     # abstract class, objects cannot be istantiated

class UserImage(MyImage):
    # This will be the model for images that are attached to users?
    owner = models.ForeignKey(MyUser, on_delete=models.CASCADE)     

    class Meta:
        abstract = True     # abstract class, objects cannot be istantiated

class ProfilePicture(UserImage):
    pass # lol, but we still do this to divide gallery pictures and profile pictures

class GalleryPicture(UserImage):
    pass # lol, but we still do this to divide gallery pictures and profile pictures