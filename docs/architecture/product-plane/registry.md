# Registry

## Description

Registry is the ODM Platform Product Plane main module, and it could act both as a standalone service or interact with 
different ODM services, such as [Policy](../product-plane/policy.md) or [Notification systems](../utility-plane/notification/index.md).

As the main module, it's the service that allows to create, edit, retrieve and delete Data Product 
and Data Product Version objects through [Data Product descriptors](../../concepts/data-product-descriptor.md).

In addition to the basic features to store and manage Data Product and Data Product Version objects, 
it offers syntactic and semantic validation to ensure the correctness of every object.

The optional interaction with other ODM services, configurable through properties, makes also possible to:

* ensure that each object is compliant with a set of policies, potentially blocking the creation and/or update of a not compliant object ([Policy](../product-plane/policy.md))
* notify _Event_ such as _creation_, _update_ or _deletion_ to a list of active observers ([Notification](../utility-plane/notification/index.md))

A basic description and a how-to guide for execution is available on the module [README.md](https://github.com/opendatamesh-initiative/odm-platform/blob/main/product-plane-services/registry-server/README.md) on GitHub.

## Technologies

* Java 11
* Maven 3.8.6
* Spring 5.3.28
* Spring Boot 2.7.13

Other than the default Java, Maven and Spring technologies, the Registry module does not make use of any particular technology.

## Architecture
As the majority of the ODM services, the Blueprint Service is composed by:

* Registry API module: a module containing abstract controller, resource definition and a client to interact with the controller
* Registry Server module: a module implementing the abstract controller, any other component to interact with the DB, and any service needed for the Registry operations

![Registry-diagram](../../images/architecture/product-plane/registry/registry_architecture.png)

## Relationships
Registry service, as described in the introduction, could act as a standalone project, but also interacts with other 
ODM services, such as Policy service and Notification services. 
Each interaction is enabled or disabled through properties file.

Additional information about service configuration or configuration and execution through Docker is available on the module
[README.md](https://github.com/opendatamesh-initiative/odm-platform/blob/main/product-plane-services/registry-server/README.md) 
on GitHub.

### Policy
TODO

### Notification
TODO