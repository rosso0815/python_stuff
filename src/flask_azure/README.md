
export FLASK_APP=run.py 
export FLASK_ENV=development 
export FLASK_PORT=8080
flask run --port 8080


FLASK_APP=hello flask run


see https://medium.com/analytics-vidhya/how-to-test-flask-applications-aef12ae5181c

# Azure

https://learn.microsoft.com/en-us/azure/app-service/quickstart-python?tabs=flask%2Cwindows%2Cazure-cli%2Cazure-cli-deploy%2Cdeploy-instructions-azportal%2Cterminal-bash%2Cdeploy-instructions-zip-azcli

````
az login

az webapp up --runtime PYTHON:3.12 --sku F1 --logs --location 'Central US' --name python-start
````


