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
	printf "${RED} Usage 1: netmanager s|c [ip addr server] ${NC}\n"
	exit 0
fi
if [[ $1 == "c" && $# -ne 2 ]]; then
	printf "${RED} Usage 2: netmanager s|c [ip addr server] ${NC}\n"
	exit 0
fi
echo "All set"
echo $2

if [[ $1 == "c" ]]; then
	logfile="../../logs/"$(date +"%Y%m%d_%H%M%S")"_throughput.log"
	touch $logfile
	echo "Files will be stored in $logfile"
	
	iperf -c $2 -i 1 |
	  while IFS= read -r line
	  do
		echo "1, "$(date +"%s.%N")","$line >> $logfile
	  done
else
	iperf -s 
fi