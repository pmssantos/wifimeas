import cv2 as cv
import numpy as np
# import matplotlib.pyplot as plt
import socket
from subprocess import Popen, PIPE

HOST='192.168.60.174'
PORT=65432

s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))

# The video feed is read in as a VideoCapture object
cap = cv.VideoCapture("input.mp4")

while (cap.isOpened()):
    # ret = a boolean return value from getting the frame, frame = the current frame being projected in the video
    ret, frame = cap.read()

	######################################
	# send frame
	s.sendall(row.rstrip())

	# Wait for return
    while True:
	    data = s.recv(1024)

    # Opens a new window and displays the output frame
    cv.imshow("output", output)
    # Frames are read by intervals of 10 milliseconds. The programs breaks out of the while loop when the user presses the 'q' key
    if 0xFF == ord('q'):
        break

# The following frees up resources and closes all windows
cap.release()
cv.destroyAllWindows()	


#https://stackoverflow.com/questions/40077980/python-receive-image-over-socket
