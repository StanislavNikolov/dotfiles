#!/bin/env python3.4
import subprocess
from i3pystatus import Status

status = Status(standalone=True)

color_normal="#FFFFFF"
color_purple="#D175FF"
color_critical="#FF6600"

#Clock
status.register("clock", format="%A %d %B %R")

#Battery
status.register("battery",
    color=color_normal, charging_color=color_purple, full_color=color_normal, critical_color=color_critical,
    status={'DPL': 'DPL', 'FULL': 'FULL', 'CHR': 'CHR', 'DIS': 'DIS'},
    format="Battery: {percentage:.1f}% {status}", interval=10)

#CPU temperature
status.register("temp", color=color_normal, format="{temp:.0f}°C")

#CPU usage (text)
status.register("cpu_usage", format="CPU: {usage_cpu1:02}% {usage_cpu1:02}% {usage_cpu2:02}% {usage_cpu3:02}%", interval=5)

#RAM
status.register("mem", color=color_normal, format="{used_mem:.0f}/{total_mem:.0f} MIB", interval=5)

status.run()
