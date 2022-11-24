#include <time.h>
#include <stdio.h>

extern double Task(double x);
extern double Rand(char *arg, int range);


int main(int argc, char* argv[]) {
    FILE *input, *output;
    int i, j, command, sumTime = 0, Nloop, range;
    double n, ans;
    char* param_of_random;
    printf("%s","input amount of itertion: \n");
    scanf("%d",&Nloop);
    printf("%s","input command: \n 1 - read from file \n 2 - Random\n 0 - Testing");
    scanf("%d",&command);
    if(command == 1) {
    	input = fopen("files/input.txt","r");
    	fscanf(input,"%lf",&n);
    }
    if(command == 2) {
    	range = 10000;
    	if(argc < 2) {
    		param_of_random = "0";
    	} else {
    		param_of_random = (argv)[1];
    	}
    	n = Rand(param_of_random, range);
    }
    
    if(command == 0) {  
 	input = fopen("files/tests.txt","r");	
 	output = fopen("files/output.txt", "w");
 	clock_t begin = clock();
    	for(i = 0; i < Nloop; i++) { 
    		fscanf(input,"%lf",&n); 
    		Task(n);
    		fprintf(output, "%lf", n);
    		fprintf(output, "%s", "\n");		
   	}
   	clock_t end = clock();
   	fprintf(output,"%lf",Task(n));
   	sumTime = (int)(end- begin);
   	printf("%s","Sum of Time in ms: ");
   	printf("%d",sumTime);
   	return 0;
    } 
    clock_t begin = clock();
    for(i = 0; i < Nloop; i++) { 
    		Task(n);		
   	}
    clock_t end = clock();
    ans = Task(n);
    output = fopen("files/output.txt", "w");
    fprintf(output,"%lf",ans);
    printf("%d", (int)(end - begin));
    return 0;
}
