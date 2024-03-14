# Policy Engine OPA

Policy Engine OPA is a [_Policy Engine Adapter_](../index.md) that acts as a _proxy_
between the [_Policy Server_](../../../product-plane/policy.md) and an instance of an OPA server 
(i.e., [Open Policy Agent](https://www.openpolicyagent.org/) server).

The main task of the adapter is to receive requests for policy evaluations on a given input, 
forward them to the OPA server, process and send back the results to the calling Policy Service.
It also handles the process of policy deployment on the OPA server and synchronization with the policies 
stored in the Policy Server (only for policy that have _Policy Engine OPA_ as Policy Engine).

## References

* GitHub repository: [odm-platform](https://github.com/opendatamesh-initiative/odm-platform-up-services-policy-opa)
* GitHub readme: [README.md](https://github.com/opendatamesh-initiative/odm-platform-up-services-policy-opa/README.md)
* API Doc: [ODM Api Documentation](https://opendatamesh-initiative.github.io/odm-api-doc/index.html), section _Doc_, subitem _opa-policy-server-redoc-static.html_ after selecting a version

## Technologies

* Java 11
* Maven 3.8.6
* Spring 5.3.28
* Spring Boot 2.7.13
* [OPA - rootless](https://hub.docker.com/layers/openpolicyagent/opa/latest-rootless/images/sha256-b8d2ca87f0241531433d106473bbe3661b7c9be735c447daefa164f2c3942b8d?context=explore)

In addition to the classic Java, Maven and Spring technologies, 
the OPA Policy Service requires an instance of a dockerized rootless OPA Server. 

## Architecture
Coming soon!

## Relationships
Coming soon!