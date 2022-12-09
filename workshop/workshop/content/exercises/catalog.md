Cool, I seem to be progressing well so far!

I now want to see a bit of details of my applications. 
So I log into the TAP UI (User Interface) here:
```dashboard:open-url
url: https://tap-gui.{{ ENV_TAP_INGRESS }}/catalog
```
select the Guest tile and press Enter. 

I can see the TAP catalog with all the applications that have been deployed. I now want to add mine to the catalog. 
So, I click on **Register Entity** button and I add the application repository path here:

```copy
https://github.com/tsalm-pivotal/emoji-inclusion/blob/main/catalog/catalog-info.yaml
```
press **ANALYZE** to let TAP ensure this is a valid link and follow the wizard by clicking on **IMPORT**. The app has now been imported on the Home screen here:
```dashboard:open-url
url: https://tap-gui.{{ ENV_TAP_INGRESS }}/catalog
```
I can click on my Inclusion app and access a number of information:

1. **The Logical graph of the app**, i.e.: all the services and their relationship
   This can be found here:
   ```dashboard:open-url
   url: https://tap-gui.emea.end2end.link/catalog/default/system/emoji-world/diagram
   ```
3. **API Swagger definition** - a placeholder for Developers to enable API documentation in the platform
   This can be found here:
   ```dashboard:open-url
   url: https://tap-gui.emea.end2end.link/catalog/default/component/inclusion/api
   ```
5. **Runtime Resources** - a placeholder for Developers to see application runtime resources such as application deployment objects and logs/metrics for monitoring and debugging, but more importantly the URL where to find the app once the application is deployed. I will come back to this point later when my application will be live. 

Let's now have a closer look at the Supply Chain, the CI/CD set of tools that come out the box with TAP installation.
