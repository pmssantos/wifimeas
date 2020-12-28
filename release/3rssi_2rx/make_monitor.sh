###################
# Sets an WLAN interface in monitor mode (if supported), at RX
#
# Initial version code by Luís Pinto (https://scholar.google.pt/citations?user=stvtLQgAAAAJ&hl=pt-PT)
# Further refinements (if applicable) by Pedro Santos
###################

WLAN_NUM=$1
#WLAN_NUM="$(iw dev | grep Interface | grep wlx | awk 'NR==1{ print $2;}')"
MON_NAME=$2
CHAN=$3


PHY_NUM=`iw dev |grep $WLAN_NUM -B 1 | awk -F '#' '{print $2}'`

sudo iw dev $WLAN_NUM del
echo "iw dev $WLAN_NUM del"
sudo iw phy phy$PHY_NUM interface add $MON_NAME type monitor
echo "iw phy phy$PHY_NUM interface add $MON_NAME type monitor"
sudo ifconfig $MON_NAME up
echo "ifconfig $MON_NAME up"
sudo iw dev $MON_NAME set channel $CHAN
echo "iw dev $MON_NAME set channel $CHAN"
