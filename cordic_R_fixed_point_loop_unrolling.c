#include <stdio.h>
#include "cordic_fixed_point.h"

void cordic_R_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1, y_temp_1, z_temp_1, x1_temp_1, y1_temp_1, z1_temp_1;
    int x_temp_2, y_temp_2,x1_temp_2, y1_temp_2, i;

    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp_1 = *z;

    x1_temp_1 = *x;
    y1_temp_1 = *y;
    z1_temp_1 = *z;
    int y_val, x_val;
    for(i=0; i<15; i += 2)
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
                x_temp_2 = x_temp_1 + (y_temp_1 >> (i+1));
                y_temp_2 = y_temp_1 - (x_temp_1 >> (i+1));
                z_temp_1 += z_table[i+1];
            }
        else
        {
            x_temp_2 = x_temp_1 - (y_temp_1 >> (i+1));
            y_temp_2 = y_temp_1 + (x_temp_1 >> (i+1));
            z_temp_1 -= z_table[i+1];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp_1;
}