# Local Commands

These are commands that don't require any reachable ODM module.

---
#### validate dpv

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