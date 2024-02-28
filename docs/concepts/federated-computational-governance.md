# Federated Computational Governance

In the data mesh paradigm, governance plays a crucial role in ensuring safety, reliability, and validity of the data products within the mesh network. A good governance ensures that data is delivered and used securely, being of high quality, complies with regulations, respects privacy, and is easy to use. 

Unlike in the past, where rigid centralized models were the norm, such approaches don't fit well with mesh network's flexibility. In the mesh era, an automated, shared approach to governance is envisioned, where rules are built into products and domains. This approach, called *federated computational governance*, lets product and platform owners jointly make decisions. It allows local rules for products while requiring domains to follow broader guidelines. Furthermore, governance enables products to work together smoothly through agreed-upon standards, fostering collaboration among all elements involved in the mesh.

From an organizational perspective, the data mesh operates as a *federation*. It features an organizational structure comprised of *domains*, each enjoying sufficient internal autonomy. Domains oversee and manage their data products, retaining control over their modeling and distribution. They determine which Service Level Objectives (SLOs) to uphold for their data products and are accountable for ensuring consumer satisfaction. The data mesh introduces an operational governance model leveraging federated decision-making: the *governance team* is a federated group of platform and domain stakeholders, including domain representatives, platform representatives (platform owners and platform architects), subject matter experts (specializing in security, compliance, privacy, and regulations), facilitators and managers.

In such a framework, the platform plays a central role in supporting the governance in a *computational* manner via:

* **Standards as Code**: many policies can be consistently implemented across all data products.

* **Policies as Code**: all data products must implement global policies for compliance, access control, audit, and privacy. The platform can ensure that policies are defined via code, tested, and continuously executed throughout the data product lifecycle.

* **Automated tests**: the platform can perform automated tests to ensure that data products always have intact and high-quality data.

* **Automated monitoring**: the platform can conduct continuous and automated monitoring and trigger alarms in case of issues.