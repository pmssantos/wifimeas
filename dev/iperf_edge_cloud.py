  #!/usr/bin/env python3
 
import socket
from subprocess import Popen, PIPE
import time
import threading

def iperf_faraway():
	f2= open("iperf_local.log","w+")
	process2 = Popen(["iperf3", "-c", "192.168.60.174", "-i", "1", "-p", "5201"], stdout=PIPE)
	for row in iter(process2.stdout.readline, b''):
		f2.write(row.rstrip())
		print(row.rstrip())
	f2.close() 

if __name__ == "__main__":

	setup_routes

	x = threading.Thread(target=iperf_faraway)
	x.start()


	f1= open("iperf_ee.log","w+")
	process1 = Popen(["iperf3", "-c", "bouygues.iperf.fr", "-i", "1", "-p", "5203"], stdout=PIPE)
	for row in iter(process1.stdout.readline, b''):
		print(row.rstrip())
		f1.write(row.rstrip())
	f1.close() 
	

