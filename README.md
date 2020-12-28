<>https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#lines

# wifimeas

Set of tools for measuring network performance.

## 1 - Throughput

User Iperf to measure throughput between two terminals

### Procedure (WiFi)

### Procedure (11p)

// 
## 2 - RSSI, one RX

Measures RSSI of received packets.
It is slow because it measures ad hoc becaones

### Procedure (WiFi)
1. Set Tx as ad hoc
2. Set Rx as monitor and run tcpdump

### Procedure (11p)

## 3 - RSSI, two RX  (faster)

Measures RSSI of received packets.
Uses two Rx antennas for faster data collection: the Tx sets up fast data transmission via Iperf or udpcast to one of the Rx antennas, while the other Rx antenna acts in monitor mode.

### Procedure (WiFi)



### Procedure (11p)
* TBD

## SUPPORT SCRIPTS
================

### tcpdumptoserver

### pcap2sql 

Converts PCAP to SQL 

