from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
from django.contrib.auth.models import AbstractUser
import phonenumbers
from PIL import Image
from django.core.files.base import ContentFile
import io

# Create your models here.
class MyUser(AbstractUser):
    friends = models.ManyToManyField("self", blank=True)
    bio = models.TextField(default="", max_length=1024)
    phone_number = PhoneNumberField(null=True, blank=True, unique=False)        # TODO add unique to this field, this somehow doesnt work if it is a new field without deleting DB which I dont want to do now

class MyImage(models.Model):
    image = models.ImageField(upload_to="media/images/full")
    preview_image = models.ImageField(upload_to="media/images/preview")     # We use a smaller version of the image to send it sometimes, for example when searching through users
    # owner = models.ForeignKey(MyUser)           # Images that are uploaded that way have a foreignkey to a user? Perspectively it might be attached to an event rather than a user..
    # 
    class Meta:
        abstract = True     # abstract class, objects cannot be istantiated

    def save(self, *args, **kwargs):
        self.create_preview_image()
        super().save(*args, **kwargs)


    def create_preview_image(self):
        print("Called")
        if self.image:
            print("Also called")
            img = Image.open(self.image)
            img.thumbnail((100, 100))  # Adjust size as needed
            thumb_io = io.BytesIO()
            img.save(thumb_io, format='JPEG')
            self.preview_image.save(
                f'preview_{self.image.name}',       # this is how claude would call the preview images
                ContentFile(thumb_io.getvalue()),
                save=False
            )

class UserImage(MyImage):
    # This will be the model for images that are attached to users?
    owner = models.ForeignKey(MyUser, on_delete=models.CASCADE)     

    class Meta:
        abstract = True     # abstract class, objects cannot be istantiated

class ProfilePicture(UserImage):
    pass # lol, but we still do this to divide gallery pictures and profile pictures

class GalleryPicture(UserImage):
    pass # lol, but we still do this to divide gallery pictures and profile pictures