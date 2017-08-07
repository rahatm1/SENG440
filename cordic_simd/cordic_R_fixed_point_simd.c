#include <stdio.h>
#include <stdint.h>
#include <arm_neon.h>
#include "../cordic_fixed_point.h"


void cordic_R_fixed_point(int *x, int *y, int *z)
{
    int temp1[2];
    temp1[0] = *x;
    temp1[1] = *y;

    int z_temp, i;
    int32x2_t vec_add, vec_sub;
    z_temp = *z;

    int32x2_t res = vld1_s32(temp1);
    for(i=0; i<15; i++)
    {
        int32x2_t temp = vrev64_s32(vrshl_s32(res, vdup_n_s32(-i)));

        vec_add = vadd_s32(res, temp);
        vec_sub = vsub_s32(res, temp);

        if(z_temp < 0)
        {
            res = vrev64_s32(vext_s32(vec_sub, vec_add, 1));
            z_temp += z_table[i];
        }
        else
        {
            res = vrev64_s32(vext_s32(vec_add, vec_sub, 1));
            z_temp -= z_table[i];
        }
    }

    vst1_s32(temp1,res);

    *x = temp1[0];
    *y = temp1[1];
    *z = z_temp;
}