# Architecture

This section aims to briefly describe the Platform architecture, listing and detailing each component of the ODM Platform.

The following image depicts a diagram of the architecture.

![Architecture-diagram](../images/architecture/architecture.png)


!!! info

    _API names in the Product Plane do not necessarily exhibit what's implemented in the application. The only purpose here is to show each module's capabilities._

As you can see, the architecture is composed of two planes reflecting those proposed by Data Mesh theory:

* **Product Plane**: the ODM implementation of the [Data Product Experience Plane](../concepts/logical-planes/data-product-experience-plane.md), which helps to build and consume data products, as well as managing their entire lifecycle. 
* **Utility Plane**: the ODM implementation of the [Data Infrastructure (Utility) Plane](../concepts/logical-planes/utility-plane.md), which aims to decouple the data product management from the underlying physical infrastructure.

It turns out that the ODM Platform main modules are technology-independent: data products are created and managed via the Product Plane independently of the underlying physical layer, which is decoupled by the Utility Plane and the Adapters.


## Product Plane

The *Product Plane* exposes the core microservices of the ODM Platform. Each microservice offers a set of APIs to deal with every phase of the data product lifecycle. ODM Platform uses the *Data Product Descriptor* to create, deploy and operate the data product instances in the mesh architecture.

The Product Plane provides the following set of microservices:

* [Blueprint Microservice](./product-plane/blueprint.md): it handles data product bootstrap and initialization leveraging on a deep integration with Git services.
* [Registry Microservice](./product-plane/registry.md): it registers a new data product with a unique identifier and a data product version within the mesh, making it visible to the mesh governance processes.
* [Policy Microservice](./product-plane/policy.md): it handles services to apply and run embedded computational policies on every data product of the mesh.
* [DevOps Microservice](./product-plane/devops.md): it manages the entire data product lifecycle (i.e., development, test, deploy, decommissioning).
* [Event Notifier Microservice](./product-plane/eventnotifier.md): it manages listeners and dispatches notifications upon events reception.
* [Params Microservice](./product-plane/params.md): it is a custom ODM microservice to handle common parameters and variables within the entire platform.

Each microservice is ready to use and represents an available feature of the platform.


## Utility Plane

The *Utility Plane* exposes a set of services useful for the mesh functionality and infrastructure decoupling, like:

* [Executors](./utility-plane/executor/index.md): they act as a proxy between the mesh platform and specific DevOps tools.
* [Observers](./utility-plane/observer/index.md): they collect and react to events occurred in the mesh platform.
* [Validators](./utility-plane/policy/index.md): they are services dedicated to the evaluation of computational policies.

Each microservice exposes an interface requiring a real implementation of it. The aim here is to give a starting point and a blueprint structure for the realization of the specific services. Any implementation of the Utility Plane services is called *Adapter*.

### Adapters

An *Adapter* is a technology-specific implementation of the Utility Plane services: it is the component that decouples the mesh platform from the real infrastructure.

Each Adapter is pluggable to the ODM Platform via configuration properties. ODM users are required to configure all the adapters they need to work with the underlying infrastructure layer.

ODM Platform offers an implementation of the following Adapters:

* [Azure DevOps Executor](./utility-plane/executor/adapters/executor-azuredevops.md): an executor able to work with <a href="https://azure.microsoft.com/en-us/products/devops/" target="_blank">Azure DevOps:octicons-link-external-24:</a> APIs to build, test, deploy data products.
* [Blindata Observer](./utility-plane/observer/adapters/blindata.md): an observer that forwards notifications to <a href="https://blindata.io/"
target="_blank">Blindata:octicons-link-external-24:</a> in response to events. 
* [OPA Validator](./utility-plane/policy/adapters/opa.md): a specific implementation of a validator that uses <a href="https://www.openpolicyagent.org/" target="_blank">Open Policy Agent:octicons-link-external-24:</a> as the engine to validate computational policies.

## Technologies

ODM Platform is a multi-module Java application composed of multiple microservices. The following is the list of the development technologies: 

* Java
* Maven
* Spring
* Spring Boot

All the services make use of this set of technologies as a baseline. Each single service can employ additional tools to meet different needs.