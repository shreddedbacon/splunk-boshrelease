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

## we need to tell bosh about the bosh-dns addon for DNS resolver to be updated
bosh update-runtime-config manifests/runtime-config-bosh-dns.yml

# Deploy it
bosh --deployment=splunk deploy manifests/splunk.yml
```

# Log in
Get the IP address of a search head
```
bosh -d splunk vms | grep "splunk-head" | grep "running" | awk '{print $4}'
```
Log in by visiting https://${IP}:8000/ and use the credentials from the splunk-head block (or whatever you changed these to from credhub/other)
```
  - name: splunk-head
    release: splunk
    properties:
      admin_user: 'admin'
      admin_pass: 'changemeplz'
```

# Check logs
Check that generated logs hit the peer nodes
```
./logger.sh
```
