###################
# Once an WLAN interface is set in monitor mode, we initiate TCP dump to collect traces
#
# Initial version code by Luís Pinto (https://scholar.google.pt/citations?user=stvtLQgAAAAJ&hl=pt-PT)
# Further refinements (if applicable) by Pedro Santos
###################

RED='\033[1;31m'
NC='\033[0m' # No Color
if [[ $# -ne 2 ]]; then
	printf "${RED}insert 2 sufixes${NC}\n"
	exit 0
fi
epoch=$(date +%s)
sudo tcpdump -i mon1  -w mon1_rot$1_$2_$epoch.pcap &
#sudo tcpdump -i mon6  -w mon6_rot$1_$2_$epoch.pcap &
#sudo tcpdump -i mon13 -w mon13_rot$1_$2_$epoch.pcap &
sleep 1
printf "${RED}3 instances of TCPDUMP running. To kill call: \nkilltcpdump${NC}\n"

