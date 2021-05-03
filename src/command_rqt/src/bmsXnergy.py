import serial
import struct
import time
import sys
import minimalmodbus

from binascii import unhexlify
_serialports = {}

class BAT(object):
	def __init__(self, port, debug = False):
		self._port = port
		self.debug = debug
		if port not in _serialports or not _serialports[port]:
			self._print_debug("Create serial port {}".format(port))
			self.serial = _serialports[port] = serial.Serial(
				port=port,
				baudrate=9600,
				parity=serial.PARITY_NONE,
				stopbits=serial.STOPBITS_ONE,
				timeout=0.2,
				bytesize=serial.EIGHTBITS
			)
			_print_out("Successfully Connected to the battery")
		else:
			self._print_debug("Serial port {} already exists".format(port))
			self.serial = _serialports[port]
			if (self.serial.port is None) or (not self.serial.is_open):
				self._print_debug("Serial port {} is closed. Opening.".format(port))
				self.serial.open()
	def _print_debug(self, text):
		if self.debug:
			_print_out("MinimalModbus debug mode. " + text)
	def readBatteryInfo(self):
		try:
			self._print_debug(str(self.serial.isOpen()))
			if self.serial.isOpen():
				hexadecimal_string = "DDA50300FFFD77"
				byte_array = bytearray.fromhex(hexadecimal_string)
				self._print_debug("sent")
				self.serial.write(byte_array)
				raw = self.serial.read(38)
				if raw == b'':
					_print_out("Waking up battery...")
					time.sleep(1)
					self.serial.write(byte_array)
					raw = self.serial.read(38)
					
					info = struct.unpack('>BBBBHHHHHHHHHBBBBBHHHB',raw)
				else:
					info = struct.unpack('>BBBBHHHHHHHHHBBBBBHHHB',raw)
				
		except:
			self._print_debug("Unable to read from the battery SUCKER!")
			info = 0
		return info


class XNERGY(object):
	def __init__(self, port, slave_address):
		self._port = port
		self.address = slave_address
		self.instrument = minimalmodbus.Instrument(self._port, 16)
		self.instrument.serial.baudrate = 9600
		self.instrument.serial.bytesize = 8
		self.instrument.serial.parity   = minimalmodbus.serial.PARITY_NONE
		self.instrument.serial.stopbits = 1
		self.instrument.serial.timeout  = 0.05
		self.instrument.mode = minimalmodbus.MODE_RTU
		self.instrument.clear_buffers_before_each_transaction = True

	def startCharging(self):
		try:
			self.instrument.write_bit(0, 1)
			chargingStatus = 1
		except:
			_print_out("Fail to start charging!")
			chargingStatus = 0
		return chargingStatus

	def stopCharging(self):
		try:
			self.instrument.write_bit(0, 0)

			chargingStatus = 0
			_print_out("Stop Charging")
		except:
			_print_out("Fail to stop charging!")
			chargingStatus = 1
		return chargingStatus


def _print_out(inputstring):
    #_check_string(inputstring, description="string to print")
    sys.stdout.write(inputstring + "\n")
    sys.stdout.flush()
