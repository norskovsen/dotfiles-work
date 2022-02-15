#!/usr/bin/python3
import os
import getpass

USER = getpass.getuser()

# # Terminate already running bar instances
os.system("killall -q polybar")

# # Wait until the processes have been shut down
os.system(f"while pgrep -u {USER} -x polybar >/dev/null; do sleep 2; done")

LIST_DISPLAYS_CMD = "xrandr --listactivemonitors | awk '{ print$4 }'"
for i, monitor in enumerate(os.popen(LIST_DISPLAYS_CMD).read().split()):
    print(f"Opening on monitor {monitor}")
    os.system(f"MONITOR={monitor} polybar bar{i+1} &")
