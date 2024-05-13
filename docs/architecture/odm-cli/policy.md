# Policy Commands

These are commands that require an active and reachable instance of the ODM *Policy Server*.

Common parameters:

* `-f / --properties-file`: file path of the configuration file describing how to communicate with ODM modules
    * it's an optional YAML file that, if present, list all the modules and their URL in the following format: `module-server: http://<hostname>:<port>` (e.g., `registry-server: http://localhost:8005`)
    * the default file in the project lists the modules as if they were exposed locally with their default ports
* `-s / --server`: server address (port included) of the ODM *Registry Server*; If explicit, override the property in the `properties-file`
* `-h / --help`: command helper
* `-V / --version`: command version


---
#### list engine

```bash
odm-cli validator list engine
```

* **name**: List Policy Engine
* **description**: List all registered Policy Engines
* **examples**: 
    * `odm-cli policy list engine` [with default `properties.yml` in module `root`]
    * `odm-cli policy -f properties.yml list engine`
    * `odm-cli policy --server http://localhost:8005 list engine`


---
#### list policy

```bash
odm-cli validator list validator
```

* **name**: List Policy
* **description**: List all registered Policies
* **examples**: 
    * `odm-cli policy list policy` [with default `properties.yml` in module `root`]
    * `odm-cli policy -f properties.yml list policy`
    * `odm-cli policy --server http://localhost:8005 list policy`


---
#### list result

```bash
odm-cli validator list result
```

* **name**: List Policy Evaluation Result
* **description**: List all registered Policy Evaluation Results
* **examples**: 
    * `odm-cli policy list result` [with default `properties.yml` in module `root`]
    * `odm-cli policy -f properties.yml list result`
    * `odm-cli policy --server http://localhost:8005 list result`


---
#### get engine

```bash
odm-cli validator get engine
```

* **name**: Get Policy Engine
* **description**: Get a specific Policy Engine given its ID
* **parameters**:
    * `--id` : Policy Engine identifier
* **examples**:
    * `odm-cli policy get engine --id 1` [with default `properties.yml` in module `root`]
    * `odm-cli policy -f properties.yml get engine --id 1`
    * `odm-cli policy --server http://localhost:8005 get engine --id 1`


---
#### get policy

```bash
odm-cli validator get validator
```

* **name**: Get Policy
* **description**: Get a specific Policy given its ID
* **parameters**:
    * `--id` : Policy identifier
    * `--root` : Whether the ID is the root ID or the version ID (Optional, default value `true`, set it to `false` to get by version ID)
* **examples**:
    * `odm-cli policy get policy --id 1` [with default `properties.yml` in module `root`]
    * `odm-cli policy -f properties.yml get policy --id 1`
    * `odm-cli policy --server http://localhost:8005 get policy --id 1`
    * `odm-cli policy get policy --id 1 --root false`


---
#### get result

```bash
odm-cli validator get result
```

* **name**: Get Policy Evaluation Result
* **description**: Get a specific Policy Evaluation Result given its ID
* **parameters**:
    * `--id` : Policy Evaluation Result identifier
* **examples**:
    * `odm-cli policy get result --id 1` [with default `properties.yml` in module `root`]
    * `odm-cli policy -f properties.yml get result --id 1`
    * `odm-cli policy --server http://localhost:8005 get result --id 1`


---
#### publish engine

```bash
odm-cli validator publish engine
```

* **name**: Publish Policy Engine
* **description**: Publish a Policy Engine given the file path of its JSON descriptor
* **parameters**: 
    * `--engine-file`: file path of the Policy Engine JSON descriptor
* **examples**:  
    * `odm-cli policy publish engine --engine-file src/main/resources/policy/engines/engine.json` [with default `properties.yml` in module `root`] 
    * `odm-cli policy -f properties.yml publish engine --engine-file src/main/resources/policy/engines/engine.json` 
    * `odm-cli policy --server http://localhost:8005 publish engine --engine-file src/main/resources/policy/engines/engine.json`


---
#### publish policy

```bash
odm-cli validator publish validator
```

