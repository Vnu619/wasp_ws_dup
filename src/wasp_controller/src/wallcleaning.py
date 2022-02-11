#!/usr/bin/env python3

import rospy
import socket
import time
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from dryveD1 import DryveD1
from MopDrive import MopControl

D1 = DryveD1('169.254.48.1', 502)
mop = MopControl()


class testing(object):

    def __init__(self):
        self.wheel_speed_pub = rospy.Publisher('/cmd_vel',Twist, queue_size = 10)
        # rospy.Subscriber("/cmd_vel", Twist, self.action)
        rospy.Subscriber("/scan2", LaserScan, self.lidarreading2)
        rospy.Subscriber("/scan", LaserScan, self.lidarreading1)

        self.button = 0
        self.initbutton = 0
        self.vmode = 0
        self.current_ref = 0
        self.state = 0
        self.d_dist = 0
        self.dist180 = 0
        self.dist260 = 0
        self.angle = 0
        self.pos0 = 15
        self.pos1 = 400 # with respect to belt table bottom edge/750 (CHART Wall value = 400)
        self.pos2 = 760 # with respect to belt table bottom edge/1010 (CHART Wall value = 760)
        self.pos3 = 1750 # with respect to belt table bottom edge/1760 (CHART Wall value = 1750)
        self.dist_near = 0.35
        self.dist_away = 0.45
        # self.state = 0
        self.flag = 0
        self.vx = 0
        self.vy = 0
        self.wz = 0
        self.w = 0
        self.diff = 0
        self.cycle = 0

    # def action(self, msg):
    #     self.button = msg.angular.z
    #     self.initbutton = msg.linear.x

    # Back LiDAR
    def lidarreading2(self, msg):
        self.dist180 = float("{:.3f}".format(msg.ranges[180]))
        return self.dist180

    # Front LiDAR
    def lidarreading1(self, msg):
        self.dist260 = float("{:.3f}".format((msg.ranges[260]) - 0.55))
        return self.dist260

    def control(self):
        D1.velocitymode()
        self.vmode = 1

        # ================================================ #
        # Initialization of LiDAR; ignore 0 LiDAR reading. #
        # ================================================ #

        if self.state == 0:
            if self.dist180 == 0.0 and self.dist260 == 0.0:
                self.state = 0
            elif self.dist260 != 0.0 and self.dist180 != 0.0:
                self.state = 1
        #return

        # ========================================= #
        # Robot aligns itself parallel to the wall. #
        # ========================================= #

        if self.state == 1:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            # print("Compensated Front LiDAR: ", self.dist260)
            # print ("Back LiDAR: ", self.dist180)
            # print ("diff: ", self.diff)
            # print ("d_dist: ", self.d_dist)

            if self.diff > 0.008 and (self.dist260 > self.dist180):
                self.wz = 0.03
                # print("000000000000000000000000000000000000000000")
                cmd_vel = Twist()
                cmd_vel.angular.z = self.wz
                self.wheel_speed_pub.publish(cmd_vel)
            elif self.diff > 0.008 and (self.dist260 < self.dist180):
                self.wz = -0.03
                # print("11111111111111111111111111111111111111111111")
                cmd_vel = Twist()
                cmd_vel.angular.z = self.wz
                self.wheel_speed_pub.publish(cmd_vel)
            elif self.diff < 0.008:
                self.wz = 0
                self.state = 2
                # print("3333333333333333333333333333333333333333333")
                cmd_vel = Twist()
                cmd_vel.angular.z = self.wz
                self.wheel_speed_pub.publish(cmd_vel)
        #return

        # ================================ #
        # Robot moves to the edge of wall. #
        # ================================ #

        if self.state == 2:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            if self.diff <= 0.05:
                self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
            elif self.diff > 0.05 and (self.dist180 > self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist260))
            elif self.diff > 0.05 and (self.dist180 < self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist180))
            if self.d_dist <= 0.45:
                print ("Compensated Front LiDAR 2: ", self.dist260)
                print ("Back LiDAR 2: ", self.dist180)
                print ("diff 2: ", self.diff)
                print ("d_dist 2: ", self.d_dist)
                # print ("1111111111111111111111111111111111111111111")
                cmd_vel = Twist()
                self.vy = 0
                self.vx = -0.05
                cmd_vel.linear.x = self.vx
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
                time.sleep(10)
                self.state = 2.1
            elif self.d_dist > 0.45:
                self.vy = 0.05
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
        # return

        # ================= #
        # Stop Vx movement. #
        # ================= #

        if self.state == 2.1:
            self.vx = 0
            cmd_vel = Twist()
            cmd_vel.linear.x = self.vx
            self.wheel_speed_pub.publish(cmd_vel)
            self.state = 3
        # return

        # ========================================================================================= #
        # Robot moves near wall, start mop rotation and belt move up until bottom edge of obstacle. #
        # ========================================================================================= #

        if self.state == 3:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            if self.diff <= 0.05:
                self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
            elif self.diff > 0.05 and (self.dist180 > self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist260))
            elif self.diff > 0.05 and (self.dist180 < self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist180))
            print("Compensated Front LiDAR 3: ", self.dist260)
            print("Back LiDAR 3: ", self.dist180)
            print("diff 3: ", self.diff)
            print("d_dist 3: ", self.d_dist)
            print('cycle: ', self.cycle)
            if self.d_dist <= self.dist_near:
                #print ("1111111111111111111111111111111111111111111")
                cmd_vel = Twist()
                self.vy = 0
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
                # while True:
                    # self.current_ref = mop.currentreadingM1() - mop.currentreadingM2()
                # while -1.0 < (mop.currentreadingM1() - mop.currentreadingM2()) < 1.0:
                while True:
                    mop.upward()
                    D1.moveup()
                    # D1.posactualdecvalue()
                    if D1.posactualdecvalue() > self.pos1:
                        print(D1.posactualdecvalue())
                        mop.stop()
                        D1.stop()
                        self.state = 4
                        break
