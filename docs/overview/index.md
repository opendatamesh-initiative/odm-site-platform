# Overview

## What is ODMP
If you want to deeply understand the main features and the implementation details of the *Open Data Mesh Platform*, this is the right place to start. You can also read the [Site Map](./sitemap.md) where you may find a structured index of all the documentation available on this site to plan your learning journey.

Welcome on board!

*Open Data Mesh Platform (ODMP)* is an open-source implementation of an *XOps Platform* facilitating the end-to-end management of data product lifecycle, from creation and validation, through deployment and access management, to decommissioning. 

ODMP's high versatility allows users to utilize the platform as is or tailor it to suit specific requirements. Embracing a modular architecture, ODMP leverages open specifications and protocols to enhance interoperability with diverse systems. By adhering to established standards, it fosters a supportive ecosystem of mesh tools that seamlessly integrate and adapt to evolving needs. Specifically, the platform is based on the [DPDS specification](https://dpds.opendatamesh.org/) for defining data product metadata.

ODMP simplifies data-ops tasks, enabling teams to efficiently create, validate, deploy, make accessible and evolve their data products in a self-service manner empowering autonomous navigation. ODMP remains technology agnostic, providing flexibility to incorporate users' preferred tools through adapters.

The figure below provides a high-level view of the planes that compose the *Open Data Mesh Platform*.

![Architecture-diagram](../images/overview/odm-overview.svg){style="display:block; margin-left:auto; margin-right:auto;" width=70%}

## Platform Capabilities

Below is a concise overview of the platform's capabilities. More details can be found in the [architecture](../architecture/index.md).

- **Data Product Blueprint Management** — APIs that register blueprints and seamlessly instantiate data products from a centralized repository

- **Data Product and Version Registration** — APIs that register and validate both high-level product metadata and detailed specifications for each version.

- **Computational Policy Verification** — APIs that codify global governance policies and ensure their enforcement throughout data product lifecycle events.

- **Data Product Deployment Management** — APIs that orchestrate CI/CD pipelines and manage end-to-end deployment of data products as architectural quanta through a single operation.

- **Data Product Lifecycle Event Notification** — APIs that automatically notify all registered observers about every key change in the data product lifecycle, streamlining integration with enterprise tools.

- **Data Marketplace Workflow Management** — APIs that orchestrate workflows controlling user access to data product outputs, ensuring smooth and secure marketplace operations.


!!! info

    The Open Data Mesh Platform isn’t meant to replace low-level infrastructure tools (like CI/CD pipeline logic). Instead, it provides a higher-level abstraction that orchestrates end-to-end data product processes, shielding users from the complexity of low-level tasks, whose implementation depends on the specifics of the underlying infrastructure technologies.


## Blindata Integration

!!! info
    **ODMP + Blindata**: web UI, enterprise security, ontology management, and a powerful data marketplace — all in one platform.

The *Open Data Mesh Platform* seamlessly integrates with [Blindata](https://blindata.io/product/) — a complete suite of solutions for data governance and compliance. With Blindata, *ODMP* is elevated with an intuitive web interface, enterprise-grade security, powerful business ontology management, and streamlined data marketplace workflows. In fact, Blindata adds an *Experience Plane* on top of the platform, bringing the full power of *ODMP* closer to business users.

The following figure shows at a high level the layers that make up the enterprise setup of ODMP integrated with Blindata Platform.

![Architecture-diagram](../images/overview/odm-blindata-overview.svg){style="display:block; margin-left:auto; margin-right:auto;" width=70%}

## Feature Matrix

ODMP vs. ODMP + Blindata: see how integration unlocks enhanced features and capabilities.

| Feature                                           | ODMP | ODMP + Blindata |
|--------------------------------------------------|:---:|:---------------:|
| REST API                                         | ✅  | ✅              |
| Data Product Blueprints CRUD Operations          | ✅  | ✅              |
| Instantiate Data Products from Blueprints       | ✅  | ✅              |
| Data Product & Version CRUD Operations           | ✅  | ✅              |
| Validate Data Product Descriptors               | ✅  | ✅              |
| CRUD Computational Policies CRUD Operations      | ✅  | ✅              |
| Validate Computational Policies                  | ✅  | ✅              |
| Verify Policies During Lifecycle Events         | ✅  | ✅              |
| Execute Data Product Deployments                 | ✅  | ✅              |
| Notify Lifecycle Events to External Tools        | ✅  | ✅              |
| Manage User Access to Data Product Ports         | ✅  | ✅              |
| Create Access Requests for Data Product Output Ports   | ❌  | ✅        |
| Approve Access Requests for Data Product Output Ports  | ❌  | ✅         |
| Model Business Ontology                           | ❌  | ✅              |
| Authenticate Users                                | ❌  | ✅              |
| Control User Authorization                        | ❌  | ✅              |
| Manage Issues & Collaboration                     | ❌  | ✅              |
| Access via Web UI                                 | ❌  | ✅              |
