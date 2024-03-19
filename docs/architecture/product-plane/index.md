# Product Plane

The *Product Plane* is the ODM implementation of the [Data Product Experience Plane](../../concepts/logical-planes/data-product-experience-plane.md) which exposes the core services of the ODM Platform, including:

* [Registry Service](./registry.md): it registers a new data product with a unique identifier and a data product version within the mesh, making it visible to the mesh governance processes.
* [Blueprint Service](./blueprint.md): it handles data product bootstrap and initialization leveraging on a deep integration with Git services.
* [DevOps Service](./devops.md): it manages the entire data product lifecycle (i.e., development, test, deploy, decommissioning).
* [Policy Service](./policy.md): it handle services to apply and run embedded computational policies on every data product of the mesh.
* [Params Service](./params.md): it is a custom ODM service to handle parameters and common variables within the entire platform.

Each service is ready to use and represents an available feature on the platform.