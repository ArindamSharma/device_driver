make # to compile the module
#this will create lab6_char.ko file

lsmod # check if there exist any module name hopless

sudo insmod lab6_char.ko #inserting the module

lsmod # checking the insersion of module

cat /proc/devices # to check if its listed in the charactor driver or not 

# create a device node in kernel device tree. Following is the command to create the device node
# "mknod path type major minor"
# path:- path is the place where device file needs to be created . Mostly we create our device file under /dev directory. we give same name of device file which we registered at the time registering our driver. As in above code wehad given device name is “mydev”. So we will give path as /dev/mydev.
# type:- type will be “c” or “b” . Weather our device will be registered as character device or block device.
# major :- Major number of driver. In our case we assumed device major number as 90.
# minor:- minor number is defined as minor number of device. we are assuming this value to 1.

mknod /dev/custom_device 11 1 #making node for my devce driver

chmod a+r+w /dev/custom_device #giving permisions

echo "Friends Forvere" > /dev/custom_device # passing data to the device

sudo rmmod lab6_char # for remove the module from the list 

lsmod # to check if the module is cleared or not
