#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=aks-internal.hmcts.net"
kubectl -n cnp create secret tls traefik-tls-cert --key=tls.key --cert=tls.cr