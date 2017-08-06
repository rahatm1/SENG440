#include <stdio.h>
#include <stdint.h>
#include "cordic_fixed_point.h"

void cordic_V_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1, y_temp_1, z_temp_1;
    int x_temp_2, y_temp_2, i;

    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp_1 = 0;

    uint32_t z_tmp_loader;
    uint16_t first_angle, second_angle;
    for(i=0; i<15; i++)
    {
        z_tmp_loader = z_table[i >> 1];
        first_angle = z_tmp_loader >>16;
        second_angle = (uint16_t) z_tmp_loader;

        if( y_temp_1 > 0)
        {
            x_temp_2 = x_temp_1 + (y_temp_1 >> i);
            y_temp_2 = y_temp_1 - (x_temp_1 >> i);
            z_temp_1 += first_angle;
        }
        else
        {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp_1 -= first_angle;
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;
        i++;

        if( y_temp_1>0)
        {
            x_temp_2 = x_temp_1 + (y_temp_1 >> i);
            y_temp_2 = y_temp_1 - (x_temp_1 >> i);
            z_temp_1 += second_angle;
        }
        else
        {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp_1 -= second_angle;
        }
        x_temp_1 = x_temp_2;
        y_temp_1 = y_temp_2;

    }
    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp_1;
}