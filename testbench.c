#include <stdio.h>
#include <math.h>
#include "cordic_fixed_point.h"

int main(void)
{
	double x_d, y_d, z_d;
	int x_i, y_i, z_i, i;
  x_d = 0.85;
  y_d = 0.76;
  z_d = atan(y_d/x_d);

  x_i = x_d * (1<<15);
  y_i = y_d * (1<<15);
  z_i = z_d * (1<<15);

  printf("x_d = %f\t\t\tx_i = %i\n", x_d, x_i);
  printf("y_d = %f\t\t\ty_i = %i\n", y_d, y_i);
  printf("z_d = %f\t\t\tz_i = %i\n", z_d, z_i);

  cordic_V_fixed_point(&x_i, &y_i, &z_i);
  printf("Vector mode:\n");
  printf("x_d = %f\t\t\tx_i = %i\n", x_i/(float)(1<<15), x_i);
  printf("y_d = %f\t\t\ty_i = %i\n", y_i/(float)(1<<15), y_i);
  printf("z_d = %f\t\t\tz_i = %i\n", z_i/(float)(1<<15), z_i);

  double rx_d = 1.0, ry_d = 0.0, rz_d = 1.57;
  int rx_i = rx_d*(1<<15), ry_i = ry_d*(1<<15), rz_i = rz_d*(1<<15);

  cordic_R_fixed_point(&rx_i, &ry_i, &rz_i);
  printf("Rotation mode:\n");
  printf("rx_d = %f\t\t\trx_i = %i\n", rx_i/(float)(1<<15), rx_i);
  printf("ry_d = %f\t\t\try_i = %i\n", ry_i/(float)(1<<15), ry_i);
  printf("rz_d = %f\t\t\trz_i = %i\n", rz_i/(float)(1<<15), rz_i);

  printf("\n");
  printf("These are our outputs yo:\n");
  for(i=0; i<15; i++)
  {
    float radian = atan(pow(2.0, (double)(-i)));
    float degrees = radian*180 / M_PI;
    printf("z[%2i] = %i, rad = %f, degree = %f\n", i, (int)(atan(pow(2.0, (double)(-i))) *(1<<15)), radian, degrees);
  }
}
