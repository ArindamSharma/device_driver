//Arindam Sharma CED17I022
#include<linux/module.h>
static int count=5;
int init_module(void){
	printk("Module Inserted\n");
	printk("Count = %d\n",count);
	return 0;
}
void cleanup_module(void){
	printk("Module removed\n");
}
module_param(count,int,0);
MODULE_LICENSE("GPL");
