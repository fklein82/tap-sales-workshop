Tanzu Application Platform GUI is a developer portal that provides a central location in which you can view dependencies, relationships, technical documentation, and even service status.

It's built from the Cloud Native Computing Foundation’s project **Backstage**.
```dashboard:open-url
url: https://backstage.io
```

TAP GUI is comprised of the following components:
- An **Organization Catalog**: The catalog serves as the primary visual representation of running services (Components) and Applications (Systems).
- **Tanzu Application Platform GUI plug-ins**: These plug-ins expose capabilities regarding specific Tanzu Application Platform tools. Initially the included plug-ins are:
  - Runtime Resources Visibility
  - Application Live View
  - Application Accelerator
  - TechDocs: This plug-in enables you to store your technical documentation in Markdown format in a source-code repository and display it alongside the relevant catalog entries.


###### Organization Catalog

The Organization Catalog/Backstage Software Catalog is a centralized system that keeps track of ownership and metadata for all the software in your ecosystem (services, websites, libraries, data pipelines, etc). The catalog is built around the concept of **metadata YAML files stored together with the code**, which are then harvested and visualized in Backstage.

It enables **two main use-cases**:
- Helping teams manage and maintain the software they own.
- Makes all the software in your company, and who owns it, discoverable.

**Adding catalog entities**

The TAP GUI catalog allows for **two approaches towards storing catalog information**:
- The default option uses an **in-memory database** and is suitable for test and development scenarios.
- For production use-cases, use a **PostgreSQL database** that exists outside the Tanzu Application Platform packaging.

Let's add the catalog for our workload.
```copy
https://github.com/tsalm-pivotal/emoji-inclusion/blob/main/catalog/catalog-info.yaml
```
##### TechDocs
```dashboard:open-url
url: {{ ENV_TAP_PRODUCT_DOCS_BASE_URL }}/GUID-tap-gui-techdocs-usage.html
```

##### Runtime resources visibility
The Runtime Resources tab shows developers the details and status of their component’s Kubernetes resources to understand their structure and debug issues.

We should be able to see the workload in the **Runtime Resources** tab in the detail view of the Component.
