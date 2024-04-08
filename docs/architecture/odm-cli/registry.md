# Registry Commands

These are commands that require an active and reachable instance of the ODM *Registry Server*.

Common parameters:

* `-f / --properties-file`: file path of the configuration file describing how to communicate with ODM modules
    * it's an optional YAML file that, if present, list all the modules and their URL in the following format: `module-server: http://<hostname>:<port>` (e.g., `registry-server: http://localhost:8001`)
    * the default file in the project lists the modules as if they were exposed locally with their default ports
* `-s / --server`: server address (port included) of the ODM *Registry Server*; If explicit, override the property in the `properties-file`
* `-h / --help`: command helper
* `-V / --version`: command version

---
#### list dp

```bash
odm-cli registry list dp
```

* **name**: List Data Product
* **description**: List all registered Data Products
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
* **description**: Publish a Data Product Version given the file path of its JSON descriptor and the ID of the parent Data Product
* **parameters**: 
    * `--id`: Data Product identifier 
    * `--dpv-file`: local file path of the Data Product Version JSON descriptor
* **examples**:  
    * `odm-cli registry publish dpv --id abc123 --dpv-file src/main/resources/dpds/dpv.json` [with default `properties.yml` in module `root`] 
    * `odm-cli registry -f properties.yml publish dpv --id abc123 --dpv-file src/main/resources/dpds/dpd-example.json` 
    * `odm-cli registry --server http://localhost:8001 publish dpv --id abc123 --dpv-file src/main/resources/dpds/dpd-example.json`

---
#### upload dpv

```bash
odm-cli registry upload dpv
```

* **name**: Upload Data Product Version
* **description**: Publish a Data Product Version given the Git repository that stores its description objects. The command will interactively ask the user the following information:  
    * SSH URI of the Git repo 
    * Designated branch of the Git repo (default: `main`) 
    * Relative path inside the Git repo of the root JSON descriptor of the Data Product Version object
* **examples**:  
    * `odm-cli registry upload dpv` [with default `properties.yml` in module `root`] 
    * `odm-cli registry -f properties.yml upload dpv` 
    * `odm-cli registry --server http://localhost:8001 upload dpv`