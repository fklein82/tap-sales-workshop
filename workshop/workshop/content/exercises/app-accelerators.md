**Hi 👋! my name is Julien and I am the Developer of the Inclusion app**

So, the Platform team has deployed and pre-configured TAP for me and gave me Developer access. 

Now, as Julien the Dev, I have deployed my Inclusion app on the platform with one command, but how did I get here in the first place?
Well, first, I have opened my IDE (Integrated Developer Environment) of choice and started coding...no...wait! 
My Software Architect team actually guided me and provided me with an Application Accelerator. 

Inspired by [start.spring.io](https://start.spring.io), **Application Accelerators for VMware Tanzu** enables Developers like me to create new applications based on templates that follow enterprise standards defined by platform engineers and architects. This accelerates how I go from idea to production with ready-made, enterprise-conformant code and configurations without needing to read tons of docs straight away.

**INSTRUCTIONS:** By clicking on the below link, I will use the IDE plugin to create the Accelerator.
```editor:execute-command
command: workbench.view.extension.tanzu-app-accelerator
```

I can now see the full list of Accelerators available to me.

So, off I go and select the **Inclusion** accelerator from the list, I fill in the details that my project needs and press **Continue** until I see **Generate Project**. When I click on **Generate Project** (Click **OK** at the pop-up window), a new tab will open. The Accelerator has now generated the code in a new tab. We can close the tab and continue to work on the IDE integrated in the workshop UI.

I can now see my code organised in my IDE. The important bit here is the **workload.yaml** file. The Accelerator autogenerates this file following Kubernetes manifest structure. It declares my deployment strategy to TAP that can be executed on any Kubernetes infrastructure.  

**INSTRUCTIONS:** Press **TAP UI - CATALOG** button to continue.
