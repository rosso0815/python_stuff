#!/usr/bin/env python

import subprocess

from cloudfoundry_client.client import CloudFoundryClient
from cloudfoundry_client.operations.push.push import PushOperation


def getClient(target, token):
    client = CloudFoundryClient(target,  verify=False)
    client.refresh_token = token
    client._access_token = token
    return client


def listApps(client):
    for app in client.v2.apps:
        print("name = "+app['entity']['name'])


def pushApp(client):
    print("pushApp client "+str(client))

    operation = PushOperation(client)
    print("operation="+str(operation))
    guid=client.v2.spaces.get_first(name='my-space')['metadata']['guid']
    print("guid="+guid)
    operation.push( guid,"/home/pfistera/workspace/ap-python/main/flask_simple_rest/manifest.yml")


def main():
    process = subprocess.Popen(['cf', 'oauth-token'],
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)

    stdout, stderr = process.communicate()
    token = stdout.decode('utf-8')
    token = token.strip()
    token = token.replace("bearer ","")
    print("stdout=x"+ token+"x")
    client = getClient('https://api.vcap.me',token)

    listApps(client)

    pushApp(client)


if __name__ == "__main__":
    main()