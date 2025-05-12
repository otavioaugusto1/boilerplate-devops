# boilerplate-devops

## config.yaml para criação de um cluster kubernetes no Kind com 3 nodes.

### Comando para criação do cluster

kind create cluster --config config.yaml --name gitops-demo --kubeconfig config


### Criar namespace para Argo CD
kubectl create namespace argocd

### Instalar Argo CD usando kubectl
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

### Verificar pods do Argo CD
kubectl get pods -n argocd

## Acessar o cluster

### Obter senha inicial do admin
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

### Expor Argo CD (em outro terminal)
kubectl port-forward svc/argocd-server -n argocd 8080:443

