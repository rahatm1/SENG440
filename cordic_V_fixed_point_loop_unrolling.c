#include <stdio.h>
#include "cordic_fixed_point.h"


void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2, i, j;

    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp = 0;

    i = 0; 
    j = 1;

    for(; i<15; i+=2, j+=2)
    {
        if(y_temp_1 > 0)
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
        
        if(y_temp_1 > 0)
        {
            x_temp_2 = x_temp_1 + (y_temp_1 >> j);
            y_temp_2 = y_temp_1 - (x_temp_1 >> j);
            z_temp += z_table[j];
        }
        else
        {
            x_temp_2 = x_temp_1 - (y_temp_1 >> j);
            y_temp_2 = y_temp_1 + (x_temp_1 >> j);
            z_temp -= z_table[j];
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}