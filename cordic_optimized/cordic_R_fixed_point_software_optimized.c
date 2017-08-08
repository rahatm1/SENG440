#include <stdio.h>
#include <stdint.h>
#include "cordic_fixed_point.h"

void cordic_R_fixed_point(int *x, int *y, int *z)
{
    register int i asm("r4");
    register int x_temp_1 asm("r5");
    register int y_temp_1 asm("r6");
    register int z_temp_1 asm("r7");

    register int x_temp_2 asm("r8");
    register int y_temp_2 asm("r9");

    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp_1 = *z;

    register uint32_t z_tmp_loader asm("r1");
    register uint16_t first_angle asm("r2");
    register uint16_t second_angle asm("r3");
    register  uint32_t z_preload asm("r10");

    z_preload = z_table[0];

    for(i=0; i<15; i++)
    {
        z_tmp_loader = z_preload;
        first_angle = z_tmp_loader >>16;
        second_angle = (uint16_t) z_tmp_loader;

        z_preload = z_table[ (i+2) >> 1];

        if( z_temp_1<0)
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

        if( z_temp_1<0)
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