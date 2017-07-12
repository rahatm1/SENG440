static int z_table[15] = {
    25735,
    15192,
    8027,
    4074,
    2045,
    1023,
    511,
    255,
    127,
    63,
    31,
    15,
    7,
    3,
    1
 };

void cordic_R_fixed_point(int *x, int *y, int *z);
void cordic_V_fixed_point(int *x, int *y, int *z);
