#!/usr/bin/env python3

import orienbus
import rospy
from geometry_msgs.msg import Twist
from std_msgs.msg import *
address = 3
port = '/dev/wasp1_motorBR'

orienbus = orienbus.OrienBus(port)
motor = orienbus.initialize(address)
speed =0
def callback(data):
	global speed
	speed = data.linear.z

if __name__ =="__main__":
	try:
		rospy.init_node('motor_BR')
		sub = rospy.Subscriber('target_speed', Twist, callback)
		pub = rospy.Publisher('/speed_br', Int32, queue_size = 1)
		while not rospy.is_shutdown():
			motor.writeSpeed(speed)
			speed_read = motor.readSpeed()#/60*0.152*(3.14/50)
			pub.publish(speed_read)

	except rospy.ROSInterruptException:
		pass
