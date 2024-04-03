# Utility Plane

The *Utility Plane* is the ODM implementation of the [Data Infrastructure (Utility) Plane](../../concepts/logical-planes/utility-plane.md) which exposes a set of services useful for the mesh functionality and infrastructure decoupling, like:

* [Executors](./executor/index.md): they act as a proxy between the mesh platform and specific DevOps tools.
* [Notification Services](./observer/index.md): they collect and react to events.
* [Policy Engines](./policy/index.md): they are services dedicated to the evaluation of computational policies.

Each microservice exposes an interface for the implementation of it, eventually including default logic, giving a starting point to the realization of the specific services.

For example, the Executor interface shows how to develop a specific DevOps executor.

Each service already has at least one existing implementation, called **Adapter**, such as the _Azure DevOps Executor_ for the Executor service, the _Blindata Adapter_ for the Notification service and the _OPA Policy Adapter_ for the Policy Engine.