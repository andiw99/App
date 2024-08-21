from django.shortcuts import get_object_or_404, render
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from .serializers import *
from profiles.models import MyUser as User
# Create your views here.
@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def getFriends(request):
    # Alright, so we need to login the user or is it automatically logged in if the authentication works right?
    # Is it now using this TokenAuthMiddleWarestack or not?
    # supposed it already works, 
    user = request.user
    print(f"User: {user}")
    friends = user.friends.all()
    print(friends)
    serializer = FriendsSerializer(friends, many=True)

    return Response(serializer.data)


@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def getFriendRequests(request):
    user = request.user
    
    friendrequests = user.received_friendrequests.all().order_by('-datetime')
    print(friendrequests)
    serializer = FriendrequestSerializer(friendrequests, many=True)

    return Response(serializer.data)

@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def searchFriends(request):
    # Alright, so we need to login the user or is it automatically logged in if the authentication works right?
    # Is it now using this TokenAuthMiddleWarestack or not?
    # supposed it already works, 
    user = request.user
    querystring = request.GET.get('username')
    friends = User.objects.filter(username__icontains=querystring).exclude(username__in=user.friends.all().values('username'))

    serializer = FriendsSerializer(friends, many=True)

    return Response(serializer.data)

@api_view(['POST'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def sendFriendrequest(request):
    sender = request.user
    body = request.POST

    receiver_name = body.get('username')
    receiver = get_object_or_404(MyUser, username=receiver_name)

    # existing_friendrequest = FriendRequest.objects.filter(sender=sender, receiver=receiver).exists()
    if FriendRequest.objects.filter(sender=sender, receiver=receiver).exists():
        return Response({"status": "friend request already pending"})
    else:
        # Create the request
        friendrequest = FriendRequest(sender=sender, receiver=receiver)
        friendrequest.save()    

        # We should return something like a statuscode?
        return Response({"status": "friend request sent"})
    

@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def acceptFriendrequest(request):
    receiver = request.user
    sender_name = request.GET.get('username')   # decided for querystring

    sender = get_object_or_404(MyUser, username=sender_name)

    # Retrieve the request
    friendrequest = get_object_or_404(FriendRequest, sender=sender, receiver=receiver)
    friendrequest.accept(receiver)          # Not sure if the check i implemented in accept is even needed    

    # We should return something like a statuscode?
    return Response({"status": "friend request accepted"})


@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAuthenticated])
def declineFriendrequest(request):
    receiver = request.user
    sender_name = request.GET.get('username')   # decided for querystring

    sender = get_object_or_404(MyUser, username=sender_name)

    # Retrieve the request
    friendrequest = get_object_or_404(FriendRequest, sender=sender, receiver=receiver)
    friendrequest.decline(receiver)          # Not sure if the check i implemented in accept is even needed    

    # We should return something like a statuscode?
    return Response({"status": "friend request denied"})
