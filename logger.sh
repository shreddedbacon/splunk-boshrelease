# use logger to send message to syslog server for testing
SERVERS=$(bosh -d splunk vms | grep "splunk-peer" | grep "running" | awk '{print $4}')
for MSGNUM in {1..20};
do
  for SERV in $SERVERS
  do
    echo logstart $SERVER
    logger -P 1514 -d -n $SERVER send message to syslog server $MSGNUM
    sleep 5
    echo logend
  done
done
