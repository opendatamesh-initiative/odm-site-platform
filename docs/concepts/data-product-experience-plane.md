# Data Product Experience Plane

The Data Product Experience Plane aims to manage the entire lifecycle of data products. It is the core component of the Open Data Mesh platform as it is responsible for orchestrating all the other components.

In turn, it consists of two modules, the [Registration Service](#registrationservice), which provides registration, validation, and access services to Data Product information, and the [Deployment Service](#deployment-service),in charge of actually deploying a Data Product, managing the creation and release of all its components.

Both services are not self-sufficient, in fact they use the underlying services exposed by the [Utility Plane](./utility-plane.md), which offer specific implementation. In this way the Data Product Experience Plane remains decoupled from the actual underlying infrastructure.

## Registration Service

The Registration Service has the function of registering data products, both at their creation and when a new version is developed. 

To do this, the product team will provide a descriptor containing all relevant information, which will be first validated syntactically and then validated also through the [Policy Service](./utility-plane.md#policyservice). 

In case all checks are successful, the metadata of the data product is sent to the [Meta Service](./utility-plane.md#metaservice) to be cataloged in the underlying Data Governance service.

![Registration Service](../images/registration-service.png)

## Deployment Service

The Deployment Service has the function of deployng a Data Product and all of its components.

It starts from a Data Product Descriptor and orchestrates a set of services from the [Utility Plane](./utility-plane.md).

The first main stage is Provisioning, where [Provisioning Service](./utility-plane.md#provisioningservice) is called in order to create the required infrastructural components, usually cloud resources like buckets and databases, needed to correctly run the Data Product.

The second stage is Building, where [Build Service](./utility-plane.md#buildservice) is called in order to compile the applications defined in the descriptor.

Finally, in the Deploy stage, the packages are distributed and executed in the target production environments.

At each step, the deployment service interfaces with the policy service of the utility plane to perform compliance checks with policies and registers new metadata on the external governance tool integrated with the platform.

!!!tip

    IMMAGINE CON WORKFLOW DEL DEPLOYMENT SERVICE?