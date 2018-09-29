# Kubernetes Ingress Controller Examples
Implementation examples of various ingress controllers

## Features
### Internal Load Balancer
These examples create an Azure Internal Loadbalancer.  An unreserved IP address can be provided, or else Azure will assign one.

The advantage of this is only one IP address is required.  The ingress controller will handle further routing based on rules provided in each application's ingress configuration.

### Routing
The implementations can do host or path-based routing.

## DNS and HTTPS
Depending on which routing method is chosen, solutions need to prepared to provide DNS and HTTPS support.

* Host-based: either wildcard or multiple DNS entries. Wildcard TLS certificate required
* Path-based: single entry DNS record, single-host TLS certificate

