#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "cordic_fixed_point.h"
#define SYSTEM_PROCESSING_GAIN 1/1.6476025812107
#define KRED  "\x1B[31m"
#define RESET "\x1B[0m"
#define EPSILON 0.001
#define convertToFixedPoint(dbl) dbl * (1<<15)
#define convertToDouble(dbl) dbl/(double)(1<<15)
#define randomSign (rand() %2 == 0 ? -1 : 1)

double randZeroToPi()
{
	return randomSign * (rand() / (RAND_MAX + 1.)) * M_PI_2;
}

double randZeroToFive()
{
    return (rand() / (RAND_MAX + 1.)) * 5;
}

double arctan( double y, double x) {
	int x_i = convertToFixedPoint(x);
	int y_i = convertToFixedPoint(y);
    int z_i = 0;

    cordic_V_fixed_point(&x_i, &y_i, &z_i);
    return convertToDouble(z_i);
}

double arctan2(double x) {
    return arctan(x, 1);
}

double sin_cordic(double z) {
	int x_i = convertToFixedPoint(1.0);
	int y_i = convertToFixedPoint(0.0);
	int z_i = convertToFixedPoint(z);
    cordic_R_fixed_point(&x_i, &y_i, &z_i);
    return convertToDouble(y_i) * SYSTEM_PROCESSING_GAIN;
}

double cos_cordic(double z) {
	int x_i = convertToFixedPoint(1);
	int y_i = convertToFixedPoint(0);
	int z_i = convertToFixedPoint(z);
    cordic_R_fixed_point(&x_i, &y_i, &z_i);
    return convertToDouble(x_i) * SYSTEM_PROCESSING_GAIN;
}

void compareActualToExpected(double actual, double expected) {
    if (fabs(actual - expected) > EPSILON) {
        printf(KRED "MISMATCH\n" RESET);
        printf("Actual: %f, Expected: %f\n", actual, expected);
    }
}

int main(void)
{

	int i;
	printf("\n");
	printf("The angle table:\n");
	for(i=0; i<15; i++)
	{
		float radian = atan(pow(2.0, (double)(-i)));
		float degrees = radian*180 / M_PI;
		printf("z[%2i] = %i, rad = %f, degree = %f\n", i, (int)(atan(pow(2.0, (double)(-i))) *(1<<15)), radian, degrees);
	}

	printf("\n\n");

	double x_d, y_d, z_d;

	for(i=0; i<15; i++){
		x_d = randZeroToFive(); // must be >= 0
		y_d = randomSign * randZeroToFive();

        //Arctan(y/x)
		z_d = atan(y_d/x_d);
        printf("arctan(%f, %f) = %f\n", y_d, x_d, arctan(y_d, x_d));
        compareActualToExpected(arctan(y_d, x_d), z_d);

        //Arctan(x)
		x_d = randZeroToFive();
		z_d = atan(x_d);
        printf("arctan2(%f) = %f\n", x_d, arctan2(x_d));
        compareActualToExpected(arctan2(x_d), z_d);

        // cos(z) & sin(z)
		z_d = randZeroToPi();
		printf("cos(%f)=%f\nsin(%f)=%f\n", z_d, cos_cordic(z_d), z_d, sin_cordic(z_d));
        compareActualToExpected(cos_cordic(z_d), cos(z_d));
        compareActualToExpected(sin_cordic(z_d), sin(z_d));

	}

}

