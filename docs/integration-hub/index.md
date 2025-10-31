# ODM Integration Hub

This page showcases the gallery of open-source **adapters services** currently available to integrate the ODM Platform with data infrastructure technologies. It also includes the **starter projects** available on GitHub for developing custom adapters tailored to specific needs, extending the *ODM Platform* and enabling integration with the technological tools of your choice.

An *Adapter* is a technology-specific implementation of the *Utility Plane* APIs: it is the component that decouples the XOps platform from the data infrastructure.

Each adapter is pluggable to the ODM Platform via configuration properties. ODM users are required to configure all the adapters they need to work with the underlying infrastructure layer.

<style>
.gallery-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  margin-top: 20px;
}

.gallery-box {
  flex: 1 1 calc(33.333% - 20px); /* ogni box prende 1/3 meno lo spazio del gap */
  max-width: calc(33.333% - 20px);
  border: 1px solid #ddd;
  border-radius: 12px;
  padding: 20px;
  background-color: #f9f9f9;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  transition: transform 0.2s ease;
}

.gallery-box h3 {
  margin-top: 0;
  font-size: 1.2em;
}

.gallery-box a {
  text-decoration: none;
  color: #0366d6;
}

.gallery-box p {
  margin: 10px 0 0 0;
  font-size: 0.95em;
}
</style>

#### Observers
<div class="gallery-container">

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-observer-blindata">Blindata Observer</a></h3>
    <img src="../images/logos/blindata.svg" alt="upload icon" width="150" style="vertical-align:middle; margin-right:6px;"/>
    <p>An observer that forwards notifications to 
      <a href="https://blindata.io/" target="_blank">Blindata </a> 
      in response to events.
    </p>
  </div>

</div>

#### Validators

<div class="gallery-container">

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-validator-opa">OPA Validator</a></h3>
    <img src="../images/logos/opa.png" alt="upload icon" width="180" style="vertical-align:middle; margin-right:6px;"/>
    <p>A specific implementation of a validator that uses 
      <a href="https://www.openpolicyagent.org/" target="_blank">Open Policy Agent </a> 
      as the engine to validate computational policies.
    </p>
  </div>

</div>

#### Executors

<div class="gallery-container">

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-marketplace-executor-starter">Marketplace Executor Starter</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>A starter project for building executors that integrate with an access management tool
    </p>
  </div>

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-executor-azuredevops">Azure DevOps Executor</a></h3>
    <img src="../images/logos/azuredevops.png" alt="upload icon" width="80" style="vertical-align:middle; margin-right:6px;"/>
    <p>An executor able to work with 
      <a href="https://azure.microsoft.com/en-us/products/devops/" target="_blank">Azure DevOps </a> 
      APIs to build, test, deploy data products.
    </p>
  </div>

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-platform-adapter-executor-gitlab">GitLab Executor</a></h3>
    <img src="../images/logos/gitlab.png" alt="upload icon" width="80" style="vertical-align:middle; margin-right:6px;"/>
    <p>An executor able to work with 
      <a href="https://about.gitlab.com/" target="_blank">GitLab </a> 
      APIs to build, test, deploy data products.
    </p>
  </div>

</div>

### CLI Tools

<div class="gallery-container">

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-cli">ODM CLI</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>Command line interface to interact with ODM Platform Services
    </p>
  </div>

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-cli-extensions">ODM CLI Extensions</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>Framework for extending the Open Data Mesh Command Line (ODM CLI)
    </p>
  </div>

   <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-cli-extensions-starter">ODM CLI Extensions Starter</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>starting project to implement a ImporterExtension, an Extension of the Open Data Mesh Command Line
    </p>
  </div>

  <div class="gallery-box">
    <h3><a href="https://github.com/opendatamesh-initiative/odm-cli-extensions-importer-jdbc">ODM CLI Importer JDBC Extension</a></h3>
    <img src="../images/logos/opendatamesh.png" alt="upload icon" width="60" style="vertical-align:middle; margin-right:6px;"/>
    <p>Command-line extension for the Open Data Mesh CLI that allows importing database metadata using JDBC
    </p>
  </div>

</div>

## Technologies

ODM Platform is a multi-module Java application composed of multiple microservices. The following is the list of the development technologies: 

* Java
* Maven
* Spring
* Spring Boot

All the services make use of this set of technologies as a baseline. Each single service can employ additional tools to meet different needs.