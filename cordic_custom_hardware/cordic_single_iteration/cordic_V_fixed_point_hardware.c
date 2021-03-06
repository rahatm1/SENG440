#include <stdio.h>

void cordic_V_fixed_point( int *x, int *y, int *z) 
{
    register int x_temp, y_temp, z_temp, i;
    register int xz_temp;
    
    x_temp = *x;
    y_temp = *y;
    
    for(i=0; i<15; i++)
    {        
        __asm__ __volatile__ ( "CORDIC_SINGLE_V %0, %1, %2" : "=r" (xz_temp) : "r" (x_temp), "r" (y_temp));        
    }

    *x = xz_temp >> 16;
    z_temp = (xz_temp << 16) >> 16;
    *z = z_temp;
}

