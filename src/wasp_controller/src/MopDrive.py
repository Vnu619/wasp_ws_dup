#!/usr/bin/env python3

import time
from roboclaw_3 import Roboclaw


#rc = Roboclaw("/dev/wasp1_wall_mop", 115200)
rc = Roboclaw("/dev/ttyACM1", 115200)
rc.Open()

class MopControl:
    def __init__(self):
        self.address = 0x80
        self.M1I = 0
        self.M2I = 0
        #rc.Open()

    def upward(self):
        rc.BackwardM1(self.address, 27)
        rc.BackwardM2(self.address, 27)
        #time.sleep(10)

    def downward(self):
        rc.ForwardM1(self.address, 27)
        rc.ForwardM2(self.address, 27)
        #time.sleep(10)

    def stop(self):
        rc.ForwardM1(self.address, 0)
        rc.ForwardM2(self.address, 0)

    def currentreadingM1(self):
        rc.ReadCurrents(self.address)
        self.M1I = (rc.ReadCurrents(self.address)[1]) * 0.01
        print("M1 Current = ", self.M1I)
        return self.M1I

    def currentreadingM2(self):
        rc.ReadCurrents(self.address)
        self.M2I = (rc.ReadCurrents(self.address)[2]) * 0.01
        #print("M2 current = ", self.M2I)
        return self.M2I

    rc.ForwardM1(0x80, 0)
    rc.ForwardM2(0x80, 0)








