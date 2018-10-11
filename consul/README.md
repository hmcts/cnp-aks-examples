# Consul
## Notes
Running with 2nd load balancer (AKS internal) which is routing the UI (for convenience) and DNS.  

Issues:
* Can't get it to work with port 53 for DNS (connection refused), so using default of 8600.
* Something is ignoring `targetPort` when creating the ILB, so can't seem to use different ports for frontend and backend.
* Only tried TCP so far for DNS.
* Query time is slow with TCP:
```
[adminssh@mgmt-bastion-sandbox test]$ dig +tcp -p 8600 @10.100.84.97 consulhelm.service.consul

; <<>> DiG 9.9.4-RedHat-9.9.4-61.el7_5.1 <<>> +tcp -p 8600 @10.100.84.97 consulhelm.service.consul
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 51671
;; flags: qr aa rd; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1
;; WARNING: recursion requested but not available

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;consulhelm.service.consul.	IN	A

;; ANSWER SECTION:
consulhelm.service.consul. 0	IN	A	10.100.84.103

;; Query time: 1825 msec
;; SERVER: 10.100.84.97#8600(10.100.84.97)
;; WHEN: Thu Oct 11 23:12:24 UTC 2018
;; MSG SIZE  rcvd: 70
```