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
* API Doc: Coming soon!

## Technologies
Coming soon!

## Architecture
Coming soon!

## Relationships
Coming soon!