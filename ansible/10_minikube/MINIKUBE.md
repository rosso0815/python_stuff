# testing KNATIVE

follow https://knative.dev/v0.3-docs/install/knative-with-minikube/

follow http://heidloff.net/article/setup-local-development-kubernetes-istio

## install minikube without kubernetes installed

https://kubernetes.io/de/docs/setup/minikube/


rm -rf ~/.minikube

minikube config set cpus 4
minikube config set memory 8192
minikube config set disk-size 20g

minikube start

eval $(minikube docker-env)

minikube ip

minikube dashboard

# deploy stateless app see https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment

kubectl apply -f https://k8s.io/examples/application/deployment.yaml

kubectl describe deployment nginx-deployment

kubectl get pods -l app=nginx

# ----------------------------




# ISTIO

```
minikube start --memory=8192 --cpus=4 \
  --kubernetes-version=v1.16.2 \
  --vm-driver=hyperkit \
  --disk-size=30g \
  --extra-config=apiserver.enable-admission-plugins="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook"
```

eval $(minikube docker-env)


## istio

https://dimitr.im/setting-up-minikube-istio-macos

brew install kubectl

```
kubectl apply -f https://github.com/knative/serving/releases/download/v0.3.0/istio-crds.yaml

curl -L https://github.com/knative/serving/releases/download/v0.3.0/istio.yaml  | sed 's/LoadBalancer/NodePort/' > /var/tmp/istio

kubectl apply --filename /var/tmp/istio

# Label the default namespace with istio-injection=enabled.
kubectl label namespace default istio-injection=enabled

kubectl get pods --namespace istio-system

```

which minikube
minikube start --container-runtime=crio --driver=podman -v=4
kubectl run httpd --image=httpd
kubectl get po
kubectl get no
kubectl describe po
kubectl get po
kubectl describe po
minikube ssh sudo crioctl image list
minikube ssh -- sudo docker ps -a
minikube delete

# CF
# https://starkandwayne.com/blog/running-cloud-foundry-on-kubernetes-using-kubecf/

# https://github.com/cloudfoundry-incubator/cf-operator/tree/master/deploy/helm/cf-operator

kubectl delete namespace cf-operator

kubectl create namespace cf-operator

helm install cf-operator \
  --namespace cf-operator \
  --set "global.operator.watchNamespace=kubecf" \
  /Users/pfistera/workspace/cf-operator/helm/cf-operator-3.0.0+68.g00fc3dd9.tgz
  
