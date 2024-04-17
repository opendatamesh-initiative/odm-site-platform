# Params

## Overview

The _Params microservice_ is an ODM Platform module, belonging to the Product Plane, 
designed as a _key-value_ store for parameters, configurations and variables.

It supports both encrypted and decrypted data, and it can interact with any other ODM module.

The main task of the Params microservice is to store configuration values 
that could be retrieved from another ODM microservice at the startup.
After fetching them, the latter could override the default configuration, changing the default application behavior.

## Concepts

### Param
The Params microservice only stores _key-value_ entries, where each record is a _Param_.
The main attributes of a Param are:

* key: a string defining the name of the parameter, the variable or the configuration entry
* value: a text value (any alphanumeric sequence or character) representing the value associated with the key
* secret: a flag to specify whether the Param needs to be encrypted or not

A key could be any string, like a Spring Boot configuration for enabling or disabling a feature, 
a retrievable parameter for custom ODM services, as well as any desired variable.
Its value is the content associated with that key and could be encrypted or decrypted depending on the user requests.

### Encryption
When registering a Param, if the _secret_ attribute is _true_, the Params microservice applies a default _encryption_
to the data, in order to mask them from any caller.

Encrypted values aren't directly decipherable from the default APIs, but particular ODM clients could be configured
with the decryption ability.
Such an ability must be configured both on the Params service and on the ODM microservice of interest
before the application startups; without this configuration step, no client will be able to access the decrypted value
of an encrypted Param.

The default encryption algorithm is <a href="https://en.wikipedia.org/wiki/Advanced_Encryption_Standard" target="_blank">AES:octicons-link-external-24:</a>
with a key size of 256. Each instance of the Params microservice will have its unique key,
safely saved in the System Properties of the application.

## How it works

!!! warning

    **Work In Progress!**

    This page is currently undergoing improvements, such as the integration with any other ODM modules and the dynamic updated of application's configurations.
    We apologize for any inconvenience and appreciate your patience.

## Relations

!!! warning

    **Work In Progress!**

    This page is currently undergoing improvements, such as the integration with any other ODM modules and the dynamic updated of application's configurations.
    We apologize for any inconvenience and appreciate your patience.

## Technologies

Other than the default Java, Maven and Spring technologies, the Params module does not make use of any particular technology.
Encryption and decryption are implemented through default Java libraries,
such as _Base64_, Security and Crypto.

## References

* GitHub repository: <a href="https://github.com/opendatamesh-initiative/odm-platform" target="_blank">odm-platform:octicons-link-external-24:</a>
* API Documentation: Coming soon!