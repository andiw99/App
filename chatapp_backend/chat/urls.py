from django.urls import path
from . import views
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('', views.getEndpoint, name="lobby"),
    path('chatlobby/', views.getLobby),
    path('getChatMessages/', views.getChatMessages, name="getChatMessages"),
    path('api-token-auth/', obtain_auth_token),
    path('get-authentication/', views.getAuthentication),
    path('get-chats/', views.getChatrooms),
    path('get-friends/', views.getFriends),
    path('create-group/', views.createGroup),
    path('search-friends/', views.searchFriends),
    path('send-friendrequest/', views.sendFriendrequest),
    path('accept-friendrequest/', views.acceptFriendrequest),
    path('decline-friendrequest/', views.declineFriendrequest),
    path('get-friendrequests/', views.getFriendRequests),
    path('signup/', views.signUpView),
    path('get-user-info/', views.getUserInfo),
    path('change-user-info/', views.changeUserInfo),
]