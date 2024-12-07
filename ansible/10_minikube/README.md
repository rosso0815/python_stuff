
https://kubernetes.io/de/docs/reference/kubectl/cheatsheet/


kubectl get pods --all-namespaces 

 https://www.bogotobogo.com/GoLang/GoLang_Web_Building_Docker_Image_and_Deploy_to_Kubernetes.php
 

minikube config set cpus 4
minikube config set memory 8192
minikube config set disk-size 20g

eval $(minikube docker-env)

docker build . -t hello  
docker run -d -p 8080:8080 --name hello hello

# https://stackoverflow.com/questions/42564058/how-to-use-local-docker-images-with-minikube
docker build -t foo:0.0.1 .
kubectl run hello-foo --image=foo:0.0.1 --image-pull-policy=Never

# Check that it's running
kubectl get pods





kubectl get svc
kubectl get pods
kubectl get deployments









kubectl create -f deployment.yml


minikube dashboard

# https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/
minikube addons enable ingress


https://medium.com/@adilsonbna/ansible-k8s-for-the-laziest-person-part-2-a0fea80c490c