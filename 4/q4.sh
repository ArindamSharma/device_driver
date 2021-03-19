xinput # for listing out the pointers
xinput create-master Pointer2 # creating new pointer

# xinput reattach <usb mouse id> <new pointer id>
# in my cast 
xinput reattach 15 16
xinput # for checking the new list 


# for removing the pointer
# xinput remove-master < new pointer 2 id>
# in my case 
xinput remove-master 16

# after removing attaching the usb mouse back to original virtual pointer
# in my case 
xinput reattach 15 2