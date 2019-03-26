# Splunk BOSH Release

# Note
This is an experimental BOSH release, not well tested or used. Use at own risk.

# Info
This BOSH release can deploy distributed splunk.

Use splunk-master for a single deployment of splunk

# Usage
```
./get_splunk.sh
./create_release.sh
bosh upload-release splunk-boshrelease.tar.gz
#bosh upload-release splunk-boshrelease-${VERSION}.tar.gz
```

# Check logs
Check that generated logs hit the peer nodes
```
./logger.sh
```
