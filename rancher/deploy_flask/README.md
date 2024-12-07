# k3s-local

````
nerdctl images

nerdctl build .

nerdctl namespace create pfistera

nerdctl -n pfistera build  -t pfistera/appython:1.0.0 .


nerdctl -n pfistera run -d -p 8081:8080 pfistera/appython:1.0.0

kubectl run --namespace pfistera --image pfistera/appython:1.0.0 appython

kubectl port-forward pods/expressapp 3000:3000


nerdctl -n pfistera  pull quay.io/quay/redis:latest