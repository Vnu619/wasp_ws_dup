#!/usr/bin/env python
from roboclaw import Roboclaw

# address of the RoboClaw as set in Motion Studio

address = 0x82

# Creating the RoboClaw object, serial port and baudrate passed

roboclaw = Roboclaw('/dev/wasp_roboclaw', 9600)

# Starting communication with the RoboClaw hardware

print(roboclaw.Open())

# Start motor 1 in the forward direction at half speed

roboclaw.ForwardM2(address, 63)
