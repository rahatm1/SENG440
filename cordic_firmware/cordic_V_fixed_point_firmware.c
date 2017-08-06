#include <stdio.h>

void cordic_V_fixed_point(int *x_y, int *z)
{
    int temp1_xy, temp2_xy, temp_z, i, temp1_y;

    temp1_xy = *x_y;
    __asm__("EXTRACT_Y\t%1,%0":"=r"(temp1_y):"r"(temp2_xy));
    temp_z = *z;

    for(i=0; i<15; i++)
    {
        if(temp1_y > 0)
        {
            __asm__("XADD_YSUB\t%1,%2,%0":"=r"(temp2_xy):"r"(temp1_xy),"r"(i));
            __asm__("EXTRACT_Y\t%1,%0":"=r"(temp1_y):"r"(temp2_xy));
            __asm__("Z_ADD\t%1,%2,%0":"=r"(temp_z):"r"(temp_z),"r"(i));
        }
        else
        {
            __asm__("XSUB_YADD\t%1,%2,%0":"=r"(temp2_xy):"r"(temp1_xy),"r"(i));
            __asm__("EXTRACT_Y\t%1,%0":"=r"(temp1_y):"r"(temp2_xy));            
            __asm__("Z_SUB\t%1,%2,%0":"=r"(temp_z):"r"(temp_z),"r"(i));
        }
        temp1_xy = temp2_xy;
    }
    *x_y = temp1_xy;
}

