###################
# Carries out thrughput measurements using Iperf
# Presumes prior configuration
#
# Initial version code by Pedro Santos
###################
RED='\033[1;31m'
NC='\033[0m'
echo $#

if [ $# -le 5 ]; then
	printf "${RED} Usage: netmeas s|c w|p <#wireless dev in 'iw dev'> <mon number> <channel (eg: 2412)> ${NC}\n"
	exit 0
fi
echo "All set"

if [[ $1 == "c" ]]; then
	logfile="../../logs/"$(date +"%Y%m%d_%H%M%S")"_rssi.pcap"
	touch $logfile
	echo "Files will be stored in $logfile"
	
	sudo tcpdump -i mon1 -w $logfile.pcap &
fi

