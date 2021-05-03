import select
import sys
import time
import os
i = 0
chargingCommand  = 0

def timeout_input(timeout, prompt="", timeout_value=None):
    sys.stdout.write(prompt)
    sys.stdout.flush()
    ready, _, _ = select.select([sys.stdin], [], [], timeout)
    if ready:
        return sys.stdin.readline().rstrip('\n')
    else:
        sys.stdout.write('\n')
        sys.stdout.flush()
        return timeout_value

for i in range(3):
	if chargingCommand != 1:
		os.system('spd-say "Charge the battery, bitch!"')
		chargingCommand = int(timeout_input(3, "Charge battery?", 0))
		time.sleep(1)
		print(i)
		print(chargingCommand)
		print(type(chargingCommand))
		i+=1
	else:
		break
