
kubectl run nginx --image=nginx --restart=Never

kubectl run curl --image=radial/busyboxplus:curl -i --tty --rm