Cool... I seem to be progressing well so far!

I now want to see details of my application. 
So I log into the TAP UI (User Interface) here:
```dashboard:open-url
url: https://tap-gui.{{ ENV_TAP_INGRESS }}/catalog
```

**INSTRUCTIONS**

If it’s the first time you access the web portal, you’ll have to select the Guest tile and press Enter.

I can see the TAP catalog with all the applications deployed, including my Inclusion application.
I can click on my Inclusion app and access pieces of information, such as:

1. **The Logical graph of the app**, i.e.: all the services and their relationship.
   This can be found here:
```dashboard:open-url
url: https://tap-gui.{{ ENV_TAP_INGRESS }}/catalog/default/system/emoji-world/diagram
```

3. **API Swagger definition** - a placeholder for Developers to enable API documentation in the platform
This can be found here:
```dashboard:open-url
url: https://tap-gui.{{ ENV_TAP_INGRESS }}/catalog/dev-space/api/inclusion-{{ ENV_TAP_INGRESS }}/definition
```

4. **Runtime Resources** - a placeholder for Developers to see application runtime resources such as application deployment objects and logs/metrics for monitoring and debugging, but more importantly, the URL where to find the app once the application is deployed. 
As my application still needs to be live, we'll check a previously deployed Inclusion application.
This can be found here:
```dashboard:open-url
url: https://tap-gui.{{ ENV_TAP_INGRESS }}/catalog/default/component/inclusion/workloads
```

Let's now look closely at the Supply Chain, the CI/CD set of tools that come out of the box with TAP installation.
