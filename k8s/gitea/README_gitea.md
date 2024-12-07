


see https://www.digitalocean.com/community/tutorials/how-to-use-go-with-mongodb-using-the-mongodb-go-driver-de

see https://www.mongodb.com/blog/post/quick-start-golang--mongodb--modeling-documents-with-go-data-structures

http://localhost:8082

kubectl describe pods -n pfistera


## Oauth2

### Gitea

tbd

### Gitlab

https://www.hibit.dev/posts/53/gitlab-oauth20-access-for-web-application

### HTTP Session
https://github.com/alexedwards/scs?tab=readme-ov-file#basic-use

### HTTP Router
Chi https://github.com/go-chi/chi


## DOCKER

docker build . -t test:test

docker run -d -p 8080:8080 --name test test:test

## KUBECTL

kubectl --namespace kube-system  --address 0.0.0.0  port-forward deployments/traefik 9000:9000 &

http://master:9000/dashboard/

a small fix done by rosso0815


## CHANGELOG

git commit -a -m "Finally finished developing feature #1" --trailer "Changelog: added"

enable glab

feature postgres added

# GITEA REPOS

curl --user admin:$GITEA_TOKEN_WRITER --upload-file path/to/file.bin http://gitea.localnet/api/packages/admin/generic/test_package/1.0.0/

curl

http://gitea.localnet/api/packages/admin/generic/test_package/1.0.0/

\ "http://localhost:4000/api/v1/repos/test1/test1/issues" \
    -H "accept: application/json" \
    -H "Authorization: token 65eaa9c8ef52460d22a93307fe0aee76289dc675" \
    -H "Content-Type: application/json" -d "{ \"body\": \"testing\", \"title\": \"test 20\"}" -i


curl http://gitea.localnet/api/v1/user -H 'accept: application/json' -H "Authorization: token $GITEA_TOKEN_WRITER"


     --upload-file path/to/file.bin \
PUT https://gitea.example.com/api/packages/{owner}/generic/{package_name}/{package_version}/{file_name}


# Gitea Docker repo

https://github.com/opencoff/certik

openssl s_client -connect gitea.localnet:443 -showcerts </dev/null | openssl x509 -outform pem 2>/dev/null

docker --tlsverify --tlscacert=ca.pem -H=gitea.localnet version

certik -v gitea.db init gitea-ca

certik -v gitea.db server -i 192.168.178.21 gitea.localnet

certik gitea.db list

certik gitea.db export gitea.localnet

certik gitea.db export gitea.localnet -o server

openssl x509 -noout -text -in gitea.crt

https://blog.differentpla.net/blog/2022/02/04/gitea-https/

# --- EOF








helm repo add gitea-charts https://dl.gitea.com/charts/

helm install gitea gitea-charts/gitea


helm status gitea

helm show values gitea-charts/gitea > values_gitea.yml
<!-- containerPorts:
  ## @param containerPorts.http Container port for HTTP
  http: 8080 -->

helm uninstal gitea

helm install -n gitea -f values_gitea.yml gitea gitea-charts/gitea


