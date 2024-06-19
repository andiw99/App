from django.urls import path
from . import views
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('', views.getEndpoint, name="lobby"),
    path('chatlobby/', views.getLobby),
    path('getChatMessages/', views.getChatMessages, name="getChatMessages"),
    path('api-token-auth/', obtain_auth_token),
    path('get-authentication/', views.getAuthentication)

]