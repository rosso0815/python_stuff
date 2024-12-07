#! /usr/bin/env bash

set -aeEux
set -o pipefail


generate_csr(){
    echo "[INFO] @@@ generat_csr $1"
    cat << __EOF > "$1".conf
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
req_extensions=v3_req
prompt = no
[req_distinguished_name]
C = CH
ST = ZH
L = Zuerich
O = Rosso0815
OU = HomeLab
CN = $1
[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS = $1
[SAN]
subjectAltName=DNS:$1
__EOF

openssl req -x509 \
    -nodes \
    -days 200 \
    -newkey rsa:2048 \
    -keyout "$1"-cert.pem \
    -out "$1"-cert.pem \
    -config "$1".conf -extensions 'v3_req'

    openssl genrsa -out "$1".key 2048

    openssl req -new -sha256 \
        -key "$1".key \
        -subj "/C=CH/ST=ZH/O=Rosso0815/CN=$1" \
        -reqexts SAN \
        -config "$1".conf \
        -out "$1".csr

    openssl req -in "$1".csr -noout -text


    openssl x509 -req \
        -in "$1".csr \
        -CA rootCA.crt -CAkey rootCA.key \
        -CAcreateserial \
        -out "$1".crt \
        -days 500 -sha256

    openssl x509 -in "$1".crt -text -noout
}

generate_openssl_rootca () {

    echo "{INFO] generate_openssl_rootca"

    if [[ ! -f rootCA.key ]] ; then
        echo "{INFO] generate rootCA.key"
        openssl genrsa -out rootCA.key 4096
    fi

    if [[ ! -f rootCA.crt ]] ; then
        echo "{INFO] generate signet RootCA"
        cat<<__EOF>req.conf
[req]
prompt = no 
distinguished_name	= req_distinguished_name
attributes		= req_attributes
[req_distinguished_name]
C = CH
ST = ZH
L = Zuerich
O = Rosso0815
OU = HomeLab
CN = homelab
[ req_attributes ]
challengePassword = A challenge password
challengePassword_min = 4
challengePassword_max = 20
__EOF

        openssl req -x509 -config req.conf \
            -new -nodes \
            -key rootCA.key -sha256 \
            -days 1024 -out rootCA.crt
        # openssl req -new -x509 -sha256 \
        # -key rootCA.key \
        # -subj "/C=CH/ST=ZH/O=Rosso0815/CN=$1" \
        # -reqexts SAN \
        # -config <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:%s", "$1")) \
        # -out "$1".csr
    fi
}

#---

# generate_openssl_rootca

# generate_csr whoami.localnet
# openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout cert.pem -out cert.pem -config req.conf -extensions 'v3_req'

# kubectl delete namespace cert-manager || true

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.15.2/cert-manager.yaml

kubectl delete namespace sandbox || true

kubectl create namespace sandbox

# kubectl apply -f 01_self_issuer.yml

# kubectl apply -f 02_cert_ca_managed.yml
#
# kubectl apply -f 03_cert-manager-ca-issuer.yaml
#
# kubectl apply -f 04_test-server-cert.yaml
#
# helm install -f 05_values_whoami.yml whoami cowboysysop/whoami -n sandbox
#
# curl -kv https://whoami.localnet/

# kubectl get issuers  -n sandbox -o wide selfsigned-issuer

# kubectl apply -f certificate.yml

# T_NAMESPACE=sandbox

# cat << __EOF

# kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.15.2/cert-manager.yaml

# kubectl delete namespace ${T_NAMESPACE-default}

# kubectl create namespace ${T_NAMESPACE-default}

# helm install whoami cowboysysop/whoami -n ${T_NAMESPACE-default}

# helm upgrade -f values_whoami.yml whoami cowboysysop/whoami -n ${T_NAMESPACE-default}

# envsubst < issuer.yml | kubectl apply -f -

# envsubst < cert_ca_managed.yml | kubectl apply -f -

# kubectl create -f test-server-cert.yaml

# helm apply -f cluster_issues.yml

# __EOF
