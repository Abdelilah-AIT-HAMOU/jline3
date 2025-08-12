#!/bin/bash
#
# Deploys to internal repository
# ID of the repository to override the deploy location for
REPO_ID=dbtools-third-party
# URL of the repository we want to deploy to
REPO_URL=https://artifacthub-phx.oci.oraclecorp.com/dbtools-dev-third-party
DEP_VERSION=3.30.4
GROUP_ID=org.jline
ARTIFACT_ID=jline
mvn org.apache.maven.plugins:maven-deploy-plugin:2.8.2:deploy-file -DskipTests -Dmaven.javadoc.skip=true\
    -Dfile=./target/jline-${DEP_VERSION}.jar \
    -Durl=${REPO_URL} \
    -Dclassifiers=sources \
    -Dtypes=jar \
    -DrepositoryId=${REPO_ID} \
    -DgroupId=${GROUP_ID} \
    -DartifactId=${ARTIFACT_ID} \
    -Dversion=${DEP_VERSION} \
    -Dpom=./pom.xmli \
    -Dfiles=./target/jline-${DEP_VERSION}-sources.jar
popd
