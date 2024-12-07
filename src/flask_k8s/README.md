# Flask Example for Docker and Kubernetes (Minikube)

see https://kubernetes.io/blog/2019/07/23/get-started-with-kubernetes-using-python/

### Docker

```bash
docker build . -t hello-python:latest

docker run -d -p 8080:8080 --name flask hello-python:latest

curl -L http://localhost:8080

```

### Minikube:

```bash

rm -rf ~/.minikube

minikube config set cpus 4
minikube config set memory 8192
minikube config set disk-size 20g

minikube start

eval $(minikube docker-env)

docker build -f Dockerfile -t hello-python:latest .

minikube kubectl get nodes

kubectl apply -f deployment.yaml

# kubectl run flask-kubernetes-example --image=flask-kubernetes-example:latest --port=8080 --image-pull-policy=Never

kubectl get deployments

kubectl get pods --all-namespaces

curl $(minikube service hello-python-service --url)

```

nerdctl -n k8s.io build -f Dockerfile -t k8s.io/hello-python:1.0.0 .
kubectl apply -f k8s_deployment.yml
kubectl apply -f k8s_service.yml

