# ---
# install gitea
# ---

curl -sfL https://get.k3s.io | \
    K3S_TOKEN=12345 \
    K3S_RESOLV_CONF=/etc/rancher/k3s/resolv.conf \
    INSTALL_K3S_EXEC="server \
    --bind-address 192.168.178.120 \
    --resolv-conf $K3S_RESOLV_CONF \
    --selinux \
    --write-kubeconfig-mode 644" \
    sh -s -

kubectl run my-shell --rm -i --tty --image ubuntu -- bash

# ---

https://gitea.localnet

helm install \
  cert-manager jetstack/cert-manager \
  --namespace gitea \
  --create-namespace \
  --version v1.15.3 \
  --set crds.enabled=true