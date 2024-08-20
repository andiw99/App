from channels.auth import AuthMiddlewareStack
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import AnonymousUser
from channels.db import database_sync_to_async

@database_sync_to_async
def get_user(token_key):
    try:
        token = Token.objects.get(key=token_key)
        return token.user
    except Token.DoesNotExist:
        return AnonymousUser()


class TokenAuthMiddlewareHeader:
    """
    Token authorization middleware for Django Channels 2
    """

    def __init__(self, app):
        # Store the ASGI application we were passed
        self.app = app

    async def __call__(self, scope, receive, send):
        headers = dict(scope['headers'])
        if b'authorization' in headers:
            #print("\n\n\n")
            #print(headers[b'authorization'])
            #print(type(headers[b'authorization']))
            #print("\n\n\n")
            token_name, token_key = headers[b'authorization'].decode().split()
            user = await get_user(token_key)
            scope['user'] = user
        return await self.app(scope, receive, send)
    
class TokenAuthMiddlewareProtocol:
    """
    Token authorization middleware for Django Channels 2
    """

    def __init__(self, app):
        # Store the ASGI application we were passed
        self.app = app

    async def __call__(self, scope, receive, send):
        protocols = scope['subprotocols']
        for protocol in protocols:
            #print(f"\n\n\n {protocol.split()} \n\n\n")            
            if protocol[:5] == "Token":
                try:
                    token_name, token_key = protocol.split()
                    user = await get_user(token_key)
                except ValueError:
                    user = AnonymousUser()
                scope['user'] = user
        return await self.app(scope, receive, send)
    
TokenAuthMiddlewareStack = lambda inner: TokenAuthMiddlewareProtocol(AuthMiddlewareStack(inner))