# Traefik Ingress Controller
## Installation
```
helm install --name traefik-1 --namespace kube-system --values values.yaml stable/traefik
```

## Dashboard
The hostname of the dashboard is set in `values.yaml`.

## Routing
You can route either by hostname or path.

### Host-based Routing
For this we would need wildcard DNS and TLS certificate:
```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: rhubarb-backend-ingress
  namespace: cnp
spec:
  rules:
  - host: backend-service.aks-internal.hmcts.net
    http:
      paths:
      - path: /
        backend:
          serviceName: rhubarb-backend-service
          servicePort: 80
```

### Path-based Routing
For this we need only maintain one DNS entry, and also need to include the rewrite annotation:
```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: rhubarb-backend-ingress
  namespace: cnp
  annotations:
    traefik.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: aks-internal.hmcts.net
    http:
      paths:
      - path: /rhubarb-backend
        backend:
          serviceName: rhubarb-backend-service
          servicePort: 80
```

### HTTPS
TLS is enabled in the `values.yaml` file.  To use, just add the certificate and private key as a secret in the same namespace as the ingress:
```
kubectl -n cnp create secret tls traefik-tls-cert --key=tls.key --cert=tls.crt
```
The secret is then referenced in the ingress configuration:
```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: rhubarb-backend-ingress
  namespace: cnp
  annotations:
    traefik.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: aks-internal.hmcts.net
    http:
      paths:
      - path: /rhubarb-backend
        backend:
          serviceName: rhubarb-backend-service
          servicePort: 80
  tls:
   - secretName: traefik-tls-cert
```
