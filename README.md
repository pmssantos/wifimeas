# wifimeas

Set of tools for measuring network performance.

## 1 - Throughput

User Iperf to measure throughput between two terminals

## 2 - RSSI, one RX

Measures RSSI of received packets.

Procedure (WiFi)
1. Set Tx as ad hoc
2. Set Rx as monitor 


Procedure (11p)

## 3 - RSSI, two RX

Measures RSSI of received packets
Presumes two Rx antennas for faster data collection.
The Tx sets up fast data transmission via Iperf or udpcast to one of the antennas of 

Procedure (WiFi)



Procedure (11p)

#- tcpdumptoserver

#- pcap2sql 
#Converts PCAP to SQL 

## SERVER SIDE
## Server to receive collected data
- server.sh

####################################################
- example: 



- iperf_edge_cloud

Run two simultaneous instances of Iperf, one to a local server, other to a remote (cloud) server
