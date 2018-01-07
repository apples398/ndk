# ndk

1. 終端 輸入命令： lsusb

Bus 002 Device 003: ID 046d:c05a Logitech, Inc. M90/M100 Optical Mouse
Bus 002 Device 002: ID 8087:8000 Intel Corp.
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 125: ID 0e8d:200a MediaTek Inc.
Bus 001 Device 002: ID 8087:8008 Intel Corp.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

找到手機對應的那一行，這裡是 
Bus 001 Device 125: ID 0e8d:200a MediaTek Inc.


2. 然後  
vim /etc/udev/rules.d/51-android.rules

添加以下這行到文件中：

SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", MODE="200a", GROUP="plugdev"

3. 再執行

chmod a+r /etc/udev/rules.d/51-android.rules

4. 再執行以下命令


adb kill-server

adb devices 
就顯示如下的了：

List of devices attached
0123456789ABCDEF    device
