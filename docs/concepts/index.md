# Concepts

The *XOps Platform* is the core component that enables cross-functional domain teams and users to be autonomus in managing and consuming data products. The aim of this page is to be a landing for readers and to guide through the main concepts and the relevant context.

## Data Mesh paradigm

*Data Mesh* is a socio-technical paradigm that transforms how organizations manage data at scale. Instead of relying on a single central team, it empowers business domains to own their data as products, supported by a self-serve platform and guided by federated computational governance. The result: faster value, higher quality, and data that truly serves the business.

At its core, *Data Mesh* is built on four guiding pillars that unlock its full potential.

### Domain-oriented data ownership

![Domains](../images/concepts/domains.svg){style="display:block; margin-left:auto; margin-right:auto"}

In *Data Mesh*, data responsibility shifts to the business domains that know it best. Each domain owns and manages its data end-to-end, ensuring higher quality, accuracy, and relevance. This decentralized approach brings data closer to the people who understand it, turning every domain into a true steward of its data.

### Data as a product

Data is *managed as a product*, designed with its users in mind. Each data product comes with clear documentation, quality standards, and reliable access. This ensures that data is not only available, but also trustworthy, discoverable, and ready to deliver real value. 

> A data product is a modular building block in a *Data Mesh* architecture, designed to make enterprise data assets easy to use, reuse, and maximize in value.

The following figure shows the anatomy of a data product.

![Data Product](../images/concepts/data-product.svg){style="display:block; margin-left:auto; margin-right:auto"}

A data product is characterized by:

- reproducible value for its users over time
- a clearly defined owner
- explicit boundaries
- a lifecycle
- some interfaces (ports) exposed to consumers and governed by data contracts.

