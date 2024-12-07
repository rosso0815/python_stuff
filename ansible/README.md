# playWithAnsible

play with ansible

chapters

- [01_hello_world](01_hello_world/README.md)




# install Python 3 Virtual Environment

```
python3 -m venv venv
source venv/bin/activate
 525  source venv/bin/activate

python -m pip install pip==9.0.3
pip install ansible-container 


pip3 install ansible
```

# https://stafwag.github.io/blog/blog/2019/03/03/howto-use-centos-cloud-images-with-cloud-init/

virt-install \
  --memory 2048 \
  --vcpus 2 \
  --name tst \
  --disk /var/cloud/alma.qcow2,device=disk \
  --disk /var/cloud/config.iso,device=cdrom \
  --os-type Linux \
  --os-variant centos8 \
  --virt-type kvm \
  --graphics none \
  --network default \
  --import