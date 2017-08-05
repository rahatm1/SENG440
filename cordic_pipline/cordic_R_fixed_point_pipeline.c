#include <stdio.h>
#include "../cordic_fixed_point.h"

void cordic_R_fixed_point(int *x, int *y, int *z)
{
    int x_temp_1, y_temp_1, z_temp_1, i;
    int x_temp_2, y_temp_2, z_temp_2, temp_z;
     
    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp_1 = *z;
    
    
    int z_val = z_table[0];
    for(i=0; i < 15; i++) {
        temp_z = z_val;
        z_val = z_table[i+1]; 
        
        if(z_temp_1 < 0){
            x_temp_2 = x_temp_1 + (y_temp_1 >> i);
            y_temp_2 = y_temp_1 - (x_temp_1 >> i);
            z_temp_2 = z_temp_1 + temp_z;
        } else {
            x_temp_2 = x_temp_1 - (y_temp_1 >> i);
            y_temp_2 = y_temp_1 + (x_temp_1 >> i);
            z_temp_2 = z_temp_1 - temp_z;
        }
        x_temp_1 = x_temp_2; y_temp_1 = y_temp_2; z_temp_1 = z_temp_2;
    }

    *x = x_temp_1;
    *y = y_temp_1;
    *z = z_temp_1;
}