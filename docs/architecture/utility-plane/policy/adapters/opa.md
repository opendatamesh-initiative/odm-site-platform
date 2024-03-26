# Policy Engine OPA

## Overview

Policy Engine OPA is a [_Policy Engine Adapter_](../index.md) that acts as a _proxy_
between the [_Policy Server_](../../../product-plane/policy.md) and an instance of an OPA (<a href="https://www.openpolicyagent.org/" target="_blank">Open Policy Agent:octicons-link-external-24:</a>) server.

The main task of the adapter is to receive requests for policy evaluations on a given input, 
forward them to the OPA server, process and send back the results to the calling Policy Service.
It also handles the process of policy deployment on the OPA server and synchronization with the policies 
stored in the Policy Server (only for policies that have _Policy Engine OPA_ as Policy Engine).


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

In addition to the classic Java, Maven and Spring technologies, the OPA Policy Engine requires an instance of a dockerized rootless OPA Server.

* <a href="https://hub.docker.com/layers/openpolicyagent/opa/latest-rootless/images/sha256-b8d2ca87f0241531433d106473bbe3661b7c9be735c447daefa164f2c3942b8d?context=explore" target="_blank">OPA - rootless:octicons-link-external-24:</a>


## References

* GitHub repository: <a href="https://github.com/opendatamesh-initiative/odm-platform-up-services-policy-opa" target="_blank">odm-platform-up-services-policy-opa:octicons-link-external-24:</a>
* API Documentation: <a href="https://opendatamesh-initiative.github.io/odm-api-doc/doc.html" target="_blank">ODM Api Documentation:octicons-link-external-24:</a>, subitem _opa-policy-server-redoc-static.html_ after selecting a specific version