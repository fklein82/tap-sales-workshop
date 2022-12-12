**Hi :wave:. I am Fréd, the Security Auditor!**

As a Security Auditor, I would like to see a number of principles and best practices built into the Supply Chain. 
The out-of-the-box Supply Chain we are using, provided with TAP for the Cody's app is already implementing best practices around security.

My main check points are:
1. Auditing the source code CVE report
2. Making sure images that run in prod are signed
3. Making sure that the way to build/patch container image is consistent, repeatable and sustainable
4. Auditing the container image CVE report

So, off I got to check some of these guidelines. I have been given access to TAP UI here:

```dashboard:open-url
url: https://tap-gui.{{ ENV_TAP_INGRESS }}/security-analysis
```

I can see Vulnerabilities displayed graphically by Severity. I have not applied any policy, hence none of the more severe CVE violate these.

Click on 'Does Not Violate Policy' menu and select the application of which I want to see the CVE report. 
I can finally see my CVE report and I can now work with both Julien and Chiara on fixing these before my production is harmed. 
