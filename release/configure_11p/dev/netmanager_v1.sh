#/bin/bash

logfile="./logs/$(date +"%Y%m%d_%H%M%S")_ifaceswitch.log"

touch $logfile

echo "1, "$(date +"%s.%N") >> $logfile

source configure_wlan_adhoc.sh #> $logfile

echo "2, "$(date +"%s.%N") >> $logfile

ping 192.168.10.3 -c 3 #> $logfile

echo "3, "$(date +"%s.%N") >> $logfile

source configure_11p_ocb.sh #> $logfile

echo "4, "$(date +"%s.%N") >> $logfile

ping 192.168.10.2 -c 3 #> $logfile

echo "5, "$(date +"%s.%N") >> $logfile
