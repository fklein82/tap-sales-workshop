
##### Tanzu Application Platform and VMware Application Catalog demo

In this workshop I will show you a combined TAP + VAC demo and talk your through the major business outcomes from a Developer, Platform Operator and `security Auditor perspectives.
In order to make the workshop flow smoothly, I will start with deploying a SpringBoot application immediately so while TAP deploys it, I can look into key concepts of the platform itself. 

So, as a Developer, I have developed an app with the help of TAP Accelerators (I will talk to you about this in a minute) and I now want to deploy my app in TAP by using this command:

```terminal:execute
command: tanzu apps workload create -f ~/workload.yaml -y
clear: true
```
