
from https://github.com/ansible-collections/community.docker




https://raw.githubusercontent.com/alibaba/ansible-provider-docs/master/contrib/inventory/docker.py


https://raw.githubusercontent.com/ansible/ansible/stable-2.9/contrib/inventory/docker.py

ansible-playbook -i docker.py test_docker_inventory.yml 
ansible-playbook -i docker.py playbook.yml -e 'ansible_python_interpreter=/usr/bin/python3'

