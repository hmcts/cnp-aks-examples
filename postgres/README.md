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

## Resource Limits
The values in the examples are a guess, but seem reasonable.  Please use them, and if they aren't sufficient feel free to adjust.
