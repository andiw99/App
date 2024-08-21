from django.urls import path
from . import views

urlpatterns = [    
    path('get-friends/', views.getFriends),
    path('search-friends/', views.searchFriends),
    path('send-friendrequest/', views.sendFriendrequest),
    path('accept-friendrequest/', views.acceptFriendrequest),
    path('decline-friendrequest/', views.declineFriendrequest),
    path('get-friendrequests/', views.getFriendRequests),
]