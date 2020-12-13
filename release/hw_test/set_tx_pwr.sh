###################
# Sets an WLAN interface in adhoc mode (if supported), at TX
# Uses adhoc_connect.sh
#
# Initial version code by Luís Pinto (https://scholar.google.pt/citations?user=stvtLQgAAAAJ&hl=pt-PT)
# Further refinements (if applicable) by Pedro Santos
###################
RED='\033[1;31m'
NC='\033[0m'

#FREQ=$2
#nn=$1
#WDEV="$(iw dev | grep Interface | grep wlx | awk 'NR=='${nn}'{ print $2;}')"
#echo $WDEV
#SSID=biknet$1

#sudo iw dev $WDEV ibss leave
#sudo ifconfig $WDEV down
#sudo iw dev $WDEV set type ibss
#sudo ifconfig $WDEV 192.168.$1.2 up
#sudo iw dev $WDEV ibss join $SSID $FREQ beacon-interval 100 basic-rates 1,12,24,48 mcast-rate 1

# https://wireless.wiki.kernel.org/en/users/documentation/iw#getting_device_capabilities
#sudo iw dev $WDEV ibss join $SSID $FREQ beacon-interval 100 basic-rates 1,12,24,48 mcast-rate 1

#iwconfig $WDEV
PWR="$(iw dev | grep txpower | awk 'NR=='1'{ print $2;}')"
printf "Current power: $PWR${NC}\n"
echo "Trying to set to 13 dBm"
iw phy phy0 set txpower fixed 13000mBm
printf ${RED}
NPWR="$(iw dev | grep txpower | awk 'NR=='1'{ print $2;}')"
if [[ "$PWR" == "$NPWR" ]]
then
	printf "Failed to update TxPower\n"	
else
	printf "Updated TxPower: $NPWR -- DONE!${NC}\n"	
fi
