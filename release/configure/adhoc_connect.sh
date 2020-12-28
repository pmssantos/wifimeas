###################
# Sets an WLAN interface in adhoc mode (if supported), at TX
# Uses adhoc_connect.sh
#
# Initial version code by Luís Pinto (https://scholar.google.pt/citations?user=stvtLQgAAAAJ&hl=pt-PT)
# Further refinements (if applicable) by Pedro Santos
###################

#WDEV=wlx000f60050e55
RED='\033[1;31m'
NC='\033[0m'
if [ $# -ne 2 ]; then
	printf "${RED}insert two parameters - 1) Position in wlan nics (in 'iw dev') and 2) frequency (ch1: 2412; 20Mhz channels up to 13) ${NC}\n"
	exit 0
fi
echo "there are $# parameters"
FREQ=$2
nn=$1
WDEV="$(iw dev | grep Interface | grep wl | awk 'NR=='${nn}'{ print $2;}')"
echo $WDEV
SSID=biknet$1
printf "${RED}Connecting ${WDEV} to adhoc ${SSID} network${NC}\n"

echo "iw dev $WDEV ibss leave"
sudo iw dev $WDEV ibss leave
echo "ifconfig $WDEV down"
sudo ifconfig $WDEV down
echo "iw dev $WDEV set type ibss"
sudo iw dev $WDEV set type ibss
echo "ifconfig $WDEV 192.168.1.$1 up"
sudo ifconfig $WDEV 192.168.1.$1 up
echo "iw dev $WDEV ibss join $SSID $FREQ beacon-interval 100 basic-rates 1,12,24,48 cast-rate 1"
sudo iw dev $WDEV ibss join $SSID $FREQ beacon-interval 100 basic-rates 1,12,24,48 mcast-rate 1
printf ${RED}
iwconfig $WDEV
printf "ADHOC $WDEV setup -- DONE!${NC}\n"