According to the principle of [*domain-oriented data ownership*](#domain-oriented-data-ownership), a data product is tied to a specific business domain. This does not mean, however, that it should only be used within that domain. On the contrary, by promoting its sharing across the entire organization, the overall value for the enterprise increases.

> **Note**: a data product does not only include the data assets it exposes, but also the metadata and all the application and infrastructure components required to fulfill its purpose.

#### What is a *Data Product Descriptor*

A *Data Product Descriptor* is a document containing comprehensive information regarding a data product, including its fully qualified name, ownership details, domain, version, interface components, and internal elements. You can find more information and a deeper explanation about that on the dedicated <a href="https://dpds.opendatamesh.org/concepts/data-product-descriptor/" target="_blank">DPDS</a> site.

The metadata defined in the Data Product Descriptor are fundamental for executing all stages of the data product lifecycle.

The goal of the [*Data Product Descriptor Specification (DPDS)*](https://dpds.opendatamesh.org/) is to establish a standard for defining the structure and the content of this document.


### Self-serve data infrastructure as a platform

A modern, self-serve platform gives domains the tools they need to publish, manage, and consume data products with ease. By removing technical barriers, it accelerates value creation and empowers teams to work with data independently, without relying on a central bottleneck.

A *Platform Engineering team* is responsible for the development, maintenance, and evolution of the self-serve platform.

The following figure illustrates the self-serve data infrastructure as a shared platform supporting the domain teams.

![Self-serve Data Platform](../images/concepts/self-serve-data-platform.svg){style="display:block; margin-left:auto; margin-right:auto"}

The driving force behind data mesh's evolution lies in the principle of *self-serve data infrastructure as a platform*. In a world with a vast landscape of data and analytics platforms, the actual goal is to revolutionize the scalability of sharing, accessing, and utilizing analytical data in a decentralized manner. This distinctive approach forms the fundamentals of a data mesh platform.

The main strategy involves extracting domain-agnostic capabilities from each domain and integrating them into a self-serve infrastructure platform. This platform is meticulously constructed and maintained by a dedicated central team, known as the *Platform Engineering team*, ensuring reliability and adaptability to ever-changing demands.

The aim of the *Platform Engineering team* is to empower *domain teams* to operate with significant autonomy. While the *domain teams* retain complete ownership of developing, operating, and maintaining their data products in production, the platform team serves to offer internal services. These services are designed to alleviate the cognitive burden that *domain teams* would otherwise face in developing these foundational services themselves.

A typical data mesh self-serve platform embodies several key characteristics:

* **Domain-oriented teams**: the platform is structured to empower autonomous teams aligned with specific domains. This approach fosters agility and specialization within each team, allowing them to focus on their unique domain expertise without being bogged down by centralized control.

* **Interoperable data products**: data products within the platform are designed to be interoperable, integrating code, data, and policy seamlessly into a single unit. This integration streamlines data management processes and enhances collaboration across different teams and domains.

* **Integrated operational and analytical capabilities**: traditionally, there has been a disconnect between operational and analytical worlds, interfering with fluid data utilization. Data mesh aims to bridge the gap by providing an integrated platform able to harmonize both operational and analytical capabilities.

* **Generalist data engineers**: the absence of standards amplifies interoperability challenges, often resulting in vendor lock-in within monolithic platforms. The data mesh paradigm seeks to break down these barriers by enhancing interoperability and reducing reliance on proprietary languages and technologies. By embracing common, generalist-friendly languages and tools, the platform empowers a broader range of data engineers to contribute effectively.

* **Decentralized technologies**: historically, infrastructure management has been centralized, leading to bottlenecks and inefficiencies. The data mesh paradigm advocates for decentralized technologies, distributing infrastructure management responsibilities across different teams and domains. This decentralization fosters scalability, resilience, innovation, while reducing dependency on centralized control.

* **Domain agnostic**: the platform offers domain-agnostic capabilities while enabling domain-specific modeling, processing, and sharing. This flexibility ensures that services remain centrally available while empowering individual domains to develop solutions tailored to their unique requirements. By hitting this balance between centralization and domain-specific customization, the platform accommodates diverse use cases promoting collaboration across the organization.

Such a decentralized structure allows greater flexibility, enabling teams to select and integrate the tools that best suit their specific needs and objectives.

#### What is an *XOps Platform*

A *self-serve data infrastructure as a platform* starts with a solid technological foundation: the data infrastructure. On top of this foundation sits the *XOps Platform*, a plane-based architecture designed to streamline the development, maintenance, and consumption of data products. By combining the capabilities of a DataOps Platform with those of an Enterprise Data Marketplace, the *XOps Platform* makes working with data faster, easier, and more effective.

The figure below illustrates the planes of the *XOps Platform* built on top of the data infrastructure.

![Platform Planes](../images/concepts/platform-planes.svg){style="display:block; margin-left:auto; margin-right:auto"}

The *XOps Platform*, or just the *platform*, as it is referred to in this documentation, is divided into three *logical planes*. 
In the conceptualization of the DataMeshOps functionalities, a *plane* embodies a logical assembly of capabilities with complementary goals and significant functional unity. Each plane holds a clear responsibility, collaboratively working towards a shared overarching goal: establishing a *self-service data infrastructure as a platform* under the guidance of a *federated computational governance*.

> The aim of each plane is to abstract the complexities of the underlying one, providing a set of interfaces (such as APIs) for the functionalities it encompasses. These interfaces act as gateways to access the capabilities within the plane. Data product developers and data platform users can interact directly with the various planes of the platform.

Each of the three planes is briefly described below.

1. [Control Plane](#control-plane): the core component of the platform, this plane manages all the events of data products lifecycle.
2. [Utility Plane](#utility-plane): the decoupling plane that contains all the services and connectors between the *Contro Plane* and the actual infrastructure.
3. [Esperience Plane](#experience-plane): the platform marketplace, with the aim of discovering data products, managing access requests and data product interactions.

A deeper description of the planes is available in their dedicated sections.

##### Control Plane
The *Control Plane* aims to manage the entire lifecycle of data products. It is the core component of the *XOps platform* as it is responsible for orchestrating all the other components. As a high-level abstraction of the platform, it helps in building, maintaining, and evolving data products. In particular, it offers specific interfaces to handle the full lifecycle of a data product (initialization, validation, registration, search, deployment, decommissioning).

The services provided by this plane are not standalone and self-sufficient; instead, they rely on the underlying services provided by the [Utility Plane](#utility-plane.md), which offers specialized implementations tailored to the low-level infrastructure services used. This approach ensures that the *Control Plane* remains independent from the underlying infrastructure.

##### Utility Plane
The *Utility Plane* assumes the critical role of connecting the *Control Plane* services to the foundational infrastructure resources required for the establishment and operation of the mesh network. Its responsibilities include the interaction with multiple low-level components essential for the mesh's functionality, such as storage systems, computational resources, and identity management frameworks.

All the interfaces exposed by the *Utility Plane* should be standardized as much as possibile to decouple the consumers from the actual implementation. Due to this decoupling, it enables:

1. Maintaining platform planes' independence from underlying technology, facilitating reusability across various technological environments
2. Designing a standardized API for infrastructure utility plane services, eliminating unnecessary technological complexities
3. Changing the implementation of infrastructure utility plane services without affecting other planes

This kind of infrastructure management not only streamlines operations but also promotes consistency, scalability, and interoperability within the broader ecosystem. 

##### Experience Plane
The *Experience Plane* abstracts mesh-level functionalities across data products, offering a streamlined interface to search, navigate, and manage the overall *Data Mesh* network. 

It links data products and their assets to the enterprise ontology, fostering semantic composability and reuse across multiple business use cases. The plane can also attach data quality indicators to data products, enabling consumers to evaluate their reliability. 

Furthermore, it facilitates interactive communication between data consumers and data product owners, allowing consumers to submit and track access requests, while owners can review and approve or reject them—ensuring smooth collaboration within the ecosystem..

### Federated computational governance

Governance in *Data Mesh* is decentralized yet coordinated. Common standards for security, compliance, and quality are applied consistently across domains while still allowing local flexibility. Automatically enforced policies ensure trust and scalability without slowing down business operations.

Representatives from each *Domain team*, the *Platform Engineering team*, and other specialized roles form a *Federated Governance Committee*. The committee defines policies that are *implemented as code* by the platform and automatically enforced across all data products. 

![Federated Computational Governance](../images/concepts/federated-computational-governance.svg){style="display:block; margin-left:auto; margin-right:auto"}

In the *Data Mesh* paradigm, governance plays a crucial role in ensuring safety, reliability, and validity of the data products within the mesh network. A good governance ensures that data is correctly delivered, securely used, high-quality guaranteed, regulation compliant, respectful of privacy, and easy to use. 

Unlike in the past, where rigid centralized models were the norm, such approaches don't fit well with mesh network's flexibility. In the mesh era, an automated, shared approach to governance is envisioned, where rules are built into products and domains. This approach, called *Federated Computational Governance*, lets product and platform owners jointly make decisions. It allows local rules for products while requiring domains to follow broader guidelines. Furthermore, governance enables products to work together smoothly through agreed-upon standards, fostering collaboration among all elements involved in the mesh.

From an organizational perspective, the data mesh operates as a *federation*. It features an organizational structure comprised of *domains*, each enjoying sufficient internal autonomy. Domains oversee and manage their data products, retaining control over their modeling and distribution. They determine which Service Level Objectives (SLOs) to guarantee for their data products and they must ensure consumer satisfaction. The data mesh introduces an operational governance model leveraging federated decision-making. The *Federated Governance Committee* is a federated group of platform and domain stakeholders, including: domain representatives, platform representatives (platform owners and platform architects), subject matter experts (specializing in security, compliance, privacy, and regulations), and managers.

In such a framework, the platform plays a central role in supporting the governance in a *computational* manner via:

* **Standards as Code**: many policies can be consistently implemented across all data products.

* **Policies as Code**: all data products must implement global policies for compliance, access control, audit, and privacy. The platform can ensure that policies are defined via code, versioned, tested and continuously executed throughout the data product lifecycle.

* **Automated tests**: the platform can perform automated tests to ensure that data products always expose intact and high-quality metadata.

* **Automated monitoring**: the platform can conduct continuous and automated monitoring and trigger alarms in case of issues.

Specifically, these *computational policies* validate the compliance and completeness of metadata specified in the *Data Product Descriptor*. They can be either non-blocking or blocking: non-blocking policies allow lifecycle stages to proceed even if violations occur, while enabling anomalies to be tracked through the *Experience Plane*; blocking policies, however, prevent progression until issues are resolved, playing a key role in enabling automation of certain lifecycle stages and ensuring correct management of data products.


