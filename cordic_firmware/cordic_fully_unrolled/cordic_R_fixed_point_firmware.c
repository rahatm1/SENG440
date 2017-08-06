#include <stdio.h>

void cordic_R_fixed_point( int *x, int *y, int *z)
{
    register int x_temp, y_temp, z_temp;
    register int xy_temp;
    
    x_temp = *x;
    z_temp = *z;
    
    __asm__ __volatile__ ( "CORDIC_R %0, %1, %2" : "=r" (xy_temp) : "r" (x_temp), "r" (z_temp));
    *x = xy_temp >> 16;
    y_temp = (xy_temp << 16) >> 16;
    *y = y_temp;
}

