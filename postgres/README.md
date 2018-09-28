# Example PostgreSQL Container Configuration
Shows how to deploy an application with a supporting PostgreSQL container

## Notes
### Pod Configuration
You can either:
1. run both the application and the database in the same pod, or
2. run them in separate pods and expose the database to the cluster internally

For most scenarios option #1 will suffice. It is simpler and has less configuration.  If you are interested in scaling your application containers or making the database available to other applications for some reason, then choose #2.

### SSL Mode
Note that the PostgreSQL container is not configured to support SSL connections, and the Rhubarb application configuration includes `POSTGRES_SSL_MODE: disable`.  Be aware that your application must support this variable in its JDBC configuration.  For example:
```
spring:
  application:
    name: HMCTS Rhubarb Recipes Service
  datasource:
    url: jdbc:postgresql://${POSTGRES_HOST:localhost}:${POSTGRES_PORT:5432}/${POSTGRES_DATABASE}?sslmode=${POSTGRES_SSL_MODE:require}
    ...
```
## Postgres Hostname
Note that in example #1 the value of `POSTGRES_HOST` is `localhost`.  This is because the application and the database are running in the same pod.  All containers in a pod share the same network interface.

In example number #2 the value of `POSTGRES_HOST` is `postgres-service`, which is the `name` of the service resource defined in the YAML file.

## Resource Limits
The values in the examples are a guess, but seem reasonable.  Please use them, and if they aren't sufficient feel free to adjust.
