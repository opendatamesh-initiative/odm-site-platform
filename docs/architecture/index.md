# Architecture

This section aims to briefly describe the Platform architecture, listing and detailing each component of the ODM Platform.

The following image depicts a diagram of the architecture.

![Architecture-diagram](../images/architecture/architecture.svg){style="display:block; margin-left:auto; margin-right:auto;" width=70%}


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
* [Notification Microservice](./product-plane/notification.md): it manages listeners and dispatches notifications upon events reception.
* [Params Microservice](./product-plane/params.md): it is a custom ODM microservice to handle common parameters and variables within the entire platform.

Each microservice is ready to use and represents an available feature of the platform.


## Utility Plane

The *Utility Plane* exposes a set of services useful for the mesh functionality and infrastructure decoupling, like:

* [Executors](./utility-plane/executor/index.md): they act as a proxy between the mesh platform and specific DevOps tools.
* [Observers](./utility-plane/observer/index.md): they collect and react to events occurred in the mesh platform.
* [Validators](utility-plane/validator/index.md): they are services dedicated to the evaluation of computational policies.

Each microservice exposes an interface requiring a real implementation of it. The aim here is to give a starting point and a blueprint structure for the realization of the specific services. Any implementation of the Utility Plane services is called *Adapter*.

### ODM Adapter Hub

An *Adapter* is a technology-specific implementation of the Utility Plane services: it is the component that decouples the mesh platform from the real infrastructure.

Each Adapter is pluggable to the ODM Platform via configuration properties. ODM users are required to configure all the adapters they need to work with the underlying infrastructure layer.

ODM Platform offers an implementation of the following Adapters:

<style>
.gallery-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  margin-top: 20px;
}

.gallery-box {
  flex: 1 1 calc(33.333% - 20px); /* ogni box prende 1/3 meno lo spazio del gap */
  max-width: calc(33.333% - 20px);
  border: 1px solid #ddd;
  border-radius: 12px;
  padding: 20px;
  background-color: #f9f9f9;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  transition: transform 0.2s ease;
}

.gallery-box h3 {
  margin-top: 0;
  font-size: 1.2em;
}

.gallery-box a {
  text-decoration: none;
  color: #0366d6;
}

.gallery-box p {
  margin: 10px 0 0 0;
  font-size: 0.95em;
}
</style>

#### Observers
<div class="gallery-container">

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-observer-blindata">Blindata Observer</a></h3>
    <img src="../images/logos/blindata.svg" alt="upload icon" width="150" style="vertical-align:middle; margin-right:6px;"/>
    <p>An observer that forwards notifications to 
      <a href="https://blindata.io/" target="_blank">Blindata </a> 
      in response to events.
    </p>
  </div>

</div>

#### Validators

<div class="gallery-container">

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-validator-opa">OPA Validator</a></h3>
    <img src="../images/logos/opa.png" alt="upload icon" width="180" style="vertical-align:middle; margin-right:6px;"/>
    <p>A specific implementation of a validator that uses 
      <a href="https://www.openpolicyagent.org/" target="_blank">Open Policy Agent </a> 
      as the engine to validate computational policies.
    </p>
  </div>

</div>

#### Executors

<div class="gallery-container">

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-marketplace-executor-starter">Marketplace Executor Starter</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>A starter project for building executors that integrate with an access management tool
    </p>
  </div>

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-executor-azuredevops">Azure DevOps Executor</a></h3>
    <img src="../images/logos/azuredevops.png" alt="upload icon" width="80" style="vertical-align:middle; margin-right:6px;"/>
    <p>An executor able to work with 
      <a href="https://azure.microsoft.com/en-us/products/devops/" target="_blank">Azure DevOps </a> 
      APIs to build, test, deploy data products.
    </p>
  </div>

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-executor-gitlab">GitLab Executor</a></h3>
    <img src="../images/logos/gitlab.png" alt="upload icon" width="80" style="vertical-align:middle; margin-right:6px;"/>
    <p>An executor able to work with 
      <a href="https://about.gitlab.com/" target="_blank">GitLab </a> 
      APIs to build, test, deploy data products.
    </p>
  </div>

</div>

### CLI Tools

<div class="gallery-container">

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-cli">ODM CLI</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>Command line interface to interact with ODM Platform Services
    </p>
  </div>

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-cli-extensions">ODM CLI Extensions</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>Framework for extending the Open Data Mesh Command Line (ODM CLI)
    </p>
  </div>

   <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-cli-extensions-starter">ODM CLI Extensions Starter</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>starting project to implement a ImporterExtension, an Extension of the Open Data Mesh Command Line
    </p>
  </div>

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-cli-extensions-importer-jdbc">ODM CLI Importer JDBC Extension</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>Command-line extension for the Open Data Mesh CLI that allows importing database metadata using JDBC
    </p>
  </div>

</div>

## Technologies

ODM Platform is a multi-module Java application composed of multiple microservices. The following is the list of the development technologies: 

* Java
* Maven
* Spring
* Spring Boot

All the services make use of this set of technologies as a baseline. Each single service can employ additional tools to meet different needs.