# boilerplate-devops

## config.yaml para criação de um cluster kubernetes no Kind com 3 nodes.

### Comando para criação do cluster

kind create cluster --config config.yaml --name nome-do-cluster --kubeconfig config

O comando "--config" especifica qual arquivo contém a configuração de criação do cluster, nesse caso é o arquivo config.yaml

O comando --name especifica o nome do cluster para criação e o comando --kubeconfig é nome dado para o arquivo que irá ser criado onde contém toda a configuração e contexto do Kubernetes.