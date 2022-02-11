#!/usr/bin/env python3

import orienbus
import rospy
import time
import math
from wasp_joy.msg import logistics
from geometry_msgs.msg import Twist

address = 2
port = '/dev/wasp1_liftmotorFR'
orienbus = orienbus.OrienBus(port)
motor = orienbus.initialize(address)

#ROstatus = 0 or 1
#ExtErrorStatus = 577 or 65; 577 is when circuit connected - e-switch released, 65 when circuit open - e-switch engaged
#AlmRstStatus = 256 or 0; 256 is when reset button is pressed, i.e. circuit connected


def init():
    inittmp = 0
    while inittmp == 0:
        motor.writeSpeed(-1500)
        if motor.readR0status() == 1:
            motor.writeSpeed(0)
            inittmp = 1
            print(inittmp)
            break
    while inittmp == 1:
        motor.writeSpeed(1500)
        if motor.readR0status() == 0:
            motor.writeSpeed(0)
            motor.resetRotationmeter()
            inittmp = 0
            print(motor.readRotationmeter())
            print(inittmp)
            break


class Lifting(object):
    def __init__(self):
        rospy.Subscriber('/cmd_logi', logistics, self.liftingloop)
        self.liftup = 0
        self.liftdown = 0
        self.lifthome = 0
        self.jack_high_limit = 1650
        self.jack_low_limit = 20
        self.hometmp = 0

    def home(self):
        while self.hometmp == 0:
            motor.writeSpeed(-1500)
            if motor.readR0status() == 1:
                motor.writeSpeed(0)
                self.hometmp = 1
                print(self.hometmp)
                print(motor.readRotationmeter())
                break
        while self.hometmp == 1:
            motor.writeSpeed(1500)
            if motor.readR0status() == 0:
                motor.writeSpeed(0)
                motor.resetRotationmeter()
                self.hometmp = 0
                print(motor.readRotationmeter())
                print(self.hometmp)
                break

    def move(self, speed_direction):
            if motor.readR0status() != 1:
                motor.writeSpeed(speed_direction)
            elif motor.readR0status() == 1:
                motor.writeSpeed(0)

    def liftingloop(self, msg):
        self.liftup = msg.liftup
        self.liftdown = msg.liftdown
        self.lifthome = msg.lifthome

    def liftingcontrol(self):
        #print("pending..................................")
        print(motor.readRotationmeter())
        if self.lifthome > 0:
            self.home()
        #elif (self.liftup == 1):
        elif (self.liftup == 1) and (motor.readRotationmeter() <= self.jack_high_limit):
            motor.writeSpeed(3000)
        elif (self.liftdown == 1):
            motor.writeSpeed(-3000)
            if motor.readRotationmeter() <= self.jack_low_limit:
                motor.writeSpeed(0)
                self.home()
        elif self.liftup == 0 or self.liftdown == 0:
            motor.writeSpeed(0)


def listener():
    rospy.init_node('lift', anonymous=True)
    _object = Lifting()
    rate = rospy.Rate(20)
    while not rospy.is_shutdown():
        _object.liftingcontrol()
        rate.sleep()


if __name__ == '__main__':
    init()
    listener()