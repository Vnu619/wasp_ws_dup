import orienbus
import rospy
import time
import math
from geometry_msgs.msg import Twist

#port = '/dev/ttyUSB0'
port = '/dev/wasp2_liftmotorBR'
orienbus = orienbus.OrienBus(port)

address1 = 1
address2 = 2
address3 = 3
address4 = 4
m1 = orienbus.initialize(address1)
m2 = orienbus.initialize(address2)
m3 = orienbus.initialize(address3)
m4 = orienbus.initialize(address4)

#ROstatus = 0 or 1
#ExtErrorStatus = 577 or 65; 577 is when circuit connected - e-switch released, 65 when circuit open - e-switch engaged
#AlmRstStatus = 256 or 0; 256 is when reset button is pressed, i.e. circuit connected


def m2init():
    inittmp = 0
    while inittmp == 0:
        m2.writeSpeed(-500)
        print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        if m2.readR0status() == 1:
            m2.writeSpeed(0)
            inittmp = 1
            print(inittmp)
            print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz')
            break
    while inittmp == 1:
        m2.writeSpeed(300)
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        if m2.readR0status() == 0:
            m2.writeSpeed(0)
            m2.resetRotationmeter()
            inittmp = 0
            print(m2.readRotationmeter())
            print(inittmp)
            print('ssssssssssssssssssssssssssssssssssssssssss')
            break


class Lifting(object):
    def __init__(self):
        rospy.Subscriber('/cmd_vel', Twist, self.liftingloop)
        self.liftkey = 0
        self.lifthome = 0
        self.jack_height = 0
        self.hometmp = 0

    def m2home(self):
        while self.hometmp == 0:
            m2.writeSpeed(-500)
            print('9999999999999999999999999999999999999')
            if m2.readR0status() == 1:
                m2.writeSpeed(0)
                self.hometmp = 1
                print(self.hometmp)
                print('88888888888888888888888888888888888888')
                break
        while self.hometmp == 1:
            m2.writeSpeed(300)
            print('77777777777777777777777777777777777777777777777')
            if m2.readR0status() == 0:
                m2.writeSpeed(0)
                m2.resetRotationmeter()
                self.hometmp = 0
                print(m2.readRotationmeter())
                print(self.hometmp)
                print('66666666666666666666666666666666666666')
                break

    def m2move(self, speed_direction):
        if (m2.readR0status() != 1) and (m2.readRotationmeter() < self.jack_height):
            m2.writeSpeed(speed_direction)
        elif (m2.readR0status() != 1) and (m2.readRotationmeter() >= self.jack_height):
            m2.writeSpeed(speed_direction)
        elif m2.readR0status() == 1:
            m2.writeSpeed(0)

    def liftingloop(self, msg):
        self.liftkey = msg.angular.z
        self.lifthome = msg.linear.x

    def liftingcontrol(self):
        print("pending..................................")
        if self.lifthome > 0:
            self.m2home()
        elif self.liftkey == 1:
            self.m2move(1000)
            print('111111111111111111111111111111')
        elif self.liftkey == -1:
            self.m2move(-1000)
            print('222222222222222222222222222222')
        elif self.liftkey == 0:
            self.m2move(0)
            print('333333333333333333333333333333')


def listener():
    rospy.init_node('lift', anonymous=True)
    _object = Lifting()
    rate = rospy.Rate(20)
    while not rospy.is_shutdown():
        if m2.readExtErrorStatus() == 65:
            m2.writeSpeed(0)
            print('Emergency button has been activated. Please release emergency button and press reset button to reset alarm.')
        elif m2.readExtErrorStatus() == 577 and m2.readAlmRstStatus() == 256:
            m2.writeSpeed(0)
            print('Alarm has been reset.')
        _object.liftingcontrol()
        rate.sleep()


if __name__ == '__main__':
#    m2init()
    listener()






#
# while True:
#     m2.writeSpeed(1000)
#     #time.sleep(5)
#     print(m2.readTripmeter())
#     # m2.writeSpeed(0)
#     # time.sleep(1)



# while True:
#     print (m2.readR0status())
#     print (m2.readExtErrorStatus())
#     if m2.readExtErrorStatus() == 577 and m2.readAlmRstStatus() == 256:
#         m2.writeSpeed(1000)
#     elif m2.readExtErrorStatus() == 65:
#         m2.writeSpeed(0)

# m1.writeSpeed(1000) # run motor1 in forward direction with 1000 rpm
# m2.writeSpeed(1000) # run motor2 in reverse direction with 500 rpm
# m3.writeSpeed(1000)
# m4.writeSpeed(1000)
# print("Motor1 Speed : {} , Motor2 Speed : {}".format(m1.readSpeed(), m2.readSpeed()))
#
# time.sleep(2) # wait for 2s
#
# # stop both motors
# m1.writeSpeed(0)
# m2.writeSpeed(0)
# m3.writeSpeed(0)
# m4.writeSpeed(0)
# print("Motor1 Speed : {} , Motor2 Speed : {}".format(m1.readSpeed(), m2.readSpeed()))
#
# time.sleep(2) # wait for 2s
#
# m1.writeSpeed(-1000) # run motor1 in reverse direction with 500 rpm
# m2.writeSpeed(-1000) # run motor2 in forward direction with 1000 rpm
# m3.writeSpeed(-1000)
# m4.writeSpeed(-1000)
# print("Motor1 Speed : {} , Motor2 Speed : {}".format(m1.readSpeed(), m2.readSpeed()))
#
# time.sleep(2) # wait for 2s
#
# # stop both motors
# m1.writeSpeed(0)
# m2.writeSpeed(0)
# m3.writeSpeed(0)
# m4.writeSpeed(0)
# print("Motor1 Speed : {} , Motor2 Speed : {}".format(m1.readSpeed(), m2.readSpeed()))





# while True:
#     speed = 500
#     motor.writeSpeed(speed)
#     speed_read = motor.readSpeed()
#     print (speed_read)
#     time.sleep(5)
#
#


#
# def callback(data):
# 	global speed
# 	speed = data.linear.y
#
#
# if __name__ == "__main__":
# 	try:
# 		rospy.init_node('motor_FR')
# 		sub = rospy.Subscriber('target_speed', Twist, callback)
# 		pub = rospy.Publisher('/speed_fr', Int32, queue_size = 1)
# 		while not rospy.is_shutdown():
# 			motor.writeSpeed(speed)
# 			speed_read = motor.readSpeed()#/60*0.152*(3.14/50)
# 			pub.publish(speed_read)
#
# 	except rospy.ROSInterruptException:
# 		pass
