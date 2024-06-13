from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['GET'])
def getEndpoint(request):
    response = {
        'Endpoint': '',
        'method': 'get',
        'body': 'test',
        'description': 'test api response'
    }
    return Response({"test": "test"})

def getLobby(request):
    return render(request, 'chat/lobby.html')