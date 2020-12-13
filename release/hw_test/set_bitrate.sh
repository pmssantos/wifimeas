###################
# Sets an WLAN interface in adhoc mode (if supported), at TX
# Uses adhoc_connect.sh
#
# Initial version code by Luís Pinto (https://scholar.google.pt/citations?user=stvtLQgAAAAJ&hl=pt-PT)
# Further refinements (if applicable) by Pedro Santos
###################
RED='\033[1;31m'
NC='\033[0m'


#if [ $# -ne 2 ]; then
#	printf "${RED}insert two parameters - $# - pos # and Frequency${NC}\n"
#	exit 0
#fi
#echo "there are $# parameters"

nn=1
WDEV="$(iw dev | grep Interface | grep wlx | awk 'NR=='${nn}'{ print $2;}')"
echo $WDEV

sudo iw dev $WDEV ibss join $SSID $FREQ beacon-interval 100 basic-rates 1,12,24,48 mcast-rate 1
printf ${RED}
iwconfig $WDEV
printf "ADHOC $WDEV setup -- DONE!${NC}\n"
