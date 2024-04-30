#!/bin/bash

# Define the directory paths
BASE_DIRECTORY="."
DOC_DIRECTORY="${BASE_DIRECTORY}/docs/api-doc"

# Echo common parts
echo "# API Documentation" > "${DOC_DIRECTORY}/index.md"
echo >> "${DOC_DIRECTORY}/index.md"
echo "This section lists the API documentation for any module of the ODM Platform." >> "${DOC_DIRECTORY}/index.md"
echo >> "${DOC_DIRECTORY}/index.md"
echo "Such documentation is automatically generated through Maven, OpenAPI and <a href=\"https://redocly.com/\" target=\"_blank\">Redocli:octicons-link-external-24:</a> for any module of the Product Plane and every existing adapter implementing services of the Utility Plane." >> "${DOC_DIRECTORY}/index.md"
echo >> "${DOC_DIRECTORY}/index.md"
echo "The documentation is available for any existing version." >> "${DOC_DIRECTORY}/index.md"
echo >> "${DOC_DIRECTORY}/index.md"

# Get the list of subdirectories in reverse order (from latest to oldest)
subdirs=$(ls -d ${BASE_DIRECTORY}/docs/assets/redoc/doc/*/ 2>/dev/null | sort -rV)

# Iterate over subdirectories in reverse order
for version_dir in ${subdirs}; do

  # Extract version from dir name
  version=$(basename "${version_dir}")
  echo "??? doc-block \"${version}\"" >> "${DOC_DIRECTORY}/index.md"
  echo >> "${DOC_DIRECTORY}/index.md"

  # Iterate over files in the version directory
  for file_name in $(ls ${version_dir}/*.html 2>/dev/null | sort); do
    # Extract name from filename, capitalize each word, and remove extension
    name=$(basename "${file_name}" | sed -E 's/[^-]+/\u&/g; s/[-.][^.]*$//g' | tr '-' ' ')
    echo -e "\t* <a href=\"../../../assets/redoc/doc/${version}/$(basename "${file_name}")\" target=\"_blank\">${name}:octicons-link-external-24:</a>" >> "${DOC_DIRECTORY}/index.md"
  done
  echo >> "${DOC_DIRECTORY}/index.md"

done