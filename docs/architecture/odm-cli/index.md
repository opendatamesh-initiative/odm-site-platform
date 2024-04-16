# ODM CLI

## Overview

The *ODM CLI* is a module implementing a CLI (i.e., _Command Line Interface_) that allows to interact with some services of
the ODM Platform world.

It has commands that don't require the connection to any ODM service, like the validation of a Data Product descriptor 
syntax, and commands that require an available and reachable ODM service, such as commands to create a Data Product, 
create a Blueprint, read all the registered Data Products, and more.


## How it works

### Architecture
ODM CLI is a Spring Boot project that doesn't expose any API and doesn't have a standard main class executing the service.
Each command invokes the start of the application that will execute the command, returns the results and shut down.

This behavior is possible thanks to the Picocli implementation, where the only code is the definition of the set of commands
available for command linde usage.

### Relations
Each command maps a feature of other ODM projects and/or modules. Depending on the command, some of them don't require any interaction with a reachable service, and some require and available and reachable ODM service.

### Commands
This section lists all the available commands, grouped by used modules.

* [Local](./local.md): local commands that don't need interaction with any ODM modules
* [Registry](./registry.md): commands that interact with the _Registry Server_ of ODM
* [Blueprint](./blueprint.md): commands that interact with the _Blueprint Server_ of ODM
* [Policy](./policy.md): commands that interact with the _Policy Server_ of ODM


## Technologies

In addition to the technologies already mentioned on the main architecture page, this module makes use of the following:

* <a href="https://picocli.info/" target="_blank">Picocli:octicons-link-external-24:</a>, a framework for creating Java command line applications with almost zero code
