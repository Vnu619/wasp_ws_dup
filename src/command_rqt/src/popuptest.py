import Tkinter as tk
import tkMessageBox
import datetime
import time
i=0
file_ = open("/home/sutd_wasp/Desktop/testdate.txt", "w")
while i <5:
	today = datetime.datetime.now()
	file_.write(str(today))
	time.sleep(1)
	delta = datetime.datetime.now()-today
	file_.write (str(delta.total_seconds()))
	file_.write (str(type(delta.total_seconds())))
	i = i+1

