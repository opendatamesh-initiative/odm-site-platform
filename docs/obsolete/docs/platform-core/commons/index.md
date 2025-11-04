# Commons

*Commons* is a submodule of Platform Core that groups and makes available some common utils to the entire application. It includes the following components:

* **OAuth**: it contains utilities and functionalities related to OAuth 2.0 authentication to external services. It includes classes for handling OAuth tokens and managing OAuth client-credentials flows.

* **Git**: it contains utilities and functionalities related to interacting with Git repositories. It includes methods for cloning repositories, managing their content, committing changes, and pushing them to remote servers.

* **Basic Exceptions**: it contains a set of basic exception classes that are commonly used throughout the application. These exception classes include generic exceptions and custom ones. They provide a standardized way to handle common error scenarios across different parts of the application.

* **Basic Client**: it is the component that streamlines communication with the application server. It offers a common interface to configure a REST server for handling HTTP requests, building URL and HTTP headers, and facilitating response parsing. Essentially, it provides the set of functionalities for building a reliable and efficient communication between the application components and the server.