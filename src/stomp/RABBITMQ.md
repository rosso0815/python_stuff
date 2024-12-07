# RABBITMQ


## OSX

# enable ui plugin
/usr/local/sbin/rabbitmq-plugins enable rabbitmq_management

# create a user
/usr/local/sbin/rabbitmqctl add_user pfistera andreas
# tag the user with "administrator" for full management UI and HTTP API access
/usr/local/sbin/rabbitmqctl set_user_tags pfistera administrator



brew services start rabbitmq

http://localhost:15672