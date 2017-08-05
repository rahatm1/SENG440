#include <stdio.h>
#include <stdint.h>
#include "../cordic_fixed_point.h"
#include <arm_neon.h>

#define MACRO(i)  \
        x_tmp = vshr_n_s32(x1, i); \
        x_tmp = vrev64_s32(x1); \
        x2_add = vadd_s32(x1, x_tmp); \
        x2_sub = vsub_s32(x1, x_tmp); \
        z_temp_1 = z_temp_1<0 ? z_temp_1 + z_table[i] : z_temp_1 - z_table[i]; \
        x1 = z_temp_1<0 ? vext_s32(x2_add, x2_sub, 1) : vext_s32(x2_sub, x2_add, 1);

void cordic_R_fixed_point(int *x, int *y, int *z)
{
    register int z_temp_1 asm ("r5");

    z_temp_1 = *z;

    int32_t test[2] = {0,0};
    int32x2_t x1 = vld1_s32(test);
    int32x2_t x_tmp;

    int32x2_t x2_add;
    int32x2_t x2_sub;

    MACRO(1);
    MACRO(2);
    MACRO(3);
    MACRO(4);
    MACRO(5);
    MACRO(6);
    MACRO(7);
    MACRO(8);
    MACRO(9);
    MACRO(10);
    MACRO(11);
    MACRO(12);
    MACRO(13);
    MACRO(14);

    //TODO
    //return...
}