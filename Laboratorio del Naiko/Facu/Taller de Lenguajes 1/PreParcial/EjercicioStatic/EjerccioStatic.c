
#include <stdio.h>

int main()
{
	int i;
	for (i=0; i<4; i++){
		static int s=4;
		if (--s%3)
			printf("S=%d", s--);
	}
	
	return 0;
}

