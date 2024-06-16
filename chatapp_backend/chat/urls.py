from django.urls import path
from . import views

urlpatterns = [
    path('', views.getEndpoint, name="lobby"),
    path('chatlobby/', views.getLobby),
    path('getChatMessages/', views.getChatMessages, name="getChatMessages")
]