* **name**: Publish Policy
* **description**: Publish a Policy given the file path of its JSON descriptor
* **parameters**: 
    * `--policy-file`: file path of the Policy JSON descriptor
* **examples**:  
    * `odm-cli policy publish policy --policy-file src/main/resources/policy/policies/policy.json` [with default `properties.yml` in module `root`] 
    * `odm-cli policy -f properties.yml publish policy --policy-file src/main/resources/policy/policies/policy.json` 
    * `odm-cli policy --server http://localhost:8005 publish policy --policy-file src/main/resources/policy/policies/policy.json`


---
#### publish result

```bash
odm-cli validator publish result
```

* **name**: Publish Policy Evaluation Result
* **description**: Publish a Policy Evaluation Result given the file path of its JSON descriptor
* **parameters**: 
    * `--result-file`: file path of the Policy Evaluation Result JSON descriptor
* **examples**:  
    * `odm-cli policy publish result --result-file src/main/resources/policy/results/result.json` [with default `properties.yml` in module `root`] 
    * `odm-cli policy -f properties.yml publish result --result-file src/main/resources/policy/results/result.json` 
    * `odm-cli policy --server http://localhost:8005 publish result --result-file src/main/resources/policy/results/result.json`


---
#### update engine

```bash
odm-cli validator update engine
```

* **name**: Update Policy Engine
* **description**: Update a Policy Engine given the file path of its JSON descriptor and its ID
* **parameters**: 
    * `--id`: identifier of the Policy Engine to update
    * `--engine-file`: file path of the Policy Engine JSON descriptor
* **examples**:  
    * `odm-cli policy update engine --id 1 --engine-file src/main/resources/policy/engines/engine.json` [with default `properties.yml` in module `root`] 
    * `odm-cli policy -f properties.yml update engine --id 1 --engine-file src/main/resources/policy/engines/engine.json` 
    * `odm-cli policy --server http://localhost:8005 update engine --id 1 --engine-file src/main/resources/policy/engines/engine.json`


---
#### update policy

```bash
odm-cli validator update validator
```

* **name**: Update Policy
* **description**: Update a Policy given the file path of its JSON descriptor and its ID
* **parameters**: 
    * `--id`: identifier of the Policy to update
    * `--policy-file`: file path of the Policy JSON descriptor
* **examples**:  
    * `odm-cli policy update policy --id 1 --policy-file src/main/resources/policy/policies/policy.json` [with default `properties.yml` in module `root`] 
    * `odm-cli policy -f properties.yml update policy --id 1 --policy-file src/main/resources/policy/policies/policy.json` 
    * `odm-cli policy --server http://localhost:8005 update policy --id 1 --policy-file src/main/resources/policy/policies/policy.json`


---
#### update result

```bash
odm-cli validator update result
```

* **name**: Update Policy Evaluation Result
* **description**: Update a Policy Evaluation Result given the file path of its JSON descriptor and its ID
* **parameters**:
    * `--id`: identifier of the Policy Evaluation Result to update
    * `--result-file`: file path of the Policy Evaluation Result JSON descriptor
* **examples**:  
    * `odm-cli policy update result --id 1 --result-file src/main/resources/policy/results/result.json` [with default `properties.yml` in module `root`] 
    * `odm-cli policy -f properties.yml update result --id 1 --result-file src/main/resources/policy/results/result.json` 
    * `odm-cli policy --server http://localhost:8005 update result --id 1 --result-file src/main/resources/policy/results/result.json`


---
#### validate document

```bash
odm-cli validator validate document
```

* **name**: Validate Document
* **description**: Request the evaluation of a Policy Evaluation Request
* **parameters**: 
    * `--document-file`: file path of the Policy Evaluation Request JSON descriptor
* **examples**:  
    * `odm-cli policy validate document --document-file src/main/resources/policy/evaluationRequests/evaluationRequest.json` [with default `properties.yml` in module `root`] 
    * `odm-cli policy -f properties.yml validate document --document-file src/main/resources/policy/evaluationRequests/evaluationRequest.json` 
    * `odm-cli policy --server http://localhost:8005 validate document --document-file src/main/resources/policy/evaluationRequests/evaluationRequest.json`