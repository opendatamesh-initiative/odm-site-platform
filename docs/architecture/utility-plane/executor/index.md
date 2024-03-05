# Executor

## Description

An Executor is the service that act as a proxy between the [DevOps Service](../../product-plane/devops.md)
and a specific DevOps tool (e.g., Azure DevOps).

In the Utility Plane of the ODM Platform there is an Executor module, called `executor-api` that, 
like any module in the Utility Plane, exposes an Interface to implement Executor.

Any implementation of `executor-api` is an _Executor Adapter_ and, actually, there is a single
adapter already developed, that is [_Executor Azure DevOps_](adapters/executor-azuredevops.md).

## Technologies
Coming soon!

## Architecture
Coming soon!

## Relationships
Coming soon!