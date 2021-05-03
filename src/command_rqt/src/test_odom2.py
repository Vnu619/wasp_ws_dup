#!/usr/bin/env python
import orienbus
import time
import rospy
import bmsXnergy
import sys
import math
import tf
from geometry_msgs.msg import Twist
from roboclaw import Roboclaw
from geometry_msgs.msg import Quaternion
from nav_msgs.msg import Odometry
from time import sleep
from std_msgs.msg import *

portMotor = '/dev/wasp_oriental' # modbus port name
portBat = '/dev/wasp_bms'
portXnergy = '/dev/wasp_xnergy'
portJackandCant = '/dev/wasp_roboclaw'
# slave addresses
address1 = 1
address2 = 2
address3 = 3
address4 = 4
flag=0
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
loop_rate =5
x_ = 0
y_ = 0
z_ =0
th = 0
Vy_real = 0
Vx_real =0
thetadot_real =0 
curr_time=0
odom = Odometry()
#prev_time = rospy.Time.now()
odomBroadcaster = tf.TransformBroadcaster()
class WaspController(object):

    def __init__(self):
	self.wheel_odom_pub = rospy.Publisher('wheel_odom', Odometry, queue_size=10)
	#rospy.Subscriber("cmd_vel", Twist, self.loop)
	self.x_ = 0
	self.y_ = 0
	self.z_ =0
	self.th = 0
	self.prev_time = rospy.Time.now()
	self.odomBroadcaster = tf.TransformBroadcaster()
	self.gearratio=50




    def forwardKinematics(self):
        rospy.loginfo("Odom !")

        curr_time = rospy.Time.now()
        dt = (curr_time - self.prev_time).to_sec()
        
        v_fl_real = FL.readSpeed()/60*R*(3.14/50)
	#print("v_fl_real",v_fl_real)
	#v_fl_real = v_fl_real/60*R*3.14/50
	print("speed=", FL.readSpeed())
	print("speed2=", FR.readSpeed())
	print("speed3=", BR.readSpeed())
	print("speed4=", BL.readSpeed()) 
        v_fr_real = FR.readSpeed()/60*R*(3.14/50)
        v_br_real = BR.readSpeed()/60*R*(3.14/50)
        v_bl_real = BL.readSpeed()/60*R*(3.14/50)
        Vy_real = 1/4*(v_fl_real-v_fr_real+v_br_real-v_bl_real)
        Vx_real = 1/4*(-v_fl_real+v_fr_real+v_br_real-v_bl_real)
        thetadot_real  = 1/4*1/(a+b)*(v_fl_real+v_fr_real+v_br_real+v_bl_real)
        delta_x = (Vx_real * math.cos(self.th) - Vy_real * math.sin(self.th)) * dt
        delta_y = (Vx_real * math.sin(self.th) + Vy_real * math.cos(self.th)) * dt
        delta_th = thetadot_real * dt
        self.x_  += delta_x
        self.y_  += delta_y
        self.th += delta_th
        odom_quat = Quaternion()
        odom_quat = tf.transformations.quaternion_from_euler(0,0,self.th)
        # Create the odometry transform frame broadcaster (publish tf)
        self.odomBroadcaster.sendTransform(
                             (self.x_, self.y_, 0),
                             odom_quat,
                             rospy.Time.now(),
                             "base_link",
                             "odom"
                             )

        # Publish Odom

        odom = Odometry()
        odom.header.frame_id = "odom"
        odom.child_frame_id = "base_link"
        odom.header.stamp = rospy.Time.now()
        odom.pose.pose.position.x = self.x_
        odom.pose.pose.position.y = self.y_
        odom.pose.pose.position.z = self.z_
        odom.pose.pose.orientation = Quaternion(*odom_quat)
        odom.twist.twist.linear.x = Vx_real
        odom.twist.twist.linear.y = Vy_real
        odom.twist.twist.angular.z = thetadot_real 
        self.prev_time = curr_time
        self.wheel_odom_pub.publish(odom)

