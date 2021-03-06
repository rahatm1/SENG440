BASIC = cordic_basic_unoptimized
BASIC_OUT = basic_unoptimized
BASIC_R = $(BASIC)/cordic_R_fixed_point.c
BASIC_V = $(BASIC)/cordic_V_fixed_point.c

CONDITIONAL = cordic_conditional
CONDITIONAL_OUT = conditional
CONDITIONAL_R = $(CONDITIONAL)/cordic_R_fixed_point_conditional.c
CONDITIONAL_V = $(CONDITIONAL)/cordic_V_fixed_point_conditional.c

SOFTWARE = software
OPTIMIZED_SOFTWARE = cordic_optimized
OPTIMIZED_SOFTWARE_OUT = software_optimized
OPTIMIZED_SOFTWARE_R = $(OPTIMIZED_SOFTWARE)/cordic_R_fixed_point_software_optimized.c
OPTIMIZED_SOFTWARE_V = $(OPTIMIZED_SOFTWARE)/cordic_V_fixed_point_software_optimized.c

PACKED = packed
PACKED_ANGLES = cordic_packed_angles
PACKED_ANGLES_OUT = packed_angles
PACKED_ANGLES_R = $(PACKED_ANGLES)/cordic_R_fixed_point_packed_angles.c
PACKED_ANGLES_V = $(PACKED_ANGLES)/cordic_V_fixed_point_packed_angles.c

PIPELINE = cordic_pipeline
PIPELINE_OUT = pipepline
PIPELINE_R = $(PIPELINE)/cordic_R_fixed_point_pipeline.c
PIPELINE_V = $(PIPELINE)/cordic_V_fixed_point_pipeline.c

SIMD = cordic_simd
SIMD_OUT = simd
SIMD_R = $(SIMD)/cordic_R_fixed_point_simd.c
SIMD_V = $(SIMD)/cordic_V_fixed_point_simd.c

UNROLLED = cordic_unrolled
UNROLLED_OUT = unrolled
UNROLLED_R = $(UNROLLED)/cordic_R_fixed_point_loop_unrolling.c
UNROLLED_V = $(UNROLLED)/cordic_V_fixed_point_loop_unrolling.c

OPTIMIZED_ASSEMBLY = cordic_optimized_assembly
OPTIMIZED_ASSEMBLY_O1 = optimized_assembly_o1
OPTIMIZED_ASSEMBLY_O1_R = $(OPTIMIZED_ASSEMBLY)/assembly_O1/cordic_R_fixed_point.s
OPTIMIZED_ASSEMBLY_O1_V = $(OPTIMIZED_ASSEMBLY)/assembly_O1/cordic_V_fixed_point.s

OPTIMIZED_ASSEMBLY_O2 = optimized_assembly_o2
OPTIMIZED_ASSEMBLY_O2_R = $(OPTIMIZED_ASSEMBLY)/assembly_O2/cordic_R_fixed_point.s
OPTIMIZED_ASSEMBLY_O2_V = $(OPTIMIZED_ASSEMBLY)/assembly_O2/cordic_V_fixed_point.s

OPTIMIZED_ASSEMBLY_O3 = optimized_assembly_o3
OPTIMIZED_ASSEMBLY_O3_R = $(OPTIMIZED_ASSEMBLY)/assembly_O3/cordic_R_fixed_point.s
OPTIMIZED_ASSEMBLY_O3_V = $(OPTIMIZED_ASSEMBLY)/assembly_O3/cordic_V_fixed_point.s

FLAGS = -lm 
FLAGS_SIMD = -mfpu=neon -mfloat-abi=softfp
TESTBENCH = testbench.c
CC = arm-linux-gcc -static -o

all: clean $(BASIC)  $(CONDITIONAL) $(SOFTWARE) $(PACKED) $(PIPELINE) $(SIMD) $(UNROLLED) $(OPTIMIZED_ASSEMBLY_O1) $(OPTIMIZED_ASSEMBLY_O2) $(OPTIMIZED_ASSEMBLY_O3)


