#include <stdlib.h>
#include <stdio.h>
double Rand(char *arg, int range)
{	
	int n = 0, i;
	n = atoi(arg);
	srand(n);
	return rand()%range*0.00001; 
    }

