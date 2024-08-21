from django.urls import path
from . import views
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('api-token-auth/', obtain_auth_token),
    path('get-authentication/', views.getAuthentication),
    path('signup/', views.signUpView),
    path('get-user-info/', views.getUserInfo),
    path('change-user-info/', views.changeUserInfo),
]