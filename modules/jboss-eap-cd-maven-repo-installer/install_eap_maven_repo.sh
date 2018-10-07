#!/bin/sh

set -e

SOURCES_DIR=/tmp/artifacts
DISTRIBUTION_ZIP="jboss-eap-cd-maven-repository.zip"

unzip -d $SOURCES_DIR/eap-cd-maven-repository -q $SOURCES_DIR/$DISTRIBUTION_ZIP
DIST_NAME=`ls $SOURCES_DIR/eap-cd-maven-repository`

JBOSS_HOME_MAVEN_REPO=$JBOSS_HOME/.m2/repository
mkdir -p $JBOSS_HOME_MAVEN_REPO
mv -T $SOURCES_DIR/eap-cd-maven-repository/$DIST_NAME/maven-repository $JBOSS_HOME_MAVEN_REPO


chown -R jboss:root $JBOSS_HOME
chmod 0755 $JBOSS_HOME
chmod -R g+rwX $JBOSS_HOME
