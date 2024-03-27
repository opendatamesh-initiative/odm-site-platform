# Notification

## Overview

The *Notification* is a microservice that receives notifications and reacts to the event contained in the notification.

On the Utility Plane of the ODM Platform, there is a Notification module that, 
like any module in the Utility Plane, exposes an Interface to implement a specific notification service. Any implementation of it is called _Notification Adapter_.


## How it works

### Architecture

As the majority of the ODM services, the Notification Microservice is composed by two modules:

* **Notification API**: a module containing abstract controllers, Java resource definitions, and a client to interact with the controller.
* **Notification Server**: a basic server eventually implementing common parts between each possible Notification Adapter.

The difference between the other modules is that it doesn't have a main class:
it isn't directly executable the task of overriding specific behaviors
and defining a runnable application is left to the implemented Adapter.

![Notification-diagram](../../../images/architecture/utility-plane/notification/notification_architecture.png)

### Relations

As previously said, the _Notification_ module in the Utility Plane is a generalization of the common parts that any Notification Adapter (i.e., implementation of Notification) must have. The module doesn't have any direct relations with any other ODM service, but each Notification Adapter needs to implement its abstract controller.

Then, a Notification Adapter interacts in a passive way (i.e., receives API calls) with ODM services such as [_DevOps Service_](../../product-plane/devops.md) or [_Registry Server_](../../product-plane/registry.md).

<!--
The ODM services know how to interact with a specific Adapter thanks to the Notification
`NotificationClient`. The Notification module in the ODM Utility Plane has indeed a client that handles communication with the abstract controller, and each adapter directly implements the abstract controller.
-->


## Technologies

Other than the default Java, Maven and Spring technologies, the Notification module does not make use of any particular technology.