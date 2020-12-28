#!/bin/sh

printf "Starting configure_wlan_adhoc"

source local.conf
 
printf "DEBUG "$DEBUG"\n"
printf "IPADDRESS"$IPADDRESS"\n"

## Leave any OCB or ad hoc networks
if [ "$DEBUG" = "1" ]
then
	printf "sudo ip link set $WLAN_NAME up\n"
fi
sudo ip link set $WLAN_NAME up
if [ "$DEBUG" = "1" ]
then
	printf "sudo ip addr flush $WLAN_NAME\n"
fi
sudo ip addr flush $WLAN_NAME
if [ "$DEBUG" = "1" ]
then
	printf "sudo iw dev $WLAN_NAME ocb leave\n"
fi	
sudo iw dev $WLAN_NAME ocb leave
if [ "$DEBUG" = "1" ]
then
	printf "sudo iw dev $WLAN_NAME ibss leave\n"
fi	
sudo iw dev $WLAN_NAME ibss leave
if [ "$DEBUG" = "1" ]
then
	printf "sudo iw reg set PT\n"
fi	
sudo iw reg set PT
if [ "$DEBUG" = "1" ]
then
	printf "sudo ip link set $WLAN_NAME down\n"
fi
sudo ip link set $WLAN_NAME down
## Alternatively
#sudo ifconfig $WLAN_NAME down

## Not sure yet
if [ "$DEBUG" = "1" ]
then
	printf "sudo iw phy phy0 set antenna 3 3\n"
fi
sudo iw phy phy0 set antenna 3 3

#### Set configurations for new status
## [11p] set OCB type 
#sudo iw dev $WLAN_NAME set type ocb
if [ "$DEBUG" = "1" ]
then
	printf "sudo iw dev $WLAN_NAME set type ibss\n"
fi
sudo iw dev $WLAN_NAME set type ibss
## [11p] set up link (routing related; will keep) [11p]
if [ "$DEBUG" = "1" ]
then
	printf "sudo ip link set $WLAN_NAME up\n"
fi
sudo ip link set $WLAN_NAME up
sudo ifconfig $WLAN_NAME $IPADDRESS up
## [11p] set bit-rates
#sudo iw dev $WLAN_NAME set bitrates legacy-5 12 sgi-5
## [11p] set freq and order join 
# Orig: sudo iw dev $WLAN_NAME ocb join 5860 10MHZ

## [WLAN] Sets all for wlan: ibss, ssid, freq, beacon rates, bit-rates
if [ "$DEBUG" = "1" ]
then
	printf "sudo iw dev $WLAN_NAME ibss join $SSID $FREQ beacon-interval 100 basic-rates 1,12,24,48 mcast-rate 1\n"
fi 
sudo iw dev $WLAN_NAME ibss join $SSID $FREQ beacon-interval 100 basic-rates 1,12,24,48 mcast-rate 1

if [ "$DEBUG" = "1" ]
then
	printf "sudo iw dev $WLAN_NAME set txpower fixed 0dBm\n"
fi
sudo iw dev $WLAN_NAME set txpower fixed 0dBm
#sudo iw dev $WLAN_NAME set txpower fixed 1000
#sudo iw dev $WLAN_NAME set txpower fixed 1100
#sudo iw dev $WLAN_NAME set txpower fixed 2700
