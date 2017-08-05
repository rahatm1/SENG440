#include <stdio.h>
#include "../cordic_fixed_point.h"

void cordic_R_fixed_point(int *x, int *y, int *z)
{
    register int i asm("r4");
    register int x_temp_1 asm("r5");
    register int y_temp_1 asm("r6");
    register int z_temp asm("r7");
    register int x_temp_2, y_temp_2;

    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp = *z;

    for(i=0; i<15; i++)
    {
        if( z_temp<0)
        {
            x_temp_2 = x_temp_1 + (y_temp_1 >> i);
            y_temp_2 = y_temp_1 - (x_temp_1 >> i);
            z_temp += z_table[i];
        }
        else
        {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp -= z_table[i];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}