# Overview

## What is ODMP
*Open Data Mesh Platform (ODMP)* is an open-core implementation of a *XOps Platform* facilitating the end-to-end management of data product lifecycles, from creation and validation, through deployment and access management, to decommissioning. ODMP's high versatility allows users to utilize the platform as is or tailor it to suit specific requirements. Embracing a modular architecture, ODMP leverages open specifications and protocols to enhance interoperability with diverse systems. By adhering to established standards, it fosters a supportive ecosystem of mesh tools that seamlessly integrate and adapt to evolving needs.

ODMP simplifies data-ops tasks, enabling teams to efficiently create, validate, deploy, serve and evolve their data products in a self-service manner empowering autonomous navigation. ODMP remains technology agnostic, providing flexibility to incorporate users' preferred tools through adapters.

The following figure shows at a high level the layers that make up the ODMP.

![Architecture-diagram](../images/overview/odm-overview.svg)

If you want to deeply understand the architecture and the implementation details of the Open Data Mesh Platform, this is the right place to start. You can also read the [Site Map](./sitemap.md) where you may find a structured index of all the documentation available on this site to plan your learning journey.

Welcome on board!

## Enterprise Edition

> **ODMP + Blindata**: web UI, enterprise security, ontology management, and a powerful data marketplace — all in one platform.


ODMP integrates seamlessly with [Blindata](https://blindata.io/product/), bringing a web-based graphical interface, robust security features, enterprise ontology management, and a rich data marketplace experience to enterprises. Blindata’s Experience Plane elevates ODMP’s services, delivering complete data governance and compliance solutions.

The following figure shows at a high level the layers that make up the enterprise setup of ODMP integrated with Blindata Platform.

![Architecture-diagram](../images/overview/odm-blindata-overview.svg)

## Feature Matrix

Below is a table with the list of features covered by ODMP standalone and the enterprise edition ODMP + Blindata

| Feature                       | ODMP            | ODMP + Blindata |
|-------------------------------|-----------------|-----------------|
| Web UI                        | ✗               | ✓               |
| User authentication           | ✗               | ✓               |
| RBAC Authorization            | ✗               | ✓               |
| Enterprise ontology management| ✗               | ✓               |
| Data marketplace experience   | ✗               | ✓               |
| Governance & compliance       | ✗               | ✓               |