#include <stdio.h>
#include "../cordic_fixed_point.h"


void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2, i, sign;

    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp = 0;

    for(i=0; i<15; i++)
    {
        sign = y_temp_1 < 0 ? 1: -1;

        x_temp_2 = x_temp_1 - sign * (y_temp_1 >> i);
        y_temp_2 = y_temp_1 + sign * (x_temp_1 >> i);
        z_temp -= sign * z_table[i];

        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
    }
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp;
}