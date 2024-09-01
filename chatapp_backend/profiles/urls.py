from django.urls import path
from django.conf import settings
from . import views
from rest_framework.authtoken.views import obtain_auth_token
from django.conf.urls.static import static

urlpatterns = [
    path('api-token-auth/', obtain_auth_token),
    path('get-authentication/', views.getAuthentication),
    path('signup/', views.signUpView),
    path('get-user-info/', views.getUserInfo),
    path('change-user-info/', views.changeUserInfo),
    path('upload-gallery-image/', views.receiveUserImage),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)