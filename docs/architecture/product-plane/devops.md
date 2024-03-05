# DevOps

## Description
DevOps is a module of the Product Plane of the ODM Platform.
It's a module that strictly requires:

* one active instance of the [_Registry Server_](../../architecture/product-plane/registry.md)
* at least one active instance of an [_Executor_](../../architecture/utility-plane/executor/index.md)

It implements the logic that allows users to handle the lifecycle of a Data Product Version object in terms of DevOps operation.
It exposes APIs to create and execute _Activities_, as well as storing their results,
where each _Activity_ represents a stage transition from a previous state to the next desired one.
For example, an Activity could be a set of operations, called _Tasks_, that correctly promote the Data Product from 
a `dev` stage to a `test` stage. 

In order to define an _Activity_, the _Registry Server_ must be reachable to retrieve the Data Product Version that will 
be the subject of the activity. 
As previously said, an _Activity_ could then be composed of one or more _Tasks_, where each one is usually a _pipeline_
of a DevOps tool (e.g., Azure DevOps).
After the creation of an _Activity_, the ODM DevOps Service allows executing it, executing one by one each of its _Tasks_. 
To make the execution possible, an _Executor_ must be running and reachable, to receive the execution call and forward it 
to the DevOps tool, properly handling request and response from it.

<span style="color:red">[WIP - this section describe code that is still evolving]</span>

In addition to the basic behaviour, it could also have optional interactions with:

* [Policy Service](../product-plane/policy.md): to optionally validate stage transitions and _Tasks_ and _Activity_ results
* [Notification services](../utility-plane/notification/index.md): to optionally send policy evaluation events and/or stage transition events

<span style="color:red">[END WIP]</span>

