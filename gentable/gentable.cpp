// gentable.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"

#define BASE_FREQ 500000000
#define CARRIER 100000000
#define BAND 50000

int _tmain(int argc, _TCHAR* argv[])
{
	double freq_wish;
	double divider;
	double m;

	printf("WIDTH = 16;\n");
	printf("DEPTH = %d;\n",256);
	printf("ADDRESS_RADIX = HEX;\n");
	printf("DATA_RADIX = HEX;\n");
	printf("CONTENT BEGIN\n");

	for(int i=0; i<256; i++)
	{
		freq_wish = CARRIER + BAND*i/256;
		divider = BASE_FREQ / freq_wish;
		m=(divider-4)/(5-divider);
		//printf("freq %f div %f %f %d\n",freq_wish,divider,m,(int)(m+0.5));
		printf("%04X: %04X;\n",i,(int)(m+0.5));
	}

	printf("END\n");

	return 0;
}

