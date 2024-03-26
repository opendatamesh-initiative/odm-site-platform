# Policy Engine

A Policy Engine is a service that answers to _policy evaluation requests_ 
received from the [_Policy Service_](../../product-plane/policy.md).

It can act as a _proxy_ between the Policy Service and a server for policy evaluation, 
like OPA (i.e. Open Policy Agent), or it can directly evaluate the policy with custom code.

As any other service in the Utility Plane, Policy Engine doesn't represent a directly executable project: it exposes an interface to implement an _Adapter_ (a specific implementation of the evaluation engine).


## How it works

### Architecture

!!! warning

    **Work In Progress!**

    This section is currently undergoing improvements. We apologize for any inconvenience and appreciate your patience.

### Relations

!!! warning

    **Work In Progress!**

    This section is currently undergoing improvements. We apologize for any inconvenience and appreciate your patience.


## Technologies

Other than the default Java, Maven and Spring technologies, the Notification module does not make use of any particular technology.