$(BASIC):	$(TESTBENCH) $(BASIC_R) $(BASIC_V)	
	$(CC) $(BASIC_OUT) $(TESTBENCH) $(BASIC_R) $(BASIC_V) $(FLAGS)

$(CONDITIONAL):	$(TESTBENCH) $(CONDITIONAL_R) $(CONDITIONAL_V)
	$(CC) $(CONDITIONAL_OUT) $(TESTBENCH) $(CONDITIONAL_R) $(CONDITIONAL_V) $(FLAGS)

$(SOFTWARE):	$(TESTBENCH) $(OPTIMIZED_SOFTWARE_R) $(OPTIMIZED_SOFTWARE_V)
	$(CC) $(OPTIMIZED_SOFTWARE_OUT) $(TESTBENCH) $(OPTIMIZED_SOFTWARE_R) $(OPTIMIZED_SOFTWARE_V) $(FLAGS)

$(PACKED):	$(TESTBENCH) $(PACKED_ANGLES_R) $(PACKED_ANGLES_V)
	$(CC) $(PACKED_ANGLES_OUT) $(TESTBENCH) $(PACKED_ANGLES_R) $(PACKED_ANGLES_V) $(FLAGS)

$(PIPELINE):	$(TESTBENCH) $(PIPELINE_R) $(PIPELINE_V)
	$(CC) $(PIPELINE_OUT) $(TESTBENCH) $(PIPELINE_R) $(PIPELINE_V) $(FLAGS)

$(SIMD):	$(TESTBENCH) $(SIMD_R) $(SIMD_V)
	$(CC) $(SIMD_OUT) $(TESTBENCH) $(SIMD_R) $(SIMD_V) $(FLAGS) $(FLAGS_SIMD)

$(UNROLLED):	$(TESTBENCH) $(UNROLLED_R) $(UNROLLED_V)
	$(CC) $(UNROLLED_OUT) $(TESTBENCH) $(UNROLLED_R) $(UNROLLED_V) $(FLAGS)

$(OPTIMIZED_ASSEMBLY_O1):	$(TESTBENCH) $(OPTIMIZED_ASSEMBLY_O1_R) $(OPTIMIZED_ASSEMBLY_O1_V)
	$(CC) $(OPTIMIZED_ASSEMBLY_O1) $(TESTBENCH) $(OPTIMIZED_ASSEMBLY_O1_R) $(OPTIMIZED_ASSEMBLY_O1_V) $(FLAGS)

$(OPTIMIZED_ASSEMBLY_O2):	$(TESTBENCH) $(OPTIMIZED_ASSEMBLY_O2_R) $(OPTIMIZED_ASSEMBLY_O2_V)
	$(CC) $(OPTIMIZED_ASSEMBLY_O2) $(TESTBENCH) $(OPTIMIZED_ASSEMBLY_O2_R) $(OPTIMIZED_ASSEMBLY_O2_V) $(FLAGS)

$(OPTIMIZED_ASSEMBLY_O3):	$(TESTBENCH) $(OPTIMIZED_ASSEMBLY_O3_R) $(OPTIMIZED_ASSEMBLY_O3_V)
	$(CC) $(OPTIMIZED_ASSEMBLY_O3) $(TESTBENCH) $(OPTIMIZED_ASSEMBLY_O3_R) $(OPTIMIZED_ASSEMBLY_O3_V) $(FLAGS)



clean:
	-rm -f $(BASIC_OUT)
	-rm -f $(CONDITIONAL_OUT)
	-rm -f $(OPTIMIZED_SOFTWARE_OUT)
	-rm -f $(PACKED_ANGLES_OUT)
	-rm -f $(PIPELINE_OUT)
	-rm -f $(SIMD_OUT)
	-rm -f $(UNROLLED_OUT)
	-rm -f $(OPTIMIZED_ASSEMBLY_O1)
	-rm -f $(OPTIMIZED_ASSEMBLY_O2)
	-rm -f $(OPTIMIZED_ASSEMBLY_O3)