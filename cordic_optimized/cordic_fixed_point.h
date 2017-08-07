static uint32_t z_table[8] = {
    1686584152,
    526061546,
    134022143,
    33489151,
    8323135,
    2031631,
    458755,
    65536
 };

void cordic_R_fixed_point(int *x, int *y, int *z);
void cordic_V_fixed_point(int *x, int *y, int *z);
