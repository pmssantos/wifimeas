if [ $# -ne 1 ]; then
	echo "ip segment needed"
	exit;
fi
DEV=$(ls /sys/class/net/ | grep ^e)
sudo ifconfig $DEV 192.168.103.18$1/24 up
ifconfig $DEV
