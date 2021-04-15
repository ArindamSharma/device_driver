//Arindam Sharma CED17I022
#include <linux/module.h> 
#include <linux/kernel.h> 
#include <linux/init.h>

/* Needed by all modules / / Needed for KERN_INFO */
/* Needed for the macros */
static int __init hello_start(void) {
	printk(KERN_INFO "Module Inserted\n");
	printk(KERN_INFO "My Name is Arindam Sharma(CED17I022)\n");
	return 0; }
static void __exit hello_end(void) {
	printk(KERN_INFO "Module removed\n");
}
module_init(hello_start); 
module_exit(hello_end);
MODULE_LICENSE("GPL");
