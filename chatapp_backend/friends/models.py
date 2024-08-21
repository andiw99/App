from datetime import timezone
from django.db import models
from django.shortcuts import get_object_or_404

from profiles.models import MyUser

# Create your models here.
class FriendRequest(models.Model):
    sender = models.ForeignKey(MyUser, on_delete=models.CASCADE, related_name="sent_friendrequests")
    receiver = models.ForeignKey(MyUser, on_delete=models.CASCADE, related_name="received_friendrequests")      # If either sender or receiver is deleted the friend request becomes invalid
    datetime = models.DateTimeField(auto_now_add=True)

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
