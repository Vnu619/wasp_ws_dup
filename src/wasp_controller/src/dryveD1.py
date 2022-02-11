import sys
import socket
import time

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)


class DryveD1(object):

    def __init__(self, host, port):
        self.host = host
        self.port = port
        try:
            s.connect((self.host, self.port))
            print('Socket created')
        except socket.error:
            print('failed to create socket')

        self.res = 0
        self.status = [0, 0, 0, 0, 0, 13, 0, 43, 13, 0, 0, 0, 96, 65, 0, 0, 0, 0, 2]
        self.status_array = bytearray(self.status)
        self.shutdown = [0, 0, 0, 0, 0, 14, 0, 43, 13, 1, 0, 0, 96, 64, 0, 0, 0, 0, 1, 6]
        self.shutdown_array = bytearray(self.shutdown)
        self.switchOn = [0, 0, 0, 0, 0, 14, 0, 43, 13, 1, 0, 0, 96, 64, 0, 0, 0, 0, 1, 7]
        self.switchOn_array = bytearray(self.switchOn)
        self.enableOperation = [0, 0, 0, 0, 0, 15, 0, 43, 13, 1, 0, 0, 96, 64, 0, 0, 0, 0, 2, 15, 0]
        self.enableOperation_array = bytearray(self.enableOperation)

        self.sendCommand(self.status_array)
        self.sendCommand(self.shutdown_array)
        self.sendCommand(self.status_array)
        self.sendCommand(self.switchOn_array)
        self.sendCommand(self.status_array)
        self.sendCommand(self.enableOperation_array)

        self.pos = 0
        self.l1 = 0
        self.l2 = 0
        self.l3 = 0
        self.byte19 = 0
        self.byte20 = 0
        self.byte21 = 0
        self.byte22 = 0
        self.actpos = 0
        self.offsetpos = 0

        self.in1 = 0
        self.inbyte19 = 0
        self.inbyte20 = 0
        self.inbyte21 = 0
        self.inbyte22 = 0

        self.actualpos = 0
        self.target = 0
        self.position = 0
        self.pi1 = 0
        self.posbyte19 = 0
        self.posbyte20 = 0
        self.posbyte21 = 0
        self.posbyte22 = 0

    def sendCommand(self, data):
        s.send(data)
        self.res = s.recv(24)
        # print(self.convert2arr(self.res))
        return self.convert2arr(self.res)

    def home(self):
        #reset
        #self.sendCommand(bytearray([0, 0, 0, 0, 0, 15, 0, 43, 13, 1, 0, 0, 96, 64, 0, 0, 0, 0, 2, 0, 1]))
        #Set mode 6 - Homing mode
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 14, 0, 43, 13, 1, 0, 0, 96, 96, 0, 0, 0, 0, 1, 6]))
        #6092h_01h Feed constant Subindex 1 (Feed)
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 146, 1, 0, 0, 0, 4, 88, 27, 0, 0]))
        #6092h_02h Feed constant Subindex 2 (Shaft revolutions)
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 146, 2, 0, 0, 0, 4, 1, 0, 0, 0]))
        #6099h_01h Homing speeds Switch
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 153, 1, 0, 0, 0, 4, 232, 3, 0, 0]))
        #6099h_02h Homing speeds Zero
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 153, 2, 0, 0, 0, 4, 232, 3, 0, 0]))
        #609Ah Homing acceleration
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 154, 0, 0, 0, 0, 4, 232, 3, 0, 0]))
        time.sleep(0.1)
        #6040h Controlword. Start Homing
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 15, 0, 43, 13, 1, 0, 0, 96, 64, 0, 0, 0, 0, 2, 31, 0]))
        #Keep homing before bit 10 and 12 turn to '1'
        while self.sendCommand(self.status_array) != [0, 0, 0, 0, 0, 15, 0, 43, 13, 0, 0, 0, 96, 65, 0, 0, 0, 0, 2, 39, 22]:
            print('Homing')
        print('Home done')
        
    def velocitymode(self):
        #Set mode 3 - velocity mode
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 14, 0, 43, 13, 1, 0, 0, 96, 96, 0, 0, 0, 0, 1, 3]))
        #6092h_01h Feed constant Subindex 1 (Feed)
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 146, 1, 0, 0, 0, 4, 88, 27, 0, 0]))
        #6092h_02h Feed constant Subindex 2 (Shaft revolutions)
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 146, 2, 0, 0, 0, 4, 1, 0, 0, 0]))
        #6083h profile acceleration
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 131, 0, 0, 0, 0, 4, 232, 3, 0, 0]))
        #6084h profile deceleration
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 132, 0, 0, 0, 0, 4, 232, 3, 0, 0]))
        time.sleep(0.1)

    def moveup(self):
        #move upwards
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 255, 0, 0, 0, 0, 4, 24, 252, 255, 255]))

    def movedown(self):
        #move downwards
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 255, 0, 0, 0, 0, 4, 232, 3, 0, 0]))

    def stop(self):
        #stop movement
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 255, 0, 0, 0, 0, 4, 0, 0, 0, 0]))

    def positionmode(self, position_input):
        self.pi1 = list(format((100000 - (position_input * 100)), "b"))
        self.pi1.reverse()
        while len(self.pi1) < 32:
            self.pi1.append(0)
        self.pi1.reverse()
        self.posbyte19 = sum([int(self.pi1[31]) * 1, int(self.pi1[30]) * 2, int(self.pi1[29]) * 4, int(self.pi1[28]) * 8,
                             int(self.pi1[27]) * 16, int(self.pi1[26]) * 32, int(self.pi1[25]) * 64,
                             int(self.pi1[24]) * 128])
        self.posbyte20 = sum([int(self.pi1[23]) * 1, int(self.pi1[22]) * 2, int(self.pi1[21]) * 4, int(self.pi1[20]) * 8,
                             int(self.pi1[19]) * 16, int(self.pi1[18]) * 32, int(self.pi1[17]) * 64,
                             int(self.pi1[16]) * 128])
        self.posbyte21 = sum([int(self.pi1[15]) * 1])
        self.posbyte22 = 0
        # Set mode 1 - position mode
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 14, 0, 43, 13, 1, 0, 0, 96, 96, 0, 0, 0, 0, 1, 1]))
        # 6092h_01h Feed constant Subindex 1 (Feed)
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 146, 1, 0, 0, 0, 4, 88, 27, 0, 0]))
        # 6092h_02h Feed constant Subindex 2 (Shaft revolutions)
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 146, 2, 0, 0, 0, 4, 1, 0, 0, 0]))
        # Target position
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 122, 0, 0, 0, 0, 4, self.posbyte19, self.posbyte20, self.posbyte21, self.posbyte22]))
        # Profile velocity
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 129, 0, 0, 0, 0, 4, 232, 3, 0, 0]))
        # 6083h profile acceleration
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 131, 0, 0, 0, 0, 4, 232, 3, 0, 0]))
        # 6084h profile deceleration
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 132, 0, 0, 0, 0, 4, 232, 3, 0, 0]))
        time.sleep(0.1)
        # 6040h Controlword. Start Homing
        self.sendCommand(bytearray([0, 0, 0, 0, 0, 15, 0, 43, 13, 1, 0, 0, 96, 64, 0, 0, 0, 0, 2, 31, 0]))

    # def actualposition(self):
    #     #Feedback actual position
    #     #posread = []
    #     posread = self.sendCommand(bytearray([0, 0, 0, 0, 0, 13, 0, 43, 13, 0, 0, 0, 96, 100, 0, 0, 0, 0, 4]))
    #     print ('Current position = ', posread)
    #     #return posread
    #     #print (posread)

    def actualposition(self):
        # Check actual position
        self.actualpos = self.sendCommand(bytearray([0, 0, 0, 0, 0, 13, 0, 43, 13, 0, 0, 0, 96, 100, 0, 0, 0, 0, 4]))
        return self.actualpos

    def posactualdecvalue(self):
        # Present actual position in decimal reading in mm wrt to negative limit switch as home = 0mm.
        self.pos = self.sendCommand(bytearray([0, 0, 0, 0, 0, 13, 0, 43, 13, 0, 0, 0, 96, 100, 0, 0, 0, 0, 4]))
        self.byte19 = self.pos[19]
        if self.pos[20] != 0:
            # byte20 convert from decimal to binary and put into a list.
            self.l1 = list(format(self.pos[20], "b"))
            # byte20 binary list multiply with correspond value to find decimal value.
            self.l1.reverse()
            while len(self.l1) < 8:
                self.l1.append(0)
            self.l1.reverse()
            self.byte20 = sum([int(self.l1[0])*32768, int(self.l1[1])*16384, int(self.l1[2])*8192, int(self.l1[3])*4096, int(self.l1[4])*2048, int(self.l1[5])*1024, int(self.l1[6])*512, int(self.l1[7])*256])
        elif self.pos[20] == 0:
            self.byte20 = 0
        if self.pos[21] != 0:
            # the largest number of position is 176000.
            # byte21 convert from decimal to binary and put into a list.
            self.l2 = list(format(self.pos[21], "b"))
            # byte20 binary list multiply with correspond value to find decimal value.
            self.l2.reverse()
            while len(self.l2) < 8:
                self.l2.append(0)
            self.l2.reverse()
            self.byte21 = sum([int(self.l2[0])*8388608, int(self.l2[1])*4194304, int(self.l2[2])*2097152, int(self.l2[3])*1048576, int(self.l2[4])*524288, int(self.l2[5])*262144, int(self.l2[6])*131072, int(self.l2[7])*65536])
        elif self.pos[21] == 0:
            self.byte21 = 0
        if self.pos[22] != 0:
            # byte22 convert from decimal to binary and put into a list.
            self.l3 = list(format(self.pos[22], "b"))
            # byte22 binary list multiply with correspond value to find decimal value.
            self.l3.reverse()
            while len(self.l3) < 8:
                self.l3.append(0)
            self.l3.reverse()
            self.byte22 = sum([int(self.l3[0])*2147483648, int(self.l3[1])*1073741824, int(self.l3[2])*536870912, int(self.l3[3])*268435456, int(self.l3[4])*134217728, int(self.l3[5])*67108864, int(self.l3[6])*33554432, int(self.l3[7])*16777216])
        self.actpos = self.byte19 + self.byte20 + self.byte21 + self.byte22
        self.offsetpos = (1760.00 - (self.actpos * 0.01))
        # print(self.byte19, self.byte20, self.byte21, self.byte22, self.actpos, self.offsetpos)
        # print(self.pos[19], self.pos[20], self.pos[21], self.pos[22])
        return self.offsetpos
        # self.x = bin(0)
        # self.xx = bin(0)
        # self.val = int(0)
        # for i in range of ([3]):
            # self.x = str(bin(self.pos[19 + i]))
            # self.xx = self.xx + self.x
            # self.val = int(self.xx)
        # return self.val

    def targetposition(self, target_input):
        self.in1 = list(format((100000-(target_input * 100)), "b"))
        self.in1.reverse()
        while len(self.in1) < 32:
            self.in1.append(0)
        self.in1.reverse()
        self.inbyte19 = sum([int(self.in1[31])*1, int(self.in1[30])*2, int(self.in1[29])*4, int(self.in1[28])*8, int(self.in1[27])*16, int(self.in1[26])*32, int(self.in1[25])*64, int(self.in1[24])*128])
        self.inbyte20 = sum([int(self.in1[23])*1, int(self.in1[22])*2, int(self.in1[21])*4, int(self.in1[20])*8, int(self.in1[19])*16, int(self.in1[18])*32, int(self.in1[17])*64, int(self.in1[16])*128])
        self.inbyte21 = sum([int(self.in1[15])*1])
        self.inbyte22 = 0
        self.target = [0, 0, 0, 0, 0, 17, 0, 43, 13, 0, 0, 0, 96, 100, 0, 0, 0, 0, 4, self.inbyte19, self.inbyte20, self.inbyte21, self.inbyte22]
        return self.target
        #self.sendCommand(bytearray([0, 0, 0, 0, 0, 17, 0, 43, 13, 1, 0, 0, 96, 122, 0, 0, 0, 0, 4, self.inbyte19, self.inbyte20, self.inbyte21, self.inbyte22]))

    def convert2arr(self, unicode):
        out = []
        for x in unicode:
            out.append(int(x))
        return out





