#!/bin/sh

/etc/init.d/openclash stop
sleep 5  
killall -9 clash
/etc/init.d/openclash start

echo "$(date '+%Y-%m-%d %H:%M:%S') - Checked" >> /root/crontab.log
