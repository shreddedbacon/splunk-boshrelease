#!/bin/bash
# Use this to download splunk, specify version using `./get_blobs 7.2.1` or use one defined in this script

if [ $1 ]
then
  SPLUNK_VERSION=$1
else
  SPLUNK_VERSION=7.2.1
fi

DOWN_DIR=.downloads
if [ ! -d "${DOWN_DIR}" ]
then
  echo "make downloads dir"
  mkdir .downloads
fi

echo "Getting splunk version ${SPLUNK_VERSION}"
SPLUNK_FILENAME=$(curl -s https://www.splunk.com/en_us/download/sem-os.html | grep -o -P "splunk-${SPLUNK_VERSION}-.[0-9a-f]{0,12}-Linux-x86_64.tgz" | uniq)
echo "Found splunk file ${SPLUNK_FILENAME}"
SPLUNK_DOWNLOAD=splunk-${SPLUNK_VERSION}.tar.gz
if [ ! -f "./downloads/$SPLUNK_DOWNLOAD" ]
then
  curl -L http://download.splunk.com/products/splunk/releases/${SPLUNK_VERSION}/splunk/linux/${SPLUNK_FILENAME} > .downloads/${SPLUNK_DOWNLOAD}
  bosh add-blob .downloads/${SPLUNK_DOWNLOAD} splunk/${SPLUNK_DOWNLOAD}
else
  echo "already exists"
fi
