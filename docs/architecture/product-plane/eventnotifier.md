# Event Notifier

## Overview

The *Event Notifier Microservice* is the ODM Platform service to allow other ODM modules to dispatch notifications.
Each notification involves a specific *Event* and is forwarded to a list of registered adapters 
of the [Observer](../utility-plane/observer/index.md)  of the Utility Plane.

The Event Notifier main task is simply to store any configured Observer, 
receive a dispatch request for the occurrence of a specific event, retrieve the registered Observers and 
forward them a notification of the event.

## Concepts

### Event

An *Event* represents the occurrence of a specific operation in the ODM processes, such as, for example, 
the creation of a Data Product, or the execution request for an Activity.

Any Event has a *type*, describing the event itself, a *beforeState* and an *afterState* representing the object before and after the event occurrence.
As an example, an Event of "DATA_PRODUCT_UPDATE" type has the JSON description of the original Data Product 
as *beforeState* and the JSON description of the same Data Product after the update operation as *afterState*.

### Notification

A *Notification* is the default container of an Event before dispatching it to the listening services.
It's the default object expected for requests to [Observer](../utility-plane/observer/index.md) implementations and
enrich the event with metadata that will be processed and updated by the receivers.

## How it works

### Architecture

As the majority of the ODM services, the Event Notifier Microservice is composed of two modules:

* **Event Notifier API**: a module containing abstract controllers, Java resource definitions, and a client to interact with the controller.
* **Event Notifier Server**: a module implementing the abstract controllers, any component useful to interact with the DB (entities, mappers, repositories, ...), and services needed for the Registry operations.

![Event-Notifier-diagram](../../images/architecture/product-plane/notification/event_notifier_architecture.png)

### Relations

Even if it's theoretically an independent application, the Event Notifier is not meant to work as a standalone microservice.
It is designed as a proxy between Product Plane microservices,
like Registry and DevOps, and many possible Observers of the Utility Plane.

The Event Notifier operates transparently to the ODM processes; 
each interaction is orchestrated by the Product Plane services, 
with the validity of the response being determined by the Observers receiving the notifications, 
except in cases of communication errors.

Every instance in the documentation where a relationship with Observer is mentioned,
implies the underlying presence of the Event Notifier, acting as a proxy in the communication flow.

## Technologies

Other than the default Java, Maven and Spring technologies,
the Event Notifier module does not make use of any particular technology.

## References

* GitHub repository: <a href="https://github.com/opendatamesh-initiative/odm-platform" target="_blank">odm-platform:octicons-link-external-24:</a>
* API Documentation: [Event Notifier Server API Documentation](../../api-doc/index.md)