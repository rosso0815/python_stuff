
[index](../README.md)

# Hello Wold

lets do some stuff

we learn Ansible 

```
VBoxManage startvm "centos7" --type headless

VBoxManage controlvm "centos7" poweroff --type headless


ansible-inventory -v -i inventory.yml  --list --yaml

# dump infos
ansible localhost -m setup

ansible-playbook -v -i hosts.yml HelloWorld.yml




# use ansible.cfg
ansible-playbook -v -HelloWorld.yml

ansible-playbook release.yml -e "swpkg=1.23.45"


```

https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html

https://passingcuriosity.com/2013/dnsmasq-dev-osx/

ansible-galaxy collection install community.general