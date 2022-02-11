import bmsXnergy
#import Tkinter as tk
#mport tkMessageBox
import datetime
import os
import time
import select
import sys

portBat = '/dev/wasp1_bms'
portXnergy = '/dev/wasp1_xnergy'
battery = bmsXnergy.BAT(portBat)
xnergy = bmsXnergy.XNERGY(portXnergy,16)
chargingStatus = xnergy.stopCharging()
chargingCommand = 0
rest = 0
log = 0
today = str(datetime.date.today())
print(today)
file_ = open("/home/wasp1/Desktop/battery_info/batLog"+today+".txt", "a")
timenow = datetime.datetime.now()
file_.write("\n"+str(timenow))
file_.close()


def timeout_input(timeout, prompt="", timeout_value=None):
    sys.stdout.write(prompt)
    sys.stdout.flush()
    ready, _, _ = select.select([sys.stdin], [], [], timeout)
    if ready:
        return sys.stdin.readline().rstrip('\n')
    else:
        sys.stdout.write('\n')
        sys.stdout.flush()
        return timeout_value

while True:
	batInfo = battery.readBatteryInfo()
	print(batInfo)
	batVoltage = batInfo[4] 
	print("Voltage: "+ str(batVoltage/100.0))
	batCurrent = batInfo[5]
	if batCurrent > 10000:
		batCurrent = batCurrent-65524
	print("Current: "+ str(batCurrent/100.0))
	batTemp1 = (batInfo[18]-2731)/10 #Unit degree C
	print("Temperature1: "+ str(batTemp1))
	batTemp2 = (batInfo[19]-2731)/10 #Unit degree C
	print("Temperature2: "+ str(batTemp2))
	batPercent = batInfo[14]
	print("Percentage: "+ str(batPercent))
	#print batInfo[2]

	if chargingCommand ==1:
		if log == 0:
			file_ = open("/home/wasp1/Desktop/battery_info/batLog"+today+".txt", "a")
			file_.write("charging start " + str(datetime.datetime.now()))
			file_.close()
			log = 1
		if batInfo[2] == 0 and batTemp1 < 42 and batTemp2 < 42 and rest == 0:
			print("battery is in good condition")
			#Battery is returning correct info and temperature is lower than the charging temperature
			if batVoltage < 5700 and batPercent <=99:
				print("battery not charged")
				chargingStatus = xnergy.startCharging()
				if batCurrent <=0:
					print("Fail to start charging")
					file_=open("/home/wasp1/Desktop/battery_info/batLog"+today+".txt", "a")
					file_.write("Fail to start charging" + str(datetime.datetime.now()))
				else:
					print("Charging")
			else:
				print("battery fully charged")
				chargingStatus = xnergy.stopCharging()
				file_ = open("/home/wasp1/Desktop/battery_info/batLog"+today+".txt", "a")
				file_.write("fully charged " + str(datetime.datetime.now()))
				file_.close()
				break
			
		elif batTemp1 < 45 and batTemp2 < 45:
			
			print("prevent overheat, rest for a while")
			chargingStatus = xnergy.stopCharging()
			rest = 1
			if log == 0:
				file_=open("/home/wasp1/Desktop/battery_info/batLog"+today+".txt", "a")
				file_.write("overheat pause " + str(datetime.datetime.now()))
				file_.close() 
				log = 1
			if batTemp1 <37 and batTemp2 <37:
				rest = 0
		else:
			chargingStatus = xnergy.stopCharging()
			file_ = open("/home/wasp1/Desktop/battery_info/batLog"+today+".txt", "a")
			file_.write("battery faulty " + str(datetime.datetime.now()))
			file_.close()
			print("Please check the battery!")
			break	

	elif chargingCommand != 1 and (batPercent <= 30 or batVoltage < 4850):
		os.system('spd-say "Charge the battery, please!"')
		print('LOW BATTERY!', 'CHARGE THE BATTERY NOW OR WAIT FOR YUYAO TO KILL YOU')
		chargingCommand = int(timeout_input(3,"To start charging please press 1: ", 0))
		
		if batPercent <=22:
			print("battery extremely low.")
    			#os.system('shutdown -P now')
						
	else:
		 
		time_interval = datetime.datetime.now()-timenow
		if time_interval.total_seconds() >= 60:
			file_ = open("/home/wasp1/Desktop/battery_info/batLog"+today+".txt", "a")
			file_.writelines("\n"+str(datetime.datetime.now())+" ")
			file_.writelines(str(batVoltage) + "," + str(batCurrent/100.0) + "," + str(batPercent) + "," + str(batTemp1) + "," + str(batTemp2))
			timenow = datetime.datetime.now()
			file_.close()
		else:
			pass

		

		
		

