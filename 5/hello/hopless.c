//#include <stdbool.h>
//#include<stddef.h> 
#include <linux/module.h> 
#include <linux/kernel.h> 
#include <linux/init.h>

/* Needed by all modules / / Needed for KERN_INFO */
/* Needed for the macros */
static int __init hello_start(void) {
	printk(KERN_INFO "Loading hello module...\n"); 
	printk(KERN_INFO "Hello world\n");
	return 0; }
static void __exit hello_end(void) {
	printk(KERN_INFO "Goodbye Mr.\n");
}
module_init(hello_start); 
module_exit(hello_end);

