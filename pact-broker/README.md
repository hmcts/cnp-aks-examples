# Pact Broker
Intial MVP for Pact Broker running in AKS.
---
## Links
https://github.com/DiUS/pact_broker-docker

https://hub.docker.com/r/dius/pact-broker/

## Notes / TODO
* Get it to work with Postgres SSL connections
* Verify Postgres service endpoints and other security connection config (some manual tweaking was applied in the portal)
* currently using default 'postgres' database
* use proper config-as-code for Postgres (e.g. Terraform or Service Broker)
* Helm Chart?
* DNS record for Consul was applied manually for http://pact-broker.service.core-compute-saat.internal/