adb logcat > C:/apk/log.txt

adb pull /data/app/yh/yh.apk C:\apk\
adb remount

chmod 777 /system

adb shell pm list packages -f

UVCCamera
adb shell
cd sys/bus/usb/drivers
ls
如果显示有uvcvideo文件夹说明支持uvc协议

adb shell 获取手机所有进程：
显示android模拟器上所有在执行的进程:

db shell ps -x
adb shell 获取手机设备信息：
1、设备基本信息：cat /system/build.prop | grep "product"
2、CPU信息：/proc/cpuinfo和/proc/stat 
3、内存：/proc/meminfo adb shell dumpsys meminfo
Terms
VSS - Virtual Set Size 虚拟耗用内存（包含共享库占用的内存）
RSS - Resident Set Size 实际使用物理内存（包含共享库占用的内存）
PSS - Proportional Set Size 实际使用的物理内存（比例分配共享库占用的内存）
USS - Unique Set Size 进程独自占用的物理内存（不包含共享库占用的内存）
4、

adb shell dumpsys batteryinfo >f:\battery.log
通过ADB向android SD卡传送文件

创建SD卡并挂载到模拟器 运 行cmd，并cd至android-sdk\tools\目录下。输入如下命令则可创建并挂载SD卡到模拟器上。mksdcard的参数中SD卡的大小单 位可以为K或者M(必须为大写)，他会在tools目录创建一个文件叫sdcard.img。通过在emulator后添加-sdcard即可挂载SD卡 并启动模拟器。
mksdcard 256M sdcard.img
emulator -avd 2.2 -sdcard sdcard.img
操作单个文件 通过adb push，则可将文件添加到SD卡中。如果想在push的时候修改文件名称的话，只需要修改push的第二个参数改成完整路径（目录+文件名），如/sdcard/test-0.jpg。重启模拟器，则可以在见到SD卡中新添加的内容了。
adb push E:/images/test.jpg /sdcard/
adb push E:/images/test.jpg /sdcard/test-0.jpg
而要将test.jpg提取出来的话，可使用adb pull命令。第二个参数为本机硬盘地址，如果不想改名的话，只需要输入目录地址（不能加)，而需要改名的话，输入文件的完整路径就行了。

adb pull /sdcard/images/test.jpg E:\tmp
adb pull /sdcard/images/test.jpg E:\tmp\test-0.jpg
操作整个文件夹 要将硬盘上的一个文件夹的所有内容都添加至SD卡的话，可以通过如下命令（注意pic后面不能有\）：
adb push E:\Android\pic /sdcard/images/
该命令会把pic文件下以及其子文件夹的内容全部添加到SD卡的images目录下。如果SD卡下没有images目录的话，可以先通过adb shell进行创建，如下：

adb shell
cd /sdcard
mkdir images
exit
而导出整个文件夹的话，可以通过如下命令：

adb pull /sdcard/images/ E:\tmp
更多：
adb devices //列出所有的连接设备
adb connect [:] //通过tcp/ip连接，5555是默认端口
设备命令：
adb push //拷贝文件/目录到设备
adb pull [] //从设备拷贝文件/目录
adb sync [] //只有发生改变时从主机拷贝到设备
adb shell //运行远端shell交互
adb shell //运行远端shell 命令
adb emu //运行仿真控制台命令
adb logcat [] //浏览设备日志
adb forward //转发套接字连接
adb install [-l] [-r] [-s] //拷贝文件包到设备并安装
adb uninstall [-k] //卸载程序包，-k意味着保留数据和缓存
adb bugreport //返回所有的bugreport信息
adb help
adb version
脚本：
adb wait-for-device //阻塞直到设备上线
adb start-server
adb kill-server
adb get-state //列印offline|bootloader|device信息
adb get-serialno
adb status-window //连续列印设备状态
adb remount //重装载/system分区
adb reboot [bootloader|recomry]
adb reboot-bootloader
adb root
adb usb






UsbDevice[
mName=/dev/bus/usb/001/003,
mVendorId=8746,
mProductId=1,
mClass=0,mSubclass=0,mProtocol=0,
mManufacturerName=ILITEK,
mProductName=Multi-Touch-V3000,mSerialNumber=null,mConfigurations=[
UsbConfiguration[mId=1,mName=null,mAttributes=160,mMaxPower=100,mInterfaces=[
UsbInterface[mId=0,mAlternateSetting=0,mName=null,mClass=3,mSubclass=0,mProtocol=0,mEndpoints=[
UsbEndpoint[mAddress=130,mAttributes=3,mMaxPacketSize=64,mInterval=1]]
UsbInterface[mId=1,mAlternateSetting=0,mName=null,mClass=3,mSubclass=0,mProtocol=0,mEndpoints=[
UsbEndpoint[mAddress=129,mAttributes=3,mMaxPacketSize=64,mInterval=1]]]]

UsbDevice[
mName=/dev/bus/usb/003/006,
mVendorId=1423,
mProductId=14401,
mClass=239,mSubclass=2,mProtocol=1,mManufacturerName=AlcorMicroCorp,mProductName=USB HD Camera audio,mSerialNumber=null,mConfigurations=[
UsbConfiguration[mId=1,mName=null,mAttributes=128,mMaxPower=250,mInterfaces=[
UsbInterface[mId=0,mAlternateSetting=0,mName=USB HD Camer,mClass=14,mSubclass=1,mProtocol=0,mEndpoints=[
UsbEndpoint[mAddress=129,mAttributes=3,mMaxPacketSize=16,mInterval=7]]
UsbInterface[mId=1,mAlternateSetting=0,mName=USB HD Camer,mClass=14,mSubclass=2,mProtocol=0,mEndpoints=[]
UsbInterface[mId=1,mAlternateSetting=1,mName=USB HD Camer,mClass=14,mSubclass=2,mProtocol=0,mEndpoints=[
UsbEndpoint[mAddress=130,mAttributes=5,mMaxPacketSize=5120,mInterval=1]]
UsbInterface[mId=1,mAlternateSetting=2,mName=USB HD Camer,mClass=14,mSubclass=2,mProtocol=0,mEndpoints=[
UsbEndpoint[mAddress=130,mAttributes=5,mMaxPacketSize=3072,mInterval=1]]
UsbInterface[mId=1,mAlternateSetting=3,mName=USB HD Camer,mClass=14,mSubclass=2,mProtocol=0,mEndpoints=[
UsbEndpoint[mAddress=130,mAttributes=5,mMaxPacketSize=1024,mInterval=1]]
UsbInterface[mId=1,mAlternateSetting=4,mName=USB HD Camer,mClass=14,mSubclass=2,mProtocol=0,mEndpoints=[
UsbEndpoint[mAddress=130,mAttributes=5,mMaxPacketSize=512,mInterval=1]]]]

UsbDevice[
mName=/dev/bus/usb/003/003,
mVendorId=10205,
mProductId=259,
mClass=0,mSubclass=0,mProtocol=0,mManufacturerName=ôaª,mProductName=2D BarCode Scanner,mSerialNumber=MINDEOMINDEOMINDEOMINDEOMINDEO,mConfigurations=[
UsbConfiguration[mId=1,mName=null,mAttributes=192,mMaxPower=200,mInterfaces=[
UsbInterface[mId=0,mAlternateSetting=0,mName=null,mClass=3,mSubclass=1,mProtocol=1,mEndpoints=[
UsbEndpoint[mAddress=129,mAttributes=3,mMaxPacketSize=64,mInterval=1]
UsbEndpoint[mAddress=2,mAttributes=3,mMaxPacketSize=64,mInterval=1]]]]
