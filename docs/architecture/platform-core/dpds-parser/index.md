# DPDS Parser

As stated in the concepts, ODM relies on the notion of [Data Product Descriptor](../../../concepts/data-product-descriptor.md), that is a standard to define the structure and the content of a Data Product.

The *DPDS Parser* is a submodule of Platform Core that groups together basic shared resources, such as Data Product and Data Product Version resources, making them available for usage to other application components. Specifically, it includes all the data model revolving around the concept of the Data Product Descriptor, its parsers and processors, and all the logics to handle serialization and possibile parsing exceptions.