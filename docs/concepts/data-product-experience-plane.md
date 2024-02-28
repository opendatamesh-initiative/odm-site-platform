# Data Product Experience Plane

The *Data Product Experience Plane* aims to manage the entire lifecycle of data products. It is the core component of the DataMeshOps platform as it is responsible for orchestrating all the other components. As a high-level abstraction of the platform, it helps in building, maintaining, and consuming data products. In particular, it offers specific interfaces to handle the full lifecycle of a data product (build, test, deploy, decommissioning) and supports consumers in the subscription for data access.

The services provided by this plane are not standalone and self-sufficient; instead, they rely on the underlying services provided by the [Utility Plane](./utility-plane.md), which offers a specialized implementation tailored to the low-level infrastructure service. This approach ensures that the *Data Product Experience Plane* remains independent from the underlying infrastructure.
