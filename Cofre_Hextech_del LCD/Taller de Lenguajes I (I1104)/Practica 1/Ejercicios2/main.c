#include <stdio.h>
#include <stdlib.h>

int main(){
    int num;
    for (num=1; num <= 50; num++ ) {
            if (num%5 == 0) {
                printf(" %d\n", num);
            }
    }
    for (num=0; num <= 50; num= num + 5 ) printf(" %d\n", num);
    return 0;
}
