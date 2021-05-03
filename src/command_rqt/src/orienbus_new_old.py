'''
		OrienBus: A Python library for interfacing oriental motors with modbus using minimalmodbus python driver

		Authors : "Phone Thiha Kyaw, Monisha, Thein Than Tun"
		Version : "1.0.0"
'''

########################################################################################
#
#   NOTES:

#   - Currently library only support profile 2 with default acceleration and deceleartions
#   - Future Versions will have different profiles and error message feedbacks
#
########################################################################################
import serial
import struct
import time
_serialports = {}

_WRITE_REGISTER = 125
_FEEDBACK_SPEED_REG_LOWER = 207
_FEEDBACK_SPEED_REG_UPPER = 206

_WRITE_REGISTER_SPEED = 1157
_FWD_DEC = 10
_REV_DEC = 18

_MIN_RPM = 80
_MAX_RPM = 4000

_latest_write_time =0 
speed = 0

#CRC-16 check list
_CRC16TABLE = (
    0,
    49345,
    49537,
    320,
    49921,
    960,
    640,
    49729,
    50689,
    1728,
    1920,
    51009,
    1280,
    50625,
    50305,
    1088,
    52225,
    3264,
    3456,
    52545,
    3840,
    53185,
    52865,
    3648,
    2560,
    51905,
    52097,
    2880,
    51457,
    2496,
    2176,
    51265,
    55297,
    6336,
    6528,
    55617,
    6912,
    56257,
    55937,
    6720,
    7680,
    57025,
    57217,
    8000,
    56577,
    7616,
    7296,
    56385,
    5120,
    54465,
    54657,
    5440,
    55041,
    6080,
    5760,
    54849,
    53761,
    4800,
    4992,
    54081,
    4352,
    53697,
    53377,
    4160,
    61441,
    12480,
    12672,
    61761,
    13056,
    62401,
    62081,
    12864,
    13824,
    63169,
    63361,
    14144,
    62721,
    13760,
    13440,
    62529,
    15360,
    64705,
    64897,
    15680,
    65281,
    16320,
    16000,
    65089,
    64001,
    15040,
    15232,
    64321,
    14592,
    63937,
    63617,
    14400,
    10240,
    59585,
    59777,
    10560,
    60161,
    11200,
    10880,
    59969,
    60929,
    11968,
    12160,
    61249,
    11520,
    60865,
    60545,
    11328,
    58369,
    9408,
    9600,
    58689,
    9984,
    59329,
    59009,
    9792,
    8704,
    58049,
    58241,
    9024,
    57601,
    8640,
    8320,
    57409,
    40961,
    24768,
    24960,
    41281,
    25344,
    41921,
    41601,
    25152,
    26112,
    42689,
    42881,
    26432,
    42241,
    26048,
    25728,
    42049,
    27648,
    44225,
    44417,
    27968,
    44801,
    28608,
    28288,
    44609,
    43521,
    27328,
    27520,
    43841,
    26880,
    43457,
    43137,
    26688,
    30720,
    47297,
    47489,
    31040,
    47873,
    31680,
    31360,
    47681,
    48641,
    32448,
    32640,
    48961,
    32000,
    48577,
    48257,
    31808,
    46081,
    29888,
    30080,
    46401,
    30464,
    47041,
    46721,
    30272,
    29184,
    45761,
    45953,
    29504,
    45313,
    29120,
    28800,
    45121,
    20480,
    37057,
    37249,
    20800,
    37633,
    21440,
    21120,
    37441,
    38401,
    22208,
    22400,
    38721,
    21760,
    38337,
    38017,
    21568,
    39937,
    23744,
    23936,
    40257,
    24320,
    40897,
    40577,
    24128,
    23040,
    39617,
    39809,
    23360,
    39169,
    22976,
    22656,
    38977,
    34817,
    18624,
    18816,
    35137,
    19200,
    35777,
    35457,
    19008,
    19968,
    36545,
    36737,
    20288,
    36097,
    19904,
    19584,
    35905,
    17408,
    33985,
    34177,
    17728,
    34561,
    18368,
    18048,
    34369,
    33281,
    17088,
    17280,
    33601,
    16640,
    33217,
    32897,
    16448,
)


