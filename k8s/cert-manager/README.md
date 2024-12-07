
# 

# https://bytegoblin.io/blog/a-simple-ca-setup-with-kubernetes-cert-manager

# https://cert-manager.io/docs/configuration/selfsigned/

# https://medium.com/geekculture/a-simple-ca-setup-with-kubernetes-cert-manager-bc8ccbd9c2

# https://www.google.com/search?q=openssl+sign+csr+with+root+ca

# https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309

# https://stackoverflow.com/questions/49803845/kubernetes-ingress-tls

# https://whoami.localnet


kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.15.2/cert-manager.yaml

kubectl delete namespace sandbox

kubectl create namespace sandbox

kubectl apply -f issuer.yml -n sandbox

kubectl get issuers  -n sandbox -o wide selfsigned-issuer

kubectl apply -f certificate.yml

helm install -f values_whoami.yml whoami cowboysysop/whoami -n sandbox

# helm upgrade -f values_whoami.yml whoami cowboysysop/whoami -n sandbox




# kubectl apply -f cluster_issuer.yml 


# kubectl get clusterissuers -o wide selfsigned-cluster-issuer


# kubectl apply -f ingressroute.yml

# --- EOF
