#include<stdio.h>
int main(){
	FILE *A;
	A=fopen("/var/log/syslog","w");
	// A=fopen("/dev/mem","w");
	// A=fopen("/dev/kmsg","w");
	if(A==NULL){
		printf("Error in opening file\n");
        exit(1);
	}
	printf("Magic\n");
	return 0;
}