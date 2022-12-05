Let's now have a closer look at the path to production for our use-case for which we added one custom step to the ones that are out-of-the-box available with TAP.
```dashboard:open-url
url: https://tap-gui.{{ ENV_TAP_INGRESS }}/supply-chain/host/{{ session_namespace }}/inclusion
```

It takes some minutes to deploy the application.

You can go through all the steps the supply chain and explain what is it doing :
1. Gitops - Monitoring your git repository
2. Testing - testing your application code
3. Source Scanning - Grype - Scanning your code 
4. Build - Buiding your application with Taznu Build Service
5. Image Scanning - Grype - Scanning your OCI image
6. Image Deployment


Explain here what the application is doing and what the application will do when we will bind the DB provided by VAC

After our application is deployed, we can open our application in the browser. By refreshing it, we can see that it's horizontally scaled and multiple instances are running.
```dashboard:open-url
url: https://inclusion-{{ session_namespace }}.{{ ENV_TAP_INGRESS }}
```
