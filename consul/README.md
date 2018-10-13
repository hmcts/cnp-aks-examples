# Consul
## Overview
* Consul manifest derived from official Helm chart: https://github.com/helm/charts/tree/master/stable/consul
* Modifed to expose DNS services on port 53 (UDP) through an additional layer 4 Azure internal loadbalancer on the AKS cluster.
* Includes Ingress resource to expose UI via Traefik

## Install on Sandbox AKS cluster

The below instructions are for the Sandbox AKS cluster (`cnp-aks-sandbox-cluster`).

```
kubectl -f consul.yaml
```
The API and UI (via bastion or proxy) will be available at http://consulhelm.service.core-compute-saat.internal

The IP of the DNS server is `10.100.84.97`

## Register a service (i.e. add a DNS record)
```
curl -H "Content-Type: application/json" -X PUT --data "{\"Name\":\"myservice\",\"Service\":\"myservice\",\"Address\":\"10.100.84.90\",\"Port\":80}" http://consulhelm.service.core-compute-saat.internal/v1/agent/service/register
```

## Confirm Registration
```
[adminssh@mgmt-bastion-sandbox test]$ dig @10.100.84.97 myservice.service.consul

; <<>> DiG 9.9.4-RedHat-9.9.4-61.el7_5.1 <<>> @10.100.84.97 myservice.service.consul
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 42311
;; flags: qr aa rd; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1
;; WARNING: recursion requested but not available

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;myservice.service.consul.	IN	A

;; ANSWER SECTION:
myservice.service.consul. 0	IN	A	10.100.84.90

;; Query time: 1 msec
;; SERVER: 10.100.84.97#53(10.100.84.97)
;; WHEN: Sat Oct 13 19:58:26 UTC 2018
;; MSG SIZE  rcvd: 69
```