#                   elif self.current_ref < -0.5:
#                        self.w = 0.3
#                        cmd_vel.angular.z = self.w
#                   else:
#                        self.w = -0.3
#                        cmd_vel.angular.z = self.w
            elif self.d_dist > self.dist_near:
                #print(self.d_dist)
                self.vy = 0.05
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
        # return

        # ==================================================================== #
        # Robot moves away from wall, belt move up until top edge of obstacle. #
        # ==================================================================== #

        if self.state == 4:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            if self.diff <= 0.05:
                self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
            elif self.diff > 0.05 and (self.dist180 > self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist260))
            elif self.diff > 0.05 and (self.dist180 < self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist180))
            print("Compensated Front LiDAR 4: ", self.dist260)
            print("Back LiDAR 4: ", self.dist180)
            print("diff 4: ", self.diff)
            print("d_dist 4: ", self.d_dist)
            print('cycle: ', self.cycle)
            if self.d_dist >= self.dist_away:
                self.vy = 0
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)

                # print("2222222222222222222222222222222222")
                while True:
                    D1.moveup()
                    # print("555555555555555555555555555555555")
                    if D1.posactualdecvalue() > self.pos2:
                        D1.stop()
                        # print("666666666666666666666666666666666")
                        self.state = 5
                        break
            else:
                self.vy = -0.05
                # print ("33333333333333333333333333333333333")
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
        #return

        # =================================================================================== #
        # Robot moves near wall, start mop rotation and belt move up until top limit of belt. #
        # =================================================================================== #

        if self.state == 5:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            if self.diff <= 0.05:
                self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
            elif self.diff > 0.05 and (self.dist180 > self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist260))
            elif self.diff > 0.05 and (self.dist180 < self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist180))
            print("Compensated Front LiDAR 5: ", self.dist260)
            print("Back LiDAR 5: ", self.dist180)
            print("diff 5: ", self.diff)
            print("d_dist 5: ", self.d_dist)
            print('cycle: ', self.cycle)
            if self.d_dist <= self.dist_near:
                cmd_vel = Twist()
                self.vy = 0
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
                # while -1.0 < (mop.currentreadingM1() - mop.currentreadingM2()) < 1.0:
                if self.cycle != 5:
                    self.cycle = self.cycle + 1
                    while True:
                        mop.upward()
                        D1.moveup()
                        if D1.posactualdecvalue() > self.pos3:
                            mop.stop()
                            D1.stop()
                            self.state = 6
                            break
                if self.cycle == 5 and self.d_dist < self.dist_away:
                    self.vy = -0.05
                    cmd_vel = Twist()
                    cmd_vel.linear.y = self.vy
                    self.wheel_speed_pub.publish(cmd_vel)
                elif self.cycle == 5 and self.d_dist >= self.dist_away:
                    self.vy = 0
                    cmd_vel = Twist()
                    cmd_vel.linear.y = self.vy
                    self.wheel_speed_pub.publish(cmd_vel)
            # elif self.dist240 > self.dist300:
            #     self.w = 0.3
            #     cmd_vel = Twist()
            #     cmd_vel.angular.z = self.w
            # elif self.dist240 < self.dist300:
            #     self.w = -0.3
            #     cmd_vel = Twist()
            #     cmd_vel.angular.z = self.w
            elif self.d_dist > self.dist_near:
                # print(self.d_dist)
                self.vy = 0.05
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
        #return

        # ========================================= #
        # Robot moves away from wall, move forward. #
        # ========================================= #

        if self.state == 6:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            if self.diff <= 0.05:
                self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
            elif self.diff > 0.05 and (self.dist180 > self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist260))
            elif self.diff > 0.05 and (self.dist180 < self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist180))
            print("Compensated Front LiDAR 6: ", self.dist260)
            print("Back LiDAR 6: ", self.dist180)
            print("diff 6: ", self.diff)
            print("d_dist 6: ", self.d_dist)
            print('cycle: ', self.cycle)
            if self.d_dist >= self.dist_away:
                self.vy = 0
                self.vx = 0.05
                cmd_vel = Twist()
                cmd_vel.linear.x = self.vx
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
                time.sleep(5.5)
                self.state = 6.1
                # if (self.d_dist >= self.dist_away) and (self.vy == 0):
                #     self.state = 3.1
                # else:
                #     self.vx = 0.1
                #     cmd_vel = Twist()
                #     cmd_vel.linear.x = self.vx
                #     self.wheel_speed_pub.publish(cmd_vel)
            else:
                self.vy = -0.05
                #print ("6666666666666666666666666666666666")
                #print (self.d_dist)
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
        # return

        # ======================= #
        # Robot stop Vx movement. #
        # ======================= #

        if self.state == 6.1:
            self.vx = 0
            # print ("55555555555555555555555555555555555")
            cmd_vel = Twist()
            cmd_vel.linear.x = self.vx
            self.wheel_speed_pub.publish(cmd_vel)
            self.state = 6.2
        # return

        # ======================================================================================== #
        # Robot moves near wall, start mop rotation and belt move down until top edge of obstacle. #
        # ======================================================================================== #

        if self.state == 6.2:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            if self.diff <= 0.05:
                self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
            elif self.diff > 0.05 and (self.dist180 > self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist260))
            elif self.diff > 0.05 and (self.dist180 < self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist180))
            print("Compensated Front LiDAR 6.2: ", self.dist260)
            print("Back LiDAR 6.2: ", self.dist180)
            print("diff 6.2: ", self.diff)
            print("d_dist 6.2: ", self.d_dist)
            print('cycle: ', self.cycle)
            if self.d_dist <= self.dist_near:
                cmd_vel = Twist()
                self.vy = 0
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
                self.cycle = self.cycle + 1
                # while -1.0 < (mop.currentreadingM1() - mop.currentreadingM2()) < 1.0:
                while True:
                    mop.downward()
                    D1.movedown()
                    if D1.posactualdecvalue() < (self.pos2 + 10):
                        mop.stop()
                        D1.stop()
                        self.state = 7
                        break
            # elif self.dist240 > self.dist300:
            #     self.w = 0.3
            #     cmd_vel = Twist()
            #     cmd_vel.angular.z = self.w
            # elif self.dist240 < self.dist300:
            #     self.w = -0.3
            #     cmd_vel = Twist()
            #     cmd_vel.angular.z = self.w
            elif self.d_dist > self.dist_near:
                # print(self.d_dist)
                self.vy = 0.05
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
        #return

        # ========================================================================= #
        # Robot moves away from wall, belt move down until bottom edge of obstacle. #
        # ========================================================================= #

        if self.state == 7:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            if self.diff <= 0.05:
                self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
            elif self.diff > 0.05 and (self.dist180 > self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist260))
            elif self.diff > 0.05 and (self.dist180 < self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist180))
            print("Compensated Front LiDAR 7: ", self.dist260)
            print("Back LiDAR 7: ", self.dist180)
            print("diff 7: ", self.diff)
            print("d_dist 7: ", self.d_dist)
            print('cycle: ', self.cycle)
            if self.d_dist >= self.dist_away:
                self.vy = 0
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
                while True:
                    D1.movedown()
                    if D1.posactualdecvalue() < (self.pos1 + 10):
                        D1.stop()
                        self.state = 8
                        break
            else:
                self.vy = -0.05
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
        # return

        # ======================================================================================= #
        # Robot moves near wall, start mop rotation and belt move down until bottom edge of belt. #
        # ======================================================================================= #

        if self.state == 8:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            if self.diff <= 0.05:
                self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
            elif self.diff > 0.05 and (self.dist180 > self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist260))
            elif self.diff > 0.05 and (self.dist180 < self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist180))
            print("Compensated Front LiDAR 8: ", self.dist260)
            print("Back LiDAR 8: ", self.dist180)
            print("diff 8: ", self.diff)
            print("d_dist 8: ", self.d_dist)
            print('Cycle: ', self.cycle)
            if self.d_dist <= self.dist_near:
                cmd_vel = Twist()
                self.vy = 0
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
                # while -1.0 < (mop.currentreadingM1() - mop.currentreadingM2()) < 1.0:
                while True:
                    #print ("9999999999999999999999999999")
                    mop.downward()
                    D1.movedown()
                    if D1.posactualdecvalue() < self.pos0:
                        #print("88888888888888888888888888888888")
                        #print(D1.posactualdecvalue())
                        mop.stop()
                        D1.stop()
                        self.state = 9
                    break
            #                   elif self.current_ref < -0.5:
            #                        self.w = 0.3
            #                        cmd_vel.angular.z = self.w
            #                   else:
            #                        self.w = -0.3
            #                        cmd_vel.angular.z = self.w
            elif self.d_dist > self.dist_near:
                # print(self.d_dist)
                self.vy = 0.05
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)

        # ========================================== #
        # Robot moves away from wall, moves froward. #
        # ========================================== #

        if self.state == 9:
            self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))
            if self.diff <= 0.05:
                self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
            elif self.diff > 0.05 and (self.dist180 > self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist260))
            elif self.diff > 0.05 and (self.dist180 < self.dist260):
                self.d_dist = float("{:.3f}".format(self.dist180))
            print("Compensated Front LiDAR 9: ", self.dist260)
            print("Back LiDAR 9: ", self.dist180)
            print("diff 9: ", self.diff)
            print("d_dist 9: ", self.d_dist)
            print('cycle: ', self.cycle)
            if self.d_dist >= self.dist_away:
                self.vy = 0
                self.vx = 0.05
                cmd_vel = Twist()
                cmd_vel.linear.x = self.vx
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)
                time.sleep(5.5)
                self.state = 9.1
                # if (self.d_dist >= self.dist_away) and (self.vy == 0):
                #     self.state = 3.1
                # else:
                #     self.vx = 0.1
                #     cmd_vel = Twist()
                #     cmd_vel.linear.x = self.vx
                #     self.wheel_speed_pub.publish(cmd_vel)
            else:
                self.vy = -0.05
                # print ("6666666666666666666666666666666666")
                #print (self.d_dist)
                cmd_vel = Twist()
                cmd_vel.linear.y = self.vy
                self.wheel_speed_pub.publish(cmd_vel)

        # ======================== #
        # Robot stops Vx movement. #
        # ======================== #

        if self.state == 9.1:
            self.vx = 0
            #print ("55555555555555555555555555555555555")
            cmd_vel = Twist()
            cmd_vel.linear.x = self.vx
            self.wheel_speed_pub.publish(cmd_vel)
            self.state = 3

