# ODM CLI

## Overview

The *ODM CLI* is a module implementing a CLI (i.e., _Command Line Interface_) that allows to interact with some services of
the ODM Platform world.

It has commands that doesn't require the connection to any ODM service, like the validation of a Data Product descriptor 
syntax, and commands that requires an available and reachable ODM service, such as commands to create a Data Product, 
create a Blueprint, read all the registered Data Products, and more.


## How it works

### Architecture
ODM CLI is a Spring Boot project that doesn't expose any API and doesn't have a standard main class executing the service.
Each command invoke the start of the application that will execute the command, return the results and shut down.

This behaviour is possible thanks to the Picocli implementation, where the only code is the definition of the set of commands
available for command linde usage.

### Relations
Each commands map a feature of other ODM projects and/or modules. Depending on the command, some of them doesn't require
any interaction with a reachable service and some requires and available and reachable ODM service.

### Commands
This section list all the available command, grouped by used modules.

* [Local](./local.md): local commands that doesn't need interaction with any ODM modules
* [Registry](./registry.md): commands that interact with the _Registry Server_ of ODM
* [Blueprint](./blueprint.md): commands that interact with the _Blueprint Server_ of ODM


## Technologies

In addition to the technologies already mentioned on the main architecture page, this module makes use of the following:

* <a href="https://picocli.info/" target="_blank">Picocli:octicons-link-external-24:</a>, a framework for creating Java command line applications with almost zero code
