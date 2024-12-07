
from typing import List

class Server():

    # clients: List['Client'] 

    def __init__(self):
        self.clients : List['Client'] =[]

    def register_client(self, client: 'Client') -> None:
        print(f'clients: {self.clients} type: {type(self.clients)}')
        self.clients.append(client)
        print('Client `%s` registered with server' % client.name)

    def print_clients(self) -> None:
        for i, client in enumerate(self.clients):
            print('client %i: %s' % (i, client.name))

    @staticmethod
    def build_clone(server: 'Server') -> 'Server':
        print(f'server.clients: {server.clients}')
        svr_new: Server = Server()
        for client in server.clients:
            print('clone')
            svr_new.register_client(client)
        return svr_new

class Client():
    name: str = None
    def __init__(self, name: str, server: 'Server'):
        self.name = name
        server.register_client(self)


svr = Server()
cli = Client('foo', svr)
svr.print_clients()

svr_clone = Server.build_clone(svr)
svr_clone.print_clients()