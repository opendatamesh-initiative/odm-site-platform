# Architecture

This section aims to briefly describe the Platform architecture, listing and detailing each component of the *ODM Platform*.

## Big Picture

The following image depicts a diagram of the architecture.

![Architecture-diagram](../images/architecture/architecture.svg){style="display:block; margin-left:auto; margin-right:auto;" width=70%}

As you can see, the architecture is composed of two planes:

* [**Control Plane** (previously called *Product Plane*)](#control-plane): it provides the services that help build and consume data products, managing their lifecycle.
* [**Utility Plane**](#utility-plane): it allows decoupling the management of data products from the underlying technological infrastructure.

It turns out that the ODM Platform’s main modules are technology-independent: data products are created and managed through the *Control Plane* services, independently of the underlying physical layer, which is decoupled by the *Utility Plane* **adapters**.


## Control Plane

The *Control Plane* exposes the **core microservices** of the ODM Platform. Each microservice offers a set of APIs to deal with every phase of the data product lifecycle. *ODM Platform* uses the [*Data Product Descriptor*](../concepts/index.md#what-is-a-data-product-descriptor) to create, deploy and operate the data product instances in the data architecture.

The Product Plane provides the following set of microservices:

* [Blueprint Service](https://github.com/opendatamesh-initiative/odm-platform/tree/main/product-plane-services/blueprint-server): it handles data product bootstrap and initialization from template projects, called blueprints, leveraging a deep integration with Git services.
* [Registry Service](https://github.com/opendatamesh-initiative/odm-platform/tree/main/product-plane-services/registry-server): it handles the registration of a data product and its versions within the platform, making it accessible to other services and discoverable by users.
* [Policy Service](https://github.com/opendatamesh-initiative/odm-platform/tree/main/product-plane-services/policy-server): it handles the registration and validation of governance policies as code, integrating with other services to enforce controls at significant events of the data product lifecycle.
* [DevOps Service](https://github.com/opendatamesh-initiative/odm-platform/tree/main/product-plane-services/devops-server): it handles the invocation and orchestration of the underlying CI/CD pipelines to deploy the data product as an atomic deployment unit (*architectural quantum*).
* [Marketplace Service](https://github.com/opendatamesh-initiative/odm-platform-pp-marketplace-server): it handles data access requests to the output ports of data products submitted by data consumers, orchestrating the necessary actions to physically grant access to the exposed data assets.
* [Notification Service](https://github.com/opendatamesh-initiative/odm-platform/tree/main/product-plane-services/notification-server): it handles the forwarding of notifications about significant events in the data product lifecycle to all registered observers, decoupling the execution of the main action from the delivery of notifications.

Each microservice is ready to use and represents an available feature of the platform.

!!! info

    The Open Data Mesh Platform isn’t meant to replace low-level infrastructure tools (like CI/CD pipeline logic). Instead, it provides a higher-level abstraction that orchestrates end-to-end data product processes, shielding users from the complexity of low-level tasks, whose implementation depends on the specifics of the underlying infrastructure technologies.

## Utility Plane

The *Utility Plane* exposes a set of **adapter microservices** that interface with the available infrastructure technologies, delegating the execution of low-level operations required for the data product lifecycle. Examples include invoking a CI/CD pipeline, sending a command to an IAM tool, or uploading metadata to a data governance system. These adapters translate requests into the formats expected by the specific tool APIs.

The adapters can be classified into:

* [Observers](../integration-hub/index.md#observers): they collect and react to significant events in the data product lifecycle. Observers register with the Notification Service: when an event occurs, it sends the event payload, containing all relevant metadata, to the registered observers so that each can react accordingly. One of the most common use cases for observers is integrating with external data governance, metadata management, and experience tools, leveraging existing investments in these systems.

* [Validators](../integration-hub/index.md#validators): they forward requests to verify computational policies to external engines in response to data product lifecycle events (e.g., when a new version of a data product is registered, or when a deployment activity is initiated). This ensures that safety gates are applied to prevent errors in managing the data product lifecycle. One of the most common use cases is checking the compliance of data product descriptive metadata or infrastructure-as-code scripts against company-wide standards, ensuring effective data product discovery by users and consistently supporting automated processes, including data product deployment activities.

* [Executors](../integration-hub/index.md#executors): they receive requests to execute a command on the infrastructure and forward them to the designated infrastructure tool, passing all necessary metadata for the action and receiving back the results and status of the operation. Common use cases include interacting with CI/CD tools or with enterprise applications for managing access permissions to resources.

* [CLI Tools](../integration-hub/index.md#cli-tools): they provide command-line interfaces to interact programmatically with the ODMP Platform services within data product development and release processes. Common use cases include integrating custom connectors to facilitate the compilation of the Data Product Descriptor by extracting metadata from infrastructure tools, or testing the data product’s compliance with computational policies, before registering a new version of the data product in the platform.

For more details, you can check the list of available adapters and starter projects on the [Integration Hub](../integration-hub/index.md) page.

!!! info

    For each category of adapter, a **standard API** is available that all adapter instances must implement. This ensures that the platform can be easily extended by installing existing adapters or by plugging in custom-developed adapters tailored to the specific infrastructure. Contributors to the ODM initiative are also working on providing **starter Github projects** to facilitate the development of custom adapters for specific categories or use cases.

