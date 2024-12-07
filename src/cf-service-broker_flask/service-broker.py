from typing import Union, List

import openbrokerapi
from openbrokerapi import api
from openbrokerapi.api import ServiceBroker
from openbrokerapi.catalog import ServicePlan
from openbrokerapi.service_broker import (
    Service,
    ProvisionDetails,
    ProvisionedServiceSpec,
    DeprovisionDetails,
    DeprovisionServiceSpec
)


class MyServiceBroker(ServiceBroker):
    def catalog(self) -> Union[Service, List[Service]]:
        return Service(
            id='service id',
            name='service name',
            description='service description',
            bindable=False,
            plans=[
                ServicePlan(
                    id='plan id',
                    name='plan name',
                    description='plan description',
                )
            ]
        )

    def provision(self,
                  instance_id: str,
                  details: ProvisionDetails,
                  async_allowed: bool,
                  **kwargs) -> ProvisionedServiceSpec:
        # Create service instance
        # ...

        return ProvisionedServiceSpec()

    def deprovision(self,
                    instance_id: str,
                    details: DeprovisionDetails,
                    async_allowed: bool,
                    **kwargs) -> DeprovisionServiceSpec:
        # Delete service instance
        # ...

        return DeprovisionServiceSpec(is_async=False)

print('Start server on 127.0.0.1:5000')
print('Check the catalog at:')
print('> curl 127.0.0.1:5000/v2/catalog -H "X-Broker-API-Version: 2.14"')
api.serve(MyServiceBroker(), None)

# Simply start the server
# api.serve(ExampleServiceBroker(), api.BrokerCredentials("", ""))

# or start the server without authentication
# api.serve(ExampleServiceBroker(), None)

# or start the server with multiple authentication
# api.serve(ExampleServiceBroker(), [api.BrokerCredentials("", ""), api.BrokerCredentials("", "")])

# or with multiple service brokers and multiple credentials
# api.serve_multiple([ExampleServiceBroker(), ExampleServiceBroker()], [api.BrokerCredentials("", ""), api.BrokerCredentials("", "")])

# or register blueprint to your own FlaskApp instance
# app = Flask(__name__)
# logger = basic_config()  # Use root logger with a basic configuration provided by openbrokerapi.log_util
# openbroker_bp = api.get_blueprint(ExampleServiceBroker(), api.BrokerCredentials("", ""), logger)
# app.register_blueprint(openbroker_bp)
# app.run("0.0.0.0")