Go to your Kubeapps tab and click on the "Catalog" tab at the top of the page to show the list of services available to deploy. 
Type "postgres" into the search box, and click the PostgreSQL tile that shows up, then click "Deploy".

Set the name, password for the "postgres" admin user, and custom database to **emoji** and click deploy.

Via the [Service Binding Specification](https://github.com/k8s-service-bindings/spec) for Kubernetes it's now possible to automatically bind our application workload to the backing service.

Developers are able to discover the services they are able to consume via the tanzu CLI.
```terminal:execute
command: tanzu service claim list -o wide
clear: true
```
... and configure the binding to them with the provided information in the Workload.
```editor:insert-lines-before-line
file: ~/inclusion/config/workload.yaml
line: -1
text: |
    serviceClaims:
    - name: db
      ref:
        apiVersion: services.apps.tanzu.vmware.com/v1alpha1
        kind: ResourceClaim
        name: db-binding-compatible
```

After applying this configuration the required credentials for the connection to the PostgresSQL database are then **automatically mounted to the application containers as a volume** and frameworks like Spring Boot are able to automatically pick them up an configure the application.

```terminal:execute
command: tanzu apps workload apply -f ~/inclusion/config/workload.yaml -y
clear: true
```

After our update to the application is deployed we can see that all intances are bound to the same database by refreshing our application in the browser.
```dashboard:open-url
url: https://inclusion-{{ session_namespace }}.{{ ENV_TAP_INGRESS }}
```


