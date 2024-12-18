from django.http import JsonResponse
from django.shortcuts import render
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from .forms import MyUserChangeForm, UserCreateForm
from .serializers import AuthorSerializer, UserSerializer, GalleryPictureSerializer, GalleryPictureNameSerializer
from rest_framework import status
from django.shortcuts import get_object_or_404
from .models import GalleryPicture, ProfilePicture
import os
import base64

# Create your views here.
IMAGE_PATH = "media/images"

@api_view(['GET', 'POST'])
def getAuthentication(request):    
    serializer = AuthorSerializer(request.user)

    return Response(serializer.data)

# TODO we will do this with flutter if this someday goes to production
from django.views.decorators.csrf import csrf_exempt
@csrf_exempt
@api_view(['POST'])
def signUpView(request):      
    form = UserCreateForm(request.POST)
    if form.is_valid():            # then we save the user? 
        new_user = form.save()
        return JsonResponse({'statuscode': 200, 'statusmessage': 'successfully registered. Please log in'})                    
    return JsonResponse({'statuscode': 400, 'statusmessage': 'error', 'errors': form.errors}, status=400)


@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def getUserInfo(request):
    user = request.user
    # We just serialize this user and send it back
    serializer = UserSerializer(user)
    return Response(serializer.data)

@csrf_exempt
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
@api_view(['POST'])
def changeUserInfo(request):      
    form = MyUserChangeForm(request.POST, instance=request.user)
    if form.is_valid():            # then we save the user? 
        new_user = form.save()
        return JsonResponse({'statuscode': 200, 'statusmessage': 'successfully changed info'})                    
    return JsonResponse({'statuscode': 400, 'statusmessage': 'error', 'errors': form.errors}, status=400)


@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
@api_view(['POST'])
def receiveUserImage(request):
    print(request.user)
    print(request.data)
    request.data['owner'] = request.user.pk
    serializer = GalleryPictureSerializer(data=request.data)
    print(serializer.is_valid())
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)        # What is the actual difference between JsonResponse and Response
    else:
        print(serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def getUserImages(request):
    # this interface should send the gallery profile picture names to Flutter
    user = request.user
    images = user.gallerypicture_set.all()
    print(images)
    serializer = GalleryPictureNameSerializer(images, many=True)

    return Response(serializer.data)


def sendImage(image_path, image_name=""):
    try:
        if not image_name:
            image_name = os.path.basename(image_path)
        # Check if file exists
        if not os.path.isfile(image_path):
            print("It does not somehow")
            return JsonResponse({
                'error': 'Image not found'
            }, status=404)
        
        # Read image file
        with open(image_path, 'rb') as image_file:
            print("opening working")
            # Encode image to base64
            encoded_image = base64.b64encode(image_file.read()).decode('utf-8')
            
            # Return JSON response with base64 encoded image
            return JsonResponse({
                'image_data': encoded_image,
                'filename': image_name
            })
    
    except Exception as e:
        print(e)
        return JsonResponse({
            'error': str(e)
        }, status=500)

@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def sendGalleryImage(request):
    # where do we get the image names from? should be send in the body of the get request?
    # No, probably just querystring
    image_name = request.GET.get('name')
    print("image_name = ", image_name)
    image_obj = get_object_or_404(GalleryPicture, image=f"{IMAGE_PATH}/full/{image_name}")
    # I guess we want to cache only the preview images?
    image_path = image_obj.preview_image.path
    print("image_path = ", image_path)
    return sendImage(image_path, image_name)


@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def deleteGalleryImage(request):
    # Get the image name from querystring
    image_name = request.GET.get('name')
    print("image_name to delete = ", image_name)
    image_obj = get_object_or_404(GalleryPicture, image=f"{IMAGE_PATH}/full/{image_name}")
    # I guess we want to cache only the preview images?
    try:
        print(image_obj.delete())
        return JsonResponse({'statuscode': 200, 'statusmessage': f'successfully deleted  {image_name}', }, status=200)   
    except Exception as e:
        print(e)
        return JsonResponse({
            'error': str(e)
        }, status=500)
