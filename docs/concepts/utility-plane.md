# Utility Plane

The *Utility Plane*, or *Data Infrastructure Plane*, assumes the critical role of offering the foundational infrastructure resources required for the establishment and operation of the mesh network. Its responsibilities include the management of various low-level components essential for the mesh's functionality, such as storage systems, computational resources, and identity management frameworks.

All the interfaces exposed by the *Utility Plane* should be standardized as much as possibile to decouple the consumers from the actual implementation. Due to this decoupling, it enables:

1. Maintaining platform planes' independence from underlying technology, facilitating reusability across various technological environments.
2. Designing a standardized API for infrastructure utility plane services, eliminating unnecessary technological complexities.
3. Changing the implementation of infrastructure utility plane services without affecting other planes.

This kind of infrastructure management not only streamlines operations but also promotes consistency, scalability, and interoperability within the broader ecosystem.