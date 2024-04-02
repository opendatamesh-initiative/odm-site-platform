# Blueprint Commands

These are commands that require an active and reachable instance of the ODM *Blueprint Server*.

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