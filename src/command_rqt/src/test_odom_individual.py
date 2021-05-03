#!/usr/bin/env python

import rospy
import time
import bmsXnergy
import sys
import math
import tf
import numpy as np
from geometry_msgs.msg import Twist
from roboclaw import Roboclaw
from geometry_msgs.msg import Quaternion
from nav_msgs.msg import Odometry
from time import sleep
from std_msgs.msg import *
from sensor_msgs.msg import Imu

#from std_msgs.msg import Int32

portBat = '/dev/wasp_bms'
portXnergy = '/dev/wasp_xnergy'
portJackandCant = '/dev/wasp_roboclaw'
# slave addresses

flag=0
jackAddress1 = 0x80
jackAddress2 = 0x81
forkAddress = 0x82

# Create objects with port name
#orienbus = orienbus.OrienBus(portMotor)
battery = bmsXnergy.BAT(portBat)
xnergy = bmsXnergy.XNERGY(portXnergy,16)
roboclaw = Roboclaw(portJackandCant, 9600)
#fork = Roboclaw(portcant, 9600)
batInfo_energy = battery.readBatteryInfo()
# Create charging parameter
chargingStatus = 0
# Initialze motors with slave addresses


# kinematic parameters
xdot = 0
ydot = 0
thetadot = 0
R = 0.152
a = 0.3
b = 0.25
loop_rate =5

#data logging
#file_ = open("/home/sutd_wasp/Desktop/speed.txt", "w")
file1 = open("/home/sutd_wasp/Desktop/velocities.txt", "a")
file2 = open("/home/sutd_wasp/Desktop/pose.txt", "a")
file3 = open("/home/sutd_wasp/Desktop/command_vel.txt", "a")
file4 = open("/home/sutd_wasp/Desktop/cmd_vel.txt", "w")

