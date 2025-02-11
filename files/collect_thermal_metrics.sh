#!/bin/sh
echo ipmi_thermal_metrics_inlet_degrees value=$(ipmitool -c sdr list | grep 01-Inlet | cut -d, -f2)
ipmitool -c sdr list | grep -i DutyCycle | cut -d, -f1,2 | tr ' ,' '_ '  | tr '[:upper:]' '[:lower:]' | while read fan speed; do echo ipmi_thermal_metrics_${fan}_speed_percent value=$speed ; done