A basic description and a how-to guide for execution is available on the module [README.md](https://github.com/opendatamesh-initiative/odm-platform/blob/main/product-plane-services/devops-server/README.md) on GitHub.

## Technologies

* Java 11
* Maven 3.8.6
* Spring 5.3.28
* Spring Boot 2.7.13

Other than the default Java, Maven and Spring technologies, the DevOps module does not make use of any particular technology.

## Concepts

### Activity
An _Activity_ is a set of one or more _Tasks_ that represent a stage transition in the lifecycle of a Data Product Version.
For example, an _Activity_ could be a set of _Tasks_ that correctly deploy the Data Product Version in its `dev` stage.

An _Activity_ is created through:

* Data Product ID
* Data Product Version
* Stage

Information about the content of the _Activity_ is retrieved from the _Registry Server_.

### Task
A _Task_ is a single execution point of an _Activity_, like, for example, a pipeline on a DevOps tool.
One or more _Task_ could be part of an _Activity_.

A _Task_ will be automatically created when the creation of an _Activity_ is required and the proper information is 
retrieved from the _Registry Server_.

### Callback
A Task must return a _callback_ to the DevOps Server when its execution finishes. 
The URL for the callback is automatically passed to the _executor_ and then to the _DevOps tool_ in a parameter named
`callbackRef`.

Such _callback_ have an optional body; if not present, the DevOps server will assume that the _Task_ status is successful,
 if it is present, it must have the following format: 
```json
{
  "status": <status>,
  "errors": <errors>,
  "results": <results> 
}
```
where:

* `<status>` could be one of `PROCESSED` or `FAILED`
* `<errors>` is an optional string with the error encountered while executing the _Task_
* `<results>` is an optional JSON object with any kind of depth
* only one of `errors` and `results` must be given

The body of the _callback_ is stored in the _Task_ results.

### Lifecycle section of a Data Product Descriptor
As previously stated, _Activity_ and _Tasks_ are not created giving their content.
The DevOps server fetches the information required for the creation directly from the _Registry Server_.

A Data Product Version object could indeed have a _lifecycle_ section in its descriptor and _Activity_ and _Tasks_ 
can only be created for a Data Product Version object that has this section.

To briefly describe how the _lifecycle_ section works, let's consider the following example:

```json
{
  ..., 
  "internalComponents":{
    "lifecycleInfo":{
      "dev":[
        {
          "service": {
            "$href":"azure-devops"
          }, 
          "template":{
            "specification":"spec", 
            "specificationVersion":"2.0",
            "definition":{
              "organization":"[organizationName]",
              "project":"[projectName]",
              "pipelineId":"[pipelineID]",
              "branch":"master"
            }
          },
          "configurations":{
            "params":{
              "paramOne":"Hello World"
            }
          }
        }
      ], 
      "prod":[
        {
          "service":{
            "$href":"azure-devops"
          },
          "template":{
            "specification":"spec",
            "specificationVersion":"2.0",
            "definition":{
              "organization":"[organizationName]",
              "project":"[projectName]",
              "pipelineId":"[pipelineID]",
              "branch":"master"
            }
          },
          "configurations":{
            "params":{
              "paramOne": "Value of paramOne",
              "paramTwo": "Value of paramTwo"
            }
          }
        }
      ]
    }
  }
}
```
The Data Product Version considered in the example have two _Activity_ that could be created: `dev` and `prod`.
Each of them is composed by a single _Task_ and each _Task_ has `azure-devops` as service. This means that in order to
execute them an _Executor_ called `azure-devops` must be registered on the DevOps Service startup 
(as shown in the section [Executor Adapters](#executor-adapters)). 

Each _Task_ has a mandatory `template` attribute that is a JSON object containing a `definition` 
attribute showing how to execute the _Task_. In the example, the _Tasks_ are _Azure DevOps_ pipeline 
and the `definition` contains the information to identify and execute the pipeline.
In addition to this, each _Task_ could also have a `configuration` attribute with extra information, 
such as parameters for the pipeline, needed for the execution.
The content of both attributes is strictly dependent from the implementation of the _Executor Adapter_ that will handle the _Tasks_.
In the example, the Executor Adapter is the [Azure DevOps Executor](../utility-plane/executor/adapters/executor-azuredevops.md).

## Architecture
As the majority of the ODM services, the Blueprint Service is composed by:

* DevOps API module: a module containing abstract controller, resource definition and a client to interact with the controller
* DevOps Server module: a module implementing the abstract controller, any other component to interact with the DB, and any service needed for DevOps operations

![DevOps-diagram](../../images/architecture/product-plane/devops/devops_architecture.png)

## Relationships
As previously stated, the DevOps service is not meant to be a standalone service. 
In order to properly operate as an orchestrator for DevOps operations, it requires:

* Registry Server: to retrieve Data Product Version objects
* Executor adapters: to invoke the execution of _Tasks_ on the correct target DevOps tool

<span style="color:red">[WIP - this section describe code that is still evolving]</span>

In addition to them, it could also have optional interactions with:

* [Policy Service](../product-plane/policy.md): to optionally validate stage transitions and _Tasks_ and _Activity_ results
* [Notification services](../utility-plane/notification/index.md): to optionally send policy evaluation events and/or stage transition events

<span style="color:red">[END WIP]</span>

### Registry Server
The creation of an _Activity_, including its Tasks, requires a reachable instance of the _Registry Server_ to fetch the
content of the _Activity_. 
The DevOps server will start even without a reachable Registry Server, but every creation will return an error.

To make sure to correctly configure the interaction among them, check the presence of the following configurations in 
the property file of the active _Spring profile_ before running the service:
```yaml
odm:
  productPlane:
    registryService:
      active: true
      address: http://<hostname>:<port>
```

Additional information about service configuration or configuration and execution through Docker is available on the module 
[README.md](https://github.com/opendatamesh-initiative/odm-platform/blob/main/product-plane-services/devops-server/README.md)
on GitHub.

### Executor Adapters
If the creation of an _Activity_ involves the _Registry Server_, the execution of it requires an active instance of the
right _Executor Adapter_. 
Each _Activity_ could be potentially executed on a different DevOps provider, adding multiple 
adapters to the requirements. 
So, the number of _Executor Adapters_ that the DevOps service needs to know depends on the desired behaviour of it.

To make sure to correctly configure the interaction among them, check the presence of something similar to 
the following configurations in the property file of the active _Spring profile_ before running the service:
```yaml
odm:
  utilityPlane:
    executorServices:
      azure-devops:
        active: true
        address: http://<hostname>:<port>
        checkAfterCallback: false
```
In this example, only one _Executor Adapter_ (i.e., the [_Azure DevOps Executor Adapter_](../utility-plane/executor/adapters/executor-azuredevops.md))
is configured for usage. 
It could be used for the execution of Tasks that have `azure-devops` as `service` in the Data Product descriptor.
To configure more than one executor, add another block like the `azure-devops` one under the `executorServices` attribute.

_Executor Adapter_ could also have an API to check the status of a pipeline once the DevOps server received 
a callback from it. If a specific adapter has that ability, 
it could be enabled or disabled through the `checkAfterCallback` property.
The check after the callback reception, if enabled, will be executed whether the callback has a body or not.

Additional information about service configuration or configuration and execution through Docker is available on the module 
[README.md](https://github.com/opendatamesh-initiative/odm-platform/blob/main/product-plane-services/devops-server/README.md)
on GitHub.

### Notification
<span style="color:red">[WIP - this section describe code that is still evolving]</span>

The DevOps service has a [notification system](../utility-plane/notification/index.md) based on the Observer Design Pattern.
On the application startup, every notification _listener_ listed in the property file is registered, 
and when an event occurs, a dispatcher sends the notification to every active listener.

To make sure to correctly configure the interaction among them, check the presence of something similar to 
the following configurations in the property file of the active _Spring profile_ before running the service:
```yaml
odm:
  utilityPlane:
    notificationServices:
      <notificationListenerName>:
        active: true
        address: http://<hostname>:<port>
```
To enable multiple listeners just add another listener in the properties under the `notificationServices` attribute.

Events for the DevOps Service are: 

* DATA_PRODUCT_STAGE_TRANSITION 
* DATA_PRODUCT_TASK_RESULTS
* DATA_PRODUCT_ACTIVITY_RESULTS

### Policy
<span style="color:red">[WIP - this section describe code that is still evolving]</span>

The DevOps Service could interact with the [Policy Service](../product-plane/policy.md) to check:

* whether a stage transition (i.e., start an _Activity_) it's valid or not depending on future and previous stage
* compliance of _Task_ results
  * _Tasks_ could return results with the callback
  * e.g., validating a _terraform plan_ returned in the callback of a _Task_ before proceeding with the next _Task_ or closing the _Activity_
* compliance of _Activity_ results
  * the result of an _Activity_ is the combination of the results of each of its _Task_
  * the full set of results could be evaluated
  * when an _Activity_ ends successfully, it's possible to evaluate whether the exposed services are coherent or not with the initial contract

As shown in the dedicated section, the Policy Service stores policies that have a special tag to specify the phase 
in which the policy must be evaluated and whether the evaluation result is blocking or not for the phase.
Blocking policy with a negative evaluation will lead to the failure of the relative phase.