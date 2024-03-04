# Utility Plane

The Utility Plane is the ODM plane that exposes services that need an implementation like:

* Notification
* Policy Engine
* Executor

Each service exposes an interface for the implementation of it, eventually including default logic,
giving a starting point to the realization of the specific services.

For example, the Executor interface shows how to develop a specific DevOps executor.
Each service already has at least one existing implementation, called **adapter**,
such as the _Azure DevOps Executor_ for the Executor service, _Blindata Adapter_ for the Notification service and
_OPA Policy Adapter_ for the Policy Engine.