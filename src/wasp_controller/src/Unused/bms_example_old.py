import bmsXnergy
import Tkinter as tk
import tkMessageBox

portBat = '/dev/wasp_bms'
portXnergy = '/dev/wasp_xnergy'
battery = bmsXnergy.BAT(portBat)
xnergy = bmsXnergy.XNERGY(portXnergy,16)
chargingStatus = 1
rest = 0
popup = 0

while True:
	batInfo = battery.readBatteryInfo()
	print(batInfo)
	batVoltage = batInfo[4] #Unit mV
	print(batVoltage)
	batCurrent = batInfo[5]
	print(batCurrent)
	batTemp1 = (batInfo[18]-2731)/10 #Unit degree C
	print(batTemp1)
	batTemp2 = (batInfo[19]-2731)/10 #Unit degree C
	print(batTemp2)
	batPercent = batInfo[14]
	print(batPercent)
	print batInfo[2]

	if popup == 1 and batPercent <= 30:
		root = tk.Tk()
		root.withdraw()
		tkMessageBox.showwarning('LOW BATTERY!', 'CHARGE THE BATTERY NOW OR WAIT FOR YUYAO TO KILL YOU')
		popup = 1

	if batInfo[2] == 0 and batTemp1 < 42 and batTemp2 < 42 and rest == 0:
		print("battery is in good condition")
	#Battery is returning correct info and temperature is lower than the charging temperature
		if batVoltage < 5700 and batPercent <=99:
			print("battery not charged")
			chargingStatus = xnergy.startCharging()
		else:
			print("battery fullycharged")
			chargingStatus = xnergy.stopCharging()
			break
			
	elif batTemp1 < 45 and batTemp2 < 45:
		print("prevent over heat, rest for a while")
		chargingStatus = xnergy.stopCharging()
		rest = 1
		if batTemp1 <38 and batTemp2 <38:
			rest = 0
	else:
		chargingStatus = xnergy.stopCharging()
		print("Please check the battery!")
		break	

		
		

