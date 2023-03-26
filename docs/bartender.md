# Bartender

Bartender is a macOS menu bar app that allows you to hide menu bar icons. It's a great way to declutter your menu bar and keep it clean.

Below are shell scripts that decide whether to show a menu bar icon.

### VPN Indicators
Show VPN indicator if connected to VPN.
```shell
#!/bin/bash

if scutil --nc list | grep -q "Connected" && ifconfig | grep utun >/dev/null; then
  echo "true"
else
  echo "false"
fi
```

### Sound Indicator
Show sound indicator if not connected to airpods.
```shell
#!/bin/bash

if system_profiler SPBluetoothDataType | grep -q "AirPods Pro"; then
  echo "false"
else
  echo "true"
fi
```
