**Persona: Developers**

Inspired by [start.spring.io](https://start.spring.io), **Application Accelerator for VMware Tanzu** enables developers to create new applications based on templates that follow enterprise standards defined by platform engineers and architects. This accelerates how a developer goes from idea to running system with ready-made, enterprise-conformant code and configurations.

Enterprise Architects author and publish accelerator projects that provide developers and operators with ready-made, enterprise-conformant code and configurations. You can then use Application Accelerator to create new projects based on those accelerator projects.

The Application Accelerator user interface (UI) enables you to discover available accelerators, configure them, and generate new projects to download.

```dashboard:open-url
url: https://tap-gui.{{ ENV_TAP_INGRESS }}/create
```
... the **tanzu CLI** with additional capabilites for managing accelerators in the cluster, ...
```terminal:execute
command: tanzu accelerator list --server-url http://accelerator.{{ ENV_TAP_INGRESS }}
clear: true
```
... and as IDE plugin.
```editor:execute-command
command: workbench.view.extension.tanzu-app-accelerator
```

Select the **Inclusion** accelerator from the list and click **Generate Project**. A new tab with the project will be opened. You can close it as we will use the embedded editor in Learning Center.
