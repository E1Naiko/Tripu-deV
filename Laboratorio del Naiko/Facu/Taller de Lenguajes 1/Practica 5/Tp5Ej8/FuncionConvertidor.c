#include <stdio.h>
#include <string.h>

#include <stdio.h>

int convertirDecimalBSS(int original) {
    int result = 0;
    int factor = 1;  // This will help place digits in the correct place

    while (original > 0) {
        result += (original % 2) * factor;
        original /= 2;
        factor *= 10;  // Move to the next place value
    }

    return result;
}
