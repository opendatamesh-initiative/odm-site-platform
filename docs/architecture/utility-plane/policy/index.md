# Policy Engine

A Policy Engine is a service that answers to _policy evaluation requests_ 
received from the [_Policy Service_](../../product-plane/policy.md).

It could act as a _proxy_ between the Policy Service and a server for policy evaluation, 
like OPA (i.e. Open Policy Agent), or it could directly evaluate the policy with custom code.

As any other service in the Utility Plane, Policy Engine doesn't represent a directly executable project.
It exposes an interface to implement an _Adapter_ of it, such as the default [_Policy Engine OPA_](adapters/opa.md).

## Technologies
* Java 11
* Maven 3.8.6
* Spring 5.3.28
* Spring Boot 2.7.13

Other than the default Java, Maven and Spring technologies,
the Policy Engine module does not make use of any particular technology.

## Architecture
Coming soon!

## Relationships
Coming soon!