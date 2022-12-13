##### Service Binding

As Julien, I now have my application in production alongside my Database to store all my emojis.
I now need to bind this application to the Database so that it starts storing data in it. 

I want to configure the binding to them with the provided information in the Workload.
```editor:insert-lines-before-line
file: ~/inclusion/config/workload.yaml
line: 30
text: |2
    serviceClaims:
    - name: db
      ref:
        apiVersion: services.apps.tanzu.vmware.com/v1alpha1
        kind: ResourceClaim
        name: db-binding-compatible
```

After applying this configuration, the required credentials for the connection to the database are then **automatically bound to the application**.   Frameworks like Spring Boot are able to automatically pick them up and configure the application connectivity to the database.

```terminal:execute
command: tanzu apps workload apply -f ~/inclusion/config/workload.yaml -y
clear: true
```

After updating the workload.yaml file, and a few minutes later, I can see in my application the emojis all together, which means my application is now using my database. 
```dashboard:open-url
url: https://inclusion-{{ session_namespace }}.{{ ENV_TAP_INGRESS }}
```

Finally, should my application container crash, I will still be able to see my data when it bounces back!
