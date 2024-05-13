# Validator

## Overview 

A Validator is a microservice that answers to _policy evaluation requests_ 
received from the [_Policy Service_](../../product-plane/policy.md).

In ODM context, Engine refers to any tool capable of receiving queries requesting the evaluation of specific policies,
assessing them, and responding accordingly. 
This encompasses microservice acting as proxy to existing policy engines,
like OPA (Open Policy Agent), as well as Lambda Functions, or custom solutions.

An example of a Validator is the [Validator OPA](adapters/opa.md).

## How it works

### Architecture

Similar to other services within the Utility Plane,
the Validator module isn't designed as a directly executable project.
Instead, it provides an interface for implementing an Adapter,
which serves as a specialized implementation of the Validator.

The Validator consists of a single module, named **Validator API**,
containing abstract controllers, Java resource definitions, and a client to interact with the controller.

A default implementation of the *Validator Server* module does not exist and any adapter must implement it.

![Validator-diagram](../../../images/architecture/utility-plane/validator/validator_architecture.png)

### Relations

#### Policy Service

A Validator is a microservice designed to complement the [Policy Service](../../product-plane/policy.md).
Even if it could act as a standalone service to evaluate policies, 
it's meant to act as the executor of the evaluation requests received by the Policy microservice.

Whenever a Validator is ready to be included in the ODM ecosystem, 
it will simply need to be registered with the Policy microservice as a specific Policy Engine. 
This will enable the addition of policies intended for it and their evaluation in standard ODM processes.

Any registered Policy in the Policy server must contain the reference to a registered Policy Engine,
that is a Validator Adapter, in order to be evaluated.

#### Product Plane services

Excluding the Policy microservice, a Validator doesn't directly interact with any other ODM service.
Nonetheless, whenever a Product Plane microservice makes a policy evaluation request to the Policy microservice,
the latter will use one or more Validator Adapters to fulfill the request.

## Technologies

Other than the default Java, Maven and Spring technologies,
the Validator module does not make use of any particular technology.