def listener():
    rospy.init_node('loopwall', anonymous=True)
    _object = testing()
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        _object.control()
        rate.sleep()


if __name__ == '__main__':
    D1.home()
    listener()

    # self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
    # self.diff = float("{:.3f}".format(abs(self.dist260 - self.dist180)))

    # if self.diff <= 0.05:
    #     self.d_dist = float("{:.3f}".format(((self.dist260 + self.dist180) * 0.5)))
    # elif self.diff > 0.05 and (self.dist180 > self.dist260):
    #     self.d_dist = float("{:.3f}".format(self.dist260))
    # elif self.diff > 0.05 and (self.dist180 < self.dist260):
    #     self.d_dist = float("{:.3f}".format(self.dist180))
    # print ("Compensated Front LiDAR: ", self.dist260)
    # print ("Back LiDAR: ", self.dist180)
    # print ("diff: ", self.diff)
    # print ("d_dist: ", self.d_dist)

    # if self.diff < 0.008:
    #     self.wz = 0
    #     print("3333333333333333333333333333333333333333333")
    #     cmd_vel = Twist()
    #     cmd_vel.angular.z = self.wz
    #     self.wheel_speed_pub.publish(cmd_vel)
    # elif self.diff > 0.008 and (self.dist260 > self.dist180):
    #     self.wz = 0.03
    #     print ("000000000000000000000000000000000000000000")
    #     cmd_vel = Twist()
    #     cmd_vel.angular.z = self.wz
    #     self.wheel_speed_pub.publish(cmd_vel)
    # elif self.diff > 0.008 and (self.dist260 < self.dist180):
    #     self.wz = -0.03
    #     print("11111111111111111111111111111111111111111111")
    #     cmd_vel = Twist()
    #     cmd_vel.angular.z = self.wz
    #     self.wheel_speed_pub.publish(cmd_vel)

    # working hardcoded
    # D1.home()
    # self.ref_done = 1
    # while self.ref_done == 1:
    #     D1.velocitymode()
    #     if D1.posactualdecvalue() < 200:
    #         D1.moveup()
    #     else:
    #         D1.stop()
    #         self.ref_done = 0

    # working teleop-code portion
    # while self.initbutton > 0:
    #     D1.velocitymode()
    #     while self.button > 0:
    #         D1.moveup()
    #     while self.button < 0:
    #         D1.movedown()
    #     while self.button == 0:
    #         D1.stop()
    #         D1.actualposition()
    #         break

