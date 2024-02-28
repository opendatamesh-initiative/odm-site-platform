# Logical Planes

The *DataMeshOps Platform*, or just the *platform*, as it is referred to in this documentation, is tipically divided into three *logical planes*. In the conceptualization of the DataMeshOps functionalities, a *plane* represents a logical collection of capabilities with aligned objectives and significant functional cohesion. Each plane holds a clear responsibility, collaboratively working towards a shared overarching goal: establishing a **self-service data platform** under the guidance of a **federated computational governance**.

The aim of a plane is to overcome the intricacies of the underlying infrastructure providing a set of interfaces (such as a set of APIs) for the functionalities it encompasses. These interfaces serve as gateways to access the capabilities within the plane. Data product developers and data platform users have the possibility to interact directly with various planes of the platform.  

As stated before, the platform is composed of three planes. Each plane is briefly outlined below:

1. [Data Product Experience Plane](./data-product-experience-plane.md): the core component of the platform, this plane manages all the stages of data products lifecycle.
2. [Utility Plane](./utility-plane.md): the accessory plane that contains all the services and connectors between the Data Product Experience Plane and the actual infrastructure.
3. [Mesh Experience Plane](./mesh-experience-plane.md): the platform marketplace, with the aim of discovering data products, managing access requests and data product interactions.

<!-- ![Planes](../images/planes.png) -->

A deeper description of the planes is available in their dedicated sections.