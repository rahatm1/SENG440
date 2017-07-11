#include <stdio.h>
#include <math.h>

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

  printf("\n");
  printf("These are our outputs yo:\n");
  for(i=0; i<15; i++)
  {
    float radian = atan(pow(2.0, (double)(-i)));
    float degrees = radian*180 / M_PI;
    printf("z[%2i] = %i, rad = %f, degree = %f\n", i, (int)(atan(pow(2.0, (double)(-i))) *(1<<15)), radian, degrees);
  }
}

int int_values(double val)
{
  return 0;
}
