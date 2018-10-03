#!/bin/bash

AKS_RESOURCE_GROUP=cnp-aks-sandbox-rg
AKS_CLUSTER=cnp-aks-sandbox-cluster

INFRA_RESOURCE_GROUP=`az aks show --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER --query nodeResourceGroup -o tsv`
az storage account create --resource-group $INFRA_RESOURCE_GROUP --name akssasandbox --sku Standard_LRS