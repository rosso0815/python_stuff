
https://docs.rancherdesktop.io/how-to-guides/hello-world-example --namespace k8s.io images ld-example

https://www.tauceti.blog/posts/kubernetes-the-not-so-hard-way-with-ansible-the-basics/

old : ansible-galaxy collection install community.kubernetes
new: ansible-galaxy collection install kubernetes.core

kubectl get namespace

nerdctl --namespace myapp build --tag nginx-helloworld:latest .
nerdctl --namespace myapp images | grep nginx-helloworld

kubectl run hello-world --image=nginx-helloworld:latest --image-pull-policy=Never --port=80
kubectl port-forward pods/hello-world 8080:80

# NEXUS

nerdctl login http://somsi:8082/repository/docker-group/ --insecure-registry

nerdctl build --tag somsi:8083/helloworld:v1.0 .

nerdctl push somsi:8083/helloworld:v1.0 

nerdctl pull somsi:8082/containous/whoami:latest
 --insecure-registry