if [ $# -ne 1 ]; then
	echo "ip segment needed"
	exit;
fi
DEV=$(ls /sys/class/net/ | grep ^e)
sudo ifconfig $DEV 10.10.10.$1/24 up
ifconfig $DEV
