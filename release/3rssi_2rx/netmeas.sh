########################################################
###################
# Carries out thrughput measurements using Iperf
# Presumes prior configuration
#
# Initial version code by Pedro Santos
###################
RED='\033[1;31m'
NC='\033[0m'
echo $#

if [ $# -le 1 ]; then
	printf "${RED} Usage: netmeas s|c |p [#wireless dev in 'iw dev'] [mon number] [channel (eg: 2412)] ${NC}\n"
	exit 0
fi
if [[ $1 == "c" && $# -ne 2 ]]; then
		printf "${RED} Usage: netmeas s|c [#wireless dev in 'iw dev'] [mon number (user assigned)] [channel (eg: 2412)] ${NC}\n"
	exit 0
fi
echo "All set"

WLAN_NUM=$3
MON_NAME=$4
CHAN=$5

../configure/make_monitor $2 $3 $4

if [[ $1 == "c" ]]; then
	logfile="../../logs/"$(date +"%Y%m%d_%H%M%S")"_rssi.log"
	touch $logfile
	echo "Files will be stored in $logfile"
	
	sudo tcpdump -i mon1 -w mon1_$logfile.pcap &
else
	
fi


	#iperf -c $2 -i 1 |
	#  while IFS= read -r line
	#  do
	#	echo "1, "$(date +"%s.%N")","$line >> $logfile
	#  done