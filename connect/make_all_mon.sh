RED='\033[1;31m'
NC='\033[0m' # No Color
sudo service network-manager stop
WDEV="$(iw dev | grep Interface | grep w | awk 'NR==1{ print $2;}')"
make_monitor.sh $WDEV mon1 1
WDEV="$(iw dev | grep Interface | grep w | awk 'NR==1{ print $2;}')"
make_monitor.sh $WDEV mon6 6
WDEV="$(iw dev | grep Interface | grep w | awk 'NR==1{ print $2;}')"
make_monitor.sh $WDEV mon13 13
printf "${RED}monitor interfaces set. confirm:\n"
iwconfig | grep 802
printf ${NC}
echo "mon1" > mon.log
cat /sys/class/net/mon1/address >> mon.log
echo "mon6" >> mon.log
cat /sys/class/net/mon6/address >> mon.log
echo "mon13" >> mon.log
cat /sys/class/net/mon13/address >> mon.log 
