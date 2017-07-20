#include <stdio.h>
#include "cordic_fixed_point.h"

void cordic_R_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1, y_temp_1, z_temp_1;
    int x_temp_2, y_temp_2, i, j;

    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp_1 = *z;
    i = 0;
    j = 1;

    for(; i<15; i +=2, j +=2)
    {
        // y_val = (y_temp_1 >> i);
        // x_val = (x_temp_1 >> i)

        if( z_temp_1<0)
            {
                x_temp_2 = x_temp_1 + (y_temp_1 >> i);
                y_temp_2 = y_temp_1 - (x_temp_1 >> i);
                z_temp_1 += z_table[i];
            }
        else
        {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp_1 -= z_table[i];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;

        if( z_temp_1<0)
            {
                x_temp_2 = x_temp_1 + (y_temp_1 >> j);
                y_temp_2 = y_temp_1 - (x_temp_1 >> j);
                z_temp_1 += z_table[j];
            }
        else
        {
            x_temp_2 = x_temp_1 - (y_temp_1 >> j);
            y_temp_2 = y_temp_1 + (x_temp_1 >> j);
            z_temp_1 -= z_table[j];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp_1;
}