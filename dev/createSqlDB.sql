/*!"13:04:29.242993 1.0 Mb/s 2412 MHz 11b -63dBm signal antenna 1 Beacon (CisterGuest) [1.0* 2.0* 5.5* 6.0 9.0 11.0* 12.0 18.0 Mbit] ESS CH: 1, PRIVACY"*/

CREATE DATABASE tcpdump;
create TABLE tcpdump(time TEXT, rate FLOAT, rateunits TEXT, channel INT, std TEXT, pwr INT, pwrunits TEXT, antenna INT, body blob);

create TABLE iperf();

