## SNULL Short Description
Stands for **S**imple **N**etwork **U**tility for **L**oading **L**ocalities

a simple description could be the interface that uses Ethernet hardware protocol and transmits IP packets.
snull is not a loopback interface however, it simulates conversations with real remote hosts in order to better demonstrate the task of writing a network driver.this interface only supports IP protocol.

### Assigning IP Numbers
The snull module creates two interfaces. These interfaces are different from a simple loopback, in that whatever you transmit through one of the interfaces loops back to the other one, not to itself. It looks like you have two external links, but actually your computer is replying to itself.

To be able to establish a communication through the snull interfaces, the source and destination addresses need to be modified during data transmission

In other words packets sent through one of the interfaces should be received by the other, but the receiver of the outgoing packet shouldn’t be recognized as the local host

As IP address consist of 4 8bit numbers seperated with dots .
we use octate to represent the 4 section of IP for 

example 192.168.1.1 here ,
|first octate|second octate|third octate |fourth octate |
|:--:|:---:|:-:|:-:|
|192|168|1|1|

what snull do is it toggles the least significant bit of the 3 octet of both the source and destination addresses; that is, it changes both the network number and the host number of class C IP numbers.

assume we have tow network SN0 and SN1
The addresses of these networks should differ only in the least significant bit of the third octet.
These networks must have 24-bit netmasks.
let local ip L1 and L2 for respective netowrk are present which offcourse  must have differ in the least significant bit of their third octet and in the fourth octet.

Note that we won’t be able to reach any other “host” belonging to the two networks, because the packets are discarded by your computer after the address has been modified and the packet has been received. 

Reference :- https://www.oreilly.com/library/view/linux-device-drivers/0596005903/ch17.html