# Concepts

The *XOps Platform* is the core component that enables cross-functional domain teams and users to be autonomus in managing and consuming data products. The aim of this page is to be a landing for readers and to guide through the main concepts:

## Data Mesh paradigm

*Data Mesh* is a socio-technical paradigm that transforms how organizations manage and scale data. Instead of relying on a single central team, it empowers business domains to own their data as products, supported by self-serve platforms and guided by shared governance. The result: faster insights, higher quality, and data that truly serves the business

At its core, *Data Mesh* is built on four guiding pillars that unlock its full potential.

### Domain-oriented data ownership

<p align="center">
  <img src="../images/concepts/domains.svg" alt="Domains"/>
</p>

In *Data Mesh*, data responsibility shifts to the business domains that know it best. Each domain owns and manages its data end-to-end, ensuring higher quality, accuracy, and relevance. This decentralized approach brings data closer to the people who understand it, turning every domain into a true steward of its data.

### Data as a product

Data is *managed as a product*, designed with its users in mind. Each data product comes with clear documentation, quality standards, and reliable access. This ensures that data is not only available, but also trustworthy, discoverable, and ready to deliver real value. 

> A data product is a modular building block in a Data Mesh architecture, designed to make enterprise data assets easy to use, reuse, and maximize in value.

<p align="center">
  <img src="../images/concepts/data-product.svg" alt="Data Product"/>
</p>

A data product is characterized by:

- reproducible value for its users over time
- a clearly defined owner
- explicit boundaries
- a lifecycle
- some interfaces (ports) exposed to consumers and governed by data contracts.

> **Note**: a data product does not only include the data assets it exposes, but also the metadata and all the application and infrastructure components required to fulfill its purpose.

### Self-serve data infrastructure as a platform

A modern, self-serve platform gives domains the tools they need to publish, manage, and consume data with ease. By removing technical barriers, it accelerates innovation and empowers teams to work with data independently, without relying on a central bottleneck.

<p align="center">
  <img src="../images/concepts/self-serve-data-platform.svg" alt="Self-serve Data Platform"/>
</p>

### Federated computational governance

Governance in Data Mesh is decentralized yet coordinated. Common standards for security, compliance, and quality are applied consistently across domains, while allowing flexibility at the local level. Automated policies ensure trust and scalability without slowing down the business.

[Federated Computational Governance](./federated-computational-governance.md): summary of the interaction between the federated governance and the platform.

- [Data Product Descriptor](./data-product-descriptor.md): brief definition of the descriptor of a data product.
- [Logical Planes](./logical-planes/index.md): introduction to the concept of the multiplane platform.
    - [Data Product Experience Plane](./logical-planes/data-product-experience-plane.md): explanation and scope of the Data Product Experience Plane.
    - [Utility Plane](./logical-planes/utility-plane.md): explanation and scope of the Utility Plane.
    - [Mesh Experience Plane](./logical-planes/mesh-experience-plane.md): explanation and scope of the Mesh Experience Plane.
- [Self-Serve Data Platform](./self-serve-data-platform.md): overview of the principles of the self-serve platform.
