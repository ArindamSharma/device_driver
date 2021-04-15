#include<linux/module.h>
static int count=5;
int init_module(void){
	printk("Count = %d\n",count);
	return 0;
}
void cleanu_module(void){
	printk("Module removed\n");
}
module_param(count,int,0);
MODULE_LICENSE("GPL");
