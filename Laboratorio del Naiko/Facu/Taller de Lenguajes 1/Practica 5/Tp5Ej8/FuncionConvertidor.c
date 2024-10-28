#include <stdio.h>

int convertirDecimalBSS(int original){
    int result = 0;

    while (original>0){
        result *= 10;
        result += original%2;
        original /=2;
    }

    return result;
}