class WaspController(object):

    def __init__(self):
	self.wheel_odom_pub = rospy.Publisher('wheel_odom', Odometry, queue_size=10)
	self.target_speed_pub = rospy.Publisher('target_speed',Twist, queue_size = 10) 
	#rospy.Subscriber("/mobile_base/commands/velocity", Twist, self.loop)
	rospy.Subscriber("cmd_vel", Twist, self.loop)
	rospy.Subscriber('/speed_fl', Int32, self.fl_speed)
	rospy.Subscriber('/speed_fr', Int32, self.fr_speed)
	rospy.Subscriber('/speed_bl', Int32, self.bl_speed)
	rospy.Subscriber('/speed_br', Int32, self.br_speed)
	rospy.Subscriber("/vectornav/IMU", Imu, self.imuCallback)
	self.x_ = 0
	self.y_ = 0
	self.z_ =0
	self.th = 0
	self.prev_time = rospy.Time.now()
	self.odomBroadcaster = tf.TransformBroadcaster()
	self.imu_msg=Imu()
	self.gearratio=50
	
	self.ydot=0
	self.xdot=0
	self.thetadot=0  
	self.roll = 0
	self.pitch = 0
	self.prev_yaw = 0
	self.imu_flag=0
	self.fl_msg=0
	self.fr_msg=0
	self.bl_msg=0
	self.br_msg=0
	self.velx=0
	self.vely=0

    def fl_speed(self, msg):
	self.fl_msg= msg.data

    def fr_speed(self, msg):
	self.fr_msg=msg.data

    def bl_speed(self, msg):
	self.bl_msg=msg.data

    def br_speed(self, msg):
	self.br_msg=msg.data

    def imuCallback(self, msg):
	self.imu_msg=msg
	if (self.imu_flag==0):
		(self.roll, self.pitch, self.prev_yaw) = tf.transformations.euler_from_quaternion([msg.orientation.x, msg.orientation.y, msg.orientation.z, msg.orientation.w])
		#print("prev_yaw",self.prev_yaw)
		self.imu_flag=1

    def forwardKinematics(self):
	ydot=self.ydot
	xdot=-self.xdot
	thetadot=self.thetadot        
	phi_fl = 1 / R * (-ydot - xdot + (a + b) * thetadot) * 60 / 3.14 * 50
        phi_fr = 1 / R * (-ydot + xdot + (a + b) * thetadot) * 60 / 3.14 * 50
        phi_br = 1 / R * (+ydot + xdot + (a + b) * thetadot) * 60 / 3.14 * 50
        phi_bl = 1 / R * (+ydot - xdot + (a + b) * thetadot) * 60 / 3.14 * 50
        #print phi_fl, phi_fr, phi_br, phi_bl
       
	target_speed = Twist()
	target_speed.linear.x = phi_fl
	target_speed.linear.y = phi_fr
	target_speed.linear.z = phi_br
	target_speed.angular.x = phi_bl
	target_speed.angular.y = 0
	target_speed.angular.z = 0



	#rospy.loginfo("Odom !")

        curr_time = rospy.Time.now()
        dt = ((curr_time - self.prev_time).to_sec() )
        

	#print("v_fl_real",v_fl_real)
	#v_fl_real = v_fl_real/60*R*3.14/50
        v_fl_real = float(self.fl_msg)/60*R*(3.14/50)
	#print ("fl_msg", self.fl_msg)
	#print("v_fl", v_fl_real)
        v_fr_real = float(self.fr_msg)/60*R*(3.14/50)
        v_br_real = float(self.br_msg)/60*R*(3.14/50)
        v_bl_real = float(self.bl_msg)/60*R*(3.14/50)
	(r, p, yaw) = tf.transformations.euler_from_quaternion([self.imu_msg.orientation.x, self.imu_msg.orientation.y, self.imu_msg.orientation.z, self.imu_msg.orientation.w])

	delta_th = yaw - self.prev_yaw
	#print ("imu",self.imu_msg.orientation.z, yaw)

        Vx_real = 0.25*(-v_fl_real-v_fr_real+v_br_real+v_bl_real)

	#print("vx_real", Vx_real)
        Vy_real = -0.25*(-v_fl_real+v_fr_real+v_br_real-v_bl_real)
	#print("vy_real", Vy_real)
	self.prev_yaw = yaw
	#print("vy_real", Vy_real)
        #thetadot_real  = 0.25/(a+b)*(v_fl_real+v_fr_real+v_br_real+v_bl_real)
        delta_x = (Vx_real * math.cos(-self.th) - Vy_real * math.sin(-self.th)) * dt
        delta_y = (Vx_real * math.sin(-self.th) + Vy_real * math.cos(-self.th)) * dt
	thetadot_real  = delta_th / dt  
        #delta_th = thetadot_real * dt
	#print("delta_x", delta_x)
	#print("delta_y", delta_y)

	if ((max(v_fl_real, v_fr_real, v_br_real,v_bl_real)>1) or (min(v_fl_real, v_fr_real, v_br_real,v_bl_real)<-1)):
		self.x_  += 0.0
        	self.y_  += 0.0
		self.th  += 0.0
		vx =0.0
		vy=0.0
		vth =0.0
	else :

        	self.x_  += delta_x
        	self.y_  += delta_y
        	self.th += delta_th
		vx = Vx_real
		vy = Vy_real
		vth =thetadot_real
	#batInfo_energy = battery.readBatteryInfo()
        #L_norm = [str(vy),"::",str(batInfo_energy[5]),"::",str(batInfo_energy[21])+ "\n"]
	self.velx=vx
	self.vely=vy        


	#print ("thetadot_real", (v_fl_real+v_fr_real+v_br_real+v_bl_real))
	#print ("selftheta",self.th )
        odom_quat = Quaternion()
        odom_quat = tf.transformations.quaternion_from_euler(0,0,self.th)
        # Create the odometry transform frame broadcaster (publish tf)
        #self.odomBroadcaster.sendTransform(
        #                     (self.x_, self.y_, 0),
        #                     odom_quat,
        #                     rospy.Time.now(),
        #                     "base_link",
        #                     "odom"
        #                     )

        # Publish Odom

        odom = Odometry()
        odom.header.frame_id = "odom"
        odom.child_frame_id = "base_link"
        odom.header.stamp = rospy.Time.now()
        odom.pose.pose.position.x = self.y_
        odom.pose.pose.position.y = self.x_
        odom.pose.pose.position.z = self.z_
        odom.pose.pose.orientation = Quaternion(*odom_quat)
        odom.twist.twist.linear.x = vy
        odom.twist.twist.linear.y = vx
        odom.twist.twist.angular.z = vth
        self.prev_time = curr_time
	L_pose = [str(self.y_),",",str(self.x_),",",str(self.z_),",",str(odom_quat)+ "\n"]
	L_velocities = [str(vy),",",str(vx),",",str(vth) + "\n"]
	
	L_cmdvel = [str(xdot),",",str(ydot),",",str(thetadot)+ "\n"]
	    

	#file3.writelines(L_Imu)	
	file1.writelines(L_velocities)
	file2.writelines(L_pose)
	file4.writelines(L_cmdvel)
        self.wheel_odom_pub.publish(odom)
	self.target_speed_pub.publish(target_speed)
	

    def pause(self):

        self.xdot = 0.0
        self.ydot = 0.0
        self.thetadot = 0.0
        time.sleep(0.3)

    def loop(self,msg):

            #self.pause()
            self.xdot = msg.linear.x
            self.ydot = msg.linear.y
            self.thetadot = -msg.angular.z
	    L_commandvel = [str(self.xdot),",",str(self.ydot),",",str(self.thetadot)+ "\n"]
	    file3.writelines(L_commandvel)
            #print xdot, ydot, thetadot
	    print(roboclaw.Open())
            if msg.angular.x == 1:
                #self.stop()
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
                        chargingStatus = xnergy.startCharging()
                # xnergy.startCharging()
                    else:
                        chargingStatus = xnergy.stopCharging()
                    print(chargingStatus)
                else:
                    print("Please check the battery!")
            elif msg.angular.x == 2:
                print(roboclaw.Open())
                xnergy.stopCharging()
                batInfo = battery.readBatteryInfo()
                print(batInfo)
		#turning on the fan
	        roboclaw.ForwardM2(0x82, 40)
		#L_vx = [str(self.vely)+ "\n"]
        	#L_vy = [str(self.velx)+ "\n"]
        	#L_curr = [str(batInfo[5])+ "\n"]
		#L_curr2 = [str(batInfo[20])+ "\n"]
		#file4.writelines(L_curr2)

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
		#turning on the fan
	        roboclaw.ForwardM2(0x82, 40)

                if msg.linear.z == 1:
                    print(roboclaw.Open())
                    roboclaw.ForwardM1(0x82, 127)
                elif msg.linear.z == 2:
                    print(roboclaw.Open())
                    roboclaw.BackwardM1(0x82, 127)
                elif msg.linear.z == 0:
                    print(roboclaw.Open())
                    roboclaw.SpeedM1(0x82, 0)
            else:

                pass




def listener():
    rospy.init_node('loop',anonymous = True)
    _object = WaspController()
    rate = rospy.Rate(20)
    #prev_time = rospy.Time.now()
    print "test ok"
    
    #wheel_odom_pub = rospy.Publisher('wheel_odom', Odometry, queue_size=10)
    #rospy.Subscriber("cmd_vel", Twist, _object.loop)
    #_object.forwardKinematics()
    while not rospy.is_shutdown():

	_object.forwardKinematics()
	#rospy.loginfo("Ok !")
        rate.sleep()
    #rospy.spin()

if __name__=='__main__':
    listener()
