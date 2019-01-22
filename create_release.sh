#!/bin/bash
if [ $1 ]
then
  VERSION=$1
  bosh create-release --force --version=${VERSION} --tarball=splunk-boshrelease-v${VERSION}.tgz
else
  bosh create-release --force --tarball=splunk-boshrelease.tar.gz
fi