def inverseKinematics(xdot,ydot,thetadot):
        global th
        global x_
        global y_
        global z_ 
        global Vy_real
	global Vx_real
	global thetadot_real
	global prev_time
	global curr_time
        prev_time = rospy.Time.now() 

	phi_fl = 1 / R * (ydot - xdot + (a + b) * thetadot) * 60 / 3.14 * 50
        phi_fr = 1 / R * (-ydot + xdot + (a + b) * thetadot) * 60 / 3.14 * 50
        phi_br = 1 / R * (ydot + xdot + (a + b) * thetadot) * 60 / 3.14 * 50
        phi_bl = 1 / R * (-ydot - xdot + (a + b) * thetadot) * 60 / 3.14 * 50
        #print phi_fl, phi_fr, phi_br, phi_bl
        FL.writeSpeed(phi_fl)
        FR.writeSpeed(phi_fr)
        BL.writeSpeed(phi_br)
        BR.writeSpeed(phi_bl)

        curr_time = rospy.Time.now()

        dt = (curr_time - prev_time).to_sec()


	#print("v_fl_real",v_fl_real)
	#v_fl_real = v_fl_real/60*R*3.14/50

        v_fl_real = FL.readSpeed()/60*R*(3.14/50)
	print("v_fl_real", v_fl_real)
        v_fr_real = FR.readSpeed()/60*R*(3.14/50)
	print("v_fr_real", v_fr_real)
        v_br_real = BR.readSpeed()/60*R*(3.14/50)
	print("v_br_real", v_br_real)
        v_bl_real = BL.readSpeed()/60*R*(3.14/50)
	print("v_bl_real", v_bl_real)
        Vy_real = 0.25*(-v_fl_real+v_fr_real+v_br_real-v_bl_real)
	print("vy_real", Vy_real)
        Vx_real = 0.25*(v_fl_real-v_fr_real-v_br_real+v_bl_real)
	print("vx_real", Vx_real)
        thetadot_real  = 0.25/(a+b)*(v_fl_real+v_fr_real+v_br_real+v_bl_real)
        delta_x = (Vx_real * math.cos(th) - Vy_real * math.sin(th)) * dt
        delta_y = (Vx_real * math.sin(th) + Vy_real * math.cos(th)) * dt
        delta_th = thetadot_real * dt
        x_  += delta_x
        y_  += delta_y
        th += delta_th

	print("y_", y_)
	print("dt", dt)
        odom_quat = Quaternion()
        odom_quat = tf.transformations.quaternion_from_euler(0,0,th)
        # Create the odometry transform frame broadcaster (publish tf)
        odomBroadcaster.sendTransform(
                             (x_, y_, 0),
                             odom_quat,
                             rospy.Time.now(),
                             "base_link",
                             "odom"
                             )

        # Publish Odom


        odom.header.frame_id = "odom"
        odom.child_frame_id = "base_link"
        odom.header.stamp = rospy.Time.now()
        odom.pose.pose.position.x = x_
        odom.pose.pose.position.y = y_
        odom.pose.pose.position.z = z_
        odom.pose.pose.orientation = Quaternion(*odom_quat)
        odom.twist.twist.linear.x = Vx_real
        odom.twist.twist.linear.y = Vy_real
        odom.twist.twist.angular.z = thetadot_real 
	prev_time = curr_time
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

def loop(msg):
        global xdot
        global ydot
        global thetadot

        if msg.linear.x != xdot or msg.linear.y != ydot or msg.linear.z != thetadot:
            pause()
            xdot = msg.linear.x
            ydot = msg.linear.y
            thetadot = msg.linear.z
            print xdot, ydot, thetadot
        else:
            inverseKinematics(xdot,ydot,thetadot)
            if msg.angular.x == 1:
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
            elif msg.angular.x == 2:
                xnergy.stopCharging()
                batInfo = battery.readBatteryInfo()
                print(batInfo)
            elif msg.angular.y == 1:
            #Screw Jack up
                print(roboclaw.Open())
                roboclaw.ForwardM1(0x80, 10)
                roboclaw.ForwardM2(0x80, 10)
                roboclaw.ForwardM1(0x81, 10)
                roboclaw.ForwardM2(0x81, 10)
            elif msg.angular.y == 2:
            #Screw Jack up
                print(roboclaw.Open())
                roboclaw.BackwardM1(0x80, 10)
                roboclaw.BackwardM2(0x80, 10)
                roboclaw.BackwardM1(0x81, 10)
                roboclaw.BackwardM2(0x81, 10)
            elif msg.angular.y == 0:
                print(roboclaw.Open())
                roboclaw.SpeedM1M2(0x80,0,0)
                roboclaw.SpeedM1M2(0x81,0,0)
                if msg.angular.z == 1:
                    print(roboclaw.Open())
                    roboclaw.ForwardM1(0x82, 127)
                elif msg.angular.z == 2:
                    print(roboclaw.Open())
                    roboclaw.BackwardM1(0x82, 127)
                elif msg.angular.z == 0:
                    print(roboclaw.Open())
                    roboclaw.SpeedM1M2(0x82, 0, 0)
            else:
                pass




def listener():
        wheel_odom_pub = rospy.Publisher('wheel_odom', Odometry, queue_size=10)
        rospy.init_node('loop',anonymous = True)

    #_object = WaspController()
        rate = rospy.Rate(loop_rate)
    #prev_time = rospy.Time.now()
        print "test ok"
  


        rospy.Subscriber("cmd_vel", Twist, loop)


 

        rospy.loginfo("Odom !")


    #_object.forwardKinematics()
        while not rospy.is_shutdown():
            rate.sleep()

            odom_quat = Quaternion()
            odom_quat = tf.transformations.quaternion_from_euler(0,0,th)
        # Create the odometry transform frame broadcaster (publish tf)
            odomBroadcaster.sendTransform(
                             (x_, y_, 0),
                             odom_quat,
                             rospy.Time.now(),
                             "base_link",
                             "odom"
                             )

        # Publish Odom


            odom.header.frame_id = "odom"
            odom.child_frame_id = "base_link"
            odom.header.stamp = rospy.Time.now()
            odom.pose.pose.position.x = x_
            odom.pose.pose.position.y = y_
            odom.pose.pose.position.z = z_
            odom.pose.pose.orientation = Quaternion(*odom_quat)
            odom.twist.twist.linear.x = Vx_real
            odom.twist.twist.linear.y = Vy_real
            odom.twist.twist.angular.z = thetadot_real 
	    prev_time = curr_time
	#_object.forwardKinematics()
            wheel_odom_pub.publish(odom)
	    rospy.loginfo("Ok !")
        rospy.spin()

if __name__=='__main__':
    listener()