class orienMotor:

	"""
		ModBus class for talking to instruments (slaves).
		Uses the minimalmodbus python library.
	Args:
		* port (str): The serial port name, for example ``/dev/ttyUSB0`` (Linux),
		  ``/dev/tty.usbserial`` (OS X) or ``COM4`` (Windows).
		* slaveaddress (int): Slave address in the range 1 to 247 (use decimal numbers,
		  not hex). Address 0 is for broadcast, and 248-255 are reserved.
	"""

	def __init__(self, _port, _slave_address, debug = False):

		self._port = _port
		self._slave_address = _slave_address
		self._debug = debug
		if _port not in _serialports or not +serialports[_port]:
			self._print_debug("Create serial port{}".format(_port))		
			self.serial = serial.Serial(
				port = _port,
				baudrate = 115200,
				parity = serial.PARITY_EVEN,
				stopbits = 1,
				timeout = 0.035,
				bytesize = serial.EIGHTBITS
			)
			print("Successfully connected to motor{}...".format(_slave_address))
		else:
			self._print_debug("Serial port {} already exists".format(_port))
			self.serial =  serialprots[_port]
			if (self.serial._port is None) or (not self.serial.is_open):
				self._print_debug("Serial port {} is closed. Opening.".format(_port))
				self.serial.open()
	
	def _print_debug(self, text):
		if self._debug:
			print("Orienbus debug mode. "+text)

	def _communicate(self, request):
		self._print_debug(str(self.serial.isOpen()))
		#try:
			#clear buffer of the port
		self._print_debug("Request to the slave:{!r}".format(request))
		self._print_debug("Clearing buffer of the port:{}".format(self._port))			
		self.serial.reset_input_buffer()
		self.serial.reset_output_buffer()
		time.sleep(0.00501)
		_latest_write_time = time.time()
		self.serial.write(request)
		answer = self.serial.read(7)
		_latest_read_times = time.time()
		#self._print_debug("reading value is {!r}".format(answer))
		self._print_debug("roundtrip time is {:.1f}".format((_latest_read_times - _latest_write_time)*1000))
		#print ("answer",answer)
		return answer
			
	def writeSpeed(self, speed):
		self._print_debug(str(self.serial.isOpen()))
		address = chr(self._slave_address)
		if (speed >= _MIN_RPM and speed <= _MAX_RPM):
			self._print_debug("within range")
			if speed > 255:
				value = bytearray.fromhex('{:04x}'.format(speed))
			else:
				value = bytearray.fromhex('{:02x}'.format(speed))
			request_1 = bytes(address+'\x10\x04\x85\x00\x01\x02'+value)+_calculate_crc_string(bytes(address+'\x10\x04\x85\x00\x01\x02'+value))
			
			self._communicate(request_1)
			request_2 = bytes(address+'\x10\x00\x7d\x00\x01\x02\x00\x0a\x2c\x7a')
			self._communicate(request_2)
 		elif speed <= -_MIN_RPM and speed >= -_MAX_RPM:
			if speed <-255:				
				value = bytearray.fromhex('{:04x}'.format(-speed))
			else:
				value = bytearray.fromhex('{:02x}'.format(-speed))
			request_1 = bytes(address+'\x10\x04\x85\x00\x01\x02'+value)+_calculate_crc_string(bytes(address+'\x10\x04\x85\x00\x01\x02'+value))
			self._communicate(request_1)
			request_2 = bytes(address+'\x10\x00\x7d\x00\x01\x02\x00\x12\x2c\x70')
			self._communicate(request_2)
		else:
			
			self._communicate(bytes(address+'\x10\x00\x7d\x00\x01\x02\x00\x22\x2c\x64'))
	def readSpeed(self):
		self._print_debug(str(self.serial.isOpen()))
		address = chr(self._slave_address)
		speed = struct.unpack('>H',self._communicate('\x01\x03\x00\xcf\x00\x01\xb4\x35')[3:5])[0]
		if speed >10000:
			speed = speed - 65535
		return speed
		
def _calculate_crc_string(inputstring):
    """Calculate CRC-16 for Modbus.

    Args:
        inputstring (str): An arbitrary-length message (without the CRC).

    Returns:
        A two-byte CRC string, where the least significant byte is first.

    """
    #_check_string(inputstring, description="input CRC string")

    # Preload a 16-bit register with ones
    register = 0xFFFF

    for char in inputstring:
        register = (register >> 8) ^ _CRC16TABLE[(register ^ ord(char)) & 0xFF]
    register = '{:04x}'.format(register)
    register = register[2]+register[3]+register[0]+register[1]
    register = bytes(bytearray.fromhex(register))	

    return register
