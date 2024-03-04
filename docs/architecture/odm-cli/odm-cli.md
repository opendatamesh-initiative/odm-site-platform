# ODM CLI

## Description
ODM CLI is a module implementing a CLI (i.e., _Command Line Interface_) that allows to interact with some services of
the ODM Platform world.

It has commands that doesn't require the connection to any ODM service, like the validation of a Data Product descriptor 
syntax, and commands that requires an available and reachable ODM service, such as commands to create a Data Product, 
create a Blueprint, read all the registered Data Products, ...

A basic description and a how-to guide for execution is available on the module [README.md](https://github.com/opendatamesh-initiative/odm-platform/blob/main/odm-cli/README.md) on GitHub.

## Technologies
* Java 11
* Maven 3.8.6
* Spring 5.3.28
* Spring Boot 2.7.13
* [Picocli 4.7.5](https://picocli.info/)

Other than the usual Java, Maven and Spring technologies, the one that catch the interest is Picocli, that is a one-file
framework for creating Java command line applications with almost zero code.

## Architecture
ODM CLI is a Spring Boot project that doesn't expose any API and doesn't have a standard main class executing the service.
Each command invoke the start of the application that will execute the command, return the results and shut down.

This behaviour is possible thanks to the Picocli implementation, where the only code is the definition of the set of commands
available for command linde usage.

## Relationships
Each commands map a feature of other ODM projects and/or modules. Depending on the command, some of them doesn't require
any interaction with a reachable service and some requires and available and reachable ODM service.

## Commands
This section list all the available command, grouped by used modules.
* Local: local commands that doesn't need interaction with any ODM modules
* Registry: commands that interact with the _Registry Server_ of ODM
* Blueprint: commands that interact with the _Blueprint Server_ of ODM

### Local commands
Commands that doesn't require any reachable ODM module.

---
#### validate-dpv

```bash
odm-cli local validate dpv
```

* **name**: Validate Data Product Version
* **description**: Syntax validation of a Data Product Version JSON descriptor given the file path
* **parameters**:
    * `-f / --file` : local file path of the JSON descriptor
    * `-h / --help`: command helper
    * `-V / --version`: command version
* **example**: `odm-cli local validate dpv --file src/main/resources/dpds/dpd-example.json`

### Registry commands
Commands that require an active and reachable instance of the ODM *Registry Server*

Common parameters:
* `-f / --properties-file`: file path of the configuration file describing how to communicate with ODM modules
  * it's an optional YAML file that, if present, list all the modules and their URL in the following format: `module-server: http://<hostname>:<port>` (e.g., `registry-server: http://localhost:8001`)
  * the default file in the project list the modules as if they were exposed locally with their default ports
* `-s / --server`: server address (port included) of the ODM *Registry Server*; If explicit, override the property in the `properties-file`
* `-h / --help`: command helper
* `-V / --version`: command version

#### list dp

```bash
odm-cli registry list dp
```

* **name**: List Data Product
* **description**: List all registered Data Product
* **examples**: 
  * `odm-cli registry list dp` [with default `properties.yml` in module `root`]
  * `odm-cli registry -f properties.yml list dp`
  * `odm-cli registry --server http://localhost:8001 list dp`

---
#### list dpv

```bash
odm-cli registry list dpv
```

* **name**: List Data Product Version
* **description**: List all registered Data Product Version given a Data Product ID
* **parameters**:
  * `--id`: Data Product identifier
* **examples**: 
  * `odm-cli registry list dpv --id abc123` [with default `properties.yml` in module `root`]
  * `odm-cli registry -f properties.yml list dpv --id abc123`
  * `odm-cli registry --server http://localhost:8001 list dpv --id abc123`

---
#### get dp

```bash
odm-cli registry get dp
```

* **name**: Get Data Product
* **description**: Get a specific Data Product given its ID
* **parameters**:
  * `--id` : Data Product identifier
* **examples**:
  * `odm-cli registry get dp --id abc123` [with default `properties.yml` in module `root`]
  * `odm-cli registry -f properties.yml get dpv --id abc123`
  * `odm-cli registry --server http://localhost:8001 get dpv --id abc123`

---
#### get dpv

```bash
odm-cli registry get dpv
```

* **name**: Get Data Product Version
* **description**: Get a specific Data Product Version given the Data Product ID and the version number
* **parameters**:
  * `--id` : Data Product identifier
  * `--dpv`: desired version number
* **examples**: 
  * `odm-cli registry get dpv --id abc123 --dpv 1.0.0` [with default `properties.yml` in module `root`]
  * `odm-cli registry -f properties.yml get dpv --id abc123 --dpv 1.0.0`
  * `odm-cli registry --server http://localhost:8001 get dpv --id abc123 --dpv 1.0.0`


---
#### publish dp

```bash
odm-cli registry publish dp
```

* **name**: Publish Data Product
* **description**: Publish a Data Product given the file path of its JSON descriptor
* **parameters**:
  * `--dp-file`: file path of the Data Product JSON descriptor
* **examples**: 
  * `odm-cli registry publish dp --dp-file src/main/resources/dpds/dp-example.json` [with default `properties.yml` in module `root`]
  * `odm-cli registry -f properties.yml publish dp --dp-file src/main/resources/dpds/dp-example.json`
  * `odm-cli registry --server http://localhost:8001 publish dp --dp-file src/main/resources/dpds/dp-example.json`

---
#### publish dpv

```bash
odm-cli registry publish dpv
```

* **name**: Publish Data Product Version
* **description**: Publish a Data Product Version givne the file path of its JSON descriptor and the ID of the parent Data Product
* **parameters**:
  * `--id`: Data Product identifier
  * `--dpv-file`: local file path of the Data Product Version JSON descriptor
* **examples**: 
  * `odm-cli registry publish dpv --id abc123 --dpv-file src/main/resources/dpds/dpv.json` [with default `properties.yml` in module `root`]
  * `odm-cli registry -f properties.yml publish dpv --id abc123 --dpv-file src/main/resources/dpds/dpd-example.json`
  * `odm-cli registry --server http://localhost:8001 publish dpv --id abc123 --dpv-file src/main/resources/dpds/dpd-example.json`

---
#### uploadDPV

```bash
odm-cli registry upload dpv
```

* **name**: Upload Data Product Version
* **description**: Publish a Data Product Version given the Git repository that store its description objects. The command will interactively ask the user the following information: 
  * SSH URI of the Git repo
  * Designated branch of the Git repo (default: `main`)
  * Relative path inside the Git repo of the root JSON descriptor of the Data Product Version object
* **examples**: 
  * `odm-cli registry upload dpv` [with default `properties.yml` in module `root`]
  * `odm-cli registry -f properties.yml upload dpv`
  * `odm-cli registry --server http://localhost:8001 upload dpv`


### Blueprint commands
Commands that require an active and reachable instance of the ODM *Blueprint Server*

Common parameters:
* `-f / --properties-file`: file path of the configuration file describing how to communicate with ODM modules
  * it's an optional YAML file that, if present, list all the modules and their URL in the following format: `module-server: http://<hostname>:<port>` (e.g., `blueprint-server: http://localhost:8003`)
  * the default file in the project list the modules as if they were exposed locally with their default ports
* `-s / --server`: server address (port included) of the ODM *Blueprint Server*; If explicit, override the property in the `properties-file`
* `-h / --help`: command helper
* `-V / --version`: command version

---
#### create
```bash
odm-cli blueprint create
```

* **name**: Create Blueprint
* **description**: Create a Blueprint given its JSON descriptor
* **parameters**:
  * `--blueprint-file`: file path of the JSON descriptor
  * `--check`: [Optional] whether to verify or not the content of the Blueprint remote repository while creating it
* **examples**:
  * `odm-cli blueprint create --blueprint-file src/main/resources/bp-example.json` [with default `properties.yml` in module `root`]
  * `odm-cli blueprint -f properties.yml create --blueprint-file src/main/resources/bp-example.json`
  * `odm-cli blueprint --server http://localhost:8003 create --blueprint-file src/main/resources/bp-example.json`
  * `odm-cli blueprint create --blueprint-file src/main/resources/bp-example.json --check`

---
#### list
```bash
odm-cli blueprint list
```

* **name**: List Blueprint
* **description**: List all registered Blueprints
* **examples**: 
  * `odm-cli blueprint list` [with default `properties.yml` in module `root`]
  * `odm-cli blueprint -f properties.yml list`
  * `odm-cli blueprint --server http://localhost:8003 list`

---
#### init

```bash
odm-cli blueprint init
```

* **name**: Init Blueprint
* **description**: Init a target Git from the Blueprint source repo. It requires the Blueprint ID and the following parameters that they'll be interactively asked the user::
  * URL of the target Git repository
  * Whether to create or not (i.e., already exists) the target repository
  * each parameter required by the Blueprint (i.e., the parameters explicitly described in the Blueprint `params.json` file). if a parameter is skipped by the user, the default value will be used.
* **parameters**:
  * `--id`: Blueprint identifier
* **examples**: 
  * `odm-cli blueprint init --id 1` [with default `properties.yml` in module `root`]
  * `odm-cli blueprint -f properties.yml initBlueprint --id 1`
  * `odm-cli blueprint --server http://localhost:8003 init --id 1`
