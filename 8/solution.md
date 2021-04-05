## SNULL
**Stands for `S`imple `N`etwork `U`tility for `L`oading `L`ocalities**

a simple description could be the interface that uses Ethernet hardware protocol and transmits IP packets.


driver of the network device,
driver that does not talk to the ”actual” devices,
works like a loopback device,
simulates actual operations,
simulates communication with actual servers,
does not send hardware requests.
only supports IP protocol,
driver modifies the packets because there are no remote
servers,
so must know the protocol,
changes content (changes source / target addresses, ...),
module produces two interfaces,
what we send to one interface, it returns to the other
interface,
simulates the operation of two external links,
definition of IP numbers for this is not enough,
the kernel would find that both the source and the target are
on this computer,
it would do all the necessary operations without the driver,
driver of the external address ”area” and sends it to another
interface,
the destination address from the external address of the other
interface.
kind of ”hidden” loopback,
turns on the least important bit of the third octet of the IP
number and network (C class),
packages sent to the network A:
connected to sn0,
first interface,
appear:
as packages of the network B,
connected to sn1,
second interface,
snullnet0 - the network associated with the sn0 interface,
snullnet1 - the network associated with the sn1 interface,
addresses of these two networks should differ only in the least
significant bit of the third octet,
mask should be 24-bit,
local0:
IP interface sn0,
belongs to the network snullnet0,
local1:
IP interface sn1,
belongs to the network snullnet1,
IPs differ only in the least significant bit of the third and
fourth octets,
remote0 - (virtual) computer on the network snullnet0:
fourth octet has to be the same as local1,
each packet sent to remote0 arrives to local1,
package changes the head as if it came from the computer
remote0,
remote1 - (virtual) computer on the network snullnet1:
fourth octet has to be the same as local0,
each packet sent to remote1 arrives to emphlocal0,
package changes the head, like it came from the computer
remote1,

Network numbers:
/etc/networks,
snullnet0 – 192.168.0.0,
snullnet1 – 192.168.1.0,
Computer numbers (hosts):
/etc/hosts,
192.168.0.1 – local0,
192.168.0.2 – remote0,
192.168.1.2 – local1,
192.168.1.1 – remote1,


ifconfig sn0 local0 netmask 255.255.255.0
ifconfig sn1 local1 netmask 255.255.255.0

ping remote0 and remote1:
morgana% ping -c 2 remote0
64 bytes from 192.168.0.99: icmp_seq=0 ttl=64 time=1.6 ms
64 bytes from 192.168.0.99: icmp_seq=1 ttl=64 time=0.9 ms
2 packets transmitted, 2 packets received, 0% packet loss
morgana% ping -c 2 remote1
64 bytes from 192.168.1.88: icmp_seq=0 ttl=64 time=1.8 ms
64 bytes from 192.168.1.88: icmp_seq=1 ttl=64 time=0.9 ms
2 packets transmitted, 2 packets received, 0% packet loss

if we send a packet to a computer on a known network that
the driver does not ”translate”
package appears on another interface, but it is ignored by the
following:
package for 192.168.0.32,
goes to the sn0 interface,
appears on sn1,
destination address 192.168.1.32,
packet is ignored.

driver emulates Ethernet protocol,
10base-T, 100base-T, ali Gigabit,
tcpdump can be used,
