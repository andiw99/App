from django.http import JsonResponse
from django.shortcuts import render
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from .forms import MyUserChangeForm, UserCreateForm
from .serializers import AuthorSerializer, UserSerializer

# Create your views here.

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
