#!/usr/bin/env python
import orienbus
import time
import rospy
import bmsXnergy

from geometry_msgs.msg import Twist
from roboclaw import Roboclaw

portMotor = '/dev/wasp_oriental' # modbus port name
portBat = '/dev/wasp_bms'
portXnergy = '/dev/wasp_xnergy'
portJackandCant = '/dev/wasp_roboclaw'
# slave addresses
address1 = 1
address2 = 2
address3 = 3
address4 = 4

jackAddress1 = 0x80
jackAddress2 = 0x81
forkAddress = 0x82

# Create objects with port name
orienbus = orienbus.OrienBus(portMotor)
battery = bmsXnergy.BAT(portBat)
xnergy = bmsXnergy.XNERGY(portXnergy,16)
roboclaw = Roboclaw(portJackandCant, 9600)
#fork = Roboclaw(portcant, 9600)

# Create charging parameter
chargingStatus = 0
# Initialze motors with slave addresses
FL = orienbus.initialize(address1)
FR = orienbus.initialize(address2)
BR = orienbus.initialize(address3)
BL = orienbus.initialize(address4)

# kinematic parameters
xdot = 0
ydot = 0
thetadot = 0
R = 0.152
a = 0.3
b = 0.25

def inverseKinematics(xdot,ydot,thetadot):
    phi_fl = 1 / R * (ydot - xdot + (a + b) * thetadot) * 60 / 3.14 * 50
    phi_fr = 1 / R * (-ydot + xdot + (a + b) * thetadot) * 60 / 3.14 * 50
    phi_br = 1 / R * (ydot + xdot + (a + b) * thetadot) * 60 / 3.14 * 50
    phi_bl = 1 / R * (-ydot - xdot + (a + b) * thetadot) * 60 / 3.14 * 50
    print phi_fl, phi_fr, phi_br, phi_bl
    FL.writeSpeed(phi_fl)
    FR.writeSpeed(phi_fr)
    BL.writeSpeed(phi_br)
    BR.writeSpeed(phi_bl)
    print("speed=", FL.readSpeed())
    print("speed2=", FR.readSpeed())
    print("speed3=", BR.readSpeed())
    print("speed4=", BL.readSpeed())



def stop():
    FL.writeSpeed(0)
    FR.writeSpeed(0)
    BL.writeSpeed(0)
    BR.writeSpeed(0)
    print("Robot stop")

def pause():
    FL.writeSpeed(0)
    FR.writeSpeed(0)
    BL.writeSpeed(0)
    BR.writeSpeed(0)
    time.sleep(0.3)

def loop(control):
    global xdot
    global ydot
    global thetadot

    if control.linear.x != xdot or control.linear.y != ydot or control.linear.z != thetadot:
        pause()
        xdot = control.linear.x
        ydot = control.linear.y
        thetadot = control.linear.z
        print xdot, ydot, thetadot
    else:
        inverseKinematics(xdot,ydot,thetadot)
        if control.angular.x == 1:
            stop()
            #Charge the battery
            batInfo = battery.readBatteryInfo()
            batVoltage = batInfo[5]  # Unit mV
            print(batVoltage)
            batCurrent = batInfo[6]
            print(batCurrent)
            batTemp1 = (batInfo[18] - 2731) / 10  # Unit degree C
            print(batTemp1)
            batTemp2 = (batInfo[19] - 2731) / 10  # Unit degree C
            print(batTemp2)
            batPercent = batInfo[15]
            print(batInfo[2])
            if batInfo[2] == 0 and batTemp1 < 45 and batTemp2 < 45:
                print("battery is in good condition")
                # Battery is returning correct info and temperature is lower than the charging temperature
                if batPercent < 95:
                    chargingStatus = xnergy.stopCharging()
                # xnergy.startCharging()
                else:
                    chargingStatus = xnergy.stopCharging()
                print(chargingStatus)
            else:
                print("Please check the battery!")
        elif control.angular.x == 2:
            xnergy.stopCharging()
            batInfo = battery.readBatteryInfo()
            print(batInfo)
        elif control.angular.y == 1:
            #Screw Jack up
            print(roboclaw.Open())
            roboclaw.ForwardM1(0x80, 10)
            roboclaw.ForwardM2(0x80, 10)
            roboclaw.ForwardM1(0x81, 10)
            roboclaw.ForwardM2(0x81, 10)
        elif control.angular.y == 2:
            #Screw Jack up
            print(roboclaw.Open())
            roboclaw.BackwardM1(0x80, 10)
            roboclaw.BackwardM2(0x80, 10)
            roboclaw.BackwardM1(0x81, 10)
            roboclaw.BackwardM2(0x81, 10)
        elif control.angular.y == 0:
            print(roboclaw.Open())
            roboclaw.SpeedM1M2(0x80,0,0)
            roboclaw.SpeedM1M2(0x81,0,0)
            if control.angular.z == 1:
                print(roboclaw.Open())
                roboclaw.ForwardM1(0x82, 127)
            elif control.angular.z == 2:
                print(roboclaw.Open())
                roboclaw.BackwardM1(0x82, 127)
            elif control.angular.z == 0:
                print(roboclaw.Open())
                roboclaw.SpeedM1M2(0x82, 0, 0)
        else:
            pass




def listener():
    rospy.init_node('loop',anonymous = True)
    rospy.Subscriber("cmd_vel", Twist, loop)
    rospy.spin()

if __name__=='__main__':
    listener()
