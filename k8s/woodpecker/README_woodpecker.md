
helm repo add woodpecker https://woodpecker-ci.org/

helm install woodpecker woodpecker/woodpecker


helm status woodpecker

helm show values woodpecker/woodpecker > values_woodpecker.yml

helm uninstall woodpecker

helm install -f values_woodpecker.yml woodpecker woodpecker/woodpecker


