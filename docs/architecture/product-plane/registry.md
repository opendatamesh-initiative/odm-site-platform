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

A basic description and a how-to guide for execution is available on the module [README.md](https://github.com/opendatamesh-initiative/odm-platform/blob/main/README.md) on GitHub.

## References

* GitHub repository: [odm-platform](https://github.com/opendatamesh-initiative/odm-platform)
* GitHub readme: [README.md](https://github.com/opendatamesh-initiative/odm-platform/blob/main/README.md)
* API Doc: [ODM Api Documentation](https://opendatamesh-initiative.github.io/odm-api-doc/index.html), section _Doc_, subitem _registry-server-redoc-static.html_ after selecting a version

## Technologies

* Java 11
* Maven 3.8.6
* Spring 5.3.28
* Spring Boot 2.7.13

Other than the default Java, Maven and Spring technologies, the Registry module does not make use of any particular technology.

## Architecture
As the majority of the ODM services, the Registry Service is composed by:

* Registry API module: a module containing abstract controller, resource definition and a client to interact with the controller
* Registry Server module: a module implementing the abstract controller, any other component to interact with the DB, and any service needed for the Registry operations

![Registry-diagram](../../images/architecture/product-plane/registry/registry_architecture.png)

## Relationships
Registry service, as described in the introduction, could act as a standalone project, but also interacts with other 
ODM services, such as Policy service and Notification services. 
Each interaction is enabled or disabled through properties file, as shown by the following snippet:

```yaml
odm:
  productPlane:
    policyService:
      active: false
      address: http://localhost:8005
  utilityPlane:
    notificationServices:
      blindata:
        active: false
        address: http://localhost:9002
```
In this example, the interactions with the Policy service are disabled, through the attribute `active: false`, 
but there is an active notification system, only one, named `blindata`, reachable at `http://localhost:9002`.

Additional information about service configuration or configuration and execution through Docker is available on the module
[README.md](https://github.com/opendatamesh-initiative/odm-platform/blob/main/product-plane-services/registry-server/README.md) 
on GitHub.

### Policy
<span style="color:red">[WIP - this section describe code that is still evolving]</span>

The Registry could interact with the [Policy Service](../product-plane/policy.md) to check compliance of Data Product 
and Data Product Version objects both on creation and update of them.

As shown in the dedicated section, the Policy Service stores policies that have a special tag to specify the phase 
in which the policy must be evaluated and whether the evaluation result is blocking or not for the phase.
Blocking policy with a negative evaluation will lead to the failure of the relative phase.

As an example, consider the existence of a few policies that check if before the creation of a Data Product Version
all the names of the components are compliant with a specific naming convention.
If the interaction with the Policy service is active, the creation of a Data Product Version with one or more components'
name not compliant with the naming convention will fail returning an error from the Policy Service.

### Notification
The Registry service has a [notification system](../utility-plane/notification/index.md) based on the Observer Design Pattern.
On the application startup, every notification _listener_ listed in the property file is registered, 
and when an event occurs, a dispatcher sends the notification to every active listener.

Events for the Registry Service are: 

* DATA_PRODUCT_CREATED 
* DATA_PRODUCT_UPDATED 
* DATA_PRODUCT_DELETED
* DATA_PRODUCT_VERSION_CREATED 
* DATA_PRODUCT_VERSION_DELETED

To register a new notification _listener_, edit the active Spring profile property file as follows: 

```yaml
odm:
  utilityPlane:
    notificationServices:
      blindata:
        active: false
        address: http://localhost:9002
      <newNotificationListenerName>:
        active: <activeFlag>
        address: http://<hostname>:<port>
```
As an example, consider adding a new _listener_ called `customListener` reachable at `http://locahost:9003` to the active listeners; 
the section of the property file shown before will be: 
```yaml
odm:
  utilityPlane:
    notificationServices:
      blindata:
        active: false
        address: http://localhost:9002
      customListener:
        active: true
        address: http://localhost:9003
```