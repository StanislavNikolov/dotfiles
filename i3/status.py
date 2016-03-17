#!/bin/env python
import subprocess
from i3pystatus import Status

status = Status(standalone=True)

green="#1A8C01"
white="#FFFFFF"
purple="#D175FF"
red="#FF6600"
blue="#4581DD"
yellow="#DDDD11"

#Clock
status.register("clock", format="%a %d %R", color=white)

#Battery
status.register("battery",
    color=yellow, charging_color=purple, full_color=green, critical_color=red,
    format="❤: {percentage:02.0f}%", interval=1)

# CPU temperature
# status.register("temp", color=white, format="{temp:.0f}°C")

# CPU usage (text)
# status.register("cpu_usage", format="▣ CPU: {usage_cpu1:02}% {usage_cpu1:02}% {usage_cpu2:02}% {usage_cpu3:02}%", interval=1)
status.register("cpu_usage", format="▣: {usage:02.0f}%", interval=1)

# RAM
status.register("mem", color=blue, format="≣: {percent_used_mem:02.0f}%", interval=1)

status.run()
