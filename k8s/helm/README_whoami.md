
helm repo add cowboysysop https://cowboysysop.github.io/charts/

helm install whoami cowboysysop/whoami

helm status whoami

helm show values cowboysysop/whoami > values_whoami.yml
<!-- containerPorts:
  ## @param containerPorts.http Container port for HTTP
  http: 8080 -->

helm uninstal whoami

helm install -f values_whoami.yml whoami cowboysysop/whoami


