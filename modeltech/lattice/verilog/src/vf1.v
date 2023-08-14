// adding AS-S0 delay arc -- robert
`timescale 1ns / 1ps // TIMESCALE FOR THE LIBRARY

`define in1_LUT_min 1.20
`define in1_LUT_max 1.30
`define in1_LUT_typ 1.25

`define in2_LUT_min 1.20
`define in2_LUT_max 1.30
`define in2_LUT_typ 1.25

`define in3_LUT_min 1.20
`define in3_LUT_max 1.30
`define in3_LUT_typ 1.25

`define in4_LUT_min 1.70
`define in4_LUT_max 1.90
`define in4_LUT_typ 1.80

`define CLB_REG_CLK_out_min 1.39
`define CLB_REG_CLK_out_max 1.48
`define CLB_REG_CLK_out_typ 1.44

`define CLB_LAT_D_out_min 1.39
`define CLB_LAT_D_out_max 1.48
`define CLB_LAT_D_out_typ 1.44

`define CLB_REG_S_out_min 1.39
`define CLB_REG_S_out_max 1.48
`define CLB_REG_S_out_typ 1.44

`define CLB_REG_R_out_min 1.39
`define CLB_REG_R_out_max 1.48
`define CLB_REG_R_out_typ 1.44

`define CLB_REG_SETUP_min 2.20
`define CLB_REG_SETUP_max 2.20
`define CLB_REG_SETUP_typ 2.20

`define CLB_REG_HOLD_min 2.20
`define CLB_REG_HOLD_max 2.20
`define CLB_REG_HOLD_typ 2.20

`define CLB_REG_RECOVERY_min 2.20
`define CLB_REG_RECOVERY_max 2.20
`define CLB_REG_RECOVERY_typ 2.20

`define CLB_REG_RHOLD_min 2.20
`define CLB_REG_RHOLD_max 2.20
`define CLB_REG_RHOLD_typ 2.20

`define CLB_REG_WIDTH_min 4.40
`define CLB_REG_WIDTH_max 4.40
`define CLB_REG_WIDTH_typ 4.40

`define CLB_REG_PERIOD_min 8.80
`define CLB_REG_PERIOD_max 8.80
`define CLB_REG_PERIOD_typ 8.80

`define IOB_INPUT_REG_CLK_out_min 1.23
`define IOB_INPUT_REG_CLK_out_max 1.23
`define IOB_INPUT_REG_CLK_out_typ 1.23
 
`define IOB_INPUT_REG_R_out_min 1.23
`define IOB_INPUT_REG_R_out_max 1.23
`define IOB_INPUT_REG_R_out_typ 1.23
 
`define IOB_INPUT_REG_S_out_min 1.23
`define IOB_INPUT_REG_S_out_max 1.23
`define IOB_INPUT_REG_S_out_typ 1.23
 
`define IOB_INPUT_LAT_D_out_min 1.23
`define IOB_INPUT_LAT_D_out_max 1.23
`define IOB_INPUT_LAT_D_out_typ 1.23

`define IOB_INPUT_LAT_R_out_min 1.23
`define IOB_INPUT_LAT_R_out_max 1.23
`define IOB_INPUT_LAT_R_out_typ 1.23

`define IOB_INPUT_LAT_S_out_min 1.23
`define IOB_INPUT_LAT_S_out_max 1.23
`define IOB_INPUT_LAT_S_out_typ 1.23

`define IOB_INPUT_REG_SETUP_min 0.33
`define IOB_INPUT_REG_SETUP_max 0.33
`define IOB_INPUT_REG_SETUP_typ 0.33
 
`define IOB_INPUT_REG_HOLD_min 0.53
`define IOB_INPUT_REG_HOLD_max 0.53
`define IOB_INPUT_REG_HOLD_typ 0.53
 
`define IOB_INPUT_REG_RECOVERY_min 0.33
`define IOB_INPUT_REG_RECOVERY_max 0.33
`define IOB_INPUT_REG_RECOVERY_typ 0.33
 
`define IOB_INPUT_REG_RHOLD_min 0.53
`define IOB_INPUT_REG_RHOLD_max 0.53
`define IOB_INPUT_REG_RHOLD_typ 0.53
 
`define IOB_INPUT_REG_WIDTH_min 0.66
`define IOB_INPUT_REG_WIDTH_max 0.66
`define IOB_INPUT_REG_WIDTH_typ 0.66
 
`define IOB_INPUT_REG_PERIOD_min 1.32
`define IOB_INPUT_REG_PERIOD_max 1.32
`define IOB_INPUT_REG_PERIOD_typ 1.32

`define IOB_OUTPUT_REG_CLK_out_min 2.10
`define IOB_OUTPUT_REG_CLK_out_max 2.10
`define IOB_OUTPUT_REG_CLK_out_typ 2.10
 
`define IOB_OUTPUT_REG_R_out_min 2.10
`define IOB_OUTPUT_REG_R_out_max 2.10
`define IOB_OUTPUT_REG_R_out_typ 2.10
 
`define IOB_OUTPUT_REG_S_out_min 2.10
`define IOB_OUTPUT_REG_S_out_max 2.10
`define IOB_OUTPUT_REG_S_out_typ 2.10
 
`define IOB_OUTPUT_LAT_D_out_min 2.10
`define IOB_OUTPUT_LAT_D_out_max 2.10
`define IOB_OUTPUT_LAT_D_out_typ 2.10

`define IOB_OUTPUT_REG_SETUP_min 0.36
`define IOB_OUTPUT_REG_SETUP_max 0.36
`define IOB_OUTPUT_REG_SETUP_typ 0.36
 
`define IOB_OUTPUT_REG_HOLD_min 0.56
`define IOB_OUTPUT_REG_HOLD_max 0.56
`define IOB_OUTPUT_REG_HOLD_typ 0.56
 
`define IOB_OUTPUT_REG_WIDTH_min 0.72
`define IOB_OUTPUT_REG_WIDTH_max 0.72
`define IOB_OUTPUT_REG_WIDTH_typ 0.72
 
`define IOB_OUTPUT_REG_PERIOD_min 1.44  
`define IOB_OUTPUT_REG_PERIOD_max 1.44
`define IOB_OUTPUT_REG_PERIOD_typ 1.44

`define IN_BUF_min 0.33
`define IN_BUF_max 0.94
`define IN_BUF_typ 0.64

`define IO_delay_min 0.40
`define IO_delay_max 0.40
`define IO_delay_typ 0.40

`define OUT_BUF_min 1.70
`define OUT_BUF_max 1.70
`define OUT_BUF_typ 1.70

`define IN_PAD_min 1.50
`define IN_PAD_max 1.50
`define IN_PAD_typ 1.50

`define OUT_PAD_min 2.20
`define OUT_PAD_max 2.20
`define OUT_PAD_typ 2.20

`define CLB_ADD_CIN_COUT_min 1.00
`define CLB_ADD_CIN_COUT_typ 1.00
`define CLB_ADD_CIN_COUT_max 1.00


`celldefine
module AND10 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND11 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND12 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
(I11 => O) =  `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max, `in4_LUT_min+`in3_LUT_min:`in4_LUT_typ+`in3_LUT_typ:`in4_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND13 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I11 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I12 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND14 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I11 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I12 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I13 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND15 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I11 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I12 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I13 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I14 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND16 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I11 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I12 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I13 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I14 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
(I15 => O) =  `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max, `in4_LUT_min+`in4_LUT_min:`in4_LUT_typ+`in4_LUT_typ:`in4_LUT_max+`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND17 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I11 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I12 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I13 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I14 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I15 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I16 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND18 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I11 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I12 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I13 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I14 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I15 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I16 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I17 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND19 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17,I18); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17,I18; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I11 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I12 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I13 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I14 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I15 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I16 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I17 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I18 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(I1 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND20 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17,I18,I19); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,I17,I18,I19; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19); 
 
specify 
 
(I0 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I6 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I7 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I8 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I9 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I10 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I11 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I12 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I13 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I14 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I15 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I16 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I17 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I18 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
(I19 => O) =  `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max, `in4_LUT_min+`in3_LUT_min+`in2_LUT_min:`in4_LUT_typ+`in3_LUT_typ+`in2_LUT_typ:`in4_LUT_max+`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2); 
 
specify 
 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3); 
 
specify 
 
(I0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND7 (O,I0,I1,I2,I3,I4,I5,I6); 
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND8 (O,I0,I1,I2,I3,I4,I5,I6,I7); 
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I7 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AND9 (O,I0,I1,I2,I3,I4,I5,I6,I7,I8); 
input I0,I1,I2,I3,I4,I5,I6,I7,I8; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7, I8); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I7 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I8 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AO21 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, O1, I2); 
and INS2 (O1, I0, I1); 
 
specify 
 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AO221 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, O1, O2, I4); 
and INS2 (O1, I0, I1); 
and INS3 (O2, I2, I3); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AO321 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, O1, O2, I5); 
and INS2 (O1, I0, I1, I2); 
and INS3 (O2, I3, I4); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module AS_LSB (S0,COUT,A0,B0,CIN,AS); 
input A0,B0,CIN,AS; 
output S0,COUT; 
supply0 GND; 
supply1 VCC; 
xor INS1(S0,A0,B0,CIN); 
xnor INS2(o1,B0,AS); 
and INS3(d1,A0,o1); 
xnor INS4(o2,CIN,AS); 
and INS5(d2,A0,o2); 
and INS8(d3,o1,o2); 
or INS10(COUT,d1,d2,d3); 
 
specify 
 
(A0 => S0) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(B0 => S0) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(CIN => S0) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(AS => S0) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(A0 => COUT) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(B0 => COUT) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(CIN => COUT) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(AS => COUT) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
endmodule 
 
`endcelldefine 
 
 
 
`celldefine 
 
module BIPAD (BIPAD); 
inout BIPAD; 
 
supply0 GND; 
supply1 VCC; 
 
specify 
 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module BI_DIR (O,I0,IO,OE); 
input I0,OE; 
inout IO; 
output O; 
 
supply0 GND; 
supply1 VCC; 
 
buf INS1 (O, IO); 
bufif1 INS2 (IO, I0, OE); 
 
specify 
 
(I0 => IO) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(OE => IO) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(IO => O) =  `IO_delay_min:`IO_delay_typ:`IO_delay_max, `IO_delay_min:`IO_delay_typ:`IO_delay_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module BUFF (O,I0); 
input I0; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, I0); 
 
specify 
 
(I0 => O) =  `in1_LUT_min:`in1_LUT_typ:`in1_LUT_max, `in1_LUT_min:`in1_LUT_typ:`in1_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module BUFTH (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif1 INS1 (O, I0, OE); 
 
specify 
 
(I0 => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(OE => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module BUFTI (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif1 INS1 (O, I0, OE); 
 
specify 
 
(I0 => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(OE => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module BUFTL (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif0 INS1 (O, I0, OE); 
 
specify 
 
(I0 => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(OE => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module CCU_ABS (S0,COUT,D,PN,CIN); 
input D,PN,CIN; 
output S0,COUT; 
supply0 GND; 
supply1 VCC; 
 
not INS1(pn,PN); 
and INS2(o1,pn,D); 
not INS3(d,D); 
xor INS4(cin,d,CIN); 
and INS5(o2,pn,cin); 
or INS6(S0,o1,o2); 
and INS7(o3,d,CIN); 
and INS8(COUT,PN,o3); 
 
specify 
 
(D => S0) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(PN => S0) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(CIN => S0) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(D => COUT) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(PN => COUT) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(CIN => COUT) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
endmodule 
 
`endcelldefine 
 
 
 
`celldefine 
 
module CCU_AGB (COUT,A0,B0,CIN); 
input A0,B0,CIN; 
output COUT; 
supply0 GND; 
supply1 VCC; 
 
not INS1(b,B0); 
and INS2(a,A0,b); 
xnor INS3(a1,A0,B0); 
and INS4(a2,a1,CIN); 
or INS5(COUT,a,a2); 
 
specify 
 
(A0 => COUT) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(B0 => COUT) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(CIN => COUT) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
endmodule 
 
`endcelldefine 
 
 
 
`celldefine 
 
module CCU_AS (S0,COUT,A0,B0,CIN,AS); 
input A0,B0,CIN,AS; 
output S0,COUT; 
 
supply0 GND; 
supply1 VCC; 
 
xor INS1 (S0, A0, CIN, out_1); 
xnor INS2 (out_1, AS, B0); 
or  INS3 (out_2, CIN, A0); 
and INS4 (out_3, out_1, out_2); 
and INS5 (out_4, CIN, A0); 
or  INS6 (COUT, out_4, out_3); 
 
specify 
 
(A0 => S0) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(B0 => S0) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(CIN => S0) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(AS => S0) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(A0 => COUT) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(B0 => COUT) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(AS => COUT) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(CIN => COUT) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
  
`celldefine 
module CCU_DCP(Q,COUT,D,LOAD,CLK,R,S,CIN); 
input D,LOAD,CLK,R,S,CIN; 
output Q,COUT; 
supply0 GND; 
supply1 VCC; 
reg notifier; 
reg Q_reg; 
not INS1 (load,LOAD); 
not INS12 (R1,R); 
not INS13 (S1,S); 
and INS2 (din0,LOAD,D); 
and INS3 (din1,load,I1); 
or INS4 (DIN,din0,din1); 
 
 
`ifdef xmodel 
VF1_DFF_X INS5 (Q_int,DIN,CLK,R1,S1,notifier); 
`else 
VF1_DFF INS6 (Q_int,DIN,CLK,R1,S1,notifier); 
`endif 
always @(Q_int) Q_reg=Q_int; 
buf INS7 (Q,Q_reg); 
 
xnor INS8 (I1,CIN,Q); 
 
or INS9 (O,Q,CIN); 
and INS10 (O1,load,O); 
or INS11 (COUT,LOAD,O1);  
 
specify 
 
(CIN =>COUT)  = (`CLB_ADD_CIN_COUT_min:`CLB_ADD_CIN_COUT_typ:`CLB_ADD_CIN_COUT_max,`CLB_ADD_CIN_COUT_min:`CLB_ADD_CIN_COUT_typ:`CLB_ADD_CIN_COUT_max); 
(R=>Q)= ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
(S=>Q)= ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
(CLK=>Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(LOAD=>Q) = ( `in3_LUT_min+`CLB_REG_CLK_out_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ:`in3_LUT_max+`CLB_REG_CLK_out_max, `in3_LUT_min+`CLB_REG_CLK_out_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ:`in3_LUT_max+`CLB_REG_CLK_out_max); 
(LOAD=>COUT) = ( `in3_LUT_min+`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`in3_LUT_max+`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max, `in3_LUT_min+`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`in3_LUT_max+`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max); 
(D=>Q) = ( `in3_LUT_min+`CLB_REG_CLK_out_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ:`in3_LUT_max+`CLB_REG_CLK_out_max, `in3_LUT_min+`CLB_REG_CLK_out_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ:`in3_LUT_max+`CLB_REG_CLK_out_max); 
(D=>COUT) = ( `in3_LUT_min+`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`in3_LUT_max+`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max, `in3_LUT_min+`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`in3_LUT_max+`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max); 
 
endspecify 
endmodule 
`endcelldefine 
 
  
  
`celldefine 
module CCU_UCP(Q,COUT,D,LOAD,CLK,R,S,CIN); 
input D,LOAD,CLK,R,S,CIN; 
output Q,COUT; 
supply0 GND; 
supply1 VCC; 
reg notifier; 
reg Q_reg; 
 
not INS1 (load,LOAD); 
not INS10 (R1,R); 
not INS11 (S1,S); 
and INS2 (din0,LOAD,D); 
and INS3 (din1,load,I1); 
or INS4 (DIN,din0,din1); 
 
 
`ifdef xmodel 
VF1_DFF_X INS5 (Q_int,DIN,CLK,R1,S1,notifier); 
`else 
VF1_DFF INS6 (Q_int,DIN,CLK,R1,S1,notifier); 
`endif 
always @(Q_int) Q_reg=Q_int; 
buf INS7 (Q,Q_reg); 
 
xor INS8 (I1,CIN,Q_reg); 
and INS9 (COUT,CIN,Q_reg,load);  
 
specify 
 
(CIN =>COUT)  = (`CLB_ADD_CIN_COUT_min:`CLB_ADD_CIN_COUT_typ:`CLB_ADD_CIN_COUT_max,`CLB_ADD_CIN_COUT_min:`CLB_ADD_CIN_COUT_typ:`CLB_ADD_CIN_COUT_max); 
(R=>Q)= ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
(S=>Q)= ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
(CLK=>Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(LOAD=>Q) = ( `in3_LUT_min+`CLB_REG_CLK_out_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ:`in3_LUT_max+`CLB_REG_CLK_out_max, `in3_LUT_min+`CLB_REG_CLK_out_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ:`in3_LUT_max+`CLB_REG_CLK_out_max); 
(LOAD=>COUT) = ( `in3_LUT_min+`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`in3_LUT_max+`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max, `in3_LUT_min+`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`in3_LUT_max+`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max); 
 
(D=>Q) = ( `in3_LUT_min+`CLB_REG_CLK_out_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ:`in3_LUT_max+`CLB_REG_CLK_out_max, `in3_LUT_min+`CLB_REG_CLK_out_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ:`in3_LUT_max+`CLB_REG_CLK_out_max); 
(D=>COUT) = ( `in3_LUT_min+`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`in3_LUT_max+`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max, `in3_LUT_min+`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`in3_LUT_typ+`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`in3_LUT_max+`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max); 
 
endspecify 
endmodule 
`endcelldefine 
 
  
`celldefine 
  
module CCU_UDC (Q,COUT,UD,CLK,R,S,CIN); 
input UD,CLK,R,S,CIN; 
output Q,COUT; 
reg notifier; 
wire Q_int; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS1 (ud,UD); 
not INS12 (R1,R); 
not INS13 (S1,S); 
xor INS2 (S0,A0,ud,CIN); 
and INS3 (c0,A0,ud); 
and INS4 (c1,A0,CIN); 
and INS5 (c2,ud,CIN); 
or INS6 (COUT,c0,c1,c2); 
 
`ifdef xmodel 
VF1_DFF_X INS7 (Q_int,S0,CLK,R1,S1,notifier); 
`else 
VF1_DFF INS8 (Q_int,S0,CLK,R1,S1,notifier); 
`endif 
 
always @(Q_int) Q_reg=Q_int; 
 
buf INS9 (A0,Q_reg); 
buf INS10 (Q,Q_reg); 
and INS11 (R_S,R1,S1); 
 
specify 
  
(CIN => COUT) = (`CLB_ADD_CIN_COUT_min:`CLB_ADD_CIN_COUT_typ:`CLB_ADD_CIN_COUT_max,`CLB_ADD_CIN_COUT_min:`CLB_ADD_CIN_COUT_typ:`CLB_ADD_CIN_COUT_max); 
(UD => COUT) = (`CLB_ADD_CIN_COUT_min:`CLB_ADD_CIN_COUT_typ:`CLB_ADD_CIN_COUT_max,`CLB_ADD_CIN_COUT_min:`CLB_ADD_CIN_COUT_typ:`CLB_ADD_CIN_COUT_max); 
(UD => Q) = (`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max,`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max);  
(CIN => Q) = (`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max,`CLB_REG_CLK_out_min+`CLB_ADD_CIN_COUT_min:`CLB_REG_CLK_out_typ+`CLB_ADD_CIN_COUT_typ:`CLB_REG_CLK_out_max+`CLB_ADD_CIN_COUT_max);  
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
//$setup(S0  &&& (R_S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
//$hold(posedge CLK &&& (R_S), S0 , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R_S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R_S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R &&& (S), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier 
); 
$hold(posedge CLK &&& (S), posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(posedge S &&& (R), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier 
); 
$hold(posedge CLK &&& (R), posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
  
endspecify 
endmodule 
`endcelldefine 
  
  
`celldefine 
  
module CLKI(O,PAD); 
input PAD; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, PAD); 
  
specify 
  
(PAD => O) =  `in1_LUT_min:`in1_LUT_typ:`in1_LUT_max, `in1_LUT_min:`in1_LUT_typ:`in1_LUT_max; 
  
endspecify 
  
  
endmodule 
`endcelldefine 
 
 
 
`celldefine  
 
 
module COM_UDCP (Q,COUT,A,D,LOAD,UD,CNTEN,CIN); 
input A,D,LOAD,UD,CNTEN,CIN; 
output Q,COUT; 
reg notifier; 
 
 
supply0 GND; 
supply1 VCC; 
and INS1 (o1,LOAD,D); 
xor INS2 (o2,A,UD_not,CIN); 
not INS3 (UD_not,UD); 
not INS4 (LOAD_not,LOAD); 
and INS5 (o3,o2,CNTEN); 
not INS6 (CNTEN_not,CNTEN); 
and INS7 (o4,CNTEN_not,A); 
or INS8 (o5,o3,o4); 
and INS9 (o6,LOAD_not,o5); 
or INS10 (Q,o1,o6); 
 
and INS11 (i1,A,UD_not); 
and INS12 (i2,A,CIN); 
and INS13 (i3,CIN,UD_not); 
or INS14 (i4,i1,i2,i3); 
and INS15 (COUT,LOAD_not,CNTEN,i4); 
 
specify 
 
(LOAD => Q) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(D => Q) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(UD => Q) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(CIN => Q) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(CNTEN => Q) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(A => Q) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
  
(LOAD => COUT) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(UD => COUT) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(CIN => COUT) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(CNTEN => COUT) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(A => COUT) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
 
endspecify 
  
  
endmodule 
`endcelldefine 
 
 
 
 
`celldefine 
 
module DEMUX2 (O0,O1,EN,S0); 
input EN,S0; 
output O0,O1; 
supply0 GND; 
supply1 VCC; 
not INS1 (SBAR, S0); 
and INS2 (O0, EN, SBAR); 
and INS3 (O1, EN, S0); 
 
specify 
 
(EN => O0) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(EN => O1) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(S0 => O0) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(S0 => O1) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module DEMUX4 (O0,O1,O2,O3,EN,S0,S1); 
input EN,S0,S1; 
output O0,O1,O2,O3; 
supply0 GND; 
supply1 VCC; 
not INS1 (S0BAR, S0); 
not INS2 (S1BAR, S1); 
and INS3 (O0, EN, S0BAR, S1BAR); 
and INS4 (O1, EN, S0, S1BAR); 
and INS5 (O2, EN, S0BAR, S1); 
and INS6 (O3, EN, S0, S1); 
 
specify 
 
(EN => O0) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(EN => O1) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(EN => O2) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(EN => O3) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(S0 => O0) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(S0 => O1) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(S0 => O2) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(S0 => O3) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(S1 => O0) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(S1 => O1) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(S1 => O2) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(S1 => O3) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFF (Q,D,CLK); 
input D,CLK; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
VF1_DFF_X INS1 (Q_int, D, CLK, VCC, VCC, notifier); 
`else 
VF1_DFF INS4 (Q_int, D, CLK, VCC, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
$setup(D , posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFC (Q,D,CLK,CE); 
input D,CLK,CE; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_CE_X INS1 (Q_int, D, CLK, VCC, VCC, CE, notifier); 
`else 
VF1_DFF_CE INS4 (Q_int, D, CLK, VCC, VCC, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
$setup(D , posedge CLK &&& (CE == 1), `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (CE == 1), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(posedge CE , posedge CLK , `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK , posedge CE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (CE == 1), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (CE == 1), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCR (Q,D,CLK,CE,R); 
input D,CLK,CE,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_CE_X INS1 (Q_int, D, CLK, R, VCC, CE, notifier); 
`else 
VF1_DFF_CE INS5 (Q_int, D, CLK, R, VCC, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (CE_R, CE, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D  &&& (CE_R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (CE_R), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(posedge CE , posedge CLK , `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK , posedge CE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (CE_R), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (CE_R), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R , posedge CLK &&& (CE == 1), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE == 1), posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCRH (Q,D,CLK,CE,R); 
input D,CLK,CE,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_CE_X INS1 (Q_int, D, CLK, R1, VCC, CE, notifier); 
`else 
VF1_DFF_CE INS7 (Q_int, D, CLK, R1, VCC, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
not INS5 (R2, R); 
and INS6 (CE_NR, CE, R2); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D , posedge CLK &&& (CE_NR), `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (CE_NR), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(posedge CE , posedge CLK , `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK , posedge CE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (CE_NR), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (CE_NR), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R , posedge CLK &&& (CE == 1), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE == 1), negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCRS (Q,D,CLK,CE,R,S); 
input D,CLK,CE,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
VF1_DFF_CE_X INS1 (Q_int, D, CLK, R, S, CE, notifier); 
`else 
VF1_DFF_CE INS7 (Q_int, D, CLK, R, S, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (CE_R_S, CE, R, S); 
and INS5 (CE_R, CE, R); 
and INS6 (CE_S, CE, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D , posedge CLK &&& (CE_R_S), `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (CE_R_S), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (CE_R_S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (CE_R_S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R , posedge CLK &&& (CE_S), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE_S), posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(posedge S , posedge CLK &&& (CE_R), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE_R), posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
$setup(posedge CE , posedge CLK , `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK , posedge CE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCRSH (Q,D,CLK,CE,R,S); 
input D,CLK,CE,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
VF1_DFF_CE_X INS1 (Q_int, D, CLK, R1,S1, CE, notifier); 
`else 
VF1_DFF_CE INS11 (Q_int, D, CLK, R1, S1, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
not INS5 (R1, R); 
and INS8 (CE_NR_NS, CE, R1, S1); 
and INS9 (CE_NR, CE, R1); 
and INS10 (CE_NS, CE, S1); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D , posedge CLK &&& (CE_NR_NS), `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (CE_NR_NS), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (CE_NR_NS), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (CE_NR_NS), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R , posedge CLK &&& (CE_NS), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE_NS), negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(negedge S , posedge CLK &&& (CE_NR), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE_NR), negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(posedge CE , posedge CLK , `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK , posedge CE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCRSS (Q,D,CLK,CE,R,S); 
input D,CLK,CE,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
or INS9 (D_in, NOT_S, D); 
 
`ifdef xmodel 
VF1_DFF_CE_X INS1 (Q_int, D_in, CLK, R, 1, CE, notifier); 
`else 
VF1_DFF_CE INS7 (Q_int, D_in, CLK, R, 1, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (CE_R_S, CE, R, S); 
and INS5 (CE_R, CE, R); 
and INS6 (CE_S, CE, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D , posedge CLK &&& (CE_R_S), `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (CE_R_S), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (CE_R_S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (CE_R_S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R , posedge CLK &&& (CE_S), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE_S), posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(posedge S , posedge CLK &&& (CE_R), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE_R), posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(posedge CE , posedge CLK , `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK , posedge CE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCRSSH (Q,D,CLK,CE,R,S); 
input D,CLK,CE,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
or INS20 (D_in, S, D); 
 
`ifdef xmodel 
VF1_DFF_CE_X INS1 (Q_int, D_in, CLK, R1, 1, CE, notifier); 
`else 
VF1_DFF_CE INS11 (Q_int, D_in, CLK, R1, 1, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
not INS5 (R1, R); 
not INS6 (S2, S); 
not INS7 (R2, R); 
and INS8 (CE_NR_NS, CE, R2, S2); 
and INS9 (CE_NR, CE, R2); 
and INS10 (CE_NS, CE, S2); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D , posedge CLK &&& (CE_NR_NS), `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (CE_NR_NS), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (CE_NR_NS), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (CE_NR_NS), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R , posedge CLK &&& (CE_NS), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE_NS), negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(negedge S , posedge CLK &&& (CE_NR), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE_NR), negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(posedge CE , posedge CLK , `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK , posedge CE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCS (Q,D,CLK,CE,S); 
input D,CLK,CE,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_CE_X INS1 (Q_int, D, CLK, VCC, S, CE, notifier); 
`else 
VF1_DFF_CE INS5 (Q_int, D, CLK, VCC, S, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (CE_S, CE, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D , posedge CLK &&& (CE_S), `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (CE_S), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (CE_S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (CE_S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge S , posedge CLK &&& (CE == 1), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE == 1), posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(posedge CE , posedge CLK , `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK , posedge CE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFCSH (Q,D,CLK,CE,S); 
input D,CLK,CE,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_CE_X INS1 (Q_int, D, CLK, VCC, S1, CE, notifier); 
`else 
VF1_DFF_CE INS7 (Q_int, D, CLK, VCC, S1, CE, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
not INS5 (S2, S); 
and INS6 (CE_NS, CE, S2); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D , posedge CLK &&& (CE_NS), `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (CE_NS), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (CE_NS), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (CE_NS), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge S , posedge CLK &&& (CE == 1), `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (CE == 1), negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(posedge CE , posedge CLK , `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK ,posedge  CE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFR (Q,D,CLK,R); 
input D,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS1 (Q_int, D, CLK, R, VCC, notifier); 
`else 
VF1_DFF INS4 (Q_int, D, CLK, R, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 

$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D  &&& R, posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& R, D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& R, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFRH (Q,D,CLK,R); 
input D,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS1 (Q_int, D, CLK, R1, VCC, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, R1, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
not INS5 (R2, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge  R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D  &&& R2, posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& R2, D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& R2, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& R2, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFRS (Q,D,CLK,R,S); 
input D,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
VF1_DFF_X INS1 (Q_int, D, CLK, R, S, notifier); 
`else 
VF1_DFF INS5 (Q_int, D, CLK, R, S, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (R_S, R, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D  &&& (R_S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (R_S), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R_S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R_S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R &&& (S), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (S), posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(posedge S &&& (R), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (R), posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFRSH (Q,D,CLK,R,S); 
input D,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
VF1_DFF_X INS1 (Q_int, D, CLK, R1, S1, notifier); 
`else 
VF1_DFF INS7 (Q_int, D, CLK, R1, S1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
not INS5 (S1, S); 
and INS6 (NR_NS, R1, S1); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D  &&& (NR_NS), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (NR_NS), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (NR_NS), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (NR_NS), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R &&& (S1), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (S1), negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(negedge S &&& (R1), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (R1), negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFRSS (Q,D,CLK,R,S); 
input D,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
or INS9 (D_in, NOT_S, D); 
 
`ifdef xmodel 
VF1_DFF_X INS1 (Q_int, D_in, CLK, R, 1, notifier); 
`else 
VF1_DFF INS5 (Q_int, D_in, CLK, R, 1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (R_S, R, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D  &&& (R_S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (R_S), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R_S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R_S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R &&& (S), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (S), posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(posedge S &&& (R), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (R), posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFRSSH (Q,D,CLK,R,S); 
input D,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
or INS20 (D_in, S, D); 
 
`ifdef xmodel 
VF1_DFF_X INS1 (Q_int, D_in, CLK, R1, 1, notifier); 
`else 
VF1_DFF INS7 (Q_int, D_in, CLK, R1, 1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
not INS5 (S1, S); 
and INS6 (NR_NS, R1, S1); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D  &&& (NR_NS), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (NR_NS), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (NR_NS), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (NR_NS), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R &&& (S1), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (S1), negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(negedge S &&& (R1), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (R1), negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFS (Q,D,CLK,S); 
input D,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS7 (Q_int, D, CLK, VCC, S, notifier); 
`else 
VF1_DFF INS4 (Q_int, D, CLK, VCC, S, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D  &&& (S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (S), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge S, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DFFSH (Q,D,CLK,S); 
input D,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS1 (Q_int, D, CLK, VCC, S1, notifier); 
`else 
VF1_DFF INS5 (Q_int, D, CLK, VCC, S1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D  &&& (S1), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (S1), D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S1), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S1), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge S, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLAT (Q,D,LAT); 
input D,LAT; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_LATCH_X INS1 (Q_int, D, LAT, VCC, VCC, notifier); 
`else 
VF1_LATCH INS4 (Q_int, D, LAT, VCC, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(LAT => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(D => Q) = ( `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max, `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max); 
$setup(D , negedge LAT, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(negedge LAT, D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge LAT, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge LAT, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module DLATR (Q,D,LAT,R); 
input D,LAT,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_LATCH_X INS1 (Q_int, D, LAT, R, VCC, notifier); 
`else 
VF1_LATCH INS4 (Q_int, D, LAT, R, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(LAT => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(D => Q) = ( `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max, `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D &&& R, negedge LAT, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(negedge LAT &&& R, D , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge LAT &&& R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge LAT &&& R, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R, negedge LAT, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(negedge LAT, posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLATRH (Q,D,LAT,R); 
input D,LAT,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_LATCH_X INS1 (Q_int, D, LAT, R1, VCC, notifier); 
`else 
VF1_LATCH INS5 (Q_int, D, LAT, R1, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
 
specify 
 
(LAT => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(D => Q) = ( `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max, `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D &&& R1, negedge LAT, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(negedge LAT, D &&& R1, `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge LAT &&& R1, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge LAT &&& R1, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R, negedge LAT, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(negedge LAT, negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
  
 
`celldefine 
 
module DLATRS (Q,D,LAT,R,S); 
input D,LAT,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
or INS9 (D_in, NOT_S, D); 
 
`ifdef xmodel 
VF1_LATCH_X INS1 (Q_int, D, LAT, R, S, notifier); 
`else 
VF1_LATCH INS5 (Q_int, D, LAT, R, S, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS6 (R_S, R, S); 
specify 
 
(LAT => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(D => Q) = ( `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max, `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D &&& R_S, negedge LAT, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(negedge LAT, D &&& R_S, `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge LAT &&& R_S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge LAT &&& R_S, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R &&& (S == 1), negedge LAT, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$recovery(posedge S &&& (R == 1), negedge LAT, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(negedge LAT &&& (S == 1), posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$hold(negedge LAT &&& (R == 1), posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLATRSH (Q,D,LAT,R,S); 
input D,LAT,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
or INS20 (D_in, S, D); 
 
`ifdef xmodel 
VF1_LATCH_X INS1 (Q_int, D, LAT, R1, S1, notifier); 
`else 
VF1_LATCH INS7 (Q_int, D, LAT, R1, S1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
not INS5 (R1, R); 
and INS6 (NR_NS , R1, S1); 
specify 
 
(LAT => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(D => Q) = ( `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max, `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D &&& NR_NS, negedge LAT, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(negedge LAT, D &&& NR_NS, `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge LAT &&& NR_NS, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge LAT &&& NR_NS, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R &&& (S == 0), negedge LAT, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(negedge LAT, negedge R  &&& (S == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(negedge S &&& (R == 0), negedge LAT, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(negedge LAT, negedge S  &&& (R == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLATS (Q,D,LAT,S); 
input D,LAT,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_LATCH_X INS1 (Q_int, D, LAT, VCC, S, notifier); 
`else 
VF1_LATCH INS4 (Q_int, D, LAT, VCC, S, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(LAT => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(D => Q) = ( `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max, `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D &&& S, negedge LAT, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(negedge LAT, D &&& S, `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge LAT &&& S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge LAT &&& S, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge S, negedge LAT, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(negedge LAT, posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module DLATSH (Q,D,LAT,S); 
input D,LAT,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_LATCH_X INS1 (Q_int, D, LAT, VCC, S1, notifier); 
`else 
VF1_LATCH INS5 (Q_int, D, LAT, VCC, S1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
 
specify 
 
(LAT => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(D => Q) = ( `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max, `CLB_LAT_D_out_min:`CLB_LAT_D_out_typ:`CLB_LAT_D_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(D &&& S1, negedge LAT, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(negedge LAT, D &&& S1, `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge LAT &&& S1, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge LAT &&& S1, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge S, negedge LAT, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(negedge LAT, negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module ENOR (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(I1 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module EQ22 (O,A0,A1,B0,B1); 
input A0,A1,B0,B1; 
output O; 
supply0 GND; 
supply1 VCC; 
xnor INS1(o1,A0,B0); 
xnor INS2(o2,A1,B1); 
and  INS3(O,o1,o2); 
 
specify 
 
(A0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(A1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(B0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(B1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module GND (X); 
output X; 
 
supply0 GND; 
supply1 VCC; 
 
assign X = GND; 
 
specify 
 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
  
  
`celldefine 
  
module GSRBUF (O,SRI); 
input SRI; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, SRI); 
  
specify 
  
(SRI => O) =  `in1_LUT_min:`in1_LUT_typ:`in1_LUT_max, `in1_LUT_min:`in1_LUT_typ:`in1_LUT_max; 
  
endspecify 
  
  
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module IBUF (O,I0); 
input I0; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, I0); 
 
specify 
 
(I0 => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module INV (O,I0); 
input I0; 
output O; 
supply0 GND; 
supply1 VCC; 
not INS1 (O, I0); 
 
specify 
 
(I0 => O) =  `in1_LUT_min:`in1_LUT_typ:`in1_LUT_max, `in1_LUT_min:`in1_LUT_typ:`in1_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module INVTH (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif1 INS1 (O, O1, OE); 
not INS2 (O1,I0); 
 
specify 
 
(I0 => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(OE => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module INVTL (O,I0,OE); 
input I0,OE; 
output O; 
supply0 GND; 
supply1 VCC; 
bufif0 INS1 (O, O1, OE); 
not INS2 (O1, I0); 
 
specify 
 
(I0 => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(OE => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module IPAD (IPAD); 
input IPAD; 
 
supply0 GND; 
supply1 VCC; 
 
specify 
 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module JKFF (Q,J,K,CLK); 
input J,K,CLK; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J, K, VCC, VCC, notifier); 
`else 
VF1_JKFF INS4 (Q_int, CLK, J, K, VCC, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
$setup(J , posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, J , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(K , posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, K , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module JKFFR (Q,J,K,CLK,R); 
input J,K,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J, K, VCC, R, notifier); 
`else 
VF1_JKFF INS4 (Q_int, CLK, J, K, VCC, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(J  &&& (R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, J  &&& (R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(K  &&& (R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, K  &&& (R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module JKFFRH (Q,J,K,CLK,R); 
input J,K,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J, K, VCC, R1, notifier); 
`else 
VF1_JKFF INS5 (Q_int, CLK, J, K, VCC, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(J  &&& (R == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, J  &&& (R == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(K  &&& (R == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, K  &&& (R == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R == 0), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R == 0), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module JKFFRS (Q,J,K,CLK,S,R); 
input J,K,CLK,S,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J, K, S, R, notifier); 
`else 
VF1_JKFF INS5 (Q_int, CLK, J, K, S, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (S_R, S, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(J  &&& (S_R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, J  &&& (S_R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(K  &&& (S_R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, K  &&& (S_R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S_R), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S_R), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R &&& (S), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R  &&& (S), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(posedge S &&& (R), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S  &&& (R), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module JKFFRSH (Q,J,K,CLK,S,R); 
input J,K,CLK,S,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J, K, S1, R1, notifier); 
`else 
VF1_JKFF INS7 (Q_int, CLK, J, K, S1, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (NS_NR, S1, R1); 
not INS5 (S1, S); 
not INS6 (R1, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(J  &&& (NS_NR), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, J  &&& (NS_NR), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(K  &&& (NS_NR), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, K  &&& (NS_NR), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (NS_NR), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (NS_NR), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R &&& (S == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge R  &&& (S == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(negedge S &&& (R == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S  &&& (R == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module JKFFRSS (Q,J,K,CLK,S,R); 
input J,K,CLK,S,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
or INS9 (J_in, NOT_S, J); 
and INS10 (K_in, S, K); 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J_in, K_in, 1, R, notifier); 
`else 
VF1_JKFF INS5 (Q_int, CLK, J_in, K_in, 1, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (S_R, S, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(J  &&& (S_R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, J  &&& (S_R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(K  &&& (S_R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, K  &&& (S_R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S_R), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S_R), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R &&& (S), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R  &&& (S), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(posedge S &&& (R), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S  &&& (R), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module JKFFRSSH (Q,J,K,CLK,S,R); 
input J,K,CLK,S,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
or INS9 (J_in, S, J); 
and INS10 (K_in, NOT_S, K); 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J_in, K_in, 1, R1, notifier); 
`else 
VF1_JKFF INS7 (Q_int, CLK, J_in, K_in, 1, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (NS_NR, S1, R1); 
not INS5 (S1, S); 
not INS6 (R1, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(J  &&& (NS_NR), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, J  &&& (NS_NR), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(K  &&& (NS_NR), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, K  &&& (NS_NR), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (NS_NR), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (NS_NR), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R &&& (S == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge R  &&& (S == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(negedge S &&& (R == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S  &&& (R == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module JKFFS (Q,J,K,CLK,S); 
input J,K,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J, K, S, VCC, notifier); 
`else 
VF1_JKFF INS4 (Q_int, CLK, J, K, S, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(J  &&& (S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, J  &&& (S), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(K  &&& (S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, K  &&& (S), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge S, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module JKFFSH (Q,J,K,CLK,S); 
input J,K,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J, K, S1, VCC, notifier); 
`else 
VF1_JKFF INS5 (Q_int, CLK, J, K, S1, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(posedge S , `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(J  &&& (S == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, J  &&& (S == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(K  &&& (S == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, K  &&& (S == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S == 0), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S == 0), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge S, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module JTAG (TDO,TDI,TCLK,TMOD); 
input TDI,TCLK,TMOD; 
output TDO; 
supply0 GND; 
supply1 VCC; 
 
specify 
 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module LI (Q,D,LAT); 
input D,LAT; 
output Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_LATCH_X INS3 (Q_int, D, LAT, VCC, VCC, notifier); 
`else 
VF1_LATCH INS1 (Q_int, D, LAT, VCC, VCC, notifier); 
`endif 
 
buf INS2 (Q, Q_int); 
 
specify 
 
(LAT => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max, `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max; 
(D => Q) =  `IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max, `IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max; 
$setup(D , negedge LAT, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max , notifier); 
$hold(negedge LAT, D , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max , notifier); 
$width(posedge LAT, `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge LAT, `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max , notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module LIR (Q,D,LAT,R); 
input D,LAT,R; 
output Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_LATCH_X INS3 (Q_int, D, LAT, R1, VCC, notifier); 
`else 
VF1_LATCH INS1 (Q_int, D, LAT, R1, VCC, notifier); 
`endif 
 
buf INS2 (Q, Q_int); 
not INS4(R1,R); 
specify 
 
(LAT => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max, `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max; 
(D => Q) =  `IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max, `IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max; 
(R => Q) =  `IOB_INPUT_LAT_R_out_min:`IOB_INPUT_LAT_R_out_typ:`IOB_INPUT_LAT_R_out_max, `IOB_INPUT_LAT_R_out_min:`IOB_INPUT_LAT_R_out_typ:`IOB_INPUT_LAT_R_out_max; 
$setup(D &&& R1 , negedge LAT, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max , notifier); 
$hold(negedge LAT &&& R1 , D , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max , notifier); 
$width(posedge LAT &&& R1, `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge LAT &&& R1, `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max , notifier); 
$recovery(posedge R, negedge LAT, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(negedge LAT, posedge R , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module LIS (Q,D,LAT,S); 
input D,LAT,S; 
output Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_LATCH_X INS3 (Q_int, D, LAT, VCC, S1, notifier); 
`else 
VF1_LATCH INS1 (Q_int, D, LAT, VCC, S1, notifier); 
`endif 
 
buf INS2 (Q, Q_int); 
not INS5(S1,S); 
specify 
 
(LAT => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max, `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max; 
(D => Q) =  `IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max, `IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max; 
(S => Q) =  `IOB_INPUT_LAT_S_out_min:`IOB_INPUT_LAT_S_out_typ:`IOB_INPUT_LAT_S_out_max, `IOB_INPUT_LAT_S_out_min:`IOB_INPUT_LAT_S_out_typ:`IOB_INPUT_LAT_S_out_max; 
$setup(D &&& S1, negedge LAT, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max , notifier); 
$hold(negedge LAT &&& S1, D , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max , notifier); 
$width(posedge LAT &&& S1, `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge LAT &&& S1, `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max , notifier); 
$recovery(posedge S, negedge LAT, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(negedge LAT, posedge S , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module MAJOR3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (o1,I0,I1); 
and INS2 (o2,I1,I2); 
and INS3 (o3,I0,I2); 
or  INS4 (O,o1,o2,o3); 
 
specify 
 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module MUX2 (O,I0,I1,S0); 
input I0,I1,S0; 
output O; 
supply0 GND; 
supply1 VCC; 
 
not INS1 (S_inv, S0); 
and INS2 (out_1, I0, S_inv); 
and INS3 (out_2, I1, S0); 
or  INS4 (O, out_1, out_2); 
 
specify 
 
(S0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module MUX4 (O,I0,I1,I2,I3,S0,S1); 
input I0,I1,I2,I3,S0,S1; 
output O; 
supply0 GND; 
supply1 VCC; 
 
 
not INS1 (S0_inv, S0); 
not INS9 (S1_inv, S1); 
and INS3 (out_1, I0, S0_inv, S1_inv); 
and INS4 (out_2, I1, S0, S1_inv); 
and INS5 (out_3, I2, S0_inv, S1); 
and INS6 (out_4, I3, S0, S1); 
or  INS7 (O, out_1, out_2, out_3, out_4); 
 
specify 
 
(S0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(S1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(I1 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2); 
 
specify 
 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3); 
 
specify 
 
(I0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3, I4); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3, I4, I5); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN7 (O,I0,I1,I2,I3,I4,I5,I6); 
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3, I4, I5, I6); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NAN8 (O,I0,I1,I2,I3,I4,I5,I6,I7); 
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
supply0 GND; 
supply1 VCC; 
nand INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I7 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NEQ22 (O,A0,A1,B0,B1); 
input A0,A1,B0,B1; 
output O; 
supply0 GND; 
supply1 VCC; 
xor INS1(o1,A0,B0); 
xor INS2(o2,A1,B1); 
or  INS3(O,o1,o2); 
 
specify 
 
(A0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(A1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(B0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(B1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(I1 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2); 
 
specify 
 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3); 
 
specify 
 
(I0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3, I4); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3, I4, I5); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR7 (O,I0,I1,I2,I3,I4,I5,I6); 
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3, I4, I5, I6); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module NOR8 (O,I0,I1,I2,I3,I4,I5,I6,I7); 
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
supply0 GND; 
supply1 VCC; 
nor INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I7 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OA21 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, O1, I2); 
or INS2 (O1, I0, I1); 
 
specify 
 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OA221 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, O1, O2, I4); 
or INS2 (O1, I0, I1); 
or INS3 (O2, I2, I3); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OA321 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
and INS1 (O, O1, O2, I5); 
or INS2 (O1, I0, I1, I2); 
or INS3 (O2, I3, I4); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OBUF (O,I0); 
input I0; 
output O; 
supply0 GND; 
supply1 VCC; 
buf INS1 (O, I0); 
 
specify 
 
(I0 => O) =  `OUT_BUF_min:`OUT_BUF_typ:`OUT_BUF_max,`OUT_BUF_min:`OUT_BUF_typ:`OUT_BUF_max ; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OPAD (OPAD); 
output OPAD; 
 
supply0 GND; 
supply1 VCC; 
 
specify 
 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(I1 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2); 
 
specify 
 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3); 
 
specify 
 
(I0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3, I4); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3, I4, I5); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR7 (O,I0,I1,I2,I3,I4,I5,I6); 
input I0,I1,I2,I3,I4,I5,I6; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3, I4, I5, I6); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module OR8 (O,I0,I1,I2,I3,I4,I5,I6,I7); 
input I0,I1,I2,I3,I4,I5,I6,I7; 
output O; 
supply0 GND; 
supply1 VCC; 
or INS1 (O, I0, I1, I2, I3, I4, I5, I6, I7); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I6 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
(I7 => O) =  `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max, `in3_LUT_min+`in3_LUT_min:`in3_LUT_typ+`in3_LUT_typ:`in3_LUT_max+`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module PUC ; 
supply0 GND; 
supply1 VCC; 
 
specify 
 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module RBC;  
supply0 GND; 
supply1 VCC; 
 
specify 
 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module RI (Q,D,CLK); 
input D,CLK; 
output Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS3 (Q_int, D, CLK, VCC, VCC, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, VCC, VCC, notifier); 
`endif 
 
buf INS2 (Q, Q_int); 
 
specify 
 
(CLK => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max,`IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max ; 
$setup(D , posedge CLK, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max, notifier); 
$hold(posedge CLK, D , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max, notifier); 
$width(posedge CLK, `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK, `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module RIR (Q,D,CLK,R); 
input D,CLK,R; 
output Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS3 (Q_int, D, CLK, R1, VCC, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, R1, VCC, notifier); 
`endif 
 
buf INS2 (Q, Q_int); 
not INS5 (R1,R); 
specify 
 
(CLK => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max,`IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max ; 
(R => Q) = ( `IOB_INPUT_REG_R_out_min:`IOB_INPUT_REG_R_out_typ:`IOB_INPUT_REG_R_out_max, `IOB_INPUT_REG_R_out_min:`IOB_INPUT_REG_R_out_typ:`IOB_INPUT_REG_R_out_max); 
$setup(D &&& R1, posedge CLK, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& R1, D , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max, notifier); 
$width(posedge CLK &&& R1, `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& R1, `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max, notifier); 
$recovery(posedge R, posedge CLK, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module RIS (Q,D,CLK,S); 
input D,CLK,S; 
output Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS3 (Q_int, D, CLK, VCC, S1, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, VCC, S1, notifier); 
`endif 
 
buf INS2 (Q, Q_int); 
not INS4 (S1,S); 
 
specify 
 
(CLK => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max,`IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max ; 
(S => Q) = ( `IOB_INPUT_REG_S_out_min:`IOB_INPUT_REG_S_out_typ:`IOB_INPUT_REG_S_out_max, `IOB_INPUT_REG_S_out_min:`IOB_INPUT_REG_S_out_typ:`IOB_INPUT_REG_S_out_max); 
$setup(D &&& (S1), posedge CLK, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max, notifier); 
$hold(posedge CLK &&& (S1), D , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S1), `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S1), `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max, notifier); 
$recovery(posedge S, posedge CLK, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module ROLI (O,Q,IO,D,CLK,LAT,OE); 
input D,CLK,LAT,OE; 
inout IO; 
output O,Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS6 (Q_int, D, CLK, VCC, VCC, notifier); 
VF1_LATCH_X INS5 (Q, IO, LAT, VCC, VCC, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, VCC, VCC, notifier); 
VF1_LATCH INS4 (Q, IO, LAT, VCC, VCC, notifier); 
`endif 
 
bufif1 INS2 (IO, Q_int, OE); 
buf INS3 (O, IO); 
 
specify 
 
(OE => IO) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(IO => O) =  `IO_delay_min:`IO_delay_typ:`IO_delay_max, `IO_delay_min:`IO_delay_typ:`IO_delay_max; 
(CLK => O) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max; 
(CLK => IO) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max; 
(LAT => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max,`IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max; 
(IO => Q) =  `IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max,`IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max; 
$setup(D  &&& (OE), posedge CLK, `IOB_OUTPUT_REG_SETUP_min:`IOB_OUTPUT_REG_SETUP_typ:`IOB_OUTPUT_REG_SETUP_max , notifier); 
$hold(posedge CLK, D  &&& (OE), `IOB_OUTPUT_REG_HOLD_min:`IOB_OUTPUT_REG_HOLD_typ:`IOB_OUTPUT_REG_HOLD_max , notifier); 
$width(posedge CLK &&& (OE), `IOB_OUTPUT_REG_WIDTH_min:`IOB_OUTPUT_REG_WIDTH_typ:`IOB_OUTPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLK &&& (OE), `IOB_OUTPUT_REG_PERIOD_min:`IOB_OUTPUT_REG_PERIOD_typ:`IOB_OUTPUT_REG_PERIOD_max , notifier); 
$setup(IO  , negedge LAT, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max , notifier); 
$hold(negedge LAT, IO  , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max , notifier); 
$width(posedge LAT , `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge LAT , `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max , notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module ROLIR (O,Q,IO,D,CLK,LAT,OE,R); 
input D,CLK,LAT,OE,R; 
inout IO; 
output O,Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS6 (Q_int, D, CLK, R1, VCC, notifier); 
VF1_LATCH_X INS5 (Q, IO, LAT, VCC, VCC, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, R1, VCC, notifier); 
VF1_LATCH INS4 (Q, IO, LAT, VCC, VCC, notifier); 
`endif 
not INS7 (R1,R); 
and INS8 (OE_R1,OE,R1); 
bufif1 INS2 (IO, Q_int, OE); 
buf INS3 (O, IO); 
 
specify 
 
(OE => IO) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(IO => O) =  `IO_delay_min:`IO_delay_typ:`IO_delay_max, `IO_delay_min:`IO_delay_typ:`IO_delay_max; 
(CLK => O) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max; 
(CLK => IO) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max; 
(R => O) =  `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max+`IO_delay_max; 
(R => IO) =  `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max; 
(LAT => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max,`IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max; 
(IO => Q) =  `IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max,`IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max; 
$setup(D  &&& (OE_R1), posedge CLK, `IOB_OUTPUT_REG_SETUP_min:`IOB_OUTPUT_REG_SETUP_typ:`IOB_OUTPUT_REG_SETUP_max , notifier); 
$hold(posedge CLK, D  &&& (OE_R1), `IOB_OUTPUT_REG_HOLD_min:`IOB_OUTPUT_REG_HOLD_typ:`IOB_OUTPUT_REG_HOLD_max , notifier); 
$width(posedge CLK &&& (OE_R1), `IOB_OUTPUT_REG_WIDTH_min:`IOB_OUTPUT_REG_WIDTH_typ:`IOB_OUTPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLK &&& (OE_R1), `IOB_OUTPUT_REG_PERIOD_min:`IOB_OUTPUT_REG_PERIOD_typ:`IOB_OUTPUT_REG_PERIOD_max , notifier); 
$recovery(posedge R &&& (OE), posedge CLK, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (OE), posedge R , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
$setup(IO  , negedge LAT, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max , notifier); 
$hold(negedge LAT, IO  , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max , notifier); 
$width(posedge LAT , `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge LAT , `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max , notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module ROLIS (O,Q,IO,D,CLK,LAT,OE,S); 
input D,CLK,LAT,OE,S; 
inout IO; 
output O,Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS6 (Q_int, D, CLK, VCC, S1, notifier); 
VF1_LATCH_X INS5 (Q, IO, LAT, VCC, VCC, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, VCC, S1, notifier); 
VF1_LATCH INS4 (Q, IO, LAT, VCC, VCC, notifier); 
`endif 
not INS9 (S1,S); 
and INS8 (OE_S1,OE,S1); 
bufif1 INS2 (IO, Q_int, OE); 
buf INS3 (O, IO); 
 
specify 
 
(OE => IO) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(IO => O) =  `IO_delay_min:`IO_delay_typ:`IO_delay_max, `IO_delay_min:`IO_delay_typ:`IO_delay_max; 
(CLK => O) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max; 
(CLK => IO) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max; 
(S => O) =  `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max+`IO_delay_max; 
(S => IO) =  `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max; 
(LAT => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max,`IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max; 
(IO => Q) =  `IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max,`IOB_INPUT_LAT_D_out_min:`IOB_INPUT_LAT_D_out_typ:`IOB_INPUT_LAT_D_out_max; 
$setup(D  &&& (OE_S1), posedge CLK, `IOB_OUTPUT_REG_SETUP_min:`IOB_OUTPUT_REG_SETUP_typ:`IOB_OUTPUT_REG_SETUP_max , notifier); 
$hold(posedge CLK, D  &&& (OE_S1), `IOB_OUTPUT_REG_HOLD_min:`IOB_OUTPUT_REG_HOLD_typ:`IOB_OUTPUT_REG_HOLD_max , notifier); 
$width(posedge CLK &&& (OE_S1), `IOB_OUTPUT_REG_WIDTH_min:`IOB_OUTPUT_REG_WIDTH_typ:`IOB_OUTPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLK &&& (OE_S1), `IOB_OUTPUT_REG_PERIOD_min:`IOB_OUTPUT_REG_PERIOD_typ:`IOB_OUTPUT_REG_PERIOD_max , notifier); 
$recovery(posedge S &&& (OE), posedge CLK, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (OE), posedge S , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
$setup(IO  , negedge LAT, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max , notifier); 
$hold(negedge LAT, IO  , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max , notifier); 
$width(posedge LAT , `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge LAT , `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max , notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module RORI (O,Q,IO,D,CLKI,CLKO,OE); 
input D,CLKI,CLKO,OE; 
inout IO; 
output O,Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS5 (Q_int, D, CLKO, VCC, VCC, notifier); 
VF1_DFF_X INS7 (Q, IO, CLKI, VCC, VCC, notifier); 
`else 
VF1_DFF INS6 (Q_int, D, CLKO, VCC, VCC,notifier); 
VF1_DFF INS4 (Q, IO, CLKI, VCC, VCC,notifier); 
`endif 
not INS1 (OE_not, OE); 
bufif0 INS2 (IO, Q_int, OE_not); 
buf INS3 (O, IO); 
 
specify 
 
(OE => IO) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(IO => O) =  `IO_delay_min:`IO_delay_typ:`IO_delay_max, `IO_delay_min:`IO_delay_typ:`IO_delay_max; 
(CLKO => O) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max; 
(CLKO => IO) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max; 
(CLKI => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max,`IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max; 
$setup(D  &&& (OE), posedge CLKO, `IOB_OUTPUT_REG_SETUP_min:`IOB_OUTPUT_REG_SETUP_typ:`IOB_OUTPUT_REG_SETUP_max , notifier); 
$hold(posedge CLKO, D  &&& (OE), `IOB_OUTPUT_REG_HOLD_min:`IOB_OUTPUT_REG_HOLD_typ:`IOB_OUTPUT_REG_HOLD_max , notifier); 
$width(posedge CLKO &&& (OE), `IOB_OUTPUT_REG_WIDTH_min:`IOB_OUTPUT_REG_WIDTH_typ:`IOB_OUTPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLKO &&& (OE), `IOB_OUTPUT_REG_PERIOD_min:`IOB_OUTPUT_REG_PERIOD_typ:`IOB_OUTPUT_REG_PERIOD_max , notifier); 
$width(posedge CLKI , `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLKI , `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max , notifier); 
$setup(IO  , posedge CLKI, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max , notifier); 
$hold(posedge CLKI, IO  , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max , notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module RORIR (O,Q,IO,D,CLKI,CLKO,OE,R); 
input D,CLKI,CLKO,OE,R; 
inout IO; 
output O,Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS5 (Q_int, D, CLKO, R1, VCC, notifier); 
VF1_DFF_X INS7 (Q, IO, CLKI, R1, VCC, notifier); 
`else 
VF1_DFF INS6 (Q_int, D, CLKO, R1, VCC, notifier); 
VF1_DFF INS4 (Q, IO, CLKI, R1, VCC, notifier); 
`endif 
not INS10 (R1,R); 
and INS8 (OE_R1,OE,R1); 
bufif1 INS2 (IO, Q_int, OE); 
buf INS3 (O, IO); 
 
 
specify 
 
(OE => IO) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(IO => O) =  `IO_delay_min:`IO_delay_typ:`IO_delay_max, `IO_delay_min:`IO_delay_typ:`IO_delay_max; 
(CLKO => O) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max; 
(CLKO => IO) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max; 
(R => O) =  `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max+`IO_delay_max; 
(R => IO) =  `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max; 
(R => Q) =  `IOB_INPUT_REG_R_out_min:`IOB_INPUT_REG_R_out_typ:`IOB_INPUT_REG_R_out_max, `IOB_INPUT_REG_R_out_min:`IOB_INPUT_REG_R_out_typ:`IOB_INPUT_REG_R_out_max; 
(CLKI => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max,`IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max; 
$setup(D  &&& (OE_R1), posedge CLKO, `IOB_OUTPUT_REG_SETUP_min:`IOB_OUTPUT_REG_SETUP_typ:`IOB_OUTPUT_REG_SETUP_max , notifier); 
$hold(posedge CLKO, D  &&& (OE_R1), `IOB_OUTPUT_REG_HOLD_min:`IOB_OUTPUT_REG_HOLD_typ:`IOB_OUTPUT_REG_HOLD_max , notifier); 
$width(posedge CLKO &&& (OE_R1), `IOB_OUTPUT_REG_WIDTH_min:`IOB_OUTPUT_REG_WIDTH_typ:`IOB_OUTPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLKO &&& (OE_R1), `IOB_OUTPUT_REG_PERIOD_min:`IOB_OUTPUT_REG_PERIOD_typ:`IOB_OUTPUT_REG_PERIOD_max , notifier); 
$recovery(posedge R &&& (OE), posedge CLKO, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLKO &&& (OE), posedge R , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
$setup(IO &&& R1  , posedge CLKI, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max , notifier); 
$hold(posedge CLKI, IO &&& R1  , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max , notifier); 
$width(posedge CLKI &&& R1 , `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLKI &&& R1 , `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max , notifier); 
$recovery(posedge R , posedge CLKI, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLKI , posedge R , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module RORIS (O,Q,IO,D,CLKO,CLKI,OE,S); 
input D,CLKO,CLKI,OE,S; 
inout IO; 
output O,Q; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS5 (Q_int, D, CLKO, VCC, S1, notifier); 
VF1_DFF_X INS7 (Q, IO, CLKI, VCC, S1, notifier); 
`else 
VF1_DFF INS6 (Q_int, D, CLKO, VCC, S1, notifier); 
VF1_DFF INS4 (Q, IO, CLKI, VCC, S1, notifier); 
`endif 
not INS1(S1,S); 
and INS8 (OE_S1,OE,S1); 
bufif1 INS2 (IO, Q_int, OE); 
buf INS3 (O, IO); 
 
specify 
 
(OE => IO) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
(IO => O) =  `IO_delay_min:`IO_delay_typ:`IO_delay_max, `IO_delay_min:`IO_delay_typ:`IO_delay_max; 
(CLKO => O) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max+`IO_delay_max; 
(CLKO => IO) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max; 
(S => O) =  `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max+`IO_delay_max, `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min+`IO_delay_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ+`IO_delay_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max+`IO_delay_max; 
(S => IO) =  `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max; 
(S => Q) =  `IOB_INPUT_REG_S_out_min:`IOB_INPUT_REG_S_out_typ:`IOB_INPUT_REG_S_out_max, `IOB_INPUT_REG_S_out_min:`IOB_INPUT_REG_S_out_typ:`IOB_INPUT_REG_S_out_max; 
(CLKI => Q) =  `IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max,`IOB_INPUT_REG_CLK_out_min:`IOB_INPUT_REG_CLK_out_typ:`IOB_INPUT_REG_CLK_out_max; 
$setup(D  &&& (OE_S1), posedge CLKO, `IOB_OUTPUT_REG_SETUP_min:`IOB_OUTPUT_REG_SETUP_typ:`IOB_OUTPUT_REG_SETUP_max , notifier); 
$hold(posedge CLKO, D  &&& (OE_S1), `IOB_OUTPUT_REG_HOLD_min:`IOB_OUTPUT_REG_HOLD_typ:`IOB_OUTPUT_REG_HOLD_max , notifier); 
$width(posedge CLKO &&& (OE_S1), `IOB_OUTPUT_REG_WIDTH_min:`IOB_OUTPUT_REG_WIDTH_typ:`IOB_OUTPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLKO &&& (OE_S1), `IOB_OUTPUT_REG_PERIOD_min:`IOB_OUTPUT_REG_PERIOD_typ:`IOB_OUTPUT_REG_PERIOD_max , notifier); 
$recovery(posedge S &&& (OE), posedge CLKO, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLKO &&& (OE), posedge S , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
$setup(IO &&& S1  , posedge CLKI, `IOB_INPUT_REG_SETUP_min:`IOB_INPUT_REG_SETUP_typ:`IOB_INPUT_REG_SETUP_max , notifier); 
$hold(posedge CLKI, IO &&& S1  , `IOB_INPUT_REG_HOLD_min:`IOB_INPUT_REG_HOLD_typ:`IOB_INPUT_REG_HOLD_max , notifier); 
$width(posedge CLKI &&& S1 , `IOB_INPUT_REG_WIDTH_min:`IOB_INPUT_REG_WIDTH_typ:`IOB_INPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLKI &&& S1 , `IOB_INPUT_REG_PERIOD_min:`IOB_INPUT_REG_PERIOD_typ:`IOB_INPUT_REG_PERIOD_max , notifier); 
$recovery(posedge S , posedge CLKI, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLKI , posedge S , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module ROT (O,D,CLK,OE); 
input D,CLK,OE; 
output O; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS3 (Q_int, D, CLK, VCC, VCC, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, VCC, VCC, notifier); 
`endif 
 
bufif1 INS2 (O, Q_int, OE); 
 
specify 
 
(CLK => O) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max ; 
(OE => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
$setup(D  &&& (OE), posedge CLK, `IOB_OUTPUT_REG_SETUP_min:`IOB_OUTPUT_REG_SETUP_typ:`IOB_OUTPUT_REG_SETUP_max , notifier); 
$hold(posedge CLK, D  &&& (OE), `IOB_OUTPUT_REG_HOLD_min:`IOB_OUTPUT_REG_HOLD_typ:`IOB_OUTPUT_REG_HOLD_max , notifier); 
$width(posedge CLK &&& (OE), `IOB_OUTPUT_REG_WIDTH_min:`IOB_OUTPUT_REG_WIDTH_typ:`IOB_OUTPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLK &&& (OE), `IOB_OUTPUT_REG_PERIOD_min:`IOB_OUTPUT_REG_PERIOD_typ:`IOB_OUTPUT_REG_PERIOD_max , notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module ROTR (O,D,CLK,OE,R); 
input D,CLK,OE,R; 
output O; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS3 (Q_int, D, CLK, R1, VCC, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, R1, VCC, notifier); 
`endif 
 
and INS8 (OE_R1,OE,R1); 
bufif1 INS2 (O, Q_int, OE); 
not INS7 (R1,R); 
 
specify 
 
(CLK => O) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max ; 
(R => O) =  `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_R_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_R_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_R_out_max+`IN_BUF_max ; 
(OE => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
$setup(D  &&& (OE_R1), posedge CLK, `IOB_OUTPUT_REG_SETUP_min:`IOB_OUTPUT_REG_SETUP_typ:`IOB_OUTPUT_REG_SETUP_max , notifier); 
$hold(posedge CLK, D  &&& (OE_R1), `IOB_OUTPUT_REG_HOLD_min:`IOB_OUTPUT_REG_HOLD_typ:`IOB_OUTPUT_REG_HOLD_max , notifier); 
$width(posedge CLK &&& (OE_R1), `IOB_OUTPUT_REG_WIDTH_min:`IOB_OUTPUT_REG_WIDTH_typ:`IOB_OUTPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLK &&& (OE_R1), `IOB_OUTPUT_REG_PERIOD_min:`IOB_OUTPUT_REG_PERIOD_typ:`IOB_OUTPUT_REG_PERIOD_max , notifier); 
$recovery(posedge R &&& (OE), posedge CLK, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (OE), posedge R , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module ROTS (O,D,CLK,OE,S); 
input D,CLK,OE,S; 
output O; 
reg notifier; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_DFF_X INS3 (Q_int, D, CLK, VCC, S1, notifier); 
`else 
VF1_DFF INS1 (Q_int, D, CLK, VCC, S1, notifier); 
`endif 
not INS7 (S1,S); 
and INS8 (OE_S1,OE,S1); 
bufif1 INS2 (O, Q_int, OE); 
 
specify 
 
(CLK => O) =  `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_CLK_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_CLK_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_CLK_out_max+`IN_BUF_max ; 
(S => O) =  `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max, `IOB_OUTPUT_REG_S_out_min+`IN_BUF_min:`IOB_OUTPUT_REG_S_out_typ+`IN_BUF_typ:`IOB_OUTPUT_REG_S_out_max+`IN_BUF_max ; 
(OE => O) =  `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max, `IN_BUF_min:`IN_BUF_typ:`IN_BUF_max; 
$setup(D  &&& (OE_S1), posedge CLK, `IOB_OUTPUT_REG_SETUP_min:`IOB_OUTPUT_REG_SETUP_typ:`IOB_OUTPUT_REG_SETUP_max , notifier); 
$hold(posedge CLK, D  &&& (OE_S1), `IOB_OUTPUT_REG_HOLD_min:`IOB_OUTPUT_REG_HOLD_typ:`IOB_OUTPUT_REG_HOLD_max , notifier); 
$width(posedge CLK &&& (OE_S1), `IOB_OUTPUT_REG_WIDTH_min:`IOB_OUTPUT_REG_WIDTH_typ:`IOB_OUTPUT_REG_WIDTH_max , 0, notifier); 
$period(posedge CLK &&& (OE_S1), `IOB_OUTPUT_REG_PERIOD_min:`IOB_OUTPUT_REG_PERIOD_typ:`IOB_OUTPUT_REG_PERIOD_max , notifier); 
$recovery(posedge S &&& (OE), posedge CLK, `IOB_INPUT_REG_RECOVERY_min:`IOB_INPUT_REG_RECOVERY_typ:`IOB_INPUT_REG_RECOVERY_max, notifier); 
$hold(posedge CLK &&& (OE), posedge S , `IOB_INPUT_REG_RHOLD_min:`IOB_INPUT_REG_RHOLD_typ:`IOB_INPUT_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module RSFF (Q,SE,RE,CLK); 
input SE,RE,CLK; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_RSFF_X INS1 (Q_int, CLK, RE, SE, VCC, VCC, notifier); 
`else 
VF1_RSFF INS4 (Q_int, CLK, RE, SE, VCC, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
$setup(RE , posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, RE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(SE , posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, SE , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module RSFFR (Q,SE,RE,CLK,R); 
input SE,RE,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_RSFF_X INS1 (Q_int, CLK, RE, SE, VCC, R, notifier); 
`else 
VF1_RSFF INS4 (Q_int, CLK, RE, SE, VCC, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(RE  &&& (R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, RE  &&& (R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(SE  &&& (R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, SE  &&& (R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module RSFFRH (Q,SE,RE,CLK,R); 
input SE,RE,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_RSFF_X INS1 (Q_int, CLK, RE, SE, VCC, R1, notifier); 
`else 
VF1_RSFF INS5 (Q_int, CLK, RE, SE, VCC, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R , `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(RE  &&& (R == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, RE  &&& (R == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(SE  &&& (R == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, SE  &&& (R == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R == 0), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R == 0), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module RSFFRS (Q,SE,RE,CLK,R,S); 
input SE,RE,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
VF1_RSFF_X INS1 (Q_int, CLK, RE, SE, S, R, notifier); 
`else 
VF1_RSFF INS5 (Q_int, CLK, RE, SE, S, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (R_S, R, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(RE  &&& (R_S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, RE  &&& (R_S), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(SE  &&& (R_S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, SE  &&& (R_S), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R_S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R_S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge S &&& (R), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S  &&& (R), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(posedge R &&& (S), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R  &&& (S), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module RSFFRSH (Q,SE,RE,CLK,R,S); 
input SE,RE,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
 
`ifdef xmodel 
VF1_RSFF_X INS1 (Q_int, CLK, RE, SE, S1, R1, notifier); 
`else 
VF1_RSFF INS7 (Q_int, CLK, RE, SE, S1, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (NR_NS, R1, S1); 
not INS5 (R1, R); 
not INS6 (S1, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(RE  &&& (NR_NS), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, RE  &&& (NR_NS), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(SE  &&& (NR_NS), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, SE  &&& (NR_NS), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (NR_NS), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (NR_NS), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge S &&& (R == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S  &&& (R == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(negedge R &&& (S == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge R  &&& (S == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module RSFFRSS (Q,SE,RE,CLK,R,S); 
input SE,RE,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
or INS9 (SE_in, NOT_S, SE); 
and INS10 (RE_in, S, RE); 
 
`ifdef xmodel 
VF1_RSFF_X INS1 (Q_int, CLK, RE_in, SE_in, 1, R, notifier); 
`else 
VF1_RSFF INS5 (Q_int, CLK, RE_in, SE_in, 1, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (R_S, R, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(RE  &&& (R_S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, RE  &&& (R_S), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(SE  &&& (R_S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, SE  &&& (R_S), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R_S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R_S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$setup(posedge S &&& (R), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S  &&& (R), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(posedge R &&& (S), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R  &&& (S), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module RSFFRSSH (Q,SE,RE,CLK,R,S); 
input SE,RE,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
or INS9 (SE_in, S, SE); 
and INS10 (RE_in, NOT_S, RE); 
 
`ifdef xmodel 
VF1_RSFF_X INS1 (Q_int, CLK, RE_in, SE_in, 1, R1, notifier); 
`else 
VF1_RSFF INS7 (Q_int, CLK, RE_in, SE_in, 1, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (NR_NS, R1, S1); 
not INS5 (R1, R); 
not INS6 (S1, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(RE  &&& (NR_NS), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, RE  &&& (NR_NS), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(SE  &&& (NR_NS), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, SE  &&& (NR_NS), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (NR_NS), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (NR_NS), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$setup(negedge S &&& (R == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S  &&& (R == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(negedge R &&& (S == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge R  &&& (S == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module RSFFS (Q,SE,RE,CLK,S); 
input SE,RE,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_RSFF_X INS1 (Q_int, CLK, RE, SE, S, VCC, notifier); 
`else 
VF1_RSFF INS4 (Q_int, CLK, RE, SE, S, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(RE  &&& (S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, RE  &&& (S), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(SE  &&& (S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, SE  &&& (S), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge S, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module RSFFSH (Q,SE,RE,CLK,S); 
input SE,RE,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_RSFF_X INS1 (Q_int, CLK, RE, SE, S1, VCC, notifier); 
`else 
VF1_RSFF INS5 (Q_int, CLK, RE, SE, S1, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max,`CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(RE  &&& (S == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, RE  &&& (S == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$setup(SE  &&& (S == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, SE  &&& (S == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S == 0), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S == 0), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge S, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFF (Q,T,CLK); 
input T,CLK; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_TFF_X INS1 (Q_int, CLK, T, VCC, VCC, notifier); 
`else 
VF1_TFF INS4 (Q_int, CLK, T, VCC, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
$setup(T , posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, T , `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK, `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFR (Q,T,CLK,R); 
input T,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_TFF_X INS1 (Q_int, CLK, T, VCC, R, notifier); 
`else 
VF1_TFF INS4 (Q_int, CLK, T, VCC, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(T  &&& (R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, T  &&& (R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier ); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFRH (Q,T,CLK,R); 
input T,CLK,R; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_TFF_X INS1 (Q_int, CLK, T, VCC, R1, notifier); 
`else 
VF1_TFF INS5 (Q_int, CLK, T, VCC, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (R1, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(T  &&& (R == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, T  &&& (R == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (R == 0), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (R == 0), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge R , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier ); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFRS (Q,T,CLK,R,S); 
input T,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_TFF_X INS1 (Q_int, CLK, T, S, R, notifier); 
`else 
VF1_TFF INS4 (Q_int, CLK, T, S, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS5 (S_R, S, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(T  &&& (S_R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, T  &&& (S_R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S_R), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S_R), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R &&& (S), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R  &&& (S), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(posedge S &&& (R), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S  &&& (R), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFRSH (Q,T,CLK,R,S); 
input T,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_TFF_X INS1 (Q_int, CLK, T, S1, R1, notifier); 
`else 
VF1_TFF INS2 (Q_int, CLK, T, S1, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS3 (Q, Q_reg); 
not INS5 (R1, R); 
not INS6 (S1, S); 
and INS7 (S_R, S1, R1); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(T  &&& (S_R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, T  &&& (S_R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S_R), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S_R), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R &&& (S1), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge R  &&& (S1), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$recovery(negedge S &&& (R1), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S  &&& (R1), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFRSS (Q,T,CLK,R,S); 
input T,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
or INS20 (T_in, NOT_S, T); 
 
`ifdef xmodel 
VF1_TFF_X INS1 (Q_int, CLK, T_in, 1, R, notifier); 
`else 
VF1_TFF INS4 (Q_int, CLK, T_in, 1, R, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS5 (S_R, S, R); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(negedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(T  &&& (S_R), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, T  &&& (S_R), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S_R), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S_R), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge R &&& (S), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge R  &&& (S), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(posedge S &&& (R), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S  &&& (R), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFRSSH (Q,T,CLK,R,S); 
input T,CLK,R,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
not INS8 (NOT_S, S); 
and INS9 (T_in, S, T); 
and INS10 (T_in1, NOT_S, GND); 
or INS11 (K_in, T_in1, T_in); 
  
and INS12 (J_in2, NOT_S, T); 
and INS13 (J_in1, S, VCC); 
or INS14 (J_in, J_in1, J_in2); 
 
`ifdef xmodel 
VF1_JKFF_X INS1 (Q_int, CLK, J_in, K_in, 1, R1, notifier); 
`else 
VF1_JKFF INS7 (Q_int, CLK, J_in, K_in, 1, R1, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
and INS4 (NS_NR, S1, R1); 
not INS5 (R1, R); 
not INS6 (S1, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(R => Q) = ( `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max, `CLB_REG_R_out_min:`CLB_REG_R_out_typ:`CLB_REG_R_out_max); 
$width(posedge R, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(T  &&& (NS_NR), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, T  &&& (NS_NR), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (NS_NR), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (NS_NR), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge R &&& (S == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK,  negedge R  &&& (S == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
$setup(negedge S &&& (R == 0), posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S  &&& (R == 0), `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFS (Q,T,CLK,S); 
input T,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_TFF_X INS1 (Q_int, CLK, T, S, VCC, notifier); 
`else 
VF1_TFF INS4 (Q_int, CLK, T, S, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(negedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(T  &&& (S), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, T  &&& (S), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(posedge S, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, posedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
`celldefine 
 
module TFFSH (Q,T,CLK,S); 
input T,CLK,S; 
output Q; 
reg notifier; 
reg Q_reg; 
 
supply0 GND; 
supply1 VCC; 
 
`ifdef xmodel 
VF1_TFF_X INS1 (Q_int, CLK, T, S1, VCC, notifier); 
`else 
VF1_TFF INS5 (Q_int, CLK, T, S1, VCC, notifier); 
`endif 
 
`ifdef PUC 
        initial Q_reg = 0; 
`endif 
 
        always @(Q_int) Q_reg = Q_int; 
 
 
buf INS2 (Q, Q_reg); 
not INS4 (S1, S); 
 
specify 
 
(CLK => Q) = ( `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max, `CLB_REG_CLK_out_min:`CLB_REG_CLK_out_typ:`CLB_REG_CLK_out_max); 
(S => Q) = ( `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max, `CLB_REG_S_out_min:`CLB_REG_S_out_typ:`CLB_REG_S_out_max); 
$width(posedge S, `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$setup(T  &&& (S == 0), posedge CLK, `CLB_REG_SETUP_min:`CLB_REG_SETUP_typ:`CLB_REG_SETUP_max, notifier); 
$hold(posedge CLK, T  &&& (S == 0), `CLB_REG_HOLD_min:`CLB_REG_HOLD_typ:`CLB_REG_HOLD_max, notifier); 
$width(posedge CLK &&& (S == 0), `CLB_REG_WIDTH_min:`CLB_REG_WIDTH_typ:`CLB_REG_WIDTH_max, 0, notifier); 
$period(posedge CLK &&& (S == 0), `CLB_REG_PERIOD_min:`CLB_REG_PERIOD_typ:`CLB_REG_PERIOD_max, notifier); 
$recovery(negedge S, posedge CLK, `CLB_REG_RECOVERY_min:`CLB_REG_RECOVERY_typ:`CLB_REG_RECOVERY_max, notifier); 
$hold(posedge CLK, negedge S , `CLB_REG_RHOLD_min:`CLB_REG_RHOLD_typ:`CLB_REG_RHOLD_max, notifier); 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
`celldefine 
 
module XNOR2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
xnor INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(I1 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XNOR3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
xnor INS1 (O, I0, I1,I2); 
 
specify 
 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XNOR4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
xnor INS1 (O, I0, I1,I2,I3); 
 
specify 
 
(I0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XNOR5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
xnor INS1 (O, I0, I1,I2,I3,I4); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XNOR6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
xnor INS1 (O, I0, I1,I2,I3,I4,I5); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XOR2 (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
xor INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(I1 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XOR3 (O,I0,I1,I2); 
input I0,I1,I2; 
output O; 
supply0 GND; 
supply1 VCC; 
xor INS1 (O, I0, I1,I2); 
 
specify 
 
(I0 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I1 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
(I2 => O) =  `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max, `in3_LUT_min:`in3_LUT_typ:`in3_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XOR4 (O,I0,I1,I2,I3); 
input I0,I1,I2,I3; 
output O; 
supply0 GND; 
supply1 VCC; 
xor INS1 (O, I0, I1,I2,I3); 
 
specify 
 
(I0 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I1 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I2 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
(I3 => O) =  `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max, `in4_LUT_min:`in4_LUT_typ:`in4_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XOR5 (O,I0,I1,I2,I3,I4); 
input I0,I1,I2,I3,I4; 
output O; 
supply0 GND; 
supply1 VCC; 
xor INS1 (O, I0, I1,I2,I3,I4); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XOR6 (O,I0,I1,I2,I3,I4,I5); 
input I0,I1,I2,I3,I4,I5; 
output O; 
supply0 GND; 
supply1 VCC; 
xor INS1 (O, I0, I1,I2,I3,I4,I5); 
 
specify 
 
(I0 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I1 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I2 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I3 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I4 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
(I5 => O) =  `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max, `in3_LUT_min+`in2_LUT_min:`in3_LUT_typ+`in2_LUT_typ:`in3_LUT_max+`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 
 
 
`celldefine 
 
module XORSOFT (O,I0,I1); 
input I0,I1; 
output O; 
supply0 GND; 
supply1 VCC; 
xor INS1 (O, I0, I1); 
 
specify 
 
(I0 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
(I1 => O) =  `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max, `in2_LUT_min:`in2_LUT_typ:`in2_LUT_max; 
 
endspecify 
 
 
endmodule 
`endcelldefine 
 

module RB_DA(RDATA3,RDATA2,RDATA1,RDATA0,WRDATA3,WRDATA2,WRDATA1,WRDATA0,WEN,REN,OE,WRCLK,WRAD4,WRAD3,WRAD2,WRAD1,WRAD0,RAD4,RAD3,RAD2,RAD1,RAD0); //
inout WRDATA3,WRDATA2,WRDATA1,WRDATA0; //
input WRAD4,WRAD3,WRAD2,WRAD1,WRAD0,RAD4,RAD3,RAD2,RAD1,RAD0; //
input WEN,REN,OE,WRCLK;
output RDATA3,RDATA2,RDATA1,RDATA0; //

//instantiation of beh module
beh_RB_DA inst1(.RDATA({RDATA3_1,RDATA2_1,RDATA1_1,RDATA0_1}),.WRDATA({WRDATA3_1,WRDATA2_1,WRDATA1_1,WRDATA0_1}),.WEN(WEN),.REN(REN),.OE(OE),.WRCLK(WRCLK),.WRAD({WRAD4,WRAD3,WRAD2,WRAD1,WRAD0}),.RAD({RAD4,RAD3,RAD2,RAD1,RAD0}));

not I_00 (INV_WEN, WEN);
and I_01 (con, REN, OE, INV_WEN);

bufif1 I_11 (WRDATA3, WRDATA3_1, con);
bufif0 I_21 (WRDATA3_1, WRDATA3, con);

bufif1 I_12 (WRDATA2, WRDATA2_1, con);
bufif0 I_22 (WRDATA2_1, WRDATA2, con);

bufif1 I_13 (WRDATA1, WRDATA1_1, con);
bufif0 I_23 (WRDATA1_1, WRDATA1, con);

bufif1 I_14 (WRDATA0, WRDATA0_1, con);
bufif0 I_24 (WRDATA0_1, WRDATA0, con);

buf (RDATA3,RDATA3_1);
buf (RDATA2,RDATA2_1);
buf (RDATA1,RDATA1_1);
buf (RDATA0,RDATA0_1);

reg notifier1, notifier2, notifier3, notifier4, notifier5, notifier6;
initial
begin
         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;

end


always @( notifier1 or notifier2 or notifier3 or notifier4 or notifier5 or notifier6)
begin

         inst1.notifier1 = notifier1;
         inst1.notifier2 = notifier2;
         inst1.notifier3 = notifier3;
         inst1.notifier4 = notifier4;
         inst1.notifier5 = notifier5;
         inst1.notifier6 = notifier6;
end


specify


               (WRAD4 => WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD3 => WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD2 => WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD1 => WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD0 => WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD4 => WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD3 => WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD2 => WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD1 => WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD0 => WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD4 => WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD3 => WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD2 => WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD1 => WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD0 => WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD4 => WRDATA3 ) = 1.00:2.00:3.00;
               (WRAD3 => WRDATA3 ) = 1.00:2.00:3.00;
               (WRAD2 => WRDATA3 ) = 1.00:2.00:3.00;
               (WRAD1 => WRDATA3 ) = 1.00:2.00:3.00;
               (WRAD0 => WRDATA3 ) = 1.00:2.00:3.00;
               (OE => WRDATA0 ) = 1.00:2.00:3.00;
               (OE => WRDATA1 ) = 1.00:2.00:3.00;
               (OE => WRDATA2 ) = 1.00:2.00:3.00;
               (OE => WRDATA3 ) = 1.00:2.00:3.00;
               (RAD4 => RDATA0 ) = 1.00:2.00:3.00;
               (RAD3 => RDATA0 ) = 1.00:2.00:3.00;
               (RAD2 => RDATA0 ) = 1.00:2.00:3.00;
               (RAD1 => RDATA0 ) = 1.00:2.00:3.00;
               (RAD0 => RDATA0 ) = 1.00:2.00:3.00;
               (RAD4 => RDATA1 ) = 1.00:2.00:3.00;
               (RAD3 => RDATA1 ) = 1.00:2.00:3.00;
               (RAD2 => RDATA1 ) = 1.00:2.00:3.00;
               (RAD1 => RDATA1 ) = 1.00:2.00:3.00;
               (RAD0 => RDATA1 ) = 1.00:2.00:3.00;
               (RAD4 => RDATA2 ) = 1.00:2.00:3.00;
               (RAD3 => RDATA2 ) = 1.00:2.00:3.00;
               (RAD2 => RDATA2 ) = 1.00:2.00:3.00;
               (RAD1 => RDATA2 ) = 1.00:2.00:3.00;
               (RAD0 => RDATA2 ) = 1.00:2.00:3.00;
               (RAD4 => RDATA3 ) = 1.00:2.00:3.00;
               (RAD3 => RDATA3 ) = 1.00:2.00:3.00;
               (RAD2 => RDATA3 ) = 1.00:2.00:3.00;
               (RAD1 => RDATA3 ) = 1.00:2.00:3.00;
               (RAD0 => RDATA3 ) = 1.00:2.00:3.00;


specparam tWDSU = 1, tWADSU = 1, tWDH = 1, tWADH = 1, tWRCLKH = 1, tWENH = 1, tRENSU = 1, tRDADV = 1, tLH = 1, tRENH = 1, tADLS = 1, tADLH = 1;

$setup ( WRDATA3, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA3, tWDH, notifier3 );

$setup ( WRDATA2, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA2, tWDH, notifier3 );

$setup ( WRDATA1, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA1, tWDH, notifier3 );

$setup ( WRDATA0, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA0, tWDH, notifier3 );

$setup ( WRAD4, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD4, tWADH, notifier4 );

$setup ( WRAD3, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD3, tWADH, notifier4 );

$setup ( WRAD2, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD2, tWADH, notifier4 );

$setup ( WRAD1, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD1, tWADH, notifier4 );

$setup ( WRAD0, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD0, tWADH, notifier4 );


$width ( posedge WRCLK , tWRCLKH, 0,  notifier5 );

$setup ( WEN, posedge WRCLK, tWADSU, notifier6 );
$hold  ( posedge WRCLK, WEN, tWENH, notifier6 );


endspecify

endmodule

module beh_RB_DA(RDATA,WRDATA,WEN,REN,OE,WRCLK,WRAD,RAD);

parameter tRDO = 3;
parameter tDOH = 1;
parameter tRLO = 2;


inout [3:0] WRDATA;
input [4:0] WRAD,RAD;
input WEN,REN,OE,WRCLK;
output [3:0] RDATA;

reg [3:0] DIN;
reg [4:0] RD_ADD, RD_ADD_W, WR_ADD, latched_add;
reg [3:0] ramout, dataout;
reg [3:0] ramout_w, dataout_w;
wire [3:0] din = DIN;
wire [3:0] RDATA, WRDATA;
wire [4:0] rd_add = RD_ADD;
wire [4:0] rd_add_w = RD_ADD_W;
wire [4:0] wr_add = WR_ADD;
reg [3:0] mem [31:0];
reg WR_CLK;
wire wr_clk = WR_CLK;
wire r_en = REN;
wire r_en_w = OE & REN & ~WEN;
integer output_delay;
integer output_delay_w;
integer i;
reg notifier1,notifier2,notifier3,notifier4,notifier5,notifier6,notifier7,notifier8,notifier9,notifier10,notifier11,notifier12,notifier7_W,notifier8_W,notifier9_W,notifier10_W,notifier11_W,notifier12_W;

initial
 begin
         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;

   WR_CLK = 1'b0;
   ramout_w = 4'bzzzz;
   dataout = 4'bzzzz;

 end

   always @(REN or RAD )

   begin
    if (REN == 1'b1) 
	RD_ADD = RAD;
	else
	begin
	    RD_ADD = 5'bx;
	end
   end
 
   always @(WEN or REN or WRAD )

   begin
    if (REN == 1'b1 && WEN == 1'b0)
	RD_ADD_W = WRAD;
    else
	begin
	    RD_ADD_W = 5'bx;
	end
   end

 

   always @(WEN or WRAD)

   begin
    if (WEN == 1'b1)
	WR_ADD = WRAD;
    else
	WR_ADD = 5'bx;
   end

   always @(posedge WR_CLK)
   begin
     if (WR_CLK == 1'b1)
	latched_add = WR_ADD;
   end

   always @(WEN or WRDATA)
   begin
    if (WEN == 1'b1)
	DIN = WRDATA;
    else
	DIN = 4'bx;
   end

   always @(WEN or WRCLK)
   begin
    if (WEN == 1'b1)
	WR_CLK = WRCLK;
    else
	WR_CLK = 1'b0;
   end



always @(notifier1 or notifier3 or notifier5 or notifier6)
  begin
	// write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
  end

always @(notifier7 or  notifier9 )

  begin
	// send RD to x immediately
	disable read;
	//output_delay = 0;
	ramout = 4'bx;
  end

always @(notifier7_W  or notifier9_W)

  begin
	// send RD to x immediately
	disable read_w;
	//output_delay_w = 0;
	ramout_w = 4'bx;
  end

always @(notifier2 or notifier4)

  begin
	disable write;
	// put x in all of the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WRCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
  end


always @(WR_CLK)

  begin
    if ((WRCLK == 1'b1) && (WEN!=1'b1))
     begin
	// if WEN toggles from 1 when WRCLK is high write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
     end
  end
	
always @(posedge WR_CLK)

  begin : write
   if (|(WR_ADD & ~WR_ADD) === 1'bx)
     begin
	// if WRAD is x write x into all the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WRCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
     end
   else
	mem[WR_ADD] = DIN;
  end


always @(RD_ADD)

  begin : read
   if ( REN == 1'b1 )
    begin
     if (|(RAD & ~RAD) === 1'bx)
      begin
        // if RAD is x send RD to x immediately
        //output_delay = 0;
        ramout = 4'bx;
        $display("(error) illegal address input so RDATA goes x: @ %.3f ",$realtime
);
      end
    else
     begin
        //output_delay = tDOH;
        //ramout = 4'bx;
        ramout = mem[RD_ADD];
     end
    end
  end

always @(RD_ADD_W)

  begin : read_w
   if (REN == 1'b1 && WEN == 1'b0)
    begin
     if (|(WRAD & ~WRAD) === 1'bx)
      begin
        // if WRAD is x send RD to x immediately
        //output_delay_w = 0;
        ramout_w = 4'bx;
        $display("(error) illegal address input so WRDATA goes x: @ %.3f ",$realtime
);
      end
    else
     begin
        //output_delay_w = tDOH;
        //ramout_w = 4'bx;
        ramout_w = mem[RD_ADD_W];
     end
    end
  end

always @(ramout_w or REN or OE or WEN)

  begin
   if (REN == 1'b1 && OE == 1'b1 && WEN == 1'b0)
        dataout = ramout_w;
   else
    begin
	//output_delay_w = 0;
        dataout = 4'bzzzz;
    end
  end

assign  RDATA = ramout;

assign WRDATA = dataout;



endmodule

module RB_DS(RDATA3,RDATA2,RDATA1,RDATA0,WRDATA3,WRDATA2,WRDATA1,WRDATA0,WEN,REN,OE,WRCLK,RCLK,WRAD4,WRAD3,WRAD2,WRAD1,WRAD0,RAD4,RAD3,RAD2,RAD1,RAD0); //
inout WRDATA3,WRDATA2,WRDATA1,WRDATA0; //
input WRAD4,WRAD3,WRAD2,WRAD1,WRAD0,RAD4,RAD3,RAD2,RAD1,RAD0; //
input WEN,REN,OE,WRCLK,RCLK;
output RDATA3,RDATA2,RDATA1,RDATA0; //

//instantiation of beh module
beh_RB_DS inst1(.RDATA({RDATA3_1,RDATA2_1,RDATA1_1,RDATA0_1}),.WRDATA({WRDATA3_1,WRDATA2_1,WRDATA1_1,WRDATA0_1}),.WEN(WEN),.REN(REN),.OE(OE),.WRCLK(WRCLK),.RCLK(RCLK),.WRAD({WRAD4,WRAD3,WRAD2,WRAD1,WRAD0}),.RAD({RAD4,RAD3,RAD2,RAD1,RAD0}));


reg notifier1, notifier2, notifier3, notifier4, notifier5, notifier6, notifier7, notifier8, notifier9, notifier10;
initial
begin
	 notifier1 = 1'b0;
	 notifier2 = 1'b0;
	 notifier3 = 1'b0;
	 notifier4 = 1'b0;
	 notifier5 = 1'b0;
	 notifier6 = 1'b0;
	 notifier7 = 1'b0;
	 notifier8 = 1'b0;
	 notifier9 = 1'b0;
	 notifier10 = 1'b0;
end

always @(notifier1 or notifier2 or notifier3 or notifier4 or notifier5 or notifier6 or notifier7 or notifier8 or notifier9 or notifier10)
begin
         inst1.notifier1 = notifier1;
         inst1.notifier2 = notifier2;
         inst1.notifier3 = notifier3;
         inst1.notifier4 = notifier4;
         inst1.notifier5 = notifier5;
         inst1.notifier6 = notifier6;
         inst1.notifier7 = notifier7;
         inst1.notifier8 = notifier8;
         inst1.notifier9 = notifier9;
         inst1.notifier10 = notifier10;
end

buf D_3 (RDATA3, RDATA3_1);
buf D_2 (RDATA2, RDATA2_1);
buf D_1 (RDATA1, RDATA1_1);
buf D_0 (RDATA0, RDATA0_1);


not I_00 (INV_WEN, WEN);
and I_01 (con,  OE, INV_WEN);

bufif1 I_11 (WRDATA3, WRDATA3_1, con);
bufif0 I_21 (WRDATA3_1, WRDATA3, con);

bufif1 I_12 (WRDATA2, WRDATA2_1, con);
bufif0 I_22 (WRDATA2_1, WRDATA2, con);

bufif1 I_13 (WRDATA1, WRDATA1_1, con);
bufif0 I_23 (WRDATA1_1, WRDATA1, con);

bufif1 I_14 (WRDATA0, WRDATA0_1, con);
bufif0 I_24 (WRDATA0_1, WRDATA0, con);


specify

specparam tWDSU = 1, tWADSU = 1, tWDH = 1, tWADH = 1, tWRCLKH = 1, tWENH = 1, tRADSU = 1, tRADH = 1, tRCLKH = 1, tRENH = 1;


               ( RCLK => RDATA0 ) = 1.00:2.00:3.00;
               ( RCLK => RDATA1 ) = 1.00:2.00:3.00;
               ( RCLK => RDATA2 ) = 1.00:2.00:3.00;
               ( RCLK => RDATA3 ) = 1.00:2.00:3.00;
               ( OE => WRDATA0 ) = 1.00:2.00:3.00;
               ( OE => WRDATA1 ) = 1.00:2.00:3.00;
               ( OE => WRDATA2 ) = 1.00:2.00:3.00;
               ( OE => WRDATA3 ) = 1.00:2.00:3.00;
                  
               ( WRCLK => WRDATA0 ) = 1.00:2.00:3.00;
               ( WRCLK => WRDATA1 ) = 1.00:2.00:3.00;
               ( WRCLK => WRDATA2 ) = 1.00:2.00:3.00;
               ( WRCLK => WRDATA3 ) = 1.00:2.00:3.00;

$width ( posedge WRCLK, tWRCLKH, 0,  notifier5 );
$width ( posedge RCLK, tRCLKH, 0,  notifier9 );

$setup ( WRDATA3, posedge WRCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&& WEN, WRDATA3, tWDH, notifier3 );

$setup ( WRDATA2, posedge WRCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&& WEN, WRDATA2, tWDH, notifier3 );

$setup ( WRDATA1, posedge WRCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&& WEN, WRDATA1, tWDH, notifier3 );

$setup ( WRDATA0, posedge WRCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&& WEN, WRDATA0, tWDH, notifier3 );

$setup ( WRAD4, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD4, tWADH, notifier4 );

$setup ( WRAD3, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD3, tWADH, notifier4 );

$setup ( WRAD2, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD2, tWADH, notifier4 );

$setup ( WRAD1, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD1, tWADH, notifier4 );

$setup ( WRAD0, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD0, tWADH, notifier4 );

$setup ( WEN, posedge WRCLK , tWADSU, notifier6 );
$hold  ( posedge WRCLK, WEN, tWENH, notifier6 );

$setup ( RAD4, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD4, tRADH, notifier8 );

$setup ( RAD3, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD3, tRADH, notifier8 );

$setup ( RAD2, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD2, tRADH, notifier8 );

$setup ( RAD1, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD1, tRADH, notifier8 );

$setup ( RAD0, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD0, tRADH, notifier8 );

$setup ( REN, posedge RCLK, tRADSU, notifier7 );
$hold  ( posedge RCLK, REN, tRENH, notifier10 );

endspecify

endmodule


module beh_RB_DS(RDATA,WRDATA,WEN,REN,OE,WRCLK,RCLK,WRAD,RAD);

parameter tRCO = 2000;

inout [3:0] WRDATA;
input [4:0] WRAD,RAD;
input WEN,REN,OE,WRCLK,RCLK;
output [3:0] RDATA;

reg [3:0] DIN;
reg [4:0] RD_ADD, RD_ADD_W, WR_ADD, latched_add;
reg [3:0] ramout;
reg [3:0] ramout_w;
reg [3:0] dataout;
wire [3:0] din = DIN;
wire [3:0] RDATA;
reg [3:0] RDATA_out;
reg [3:0] WRDATA_out;
wire [4:0] rd_add = RD_ADD;
wire [4:0] rd_add_w = RD_ADD_W;
wire [4:0] wr_add = WR_ADD;
reg [3:0] mem [31:0];
reg RD_CLK,WR_CLK,RD_CLK_W;
wire rd_clk = RD_CLK;
wire rd_clk_w = RD_CLK_W;
wire wr_clk = WR_CLK;
integer output_delay;
integer output_delay_w;
integer i;
reg notifier1,notifier2,notifier3,notifier4,notifier5,notifier6,notifier7,notifier8,notifier9,notifier10,notifier7_W,notifier8_W,notifier9_W,notifier10_W;

initial
 begin
         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;
         notifier7 = 1'b0;
         notifier8 = 1'b0;
         notifier9 = 1'b0;
         notifier10 = 1'b0;

   RD_CLK = 1'b0;
   WR_CLK = 1'b0;
   RD_CLK_W = 1'b0;
   ramout_w = 4'bzzzz;
   dataout = 4'bzzzz;

 end

   always @(REN or RAD)

   begin
    if (REN == 1'b1)
	RD_ADD = RAD;
    else
	RD_ADD = 5'bx;
   end
 
   always @(WEN or REN or WRAD)

   begin
    if (REN == 1'b1 && WEN == 1'b0)
	RD_ADD_W = WRAD;
    else
	RD_ADD_W = 5'bx;
   end
 
   always @(REN or RCLK)
   
   begin
    if (REN == 1'b1)
	RD_CLK = RCLK;
    else
	RD_CLK = 1'b0;
   end

   always @(REN or WRCLK or WEN)
   
   begin
    if ( REN == 1'b1 && WEN == 1'b0)
	RD_CLK_W = WRCLK;
    else
	RD_CLK_W = 1'b0;
   end

   always @(WEN or WRAD)

   begin
    if (WEN == 1'b1)
	WR_ADD = WRAD;
    else
	WR_ADD = 5'bx;
   end

   always @(posedge WR_CLK)
   begin
     if (WR_CLK == 1'b1)
	latched_add = WR_ADD;
   end

   always @(WEN or WRDATA)
   begin
    if (WEN == 1'b1)
	DIN = WRDATA;
    else
	DIN = 4'bx;
   end

   always @(WEN or WRCLK)
   begin
    if (WEN == 1'b1)
	WR_CLK = WRCLK;
    else
	WR_CLK = 1'b0;
   end

always @(notifier1 or notifier3 or notifier5 or notifier6)
  begin
	// write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
  end

always @(notifier7 or notifier8 or notifier9 or notifier10)

  begin
	// send RD to x immediately
	disable read;
	//output_delay = 0;
	ramout = 4'bx;
        //RDATA_out = ramout;
  end

always @(notifier7_W or notifier8_W or notifier9_W or notifier10_W)

  begin
	// send RD to x immediately
	disable read_w;
	//output_delay_w = 0;
	ramout_w = 4'bx;
//        //WRDATA_out = ramout_w;
  end

always @(notifier2 or notifier4)

  begin
	disable write;
	// put x in all of the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WRCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
  end

always @(RD_CLK)

  begin
    if ((RCLK == 1'b1) && (REN!= 1'b1))
     begin
	// if REN toggles from 1 when RCLK is high send RD to x immediately
	disable read;
	//output_delay = 0;
	ramout = 4'bx;
        //RDATA_out = ramout;
     end
  end

always @(RD_CLK_W)

  begin
    if ((WRCLK == 1'b1) && (REN!= 1'b1))
     begin
	// if REN toggles from 1 when WRCLK is high send RD to x immediately
	disable read_w;
	//output_delay_w = 0;
	ramout_w = 4'bx;
//       // WRDATA_out = ramout_w;
     end
  end

always @(WR_CLK)

  begin
    if ((WRCLK == 1'b1) && (WEN!=1'b1))
     begin
	// if WEN toggles from 1 when WRCLK is high write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
     end
  end
	
always @(posedge WR_CLK)

  begin : write
   if (|(WR_ADD & ~WR_ADD) === 1'bx)
     begin
	// if WRAD is x write x into all the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WRCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
     end
   else
	mem[WR_ADD] = DIN;
  end

always @(posedge RD_CLK)

  begin : read
   if (|(RAD & ~RAD) === 1'bx)
     begin
	// if RAD is x send RD to x immediately
	ramout = 4'bx;
	//output_delay = 0;
        //RDATA_out = ramout;
	$display("(error) illegal address input at the rising edge of RCLK so RDATA goes x: @ %.3f ",$realtime);
     end
   else
     begin
	//output_delay = tRCO;
	ramout = mem[RD_ADD];
        //#output_delay RDATA_out = ramout;
     end
  end
 
always @(posedge RD_CLK_W)

  begin : read_w
   if (|(WRAD & ~WRAD) === 1'bx)
     begin
	// if WRAD is x send RD to x immediately
	ramout_w = 4'bx;
	//output_delay_w = 0;
//       // WRDATA_out = ramout_w;
	$display("(error) illegal address input at the rising edge of WRCLK so WRDATA goes x: @ %.3f ",$realtime);
     end
   else
     begin
	//output_delay_w = tRCO;
	ramout_w = mem[RD_ADD_W];
//       // #output_delay_w WRDATA_out = ramout_w;
     end
  end
 
//always @(WRDATA_out or REN or OE or WEN)
always @(ramout_w or REN or OE or WEN)
  begin
  if (REN == 1'b1 && OE == 1'b1 && WEN == 1'b0)
	dataout = ramout_w;
   else
    begin
	//output_delay_w = 0;
	dataout = 4'bzzzz;
  end
 end


assign RDATA = ramout;

assign WRDATA = dataout;

//assign WRDATA = WRDATA_out;

endmodule
module RB_MA(WRDATA3,WRDATA2,WRDATA1,WRDATA0,WEN,OE,WRCLK,WRAD4,WRAD3,WRAD2,WRAD1,WRAD0); //
inout WRDATA3,WRDATA2,WRDATA1,WRDATA0; //
input WRAD4,WRAD3,WRAD2,WRAD1,WRAD0; //
input WEN,OE,WRCLK;

//instantiation of beh module
beh_RB_MA inst1(.WRDATA({WRDATA3_1,WRDATA2_1,WRDATA1_1,WRDATA0_1}),.WEN(WEN),.OE(OE),.WCLK(WRCLK),.WRAD({WRAD4,WRAD3,WRAD2,WRAD1,WRAD0}));

not I_00 (INV_WEN, WEN);
and I_01 (con,  OE, INV_WEN);

bufif1 I_11 (WRDATA3, WRDATA3_1, con);
bufif0 I_21 (WRDATA3_1, WRDATA3, con);

bufif1 I_12 (WRDATA2, WRDATA2_1, con);
bufif0 I_22 (WRDATA2_1, WRDATA2, con);

bufif1 I_13 (WRDATA1, WRDATA1_1, con);
bufif0 I_23 (WRDATA1_1, WRDATA1, con);

bufif1 I_14 (WRDATA0, WRDATA0_1, con);
bufif0 I_24 (WRDATA0_1, WRDATA0, con);

reg notifier1, notifier2, notifier3, notifier4, notifier5, notifier6;
initial
begin
	 notifier1 = 1'b0; 
	 notifier2 = 1'b0; 
	 notifier3 = 1'b0; 
	 notifier4 = 1'b0; 
	 notifier5 = 1'b0; 
	 notifier6 = 1'b0; 
end
always @(notifier1 or  notifier2 or  notifier3 or  notifier4 or  notifier5 or  notifier6)
begin
 
         inst1.notifier1 = notifier1; 
         inst1.notifier2 = notifier2; 
         inst1.notifier3 = notifier3; 
         inst1.notifier4 = notifier4; 
         inst1.notifier5 = notifier5; 
         inst1.notifier6 = notifier6;
end
specify
specparam tWDSU = 1, tWADSU = 1, tWDH = 1, tWADH = 1, tWCLKH = 1, tWENH = 1, tWRAD = 1;

               ( WRAD4 => WRDATA0 )  = 1.00:2.00:3.00 ;
               ( WRAD3 => WRDATA0 )  = 1.00:2.00:3.00 ;
               ( WRAD2 => WRDATA0 )  = 1.00:2.00:3.00 ;
               ( WRAD1 => WRDATA0 )  = 1.00:2.00:3.00 ;
               ( WRAD0 => WRDATA0 )  = 1.00:2.00:3.00 ;
               ( WRAD4 => WRDATA1 )  = 1.00:2.00:3.00 ;
               ( WRAD3 => WRDATA1 )  = 1.00:2.00:3.00 ;
               ( WRAD2 => WRDATA1 )  = 1.00:2.00:3.00 ;
               ( WRAD1 => WRDATA1 )  = 1.00:2.00:3.00 ;
               ( WRAD0 => WRDATA1 )  = 1.00:2.00:3.00 ;
               ( WRAD4 => WRDATA2 )  = 1.00:2.00:3.00 ;
               ( WRAD3 => WRDATA2 )  = 1.00:2.00:3.00 ;
               ( WRAD2 => WRDATA2 )  = 1.00:2.00:3.00 ;
               ( WRAD1 => WRDATA2 )  = 1.00:2.00:3.00 ;
               ( WRAD0 => WRDATA2 )  = 1.00:2.00:3.00 ;
               ( WRAD4 => WRDATA3 )  = 1.00:2.00:3.00 ;
               ( WRAD3 => WRDATA3 )  = 1.00:2.00:3.00 ;
               ( WRAD2 => WRDATA3 )  = 1.00:2.00:3.00 ;
               ( WRAD1 => WRDATA3 )  = 1.00:2.00:3.00 ;
               ( WRAD0 => WRDATA3 )  = 1.00:2.00:3.00 ;
               ( OE => WRDATA0 )  = 1.00:2.00:3.00 ;
               ( OE => WRDATA1 )  = 1.00:2.00:3.00 ;
               ( OE => WRDATA2 )  = 1.00:2.00:3.00 ;
               ( OE => WRDATA3 )   = 1.00:2.00:3.00 ;
                  
$width ( posedge WRCLK, tWCLKH, 0,  notifier5 );

$setup ( WRDATA3, posedge WRCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&& WEN, WRDATA3, tWDH, notifier3 );

$setup ( WRDATA2, posedge WRCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&& WEN, WRDATA2, tWDH, notifier3 );

$setup ( WRDATA1, posedge WRCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&& WEN, WRDATA1, tWDH, notifier3 );

$setup ( WRDATA0, posedge WRCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&& WEN, WRDATA0, tWDH, notifier3 );

$setup ( WRAD4, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD4, tWADH, notifier4 );

$setup ( WRAD3, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD3, tWADH, notifier4 );

$setup ( WRAD2, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD2, tWADH, notifier4 );

$setup ( WRAD1, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD1, tWADH, notifier4 );

$setup ( WRAD0, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD0, tWADH, notifier4 );

$setup ( WEN, posedge WRCLK , tWADSU, notifier6 );
$hold  ( posedge WRCLK, WEN, tWENH, notifier6 );


endspecify

endmodule

module beh_RB_MA(WRDATA,WEN,OE,WCLK,WRAD);

parameter tRCO = 3000;
parameter tDOH = 1000;

inout [3:0] WRDATA;
input [4:0] WRAD;
input WEN,OE,WCLK;

reg [3:0] DIN;
reg [4:0] RD_ADD, WR_ADD, latched_add;
reg [3:0] ramout;
reg [3:0] dataout;
wire [3:0] din = DIN;
wire [3:0] WRDATA;
wire [4:0] rd_add = RD_ADD;
wire [4:0] wr_add = WR_ADD;
reg [3:0] mem [31:0];
reg WR_CLK;
wire wr_clk = WR_CLK;
integer output_delay;
integer i;
reg notifier1,notifier2,notifier3,notifier4,notifier5,notifier6,notifier7,notifier8,notifier9,notifier10;

initial
 begin
   notifier1 = 1'b0;
   notifier2 = 1'b0;
   notifier3 = 1'b0;
   notifier4 = 1'b0;
   notifier5 = 1'b0;
   notifier6 = 1'b0;
   WR_CLK = 1'b0;
   ramout = 4'bzzzz;
   dataout = 4'bzzzz;
 end

   always @(WEN or WRAD)

   begin
    if (WEN == 1'b0)
	RD_ADD = WRAD;
    else
	RD_ADD = 5'bx;
   end
 

   always @(WEN or WRAD)

   begin
    if (WEN == 1'b1)
	WR_ADD = WRAD;
    else
	WR_ADD = 5'bx;
   end

   always @(posedge WR_CLK)
   begin
    if (WR_CLK == 1'b1)
	latched_add = WR_ADD;
   end

   always @(WEN or WRDATA)
   begin
    if (WEN == 1'b1)
	DIN = WRDATA;
    else
	DIN = 4'bx;
   end

   always @(WEN or WCLK)
   begin
    if (WEN == 1'b1)
	WR_CLK = WCLK;
    else
	WR_CLK = 1'b0;
   end
always @(notifier1 or notifier3 or notifier5 or notifier6)

  begin
	// write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
  end

always @(notifier7) 

  begin
	// send Data_out to x immediately
	disable read;
	//output_delay = 0;
	ramout = 4'bx;
  end

always @(notifier2 or notifier4)

  begin
	disable write;
	// put x in all of the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
  end


always @(WR_CLK)

  begin
    if ((WCLK == 1'b1) && (WEN!=1'b1))
     begin
	// if WEN toggles from 1 when WCLK is high write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
     end
  end
	
always @(posedge WR_CLK)

  begin : write
   if (|(WR_ADD & ~WR_ADD) === 1'bx)
     begin
	// if WRAD is x write x into all the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
     end
   else
	mem[WR_ADD] = DIN;
  end

always @(RD_ADD)
if (WEN == 1'b0)
begin
  begin : read
   if (|(RD_ADD & ~RD_ADD) === 1'bx)
     begin
	// if WRAD is x send Data_out to x immediately
//	output_delay = 0;
//	ramout = 4'bx;
	$display("(error) illegal address input at the rising edge of OE so Data_out goes x: @ %.3f ",$realtime);
     end
   else
     begin
//	output_delay = tDOH;
 //       ramout = 4'bxxxx;
	 ramout = mem[RD_ADD];
     end
  end
end

always @(ramout or OE or WEN)
  begin
   if (OE == 1'b1 && WEN == 1'b0)
	dataout = ramout;
   else
    begin
	//output_delay = 0;
	dataout = 4'bzzzz; 
    end
  end
 
assign WRDATA = dataout;

endmodule
 
module RB_MS(WRDATA3,WRDATA2,WRDATA1,WRDATA0,WEN,OE,WRCLK,WRAD4,WRAD3,WRAD2,WRAD1,WRAD0); //
inout WRDATA3,WRDATA2,WRDATA1,WRDATA0; //
input WRAD4,WRAD3,WRAD2,WRAD1,WRAD0; //
input WEN,OE,WRCLK;

//instantiation of beh module
beh_RB_MS inst1(.WRDATA({WRDATA3_1,WRDATA2_1,WRDATA1_1,WRDATA0_1}),.WEN(WEN),.REN(1'b1),.OE(OE),.WRCLK(WRCLK),.WRAD({WRAD4,WRAD3,WRAD2,WRAD1,WRAD0}));

not I_00 (INV_WEN, WEN);
and I_01 (con, OE, INV_WEN);

bufif1 I_11 (WRDATA3, WRDATA3_1, con);
bufif0 I_21 (WRDATA3_1, WRDATA3, con);

bufif1 I_12 (WRDATA2, WRDATA2_1, con);
bufif0 I_22 (WRDATA2_1, WRDATA2, con);

bufif1 I_13 (WRDATA1, WRDATA1_1, con);
bufif0 I_23 (WRDATA1_1, WRDATA1, con);

bufif1 I_14 (WRDATA0, WRDATA0_1, con);
bufif0 I_24 (WRDATA0_1, WRDATA0, con);

reg notifier1, notifier2, notifier3, notifier4, notifier5, notifier6; 
initial
begin
 	 notifier1 = 1'b0;
	 notifier2 = 1'b0;
	 notifier3 = 1'b0;
	 notifier4 = 1'b0;
	 notifier5 = 1'b0;
	 notifier6 = 1'b0;

end
always @( notifier1 or notifier2 or notifier3 or notifier4 or notifier5 or notifier6)
begin

         inst1.notifier1 = notifier1;
         inst1.notifier2 = notifier2;
         inst1.notifier3 = notifier3;
         inst1.notifier4 = notifier4;
         inst1.notifier5 = notifier5;
         inst1.notifier6 = notifier6;
end

specify

               ( WRCLK => WRDATA0 ) = 1.00:2.00:3.00;
               ( WRCLK => WRDATA1 ) = 1.00:2.00:3.00;
               ( WRCLK => WRDATA2 ) = 1.00:2.00:3.00;
               ( WRCLK => WRDATA3 ) = 1.00:2.00:3.00;
               ( OE => WRDATA0 ) = 1.00:2.00:3.00;
               ( OE => WRDATA1 ) = 1.00:2.00:3.00;
               ( OE => WRDATA2 ) = 1.00:2.00:3.00;
               ( OE => WRDATA3 ) = 1.00:2.00:3.00;
                
specparam tWDSU = 1, tWADSU = 1, tWDH = 1, tWADH = 1, tWCLKH = 1, tWENH = 1, tRADSU = 1, tRADH = 1, tRCLKH = 1, tRENH = 1;

$setup ( WRDATA3, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA3, tWDH, notifier3 );

$setup ( WRDATA2, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA2, tWDH, notifier3 );

$setup ( WRDATA1, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA1, tWDH, notifier3 );

$setup ( WRDATA0, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA0, tWDH, notifier3 );

$setup ( WRAD4, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD4, tWADH, notifier4 );

$setup ( WRAD3, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD3, tWADH, notifier4 );

$setup ( WRAD2, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD2, tWADH, notifier4 );

$setup ( WRAD1, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD1, tWADH, notifier4 );

$setup ( WRAD0, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD0, tWADH, notifier4 );

$width ( posedge WRCLK, tWCLKH, 0,  notifier5 );

$setup ( WEN, posedge WRCLK, tWADSU, notifier6 );
$hold  ( posedge WRCLK, WEN, tWENH, notifier6 );


endspecify


endmodule

module beh_RB_MS(WRDATA,WEN,REN,OE,WRCLK,WRAD);

parameter tRCO = 2000;

inout [3:0] WRDATA;
input [4:0] WRAD;
input WEN,REN,OE,WRCLK;

reg [3:0] DIN;
reg [4:0] RD_ADD, WR_ADD, latched_add;
reg [3:0] ramout;
reg [3:0] dataout;
wire [3:0] din = DIN;
wire [3:0] WRDATA;
wire [4:0] rd_add = RD_ADD;
wire [4:0] wr_add = WR_ADD;
reg [3:0] mem [31:0];
reg RD_CLK,WR_CLK;
wire rd_clk = RD_CLK;
wire wr_clk = WR_CLK;
integer output_delay;
integer i;
reg notifier1,notifier2,notifier3,notifier4,notifier5,notifier6,notifier7,notifier8,notifier9,notifier10;

initial
 begin
   RD_CLK = 1'b0;
   WR_CLK = 1'b0;
   ramout = 4'bzzzz;
   dataout = 4'bzzzz;
 end

   always @(WEN or REN or WRAD)

   begin
    if (REN == 1'b1 && WEN == 1'b0)
	RD_ADD = WRAD;
    else
	RD_ADD = 5'bx;
   end
 
   always @(REN or WRCLK or WEN)
   
   begin
    if (REN == 1'b1 && WEN == 1'b0)
	RD_CLK = WRCLK;
    else
	RD_CLK = 1'b0;
   end

   always @(WEN or WRAD)

   begin
    if (WEN == 1'b1)
	WR_ADD = WRAD;
    else
	WR_ADD = 5'bx;
   end

   always @(posedge WR_CLK)
   begin
    if (WR_CLK == 1'b1)
	latched_add = WR_ADD;
   end

   always @(WEN or WRDATA)
   begin
    if (WEN == 1'b1)
	DIN = WRDATA;
    else
	DIN = 4'bx;
   end

   always @(WEN or WRCLK)
   begin
    if (WEN == 1'b1)
	WR_CLK = WRCLK;
    else
	WR_CLK = 1'b0;
   end
always @(notifier1 or notifier3 or notifier5 or notifier6)

  begin
	// write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
  end

always @(notifier7 or notifier8 or notifier9 or notifier10)

  begin
	// send Data_out to x immediately
	disable read;
	//output_delay = 0;
	ramout = 4'bx;
  end

always @(notifier2 or notifier4)

  begin
	disable write;
	// put x in all of the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
  end

always @(RD_CLK)

  begin
    if ((WRCLK == 1'b1) && (REN!= 1'b1))
     begin
	// if REN toggles from 1 when WRCLK is high send Data_out to x immediately
	disable read;
	//output_delay = 0;
	ramout = 4'bx;
     end
  end

always @(WR_CLK)

  begin
    if ((WRCLK == 1'b1) && (WEN!=1'b1))
     begin
	// if WEN toggles from 1 when WRCLK is high write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
     end
  end
	
always @(posedge WR_CLK)

  begin : write
   if (|(WR_ADD & ~WR_ADD) === 1'bx)
     begin
	// if WRAD is x write x into all the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
     end
   else
        begin
	mem[WR_ADD] = DIN;
        end
  end

always @(posedge RD_CLK)

  begin : read
   if (|(RD_ADD & ~RD_ADD) === 1'bx)
     begin
	// if WRAD is x send Data_out to x immediately
	//output_delay = 0;
	ramout = 4'bx;
	$display("(error) illegal address input at the rising edge of RCLK so Data_out goes x: @ %.3f ",$realtime);
     end
   else
     begin
	//output_delay = tRCO;
	ramout = mem[RD_ADD];
     end
  end

always @(ramout or REN or OE or WEN)
  begin
   if (REN == 1'b1 && OE == 1'b1 && WEN == 1'b0)
	dataout = ramout;
//     if(OE == 1'b0 || WEN == 1'b1)
   else
    begin
	//output_delay = 0;
	dataout = 4'bzzzz; 
   end
 end
 
assign WRDATA = dataout;

endmodule
module RB_SA(RDATA3,RDATA2,RDATA1,RDATA0,WDATA3,WDATA2,WDATA1,WDATA0,WEN,REN,WCLK,WAD4,WAD3,WAD2,WAD1,WAD0,RAD4,RAD3,RAD2,RAD1,RAD0); //
input WDATA3,WDATA2,WDATA1,WDATA0; //
input WAD4,WAD3,WAD2,WAD1,WAD0,RAD4,RAD3,RAD2,RAD1,RAD0; //
input WEN,REN,WCLK;
output RDATA3,RDATA2,RDATA1,RDATA0; //

//instantiation of beh module
beh_RB_SA inst1(.RDATA({RDATA3_1,RDATA2_1,RDATA1_1,RDATA0_1}),.WDATA({WDATA3,WDATA2,WDATA1,WDATA0}),.WEN(WEN),.REN(REN),.WCLK(WCLK),.WAD({WAD4,WAD3,WAD2,WAD1,WAD0}),.RAD({RAD4,RAD3,RAD2,RAD1,RAD0}));

buf I_0 (RDATA0, RDATA0_1);
buf I_1 (RDATA1, RDATA1_1);
buf I_2 (RDATA2, RDATA2_1);
buf I_3 (RDATA3, RDATA3_1);

reg notifier1, notifier2, notifier3, notifier4, notifier5, notifier6;
initial
begin

	 notifier1 = 1'b0;
	 notifier2 = 1'b0;
	 notifier3 = 1'b0;
	 notifier4 = 1'b0;
	 notifier5 = 1'b0;
	 notifier6 = 1'b0;
end
always @(notifier1 or notifier2 or notifier3 or notifier4 or notifier5 or notifier6)
begin

         inst1.notifier1 = notifier1;
         inst1.notifier2 = notifier2;
         inst1.notifier3 = notifier3;
         inst1.notifier4 = notifier4;
         inst1.notifier5 = notifier5;
         inst1.notifier6 = notifier6;
end

specify
specparam tWDSU = 1, tWADSU = 1, tWRAD = 1, tWDH = 1, tWADH = 1, tWCLKH = 1, tWENH = 1, tRENSU = 1, tWRADH = 1, tRENH = 1;

               ( RAD4 => RDATA0 ) = 1.00:2.00:3.00 ;
               ( RAD3 => RDATA0 ) = 1.00:2.00:3.00 ;
               ( RAD2 => RDATA0 ) = 1.00:2.00:3.00 ;
               ( RAD1 => RDATA0 ) = 1.00:2.00:3.00 ;
               ( RAD0 => RDATA0 ) = 1.00:2.00:3.00 ;
               ( RAD4 => RDATA1 ) = 1.00:2.00:3.00 ;
               ( RAD3 => RDATA1 ) = 1.00:2.00:3.00 ;
               ( RAD2 => RDATA1 ) = 1.00:2.00:3.00 ;
               ( RAD1 => RDATA1 ) = 1.00:2.00:3.00 ;
               ( RAD0 => RDATA1 ) = 1.00:2.00:3.00 ;
               ( RAD4 => RDATA2 ) = 1.00:2.00:3.00 ;
               ( RAD3 => RDATA2 ) = 1.00:2.00:3.00 ;
               ( RAD2 => RDATA2 ) = 1.00:2.00:3.00 ;
               ( RAD1 => RDATA2 ) = 1.00:2.00:3.00 ;
               ( RAD0 => RDATA2 ) = 1.00:2.00:3.00 ;
               ( RAD4 => RDATA3 ) = 1.00:2.00:3.00 ;
               ( RAD3 => RDATA3 ) = 1.00:2.00:3.00 ;
               ( RAD2 => RDATA3 ) = 1.00:2.00:3.00 ;
               ( RAD1 => RDATA3 ) = 1.00:2.00:3.00 ;
               ( RAD0 => RDATA3 ) = 1.00:2.00:3.00 ;
               ( REN => RDATA0 ) = 1.00:2.00:3.00 ;
               ( REN => RDATA1 ) = 1.00:2.00:3.00 ;
               ( REN => RDATA2 ) = 1.00:2.00:3.00 ;
               ( REN => RDATA3 ) = 1.00:2.00:3.00 ;
               
//$width (posedge rd_add, tWRAD, 0, notifier9 );
$width ( posedge WCLK, tWCLKH, 0,  notifier5 );

$setup ( WDATA3, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA3, tWDH, notifier3 );

$setup ( WDATA2, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA2, tWDH, notifier3 );

$setup ( WDATA1, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA1, tWDH, notifier3 );

$setup ( WDATA0, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA0, tWDH, notifier3 );

$setup ( WAD4, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD4, tWADH, notifier4 );

$setup ( WAD3, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD3, tWADH, notifier4 );

$setup ( WAD2, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD2, tWADH, notifier4 );

$setup ( WAD1, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD1, tWADH, notifier4 );

$setup ( WAD0, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD0, tWADH, notifier4 );

$setup ( WEN, posedge WCLK , tWADSU, notifier6 );
$hold  ( posedge WCLK, WEN, tWENH, notifier6 );

endspecify

endmodule

module beh_RB_SA(RDATA,WDATA,WEN,REN,WCLK,WAD,RAD);

parameter tRCO = 3000;
parameter tDOH = 1000;

input [3:0] WDATA;
input [4:0] WAD,RAD;
input WEN,REN,WCLK;
output [3:0] RDATA;

reg [3:0] DIN;
reg [4:0] RD_ADD, WR_ADD, latched_add;
reg [3:0] ramout;
wire [3:0] din = DIN;
wire [3:0] RDATA;
wire [4:0] rd_add = RD_ADD;
wire [4:0] wr_add = WR_ADD;
wire r_en = REN;
reg [3:0] mem [31:0];
reg WR_CLK;
wire wr_clk = WR_CLK;
//integer output_delay;
integer i;
reg notifier1,notifier2,notifier3,notifier4,notifier5,notifier6,notifier7,notifier8,notifier9;

initial
 begin
         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;

   WR_CLK = 1'b0;
   ramout = 4'bzzzz;
 end

   always @(REN or RAD)

   begin
    if (REN == 1'b1)
	RD_ADD = RAD;
    else
	RD_ADD = 5'bx;
   end
 
   always @(WEN or WAD)

   begin
    if (WEN == 1'b1)
	WR_ADD = WAD;
    else
	WR_ADD = 5'bx;
   end

   always @(posedge WR_CLK)
   begin
     if (WR_CLK == 1'b1)
	latched_add = WR_ADD;
   end

   always @(WEN or WDATA)
   begin
    if (WEN == 1'b1)
	DIN = WDATA;
    else
	DIN = 4'bx;
   end

   always @(WEN or WCLK)
   begin
    if (WEN == 1'b1)
	WR_CLK = WCLK;
    else
	WR_CLK = 1'b0;
   end
// in case of viol. 1 there could be a bug it might trash the previous location as latched_add will change after posedge wr_clk

always @(notifier1 or notifier3 or notifier5 or notifier6)

  begin
	// write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
  end

always @(notifier7 or notifier8 or notifier9)

  begin
	 //send RD to x immediately
	disable read;
//	output_delay = 0;
	ramout = 4'bx;
  end

always @(notifier2 or notifier4)

  begin
	disable write;
	// put x in all of the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
  end


always @(WR_CLK)

  begin
    if ((WCLK == 1'b1) && (WEN!=1'b1))
     begin
	// if WEN toggles from 1 when WCLK is high write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
     end
  end
	
always @(RD_ADD)

  begin : read
   if (REN == 1'b1)
   begin
   if (|(RD_ADD & ~RD_ADD) === 1'bx)
     begin
	// if RAD is x send RD to x immediately
//	output_delay = 0;
	ramout = 4'bx;
	$display("(error) illegal address input so RDATA goes x: @ %.3f ",$realtime);
     end
   else
     begin
//	output_delay = tDOH;
 //       ramout = 4'bxxxx;
	 ramout = mem[RD_ADD];
     end
   end
  end
 
always @(posedge WR_CLK)

  begin : write
   if (|(WR_ADD & ~WR_ADD) === 1'bx)
     begin
	// if WAD is x write x into all the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
     end
   else
	mem[WR_ADD] = DIN;
  end

assign RDATA = ramout;

endmodule
`celldefine

module RB_SS(RDATA3,RDATA2,RDATA1,RDATA0,WDATA3,WDATA2,WDATA1,WDATA0,WEN,REN,WCLK,RCLK,WAD4,WAD3,WAD2,WAD1,WAD0,RAD4,RAD3,RAD2,RAD1,RAD0); //
input WDATA3,WDATA2,WDATA1,WDATA0; //
input WAD4,WAD3,WAD2,WAD1,WAD0,RAD4,RAD3,RAD2,RAD1,RAD0; //
input WEN,REN,WCLK,RCLK;
output RDATA3,RDATA2,RDATA1,RDATA0; //

//instantiation of beh module
beh_RB_SS inst1(.RDATA({RDATA3_1,RDATA2_1,RDATA1_1,RDATA0_1}),.WDATA({WDATA3,WDATA2,WDATA1,WDATA0}),.WEN(WEN),.REN(REN),.WCLK(WCLK),.RCLK(RCLK),.WAD({WAD4,WAD3,WAD2,WAD1,WAD0}),.RAD({RAD4,RAD3,RAD2,RAD1,RAD0}));

buf D_3 (RDATA3, RDATA3_1);
buf D_2 (RDATA2, RDATA2_1);
buf D_1 (RDATA1, RDATA1_1);
buf D_0 (RDATA0, RDATA0_1);

reg notifier1, notifier3, notifier2, notifier4, notifier5, notifier6, notifier7, notifier8, notifier9, notifier10;
initial
begin

	 notifier1 = 1'b0;
	 notifier3 = 1'b0;
	 notifier2 = 1'b0;
	 notifier4 = 1'b0;
	 notifier5 = 1'b0;
	 notifier6 = 1'b0;
	 notifier7 = 1'b0;
	 notifier8 = 1'b0;
	 notifier9 = 1'b0;
	 notifier10 = 1'b0;

end

always @(notifier1 or  notifier3 or  notifier2 or  notifier4 or  notifier5 or  notifier6 or  notifier7 or  notifier8 or  notifier9 or  notifier10)
begin
         inst1.notifier1 =  notifier1;
         inst1.notifier3 =  notifier3;
         inst1.notifier2 =  notifier2;
         inst1.notifier4 =  notifier4;
         inst1.notifier5 =  notifier5;
         inst1.notifier6 =  notifier6;
         inst1.notifier7 =  notifier7;
         inst1.notifier8 =  notifier8;
         inst1.notifier9 = notifier9 ;
         inst1.notifier10 = notifier10;
end

specify
specparam tWDSU = 1, tWADSU = 1, tWDH = 1, tWADH = 1, tWCLKH = 1, tWENH = 1, tRADSU = 1, tRADH = 1, tRCLKH = 1, tRENH = 1;

(RCLK => RDATA0) =  1.00:2.00:3.00;
(RCLK => RDATA1) =  1.00:2.00:3.00;
(RCLK => RDATA2) =  1.00:2.00:3.00;
(RCLK => RDATA3) =  1.00:2.00:3.00;

$setup ( WDATA3, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA3, tWDH, notifier3 );

$setup ( WDATA2, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA2, tWDH, notifier3 );

$setup ( WDATA1, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA1, tWDH, notifier3 );

$setup ( WDATA0, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA0, tWDH, notifier3 );

$setup ( WAD4, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD4, tWADH, notifier4 );

$setup ( WAD3, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD3, tWADH, notifier4 );

$setup ( WAD2, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD2, tWADH, notifier4 );

$setup ( WAD1, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD1, tWADH, notifier4 );

$setup ( WAD0, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD0, tWADH, notifier4 );

$setup ( RAD4, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD4, tRADH, notifier8 );

$setup ( RAD3, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD3, tRADH, notifier8 );

$setup ( RAD2, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD2, tRADH, notifier8 );

$setup ( RAD1, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD1, tRADH, notifier8 );

$setup ( RAD0, posedge RCLK &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN, RAD0, tRADH, notifier8 );

$setup ( WEN, posedge WCLK, tWADSU, notifier6 );
$hold  ( posedge WCLK, WEN, tWENH, notifier6 );

$width ( posedge WCLK, tWCLKH, 0,  notifier5 );
//$width ( negedge WCLK, tWCLKH, 0,  notifier5 );

$width ( posedge RCLK, tRCLKH, 0,  notifier9 );
//$width ( negedge RCLK, tRCLKH, 0,  notifier9 );

$setup ( REN, posedge RCLK, tWADSU, notifier10 );
$hold  ( posedge RCLK, REN, tRENH, notifier10 );
endspecify

endmodule

`endcelldefine 

module beh_RB_SS(RDATA,WDATA,WEN,REN,WCLK,RCLK,WAD,RAD);

parameter tRCO = 1;

input [3:0] WDATA;
input [4:0] WAD,RAD;
input WEN,REN,WCLK,RCLK;
output [3:0] RDATA;

reg [3:0] DIN;
reg [4:0] RD_ADD, WR_ADD, latched_add;
reg [3:0] ramout;
wire [3:0] din = DIN;
wire [3:0] RDATA;
wire [4:0] rd_add = RD_ADD;
wire [4:0] wr_add = WR_ADD;
reg [3:0] mem [31:0];
reg RD_CLK,WR_CLK;
wire rd_clk = RD_CLK;
wire wr_clk = WR_CLK;
integer output_delay;
integer i;
reg notifier1,notifier2,notifier3,notifier4,notifier5,notifier6,notifier7,notifier8,notifier9,notifier10;

initial
 begin
   RD_CLK = 1'b0;
   WR_CLK = 1'b0;
         notifier1 = 1'b0;
         notifier3 = 1'b0;
         notifier2 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;
         notifier7 = 1'b0;
         notifier8 = 1'b0;
         notifier9 = 1'b0;
         notifier10 = 1'b0;

 end

   always @(REN or RAD)

   begin
    if (REN == 1'b1)
	RD_ADD = RAD;
    else
	RD_ADD = 5'bx;
   end
 
   always @(REN or RCLK)
   
   begin
    if (REN == 1'b1)
	RD_CLK = RCLK;
    else
	RD_CLK = 1'b0;
   end

   always @(WEN or WAD)

   begin
    if (WEN == 1'b1)
	WR_ADD = WAD;
    else
	WR_ADD = 5'bx;
   end

   always @(posedge WR_CLK)
   begin
     if (WR_CLK == 1'b1)
	latched_add = WR_ADD;
   end

   always @(WEN or WDATA)
   begin
    if (WEN == 1'b1)
	DIN = WDATA;
    else
	DIN = 4'bx;
   end

   always @(WEN or WCLK)
   begin
    if (WEN == 1'b1)
	WR_CLK = WCLK;
    else
	WR_CLK = 1'b0;
   end
// in case of viol. 1 there could be a bug it might trash the previous location as latched_add will change after posedge wr_clk

always @(notifier1 or notifier3 or notifier5 or notifier6)

  begin
	// write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
  end

always @(notifier7 or notifier8 or notifier9 or notifier10)

  begin
	// send RD to x immediately
	disable read;
	//output_delay = 0;
	ramout = 4'bx;
  end

always @(notifier2 or notifier4)

  begin
	disable write;
	// put x in all of the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
  end

always @(RD_CLK)

  begin
    if ((RCLK == 1'b1) && (REN!= 1'b1))
     begin
	// if REN toggles from 1 when RCLK is high send RD to x immediately
	disable read;
	//output_delay = 0;
	ramout = 4'bx;
     end
  end

always @(WR_CLK)

  begin
    if ((WCLK == 1'b1) && (WEN!=1'b1))
     begin
	// if WEN toggles from 1 when WCLK is high write x into the memory location
	disable write;
	mem[latched_add] = 4'bx;
     end
  end
	
always @(posedge RD_CLK)

  begin : read
   if (|(RD_ADD & ~RD_ADD) === 1'bx)
     begin
	// if RAD is x send RD to x immediately
	//output_delay = 0;
	ramout = 4'bx;
	$display("(error) illegal address input at the rising edge of RCLK so RDATA goes x: @ %.3f ",$realtime);
     end
   else
     begin
	//output_delay = tRCO;
	ramout = mem[RD_ADD];
     end
  end
 
always @(posedge WR_CLK)

  begin : write
   if (|(WR_ADD & ~WR_ADD) === 1'bx)
     begin
	// if WAD is x write x into all the memory locations
	for(i=0; i<=31;i=i+1)
	mem[i] = 4'bx;
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime);
     end
   else
	mem[WR_ADD] = DIN;
  end

//assign #output_delay RDATA = ramout;
assign  RDATA = ramout;

endmodule



module RB_DAR(RDATA3,RDATA2,RDATA1,RDATA0,WRDATA3,WRDATA2,WRDATA1,WRDATA0,WEN,REN,OE,WRCLK,ADRCLK,WRAD4,WRAD3,WRAD2,WRAD1,WRAD0,RAD4,RAD3,RAD2,RAD1,RAD0); //
inout WRDATA3,WRDATA2,WRDATA1,WRDATA0; //
input WRAD4,WRAD3,WRAD2,WRAD1,WRAD0,RAD4,RAD3,RAD2,RAD1,RAD0; //
input WEN,REN,OE,WRCLK,ADRCLK; 
output RDATA3,RDATA2,RDATA1,RDATA0; //

//instantiation of beh module
beh_RB_DAR inst1(.RDATA({RDATA3_1,RDATA2_1,RDATA1_1,RDATA0_1}),.WRDATA({WRDATA3_1,WRDATA2_1,WRDATA1_1,WRDATA0_1}),.WEN(WEN),.REN(REN),.OE(OE),.WRCLK(WRCLK),.ADRCLK(ADRCLK),.WRAD({WRAD4,WRAD3,WRAD2,WRAD1,WRAD0}),.RAD({RAD4,RAD3,RAD2,RAD1,RAD0}));


buf (RDATA3,RDATA3_1);
buf (RDATA2,RDATA2_1);
buf (RDATA1,RDATA1_1);
buf (RDATA0,RDATA0_1);

not I_00 (INV_WEN, WEN);
and I_01 (con, REN, OE, INV_WEN);

bufif1 I_11 (WRDATA3, WRDATA3_1, con);
bufif0 I_21 (WRDATA3_1, WRDATA3, con);

bufif1 I_12 (WRDATA2, WRDATA2_1, con);
bufif0 I_22 (WRDATA2_1, WRDATA2, con);

bufif1 I_13 (WRDATA1, WRDATA1_1, con);
bufif0 I_23 (WRDATA1_1, WRDATA1, con);

bufif1 I_14 (WRDATA0, WRDATA0_1, con);
bufif0 I_24 (WRDATA0_1, WRDATA0, con);


reg notifier1, notifier2, notifier3, notifier4, notifier5, notifier6,notifier7,notifier8,notifier11;
initial
begin
         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;
         notifier7 = 1'b0;
         notifier8 = 1'b0;
         notifier11 = 1'b0;

end

always @( notifier1 or notifier2 or notifier3 or notifier4 or notifier5 or notifier6 or notifier7 or notifier8 or notifier11)
begin

         inst1.notifier1 = notifier1;
         inst1.notifier2 = notifier2;
         inst1.notifier3 = notifier3;
         inst1.notifier4 = notifier4;
         inst1.notifier5 = notifier5;
         inst1.notifier6 = notifier6;
         inst1.notifier7 = notifier7;
         inst1.notifier8 = notifier8;
         inst1.notifier11 = notifier11;
end


specify 

               (WRAD4 =>WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD3 =>WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD2 =>WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD1 =>WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD0 =>WRDATA0 ) = 1.00:2.00:3.00;
               (WRAD4 =>WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD3 =>WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD2 =>WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD1 =>WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD0 =>WRDATA1 ) = 1.00:2.00:3.00;
               (WRAD4 =>WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD3 =>WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD2 =>WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD1 =>WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD0 =>WRDATA2 ) = 1.00:2.00:3.00;
               (WRAD4 =>WRDATA3 ) = 1.00:2.00:3.00;
               (WRAD3 =>WRDATA3 ) = 1.00:2.00:3.00;
               (WRAD2 =>WRDATA3 ) = 1.00:2.00:3.00;
               (WRAD1 =>WRDATA3 ) = 1.00:2.00:3.00;
               (WRAD0 =>WRDATA3 ) = 1.00:2.00:3.00;
               (OE =>WRDATA0 ) = 1.00:2.00:3.00;
               (OE =>WRDATA1 ) = 1.00:2.00:3.00;
               (OE =>WRDATA2 ) = 1.00:2.00:3.00;
               (OE =>WRDATA3 ) = 1.00:2.00:3.00;
               (ADRCLK =>RDATA0 ) = 1.00:2.00:3.00;
               (ADRCLK =>RDATA1 ) = 1.00:2.00:3.00;
               (ADRCLK =>RDATA2 ) = 1.00:2.00:3.00;
               (ADRCLK =>RDATA3 ) = 1.00:2.00:3.00;

 
specparam tWDSU = 1, tWADSU = 1, tWDH = 1, tWADH = 1, tWRCLKH = 3, tWENH = 1, tRADSU = 1, tRADH = 1, tWRADSU = 1, tWRADH = 1, tADRCLKW = 3, tRENSU = 1, tRENH = 1, tRENSU_W = 1, tRENH_W = 1; 

$setup ( WRDATA3, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA3, tWDH, notifier3 );

$setup ( WRDATA2, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA2, tWDH, notifier3 );

$setup ( WRDATA1, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA1, tWDH, notifier3 );

$setup ( WRDATA0, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA0, tWDH, notifier3 );

$setup ( WRAD4, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD4, tWADH, notifier4 );

$setup ( WRAD3, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD3, tWADH, notifier4 );

$setup ( WRAD2, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD2, tWADH, notifier4 );

$setup ( WRAD1, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD1, tWADH, notifier4 );

$setup ( WRAD0, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD0, tWADH, notifier4 );

$width ( posedge WRCLK, tWRCLKH, 0,  notifier5 ); 
$width ( posedge ADRCLK, tADRCLKW, 0, notifier11 );

$setup ( WEN, posedge ADRCLK, tWADSU, notifier6 );
$hold  ( posedge ADRCLK, WEN, tWENH, notifier6 );

$setup ( RAD4, posedge ADRCLK, tRADSU, notifier7 );
$hold (posedge ADRCLK, RAD4, tRADH, notifier8 );

$setup ( RAD3, posedge ADRCLK, tRADSU, notifier7 );
$hold (posedge ADRCLK, RAD3, tRADH, notifier8 );

$setup ( RAD2, posedge ADRCLK, tRADSU, notifier7 );
$hold (posedge ADRCLK, RAD2, tRADH, notifier8 );

$setup ( RAD1, posedge ADRCLK, tRADSU, notifier7 );
$hold (posedge ADRCLK, RAD1, tRADH, notifier8 );

$setup ( RAD0, posedge ADRCLK, tRADSU, notifier7 );
$hold (posedge ADRCLK, RAD0, tRADH, notifier8 );


endspecify 

endmodule


module beh_RB_DAR(RDATA,WRDATA,WEN,REN,OE,WRCLK,ADRCLK,WRAD,RAD); 
 
parameter tRDO = 3; 
parameter tDOH = 1; 
 
 
inout [3:0] WRDATA; 
input [4:0] WRAD,RAD; 
input WEN,REN,OE,WRCLK,ADRCLK; 
output [3:0] RDATA; 
 
reg [3:0] DIN; 
reg [4:0] RD_ADD, RD_ADD_W, WR_ADD, latched_add, read_add, read_add_w; 
reg [3:0] ramout, dataout; 
reg [3:0] ramout_w, dataout_w; 
wire [3:0] din = DIN; 
wire [3:0] RDATA, WRDATA; 
wire [4:0] rd_add = read_add; 
wire [4:0] rd_add_w = read_add_w; 
wire [4:0] wr_add = WR_ADD; 
reg [3:0] mem [31:0]; 
reg WR_CLK,ADR_CLK; 
wire wr_clk = WR_CLK; 
wire adr_clk = ADR_CLK;
wire r_en = REN; 
wire r_en_w = OE & REN & ~WEN; 
integer output_delay; 
integer output_delay_w; 
integer i; 
reg notifier1,notifier2,notifier3,notifier4,notifier5,notifier6,notifier7,notifier8,notifier9,notifier10,notifier11,notifier12,notifier13; 
 
initial 
 begin 
         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;
         notifier7 = 1'b0;
         notifier8 = 1'b0;
         notifier11 = 1'b0;

   WR_CLK = 1'b0; 
   ramout_w = 4'bzzzz; 
   dataout = 4'bzzzz; 
 
 end 

always @(posedge ADR_CLK)

   begin
    if (ADR_CLK == 1'b1)
     read_add_w = WRAD;
   end
 
always @(posedge ADRCLK)
   begin
       read_add = RAD;
   end

   always @(read_add ) 
 
   begin 
	RD_ADD = read_add; 
   end 
  
   always @(read_add_w ) 
 
   begin 
	RD_ADD_W = read_add_w; 
   end 
 
  
 
   always @(WEN or WRAD) 
 
   begin 
    if (WEN == 1'b1) 
	WR_ADD = WRAD; 
    else 
	WR_ADD = 5'bx; 
   end 
 
   always @(posedge WR_CLK) 
   begin 
     if (WR_CLK == 1'b1) 
	latched_add = WR_ADD; 
   end 
 
   always @(WEN or WRDATA) 
   begin 
    if (WEN == 1'b1) 
	DIN = WRDATA; 
    else 
	DIN = 4'bx; 
   end 
 
   always @(WEN or ADRCLK) 
   begin 
    if (WEN == 1'b0) 
	ADR_CLK = ADRCLK; 
    else 
	ADR_CLK = 1'b0; 
   end 

   always @(WEN or WRCLK) 
   begin 
    if (WEN == 1'b1) 
	WR_CLK = WRCLK; 
    else 
	WR_CLK = 1'b0; 
   end 
 
 
 
always @(notifier1 or notifier3 or notifier5 or notifier6) 
  begin 
	// write x into the memory location 
	disable write; 
	mem[latched_add] = 4'bx; 
  end 
 
always @(notifier7 or  notifier8 or notifier11 or notifier12 ) 
 
  begin 
	// send RD to x immediately 
	disable read; 
	//output_delay = 0; 
	ramout = 4'bx; 
  end 
 
always @(notifier9  or notifier10 or notifier11 or notifier13 ) 
 
  begin 
	// send RD to x immediately 
	disable read_w; 
	//output_delay_w = 0; 
	ramout_w = 4'bx; 
  end 
 
always @(notifier2 or notifier4) 
 
  begin 
	disable write; 
	// put x in all of the memory locations 
	for(i=0; i<=31;i=i+1) 
	mem[i] = 4'bx; 
	$display("(error) illegal address input at the rising edge of WRCLK so writing X in all of the memory locations: @ %.3f ",$realtime); 
  end 
 
 
always @(WR_CLK) 
 
  begin 
    if ((WRCLK == 1'b1) && (WEN!=1'b1)) 
     begin 
	// if WEN toggles from 1 when WRCLK is high write x into the memory location 
	disable write; 
	mem[latched_add] = 4'bx; 
     end 
  end 
	 
always @(posedge WR_CLK) 
 
  begin : write 
   if (|(WR_ADD & ~WR_ADD) === 1'bx) 
     begin 
	// if WRAD is x write x into all the memory locations 
	for(i=0; i<=31;i=i+1) 
	mem[i] = 4'bx; 
	$display("(error) illegal address input at the rising edge of WRCLK so writing X in all of the memory locations: @ %.3f ",$realtime); 
     end 
   else 
	mem[WR_ADD] = DIN; 
  end 
 
 
always @(REN or RD_ADD) 
 
  begin : read 
   if ( REN == 1'b1 ) 
    begin 
     if (|(RD_ADD & ~RD_ADD) === 1'bx) 
      begin 
        // if RAD is x send RD to x immediately 
        //output_delay = 0; 
        ramout = 4'bx; 
        $display("(error) illegal address input so RDATA goes x: @ %.3f ",$realtime 
); 
      end 
    else 
     begin 
        //output_delay = tDOH; 
        ramout = mem[RD_ADD]; 
     end 
    end 
  end 
 
always @(REN or RD_ADD_W) 
 
  begin : read_w 
   if (REN == 1'b1 ) 
    begin 
     if (|(RD_ADD_W & ~RD_ADD_W) === 1'bx) 
      begin 
        // if WRAD is x send RD to x immediately 
        //output_delay_w = 0; 
        ramout_w = 4'bx; 
        $display("(error) illegal address input so WRDATA goes x: @ %.3f ",$realtime 
); 
      end 
    else 
     begin 
        //output_delay_w = tDOH; 
        //ramout_w = 4'bx; 
        ramout_w = mem[RD_ADD_W]; 
     end 
    end 
  end 
 
always @(ramout_w or REN or OE or WEN) 
 
  begin 
   if (REN == 1'b1 && OE == 1'b1 && WEN == 1'b0) 
        dataout = ramout_w; 
   else 
    begin 
	//output_delay_w = 0; 
        dataout = 4'bzzzz; 
    end 
  end 
 
assign  RDATA = ramout; 
 
assign  WRDATA = dataout; 
 
 
 
endmodule 
 

module RB_MAR(WRDATA3,WRDATA2,WRDATA1,WRDATA0,WEN,OE,WRCLK,ADRCLK,WRAD4,WRAD3,WRAD2,WRAD1,WRAD0); //
inout WRDATA3,WRDATA2,WRDATA1,WRDATA0; //
input WRAD4,WRAD3,WRAD2,WRAD1,WRAD0; //
input WEN,OE,WRCLK,ADRCLK; 

//instantiation of beh module
beh_RB_MAR inst1(.WRDATA({WRDATA3_1,WRDATA2_1,WRDATA1_1,WRDATA0_1}),.WEN(WEN),.OE(OE),.WCLK(WRCLK),.ADRCLK(ADRCLK),.WRAD({WRAD4,WRAD3,WRAD2,WRAD1,WRAD0}));

not I_00 (INV_WEN, WEN);
and I_01 (con, OE, INV_WEN);

bufif1 I_11 (WRDATA3, WRDATA3_1, con);
bufif0 I_21 (WRDATA3_1, WRDATA3, con);

bufif1 I_12 (WRDATA2, WRDATA2_1, con);
bufif0 I_22 (WRDATA2_1, WRDATA2, con);

bufif1 I_13 (WRDATA1, WRDATA1_1, con);
bufif0 I_23 (WRDATA1_1, WRDATA1, con);

bufif1 I_14 (WRDATA0, WRDATA0_1, con);
bufif0 I_24 (WRDATA0_1, WRDATA0, con);


reg notifier1, notifier2, notifier3, notifier4, notifier5, notifier6,notifier7,notifier8,notifier9;
initial
begin
         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;
         notifier7 = 1'b0;
         notifier8 = 1'b0;
         notifier9 = 1'b0;

end

always @( notifier1 or notifier2 or notifier3 or notifier4 or notifier5 or notifier6 or notifier7 or notifier8 or notifier9)
begin

         inst1.notifier1 = notifier1;
         inst1.notifier2 = notifier2;
         inst1.notifier3 = notifier3;
         inst1.notifier4 = notifier4;
         inst1.notifier5 = notifier5;
         inst1.notifier6 = notifier6;
         inst1.notifier7 = notifier7;
         inst1.notifier8 = notifier8;
         inst1.notifier9 = notifier9;
end


specify 

               (ADRCLK =>WRDATA0 ) = 1.00:2.00:3.00;
               (ADRCLK =>WRDATA1 ) = 1.00:2.00:3.00;
               (ADRCLK =>WRDATA2 ) = 1.00:2.00:3.00;
               (ADRCLK =>WRDATA3 ) = 1.00:2.00:3.00;
               (OE =>WRDATA0 ) = 1.00:2.00:3.00;
               (OE =>WRDATA1 ) = 1.00:2.00:3.00;
               (OE =>WRDATA2 ) = 1.00:2.00:3.00;
               (OE =>WRDATA3 ) = 1.00:2.00:3.00;

 
specparam tWDSU = 1, tWADSU = 1, tWDH = 1, tWADH = 1, tWRCLKH = 3, tWENH = 1, tWRAD = 3, tADRCLKW = 3, tRADSU =1, tRADH = 1; 

$setup ( WRDATA3, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA3, tWDH, notifier3 );

$setup ( WRDATA2, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA2, tWDH, notifier3 );

$setup ( WRDATA1, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA1, tWDH, notifier3 );

$setup ( WRDATA0, posedge WRCLK &&&  WEN, tWDSU, notifier1 );
$hold  ( posedge WRCLK &&&  WEN, WRDATA0, tWDH, notifier3 );

$setup ( WRAD4, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD4, tWADH, notifier4 );

$setup ( WRAD3, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD3, tWADH, notifier4 );

$setup ( WRAD2, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD2, tWADH, notifier4 );

$setup ( WRAD1, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD1, tWADH, notifier4 );

$setup ( WRAD0, posedge WRCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WRCLK &&& WEN, WRAD0, tWADH, notifier4 );

$width ( posedge WRCLK, tWRCLKH, 0,  notifier5 );
$width ( posedge ADRCLK, tADRCLKW, 0, notifier7 );

$setup ( WEN, posedge ADRCLK, tWADSU, notifier6 );
$hold  ( posedge ADRCLK, WEN, tWENH, notifier6 );

$setup ( WRAD4, posedge ADRCLK, tRADSU, notifier8 );
$hold (posedge ADRCLK, WRAD4, tRADH, notifier9 );

$setup ( WRAD3, posedge ADRCLK, tRADSU, notifier8 );
$hold (posedge ADRCLK, WRAD3, tRADH, notifier9 );

$setup ( WRAD2, posedge ADRCLK, tRADSU, notifier8 );
$hold (posedge ADRCLK, WRAD2, tRADH, notifier9 );

$setup ( WRAD1, posedge ADRCLK, tRADSU, notifier8 );
$hold (posedge ADRCLK, WRAD1, tRADH, notifier9 );

$setup ( WRAD0, posedge ADRCLK, tRADSU, notifier8 );
$hold (posedge ADRCLK, WRAD0, tRADH, notifier9 );

endspecify 

endmodule

 
module beh_RB_MAR(WRDATA,WEN,OE,WCLK,ADRCLK,WRAD); 
 
parameter tRCO = 3; 
parameter tDOH = 1; 
 
inout [3:0] WRDATA; 
input [4:0] WRAD; 
input WEN,OE,WCLK,ADRCLK; 
 
reg [3:0] DIN; 
reg [4:0] RD_ADD, WR_ADD, latched_add, read_add; 
reg [3:0] ramout; 
reg [3:0] dataout; 
wire [3:0] din = DIN; 
wire [3:0] WRDATA; 
wire [4:0] rd_add = RD_ADD; 
wire [4:0] wr_add = WR_ADD; 
reg [3:0] mem [31:0]; 
reg WR_CLK,ADR_CLK; 
wire wr_clk = WR_CLK; 
wire adr_clk = ADR_CLK; 
integer output_delay; 
integer i; 
reg notifier1,notifier2,notifier3,notifier4,notifier5,notifier6,notifier7,notifier8,notifier9; 
 
initial 
 begin 
         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;
         notifier7 = 1'b0;
         notifier8 = 1'b0;
         notifier9 = 1'b0;

   WR_CLK = 1'b0; 
   ramout = 4'bzzzz; 
   dataout = 4'bzzzz; 
 end 
 
   always @(posedge ADR_CLK)
   
   begin
   if (ADR_CLK == 1'b1)
       read_add = WRAD;
   end

   always @(read_add) 
 
   begin 
	RD_ADD = read_add; 
   end 
  
 
   always @(WEN or WRAD) 
 
   begin 
    if (WEN == 1'b1) 
	WR_ADD = WRAD; 
    else 
	WR_ADD = 5'bx; 
   end 
 
   always @(posedge WR_CLK) 
   begin 
    if (WR_CLK == 1'b1) 
	latched_add = WR_ADD; 
   end 
 
   always @(WEN or WRDATA) 
   begin 
    if (WEN == 1'b1) 
	DIN = WRDATA; 
    else 
	DIN = 4'bx; 
   end 
 
   always @(WEN or WCLK) 
   begin 
    if (WEN == 1'b1) 
	WR_CLK = WCLK; 
    else 
	WR_CLK = 1'b0; 
   end 

   always @(WEN or ADRCLK)
   begin
     if (WEN == 1'b0)
         ADR_CLK = ADRCLK;
     else
         ADR_CLK = 1'b0;
   end
 
 
always @(notifier1 or notifier3 or notifier5 or notifier6) 
 
  begin 
	// write x into the memory location 
	disable write; 
	mem[latched_add] = 4'bx; 
  end 
 
always @(notifier7 or notifier8 or notifier9 )  
 
  begin 
	// send Data_out to x immediately 
	disable read; 
	//output_delay = 0; 
	ramout = 4'bx; 
  end 
 
always @(notifier2 or notifier4) 
 
  begin 
	disable write; 
	// put x in all of the memory locations 
	for(i=0; i<=31;i=i+1) 
	mem[i] = 4'bx; 
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime); 
  end 
 
 
always @(WR_CLK) 
 
  begin 
    if ((WCLK == 1'b1) && (WEN!=1'b1)) 
     begin 
	// if WEN toggles from 1 when WCLK is high write x into the memory location 
	disable write; 
	mem[latched_add] = 4'bx; 
     end 
  end 
	 
always @(posedge WR_CLK) 
 
  begin : write 
   if (|(WR_ADD & ~WR_ADD) === 1'bx) 
     begin 
	// if WRAD is x write x into all the memory locations 
	for(i=0; i<=31;i=i+1) 
	mem[i] = 4'bx; 
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime); 
     end 
   else 
	mem[WR_ADD] = DIN; 
  end 
 
always @(RD_ADD) 
 begin : read 

//if (OE == 1'b1 && WEN == 1'b0) 
begin 
   if (|(RD_ADD & ~RD_ADD) === 1'bx) 
     begin 
	// if WRAD is x send Data_out to x immediately 
	//output_delay = 0; 
	ramout = 4'bx; 
	$display("(error) illegal address input at the rising edge of OE so Data_out goes x: @ %.3f ",$realtime); 
     end 
   else 
     begin 
	//output_delay = tDOH; 
        //ramout = 4'bxxxx; 
	ramout = mem[RD_ADD]; 
     end 
  end 
end 
 
always @(ramout or OE or WEN) 
  begin 
   if (OE == 1'b1 && WEN == 1'b0) 
	dataout = ramout; 
   else 
    begin 
	//output_delay = 0; 
	dataout = 4'bzzzz;  
    end 
  end 
  
assign WRDATA = dataout; 
 
endmodule 
 

module RB_SAR(RDATA3,RDATA2,RDATA1,RDATA0,WDATA3,WDATA2,WDATA1,WDATA0,WEN,REN,WCLK,ADRCLK,WAD4,WAD3,WAD2,WAD1,WAD0,RAD4,RAD3,RAD2,RAD1,RAD0); //
input WDATA3,WDATA2,WDATA1,WDATA0; //
input WAD4,WAD3,WAD2,WAD1,WAD0,RAD4,RAD3,RAD2,RAD1,RAD0; //
input WEN,REN,WCLK,ADRCLK; 
output RDATA3,RDATA2,RDATA1,RDATA0; //

//instantiation of beh module
beh_RB_SAR inst1(.RDATA({RDATA3_1,RDATA2_1,RDATA1_1,RDATA0_1}),.WDATA({WDATA3,WDATA2,WDATA1,WDATA0}),.WEN(WEN),.REN(REN),.WCLK(WCLK),.ADRCLK(ADRCLK),.WAD({WAD4,WAD3,WAD2,WAD1,WAD0}),.RAD({RAD4,RAD3,RAD2,RAD1,RAD0}));


buf I_0 (RDATA0, RDATA0_1);
buf I_1 (RDATA1, RDATA1_1);
buf I_2 (RDATA2, RDATA2_1);
buf I_3 (RDATA3, RDATA3_1);

reg notifier1, notifier2, notifier3, notifier4, notifier5, notifier6,notifier10,notifier11,notifier12;
initial
begin

         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;
         notifier10 = 1'b0;
         notifier11 = 1'b0;
         notifier12 = 1'b0;
end
always @(notifier1 or notifier2 or notifier3 or notifier4 or notifier5 or notifier6 or notifier10 or notifier11 or notifier12)
begin

         inst1.notifier1 = notifier1;
         inst1.notifier2 = notifier2;
         inst1.notifier3 = notifier3;
         inst1.notifier4 = notifier4;
         inst1.notifier5 = notifier5;
         inst1.notifier6 = notifier6;
         inst1.notifier10 = notifier10;
         inst1.notifier11 = notifier11;
         inst1.notifier12 = notifier12;
end

specify 

               (ADRCLK =>RDATA0 ) = 1.00:2.00:3.00 ;
               (ADRCLK =>RDATA1 ) = 1.00:2.00:3.00 ;
               (ADRCLK =>RDATA2 ) = 1.00:2.00:3.00 ;
               (ADRCLK =>RDATA3 ) = 1.00:2.00:3.00 ;
               (REN =>RDATA0 ) = 1.00:2.00:3.00 ;
               (REN =>RDATA1 ) = 1.00:2.00:3.00 ;
               (REN =>RDATA2 ) = 1.00:2.00:3.00 ;
               (REN =>RDATA3 ) = 1.00:2.00:3.00 ;

 
specparam tWDSU = 1, tWADSU = 1, tWRAD = 1, tWDH = 1, tWADH = 1, tWCLKH = 1, tWENH = 1, tRENSU = 1, tWRADH = 1, tRENH = 1, tRADSU = 1, tRADH = 1, tADRCLKW = 1; 

$setup ( WDATA3, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA3, tWDH, notifier3 );

$setup ( WDATA2, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA2, tWDH, notifier3 );

$setup ( WDATA1, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA1, tWDH, notifier3 );

$setup ( WDATA0, posedge WCLK &&& WEN, tWDSU, notifier1 );
$hold  ( posedge WCLK &&& WEN, WDATA0, tWDH, notifier3 );

$setup ( WAD4, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD4, tWADH, notifier4 );

$setup ( WAD3, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD3, tWADH, notifier4 );

$setup ( WAD2, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD2, tWADH, notifier4 );

$setup ( WAD1, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD1, tWADH, notifier4 );

$setup ( WAD0, posedge WCLK &&& WEN, tWADSU, notifier2 );
$hold  ( posedge WCLK &&& WEN, WAD0, tWADH, notifier4 );

$setup ( WEN, posedge WCLK , tWADSU, notifier6 );
$hold  ( posedge WCLK, WEN, tWENH, notifier6 );

$width ( posedge WCLK, tWCLKH, 0,  notifier5 );
$width ( posedge ADRCLK, tADRCLKW, 0, notifier12 );

$setup ( WEN, posedge ADRCLK, tWADSU, notifier6 );
$hold  ( posedge ADRCLK, WEN, tWENH, notifier6 );
 
$setup ( RAD4, posedge ADRCLK, tRADSU, notifier10 );
$hold (posedge ADRCLK, RAD4, tRADH, notifier11 );
 
$setup ( RAD3, posedge ADRCLK, tRADSU, notifier10 );
$hold (posedge ADRCLK, RAD3, tRADH, notifier11 );
 
$setup ( RAD2, posedge ADRCLK, tRADSU, notifier10 );
$hold (posedge ADRCLK, RAD2, tRADH, notifier11 );
 
$setup ( RAD1, posedge ADRCLK, tRADSU, notifier10 );
$hold (posedge ADRCLK, RAD1, tRADH, notifier11 );
 
$setup ( RAD0, posedge ADRCLK, tRADSU, notifier10 );
$hold (posedge ADRCLK, RAD0, tRADH, notifier11 );


endspecify 
endmodule

 
module beh_RB_SAR(RDATA,WDATA,WEN,REN,WCLK,ADRCLK,WAD,RAD); 
 
parameter tRCO = 3000; 
parameter tDOH = 1000; 
 
input [3:0] WDATA; 
input [4:0] WAD,RAD; 
input WEN,REN,WCLK,ADRCLK; 
output [3:0] RDATA; 
 
reg [3:0] DIN; 
reg [4:0] RD_ADD, WR_ADD, latched_add,read_add; 
reg [3:0] ramout; 
wire [3:0] din = DIN; 
wire [3:0] RDATA; 
wire [4:0] rd_add = RD_ADD; 
wire [4:0] wr_add = WR_ADD; 
wire r_en = REN; 
reg [3:0] mem [31:0]; 
reg WR_CLK,ADR_CLK; 
wire wr_clk = WR_CLK; 
wire adr_clk = ADR_CLK; 
integer output_delay; 
integer i; 
reg notifier1,notifier2,notifier3,notifier4,notifier5,notifier6,notifier7,notifier8,notifier9,notifier10,notifier11,notifier12; 
 
initial 
 begin 
         notifier1 = 1'b0;
         notifier2 = 1'b0;
         notifier3 = 1'b0;
         notifier4 = 1'b0;
         notifier5 = 1'b0;
         notifier6 = 1'b0;
         notifier10 = 1'b0;
         notifier11 = 1'b0;
         notifier12 = 1'b0;

   WR_CLK = 1'b0; 
   ramout = 4'bzzzz; 
 end 

  always @(posedge ADRCLK)
   begin
    if (ADRCLK == 1'b1)
     read_add = RAD;
   end 
   


   always @(read_add) 
 
   begin 
	RD_ADD = read_add; 
   end 
  
   always @(WEN or WAD) 
 
   begin 
    if (WEN == 1'b1) 
	WR_ADD = WAD; 
    else 
	WR_ADD = 5'bx; 
   end 
 
   always @(posedge WR_CLK) 
   begin 
     if (WR_CLK == 1'b1) 
	latched_add = WR_ADD; 
   end 
 
   always @(WEN or WDATA) 
   begin 
    if (WEN == 1'b1) 
	DIN = WDATA; 
    else 
	DIN = 4'bx; 
   end 
 
   always @(WEN or WCLK) 
   begin 
    if (WEN == 1'b1) 
	WR_CLK = WCLK; 
    else 
	WR_CLK = 1'b0; 
   end 
   
 
 
// in case of viol. 1 there could be a bug it might trash the previous location as latched_add will change after posedge wr_clk 
 
always @(notifier1 or notifier3 or notifier5 or notifier6) 
 
  begin 
	// write x into the memory location 
	disable write; 
	mem[latched_add] = 4'bx; 
  end 
 
always @(notifier7 or notifier8 or notifier10 or notifier11 or notifier12 ) 
 
  begin 
	 //send RD to x immediately 
	disable read; 
	//output_delay = 0; 
	ramout = 4'bx; 
  end 
 
always @(notifier2 or notifier4) 
 
  begin 
	disable write; 
	// put x in all of the memory locations 
	for(i=0; i<=31;i=i+1) 
	mem[i] = 4'bx; 
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime); 
  end 
 
 
always @(WR_CLK) 
 
  begin 
    if ((WCLK == 1'b1) && (WEN!=1'b1)) 
     begin 
	// if WEN toggles from 1 when WCLK is high write x into the memory location 
	disable write; 
	mem[latched_add] = 4'bx; 
     end 
  end 
	 
always @(RD_ADD) 
 
  begin : read 
   if (REN == 1'b1) 
   begin 
   if (|(RD_ADD & ~RD_ADD) === 1'bx) 
     begin 
	// if RAD is x send RD to x immediately 
	//output_delay = 0; 
	ramout = 4'bx; 
	$display("(error) illegal address input so RDATA goes x: @ %.3f ",$realtime); 
     end 
   else 
     begin 
	//output_delay = tDOH; 
        //ramout = 4'bxxxx; 
	ramout = mem[RD_ADD]; 
     end 
   end 
  end 
  
always @(posedge WR_CLK) 
 
  begin : write 
   if (|(WR_ADD & ~WR_ADD) === 1'bx) 
     begin 
	// if WAD is x write x into all the memory locations 
	for(i=0; i<=31;i=i+1) 
	mem[i] = 4'bx; 
	$display("(error) illegal address input at the rising edge of WCLK so writing X in all of the memory locations: @ %.3f ",$realtime); 
     end 
   else 
	mem[WR_ADD] = DIN; 
  end 
 
assign RDATA = ramout; 
 
endmodule 
 

module R_SS(RDATA3,RDATA2,RDATA1,RDATA0,REN,RCLK,RAD4,RAD3,RAD2,RAD1,RAD0); //
input RAD4,RAD3,RAD2,RAD1,RAD0; //
input REN,RCLK;
output RDATA3,RDATA2,RDATA1,RDATA0; //

//instantiation of beh module

beh_R_SS inst1(.RDATA({RDATA3_1,RDATA2_1,RDATA1_1,RDATA0_1}),.REN(REN),.RCLK(RCLK),.RAD({RAD4,RAD3,RAD2,RAD1,RAD0}));

buf D_3 (RDATA3, RDATA3_1);
buf D_2 (RDATA2, RDATA2_1);
buf D_1 (RDATA1, RDATA1_1);
buf D_0 (RDATA0, RDATA0_1);

reg notifier7, notifier8, notifier9, notifier10;
initial
begin
	notifier7 = 1'b0;
	notifier8 = 1'b0;
	notifier9 = 1'b0;
	notifier10 = 1'b0;
end

always @(notifier7 or notifier8 or notifier9 or notifier10)
begin
	inst1.notifier7 = notifier7;
	inst1.notifier8 = notifier8;
	inst1.notifier9 = notifier9;
	inst1.notifier10 = notifier10;
end

specify

specparam tRADSU = 1, tRADH = 1, tRCLKH = 1, tRENH = 1;

(RCLK => RDATA0) =  1.00:2.00:3.00;
(RCLK => RDATA1) =  1.00:2.00:3.00;
(RCLK => RDATA2) =  1.00:2.00:3.00;
(RCLK => RDATA3) =  1.00:2.00:3.00;

$width ( posedge RCLK, tRCLKH, 0,  notifier9 );
$setup ( RAD4, posedge RCLK &&& REN , tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN , RAD4, tRADH, notifier8 );

$setup ( RAD3, posedge RCLK &&& REN , tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN , RAD3, tRADH, notifier8 );

$setup ( RAD2, posedge RCLK &&& REN , tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN , RAD2, tRADH, notifier8 );

$setup ( RAD1, posedge RCLK &&& REN , tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN , RAD1, tRADH, notifier8 );

$setup ( RAD0, posedge RCLK &&& REN , tRADSU, notifier7 );
$hold  ( posedge RCLK &&& REN , RAD0, tRADH, notifier8 );


$setup ( REN, posedge RCLK , tRENH, notifier7 );
$hold  ( posedge RCLK, REN, tRENH, notifier10 );

endspecify

endmodule

module R_DS(RDATA13,RDATA12,RDATA11,RDATA10,RDATA23,RDATA22,RDATA21,RDATA20,REN,RCLK1,RCLK2,RAD14,RAD13,RAD12,RAD11,RAD10,RAD24,RAD23,RAD22,RAD21,RAD20,OE); //
input RAD14,RAD13,RAD12,RAD11,RAD10; //
input RAD24,RAD23,RAD22,RAD21,RAD20; //
input REN,RCLK1,RCLK2,OE;
output RDATA13,RDATA12,RDATA11,RDATA10; //
output RDATA23,RDATA22,RDATA21,RDATA20; //

//instantiation of beh module
beh_R_DS inst1(.RDATA1({RDATA13_1,RDATA12_1,RDATA11_1,RDATA10_1}),.RDATA2({RDATA23_1,RDATA22_1,RDATA21_1,RDATA20_1}),.REN(REN),.RCLK1(RCLK1),.RCLK2(RCLK2),.RAD1({RAD14,RAD13,RAD12,RAD11,RAD10}),.RAD2({RAD24,RAD23,RAD22,RAD21,RAD20}),.OE(OE));


buf D_3 (RDATA13, RDATA13_1);
buf D_2 (RDATA12, RDATA12_1);
buf D_1 (RDATA11, RDATA11_1);
buf D_0 (RDATA10, RDATA10_1);


buf ID_3 (RDATA23, RDATA23_1);
buf ID_2 (RDATA22, RDATA22_1);
buf ID_1 (RDATA21, RDATA21_1);
buf ID_0 (RDATA20, RDATA20_1);


reg notifier9, notifier9_W, notifier7, notifier8, notifier7_W, notifier8_W, notifier10, notifier10_W;
initial
begin
	notifier9 = 1'b0;
	notifier9_W = 1'b0;
	notifier7 = 1'b0;
	notifier8 = 1'b0;
	notifier7_W = 1'b0;
	notifier8_W = 1'b0;
	notifier10 = 1'b0;
	notifier10_W = 1'b0;
end

always @(notifier9 or notifier9_W or notifier7 or notifier8 or notifier7_W or notifier8_W or notifier10 or notifier10_W)
begin

        inst1.notifier9 = notifier9;
        inst1.notifier9_W = notifier9_W;
        inst1.notifier7 = notifier7;
        inst1.notifier8 = notifier8;
        inst1.notifier7_W = notifier7_W;
        inst1.notifier8_W = notifier8_W;
        inst1.notifier10 = notifier10;
        inst1.notifier10_W = notifier10_W;
end

specify

specparam tRADSU = 1, tRADH = 1, tRCLKH = 1, tRENH = 1;

	( RCLK1 =>  RDATA10 )  = 1.00:2.00:3.00;
        ( RCLK1 =>  RDATA11 )  = 1.00:2.00:3.00;
        ( RCLK1 =>  RDATA12 )  = 1.00:2.00:3.00;
        ( RCLK1 =>  RDATA13 )  = 1.00:2.00:3.00;
        ( RCLK2 =>  RDATA20 )  = 1.00:2.00:3.00;
        ( RCLK2 =>  RDATA21 )  = 1.00:2.00:3.00;
        ( RCLK2 =>  RDATA22 )  = 1.00:2.00:3.00;
        ( RCLK2 =>  RDATA23 )  = 1.00:2.00:3.00;
        ( OE =>  RDATA20  )  = 1.00:2.00:3.00;
        ( OE =>  RDATA21 )  = 1.00:2.00:3.00;
        ( OE =>  RDATA22 )  = 1.00:2.00:3.00;
        ( OE =>  RDATA23 )  = 1.00:2.00:3.00;

$width ( posedge RCLK1, tRCLKH, 0,  notifier9 );
$width ( posedge RCLK2, tRCLKH, 0,  notifier9_W );

$setup ( RAD14, posedge RCLK1 &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK1 &&& REN, RAD14, tRADH, notifier8 );

$setup ( RAD13, posedge RCLK1 &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK1 &&& REN, RAD13, tRADH, notifier8 );

$setup ( RAD12, posedge RCLK1 &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK1 &&& REN, RAD12, tRADH, notifier8 );

$setup ( RAD11, posedge RCLK1 &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK1 &&& REN, RAD11, tRADH, notifier8 );

$setup ( RAD10, posedge RCLK1 &&& REN, tRADSU, notifier7 );
$hold  ( posedge RCLK1 &&& REN, RAD10, tRADH, notifier8 );

$setup ( RAD24, posedge RCLK2 &&& REN, tRADSU, notifier7_W );
$hold  ( posedge RCLK2 &&& REN, RAD24, tRADH, notifier8_W );

$setup ( RAD23, posedge RCLK2 &&& REN, tRADSU, notifier7_W );
$hold  ( posedge RCLK2 &&& REN, RAD23, tRADH, notifier8_W );

$setup ( RAD22, posedge RCLK2 &&& REN, tRADSU, notifier7_W );
$hold  ( posedge RCLK2 &&& REN, RAD22, tRADH, notifier8_W );

$setup ( RAD21, posedge RCLK2 &&& REN, tRADSU, notifier7_W );
$hold  ( posedge RCLK2 &&& REN, RAD21, tRADH, notifier8_W );

$setup ( RAD20, posedge RCLK2 &&& REN, tRADSU, notifier7_W );
$hold  ( posedge RCLK2 &&& REN, RAD20, tRADH, notifier8_W );

$setup ( REN, posedge RCLK1, tRADSU, notifier10 );
$hold  ( posedge RCLK1, REN, tRENH, notifier10 );

$setup ( REN, posedge RCLK2, tRADSU, notifier10_W );
$hold  ( posedge RCLK2, REN, tRENH, notifier10_W );

endspecify

endmodule

module R_SA(RDATA3,RDATA2,RDATA1,RDATA0,REN,RAD4,RAD3,RAD2,RAD1,RAD0); //
input RAD4,RAD3,RAD2,RAD1,RAD0; //
input REN;
output RDATA3,RDATA2,RDATA1,RDATA0; //

//instantiation of beh module
beh_R_SA inst1(.RDATA({RDATA3_1,RDATA2_1,RDATA1_1,RDATA0_1}),.REN(REN),.RAD({RAD4,RAD3,RAD2,RAD1,RAD0}));

buf D_3 (RDATA3, RDATA3_1);
buf D_2 (RDATA2, RDATA2_1);
buf D_1 (RDATA1, RDATA1_1);
buf D_0 (RDATA0, RDATA0_1);


specify


               ( RAD4 =>  RDATA0) = 1.00:2.00:3.00;
               ( RAD3 =>  RDATA0) = 1.00:2.00:3.00;
               ( RAD2 =>  RDATA0) = 1.00:2.00:3.00;
               ( RAD1 =>  RDATA0) = 1.00:2.00:3.00;
               ( RAD0 =>  RDATA0) = 1.00:2.00:3.00;
               ( RAD4 =>  RDATA1) = 1.00:2.00:3.00;
               ( RAD3 =>  RDATA1) = 1.00:2.00:3.00;
               ( RAD2 =>  RDATA1) = 1.00:2.00:3.00;
               ( RAD1 =>  RDATA1) = 1.00:2.00:3.00;
               ( RAD0 =>  RDATA1) = 1.00:2.00:3.00;
               ( RAD4 =>  RDATA2) = 1.00:2.00:3.00;
               ( RAD3 =>  RDATA2) = 1.00:2.00:3.00;
               ( RAD2 =>  RDATA2) = 1.00:2.00:3.00;
               ( RAD1 =>  RDATA2) = 1.00:2.00:3.00;
               ( RAD0 =>  RDATA2) = 1.00:2.00:3.00;
               ( RAD4 =>  RDATA3) = 1.00:2.00:3.00;
               ( RAD3 =>  RDATA3) = 1.00:2.00:3.00;
               ( RAD2 =>  RDATA3) = 1.00:2.00:3.00;
               ( RAD1 =>  RDATA3) = 1.00:2.00:3.00;
               ( RAD0 =>  RDATA3) = 1.00:2.00:3.00;
               ( REN =>  RDATA0) = 1.00:2.00:3.00;
               ( REN =>  RDATA1) = 1.00:2.00:3.00;
               ( REN =>  RDATA2) = 1.00:2.00:3.00;
               ( REN =>  RDATA3) = 1.00:2.00:3.00;
                  
endspecify

endmodule

module R_DA(RDATA13,RDATA12,RDATA11,RDATA10,RDATA23,RDATA22,RDATA21,RDATA20,OE,REN,RAD14,RAD13,RAD12,RAD11,RAD10,RAD24,RAD23,RAD22,RAD21,RAD20); //
input RAD14,RAD13,RAD12,RAD11,RAD10; //
input RAD24,RAD23,RAD22,RAD21,RAD20; //
input REN,OE;
output RDATA13,RDATA12,RDATA11,RDATA10; //
output RDATA23,RDATA22,RDATA21,RDATA20; //

//instantiation of beh module
beh_R_DA inst1(.RDATA1({RDATA13_1,RDATA12_1,RDATA11_1,RDATA10_1}),.RDATA2({RDATA23_1,RDATA22_1,RDATA21_1,RDATA20_1}),.OE(OE),.REN(REN),.RAD1({RAD14,RAD13,RAD12,RAD11,RAD10}),.RAD2({RAD24,RAD23,RAD22,RAD21,RAD20}));

buf D_3 (RDATA13, RDATA13_1);
buf D_2 (RDATA12, RDATA12_1);
buf D_1 (RDATA11, RDATA11_1);
buf D_0 (RDATA10, RDATA10_1);

buf ID_3 (RDATA23, RDATA23_1);
buf ID_2 (RDATA22, RDATA22_1);
buf ID_1 (RDATA21, RDATA21_1);
buf ID_0 (RDATA20, RDATA20_1);

specify
               ( RAD24 => RDATA20 )  = 1.00:2.00:3.00 ;
               ( RAD23 => RDATA20 )  = 1.00:2.00:3.00 ;
               ( RAD22 => RDATA20 )  = 1.00:2.00:3.00 ;
               ( RAD21 => RDATA20 )  = 1.00:2.00:3.00 ;
               ( RAD20 => RDATA20 )  = 1.00:2.00:3.00 ;
               ( RAD24 => RDATA21 )  = 1.00:2.00:3.00 ;
               ( RAD23 => RDATA21 )  = 1.00:2.00:3.00 ;
               ( RAD22 => RDATA21 )  = 1.00:2.00:3.00 ;
               ( RAD21 => RDATA21 )  = 1.00:2.00:3.00 ;
               ( RAD20 => RDATA21 )  = 1.00:2.00:3.00 ;
               ( RAD24 => RDATA22 )  = 1.00:2.00:3.00 ;
               ( RAD23 => RDATA22 )  = 1.00:2.00:3.00 ;
               ( RAD22 => RDATA22 )  = 1.00:2.00:3.00 ;
               ( RAD21 => RDATA22 )  = 1.00:2.00:3.00 ;
               ( RAD20 => RDATA22 )  = 1.00:2.00:3.00 ;
               ( RAD24 => RDATA23 )  = 1.00:2.00:3.00 ;
               ( RAD23 => RDATA23 )  = 1.00:2.00:3.00 ;
               ( RAD22 => RDATA23 )  = 1.00:2.00:3.00 ;
               ( RAD21 => RDATA23 )  = 1.00:2.00:3.00 ;
               ( RAD20 => RDATA23 )  = 1.00:2.00:3.00 ;
               ( OE => RDATA20 )  = 1.00:2.00:3.00 ;
               ( OE => RDATA21 )  = 1.00:2.00:3.00 ;
               ( OE => RDATA22 )  = 1.00:2.00:3.00 ;
               ( OE => RDATA23 )  = 1.00:2.00:3.00 ;
               ( RAD14 => RDATA10 )  = 1.00:2.00:3.00 ;
               ( RAD13 => RDATA10 )  = 1.00:2.00:3.00 ;
               ( RAD12 => RDATA10 )  = 1.00:2.00:3.00 ;
               ( RAD11 => RDATA10 )  = 1.00:2.00:3.00 ;
               ( RAD10 => RDATA10 )  = 1.00:2.00:3.00 ;
               ( RAD14 => RDATA11 )  = 1.00:2.00:3.00 ;
               ( RAD13 => RDATA11 )  = 1.00:2.00:3.00 ;
               ( RAD12 => RDATA11 )  = 1.00:2.00:3.00 ;
               ( RAD11 => RDATA11 )  = 1.00:2.00:3.00 ;
               ( RAD10 => RDATA11 )  = 1.00:2.00:3.00 ;
               ( RAD14 => RDATA12 )  = 1.00:2.00:3.00 ;
               ( RAD13 => RDATA12 )  = 1.00:2.00:3.00 ;
               ( RAD12 => RDATA12 )  = 1.00:2.00:3.00 ;
               ( RAD11 => RDATA12 )  = 1.00:2.00:3.00 ;
               ( RAD10 => RDATA12 )  = 1.00:2.00:3.00 ;
               ( RAD14 => RDATA13 )  = 1.00:2.00:3.00 ;
               ( RAD13 => RDATA13 )  = 1.00:2.00:3.00 ;
               ( RAD12 => RDATA13 )  = 1.00:2.00:3.00 ;
               ( RAD11 => RDATA13 )  = 1.00:2.00:3.00 ;
               ( RAD10 => RDATA13 )  = 1.00:2.00:3.00 ;

endspecify

endmodule

module R_DAR(RDATA13,RDATA12,RDATA11,RDATA10,RDATA23,RDATA22,RDATA21,RDATA20,OE,REN,RAD14,RAD13,RAD12,RAD11,RAD10,RAD24,RAD23,RAD22,RAD21,RAD20,ADRCLK); //
input RAD14,RAD13,RAD12,RAD11,RAD10; //
input RAD24,RAD23,RAD22,RAD21,RAD20; //
input REN,OE,ADRCLK;
output RDATA13,RDATA12,RDATA11,RDATA10; //
output RDATA23,RDATA22,RDATA21,RDATA20; //

//instantiation of beh module
beh_R_DAR inst1(.RDATA1({RDATA13_1,RDATA12_1,RDATA11_1,RDATA10_1}),.RDATA2({RDATA23_1,RDATA22_1,RDATA21_1,RDATA20_1}),.OE(OE),.REN(REN),.RAD1({RAD14,RAD13,RAD12,RAD11,RAD10}),.RAD2({RAD24,RAD23,RAD22,RAD21,RAD20}),.ADRCLK(ADRCLK));



buf D_3 (RDATA13, RDATA13_1);
buf D_2 (RDATA12, RDATA12_1);
buf D_1 (RDATA11, RDATA11_1);
buf D_0 (RDATA10, RDATA10_1);

buf ID_3 (RDATA23, RDATA23_1);
buf ID_2 (RDATA22, RDATA22_1);
buf ID_1 (RDATA21, RDATA21_1);
buf ID_0 (RDATA20, RDATA20_1);

reg notifier10, notifier11, notifier10_W, notifier11_W, notifier12;
initial
begin
	notifier10 = 1'b0;
	notifier11 = 1'b0;
	notifier10_W = 1'b0;
	notifier11_W = 1'b0;
	notifier12 = 1'b0;
end
always @(notifier10 or notifier11 or notifier10_W or notifier11_W or notifier12 )
begin

        inst1.notifier10 = notifier10;
        inst1.notifier11 = notifier11;
        inst1.notifier10_W = notifier10_W;
        inst1.notifier11_W = notifier11_W;
        inst1.notifier12 = notifier12;

end

specify

specparam tRENSU = 1, tRDADV = 1,tRENH = 1,tADRSU = 1,tADRH = 1,tADRW = 1,tRENSU_W = 1,tRENH_W = 1;

               ( ADRCLK => RDATA20 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA21 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA22 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA23 ) = 1.00:2.00:3.00;
               ( OE => RDATA20 ) = 1.00:2.00:3.00;
               ( OE => RDATA21 ) = 1.00:2.00:3.00;
               ( OE => RDATA22 ) = 1.00:2.00:3.00;
               ( OE => RDATA23 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA10 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA11 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA12 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA13 ) = 1.00:2.00:3.00;

$width ( posedge ADRCLK , tADRW, 0,  notifier12 );

$setup ( RAD14, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD14, tADRH, notifier11 );

$setup ( RAD13, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD13, tADRH, notifier11 );

$setup ( RAD12, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD12, tADRH, notifier11 );

$setup ( RAD11, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD11, tADRH, notifier11 );

$setup ( RAD10, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD10, tADRH, notifier11 );

$setup ( RAD24, posedge ADRCLK &&& REN , tADRSU, notifier10_W );
$hold  ( posedge ADRCLK &&& REN , RAD24, tADRH, notifier11_W );

$setup ( RAD23, posedge ADRCLK &&& REN , tADRSU, notifier10_W );
$hold  ( posedge ADRCLK &&& REN , RAD23, tADRH, notifier11_W );

$setup ( RAD22, posedge ADRCLK &&& REN , tADRSU, notifier10_W );
$hold  ( posedge ADRCLK &&& REN , RAD22, tADRH, notifier11_W );

$setup ( RAD21, posedge ADRCLK &&& REN , tADRSU, notifier10_W );
$hold  ( posedge ADRCLK &&& REN , RAD21, tADRH, notifier11_W );

$setup ( RAD20, posedge ADRCLK &&& REN , tADRSU, notifier10_W );
$hold  ( posedge ADRCLK &&& REN , RAD20, tADRH, notifier11_W );



endspecify

endmodule

module R_SAR(RDATA3,RDATA2,RDATA1,RDATA0,REN,RAD4,RAD3,RAD2,RAD1,RAD0,ADRCLK); //
input RAD4,RAD3,RAD2,RAD1,RAD0; //
input REN;
input ADRCLK;
output RDATA3,RDATA2,RDATA1,RDATA0; //

//instantiation of beh module
beh_R_SAR inst1(.RDATA({RDATA3_1,RDATA2_1,RDATA1_1,RDATA0_1}),.REN(REN),.RAD({RAD4,RAD3,RAD2,RAD1,RAD0}),.ADRCLK(ADRCLK));


buf D_3 (RDATA3, RDATA3_1);
buf D_2 (RDATA2, RDATA2_1);
buf D_1 (RDATA1, RDATA1_1);
buf D_0 (RDATA0, RDATA0_1);

reg notifier10, notifier11;
initial
begin
	notifier10 = 1'b0;
	notifier11 = 1'b0;
end


always @(notifier10 or notifier10)
begin
	inst1.notifier10 = notifier10;
	inst1.notifier11 = notifier11;
end

specify

specparam tRENSU = 1, tRDADV = 1, tLH = 1, tRENH = 1,tADRSU = 1, tADRH = 1,tADRW = 1;


               ( ADRCLK => RDATA0 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA1 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA2 ) = 1.00:2.00:3.00;
               ( ADRCLK => RDATA3  ) = 1.00:2.00:3.00;
               ( REN => RDATA0 ) = 1.00:2.00:3.00;
               ( REN => RDATA1 ) = 1.00:2.00:3.00;
               ( REN => RDATA2 ) = 1.00:2.00:3.00;
               ( REN => RDATA3 ) = 1.00:2.00:3.00;

$width ( posedge ADRCLK , tADRW, 0,  notifier11 );

$setup ( RAD4, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD4, tADRH, notifier10 );

$setup ( RAD3, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD3, tADRH, notifier10 );

$setup ( RAD2, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD2, tADRH, notifier10 );

$setup ( RAD1, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD1, tADRH, notifier10 );

$setup ( RAD0, posedge ADRCLK &&& REN , tADRSU, notifier10 );
$hold  ( posedge ADRCLK &&& REN , RAD0, tADRH, notifier10 );


endspecify

endmodule

module beh_R_SS(RDATA,REN,RCLK,RAD);


input [4:0] RAD;
input REN,RCLK;
output [3:0] RDATA;
reg [4:0] RD_ADD;
reg [3:0] ramout;
wire [4:0] rd_add = RD_ADD;
reg [3:0] mem [31:0];
reg RD_CLK;
wire rd_clk = RD_CLK;
integer output_delay;
integer i;
reg notifier7,notifier8,notifier9,notifier10;

initial
 begin
   notifier7 = 0;
   notifier8 = 0;
   notifier9 = 0;
   notifier10 = 0;
   $readmemb("rom_data",mem,0,31);
   RD_CLK = 1'b0;
   RD_ADD = 4'bz;
 end

   always @(REN or RAD)
   begin
    if (REN == 1'b1 )
     begin
	RD_ADD = RAD;
    end
    else
      begin
	RD_ADD = 5'bx;
   end
 end
   always @(RCLK or RAD)
   begin
    if (RCLK == 1'b1 )
     begin
	RD_CLK = 1'b1;
    end
    else
      begin
	RD_CLK = 1'b0;
   end
 end
 

always @(notifier7 or notifier8 or notifier9 or notifier10)

  begin
        // send RD to x immediately
        disable read;
        ramout = 4'bx;
  end


always @(RD_CLK)
  begin
    if ((RCLK == 1'b1) && (REN!= 1'b1))
     begin
	// if REN toggles from 1 when RCLK is high send RD to x immediately
	disable read;
	ramout = 4'bx;
     end
  end

always @(posedge RD_CLK)

  begin : read
   if (|(RD_ADD & ~RD_ADD) === 1'bx)
     begin
	// if RAD is x send RD to x immediately
	ramout = 4'bx;
	$display("(error) illegal address input at the rising edge of RCLK so RDATA goes x: @ %.3f ",$realtime);
     end
   else
     begin
	ramout = mem[RD_ADD];
     end
  end
 
assign RDATA = ramout;

endmodule

module beh_R_DS(RDATA1,RDATA2,REN,RCLK1,RCLK2,RAD1,RAD2,OE);

parameter tRCO = 2000;

input [4:0] RAD1;
input [4:0] RAD2;
input REN,RCLK1,RCLK2,OE;
output [3:0] RDATA1;
output [3:0] RDATA2;
reg [4:0] RD_ADD_1;
reg [4:0] RD_ADD_2;
reg [3:0] ramout;
reg [3:0] ramout_w;
reg [3:0] dataout;
reg RD_CLK_1;
reg RD_CLK_2;
wire [4:0] rd_add_1 = RD_ADD_1;
wire [4:0] rd_add_2 = RD_ADD_2;
reg [3:0] mem [31:0];
wire rd_clk_1 = RD_CLK_1;
wire rd_clk_2 = RD_CLK_2;
integer output_delay;
integer output_delay_w;
integer i;
reg notifier7,notifier8,notifier9,notifier10,notifier7_W,notifier8_W,notifier9_W,notifier10_W;

initial
begin
   notifier7 = 0;
   notifier8 = 0;
   notifier9 = 0;
   notifier10 = 0;
   notifier7_W = 0;
   notifier8_W = 0;
   notifier9_W = 0;
   notifier10_W = 0;
   $readmemb("rom_data",mem,0,31);
   RD_CLK_1 = 1'b0;
   RD_CLK_2 = 1'b0;

 end

   always @(REN or RAD1)

   begin
    if (REN == 1'b1 )
      begin
	RD_ADD_1 = RAD1;
      end
    else
      begin
	RD_ADD_1 = 5'bx;
      end
   end

   always @(RAD1 or RCLK1)

   begin
    if (REN == 1'b1 )
      begin
        RD_CLK_1 = RCLK1;
      end
    else
      begin
        RD_CLK_1 = 1'b0;
      end
   end

   always @(REN or RAD2)
   
   begin
    if (REN == 1'b1 )
      begin
        RD_ADD_2 = RAD2;
      end
    else
      begin
        RD_ADD_2 = 5'bx;
      end
    end

   always @(RAD2 or RCLK2)
   begin
    if (REN == 1'b1 )
      begin
	RD_CLK_2 = RCLK2;
      end
    else
      begin
	RD_CLK_2 = 1'b0;
      end
    end

 
always @(notifier7 or notifier8 or notifier9 or notifier10)
 
  begin  
        // send RD to x immediately
        disable read;
        ramout = 4'bx;
  end
 
always @(notifier7_W or notifier8_W or notifier9_W or notifier10_W)
 
  begin  
        // send RD to x immediately
        disable read_w;
        dataout = 4'bx;
  end
 

always @(RD_CLK_1)
  begin
if ((RCLK1 == 1'b1) && (REN!= 1'b1))
     begin
	// if REN toggles from 1 when RCLK is high send RD to x immediately
	disable read;
	ramout = 4'bx;
     end
  end


always @(posedge RD_CLK_1)

  begin : read
   if (|(RD_ADD_1 & ~RD_ADD_1) === 1'bx)
     begin
	// if RAD is x send RD to x immediately
	ramout = 4'bx;
	$display("(error) illegal address input at the rising edge of RCLK1 so RDATA1 goes x: @ %.3f ",$realtime);
     end
   else
     begin
        ramout = mem[RD_ADD_1];
     end
  end
 
always @(RD_CLK_2)

  begin
    if ((RCLK2 == 1'b1) && (REN!= 1'b1))
     begin
	// if REN toggles from 1 when RCLK2 is high send RD to x immediately
	disable read_w;
	dataout = 4'bx;
     end
  end

always @(posedge RD_CLK_2)

begin:read_w
if((REN == 1'b1))
  begin  
   if (|(RD_ADD_2 & ~RD_ADD_2) === 1'bx)
     begin
	// if RAD is x send RD to x immediately
	dataout = 4'bx;
	$display("(error) illegal address input at the rising edge of RCLK1 so RDATA2 goes x: @ %.3f ",$realtime);
     end
   else
     begin
	dataout= mem[RD_ADD_2];
     end
  end
end
 
always @(dataout or REN or OE )
 
  begin
   if (REN == 1'b1 && OE == 1'b1)
        ramout_w = dataout;
  end

assign   RDATA1 = ramout;
assign   RDATA2 = ramout_w;


endmodule

module beh_R_SA(RDATA,REN,RAD);

parameter tRDO = 3000;
parameter tDOH = 1000;
parameter tRLO = 2000;
input [4:0] RAD;
input REN;
output [3:0] RDATA;
reg [4:0] RD_ADD;
reg [3:0] ramout;
wire [3:0] RDATA;
reg [3:0] RDATA_out;
wire [4:0] rd_add = RD_ADD;
reg [3:0] mem [31:0];
integer output_delay;
integer i;
reg notifier7,notifier8,notifier9;

initial
 begin
   notifier7 = 0;
   notifier8 = 0;
   notifier9 = 0;
   $readmemb("rom_data",mem,0,31);
 end

   always @(REN or RAD) 
   begin
    if (REN == 1'b1 )
	RD_ADD = RAD;
    else
	RD_ADD = 5'bx;
    end

always @(REN or RD_ADD)
    begin : read
    if (REN == 1'b1 )
    begin
     if (|(RAD & ~RAD) === 1'bx)
      begin
	// if RAD is x send RD to x immediately
	ramout = 4'bx; 
	$display("(error) illegal address input so RDATA goes x: @ %.3f ",$realtime);
    end
    else
     begin
         ramout = mem[RAD];
      end
    end
  end
assign RDATA = ramout;
endmodule
module beh_R_DA(RDATA1,RDATA2,OE,REN,RAD1,RAD2);

parameter tRDO = 3000;
parameter tDOH = 1000;
input [4:0] RAD1;
input [4:0] RAD2;
input REN,OE;
output [3:0] RDATA1;
output [3:0] RDATA2;
reg [4:0] RD_ADD_1, RD_ADD_2;
reg [3:0] ramout, ramout_w, dataout;
wire [3:0] RDATA1;
wire [3:0] RDATA2;
reg [3:0] RDATA1_out;
reg [3:0] RDATA2_out;
wire [4:0] rd_add_1 = RD_ADD_1;
wire [4:0] rd_add_2 = RD_ADD_2;
reg [3:0] mem [31:0];
integer output_delay,output_delay_w;
integer i;
reg notifier7,notifier8,notifier9,notifier7_W,notifier8_W,notifier9_W;

initial
 begin
   notifier7 = 0;
   notifier8 = 0;
   notifier9 = 0;
   notifier7_W = 0;
   notifier8_W = 0;
   notifier9_W = 0;
   $readmemb("rom_data",mem,0,31);
 end

   always @(REN or RAD1)
         if (REN == 1'b1 )
         begin    
             RD_ADD_1 = RAD1;
        end
         else 
         begin    
             RD_ADD_1 = 5'bx;
         end

   always @(REN or RAD2) 
         if (REN == 1'b1 )
         begin    
             RD_ADD_2 = RAD2;
        end
         else 
         begin
             RD_ADD_2 = 5'bx;
         end



always @(notifier7 or notifier8 or notifier9)

  begin
	// send RD to x immediately
	disable read;
	ramout = 4'bx;
  end

always @(notifier7_W or notifier8_W or notifier9_W)

  begin
	// send RD to x immediately
	disable read_w;
	dataout = 4'bx;
  end

always @(RAD1)
   begin : read
   if (REN == 1'b1 )
    begin
     if (|(RAD1 & ~RAD1) === 1'bx)
      begin
        // if RAD1 is x send RD to x immediately
        ramout = 4'bx;
        $display("(error) illegal address input so RDATA goes x: @ %.3f ",$realtime);
      end
     else
     begin
        ramout = mem[RAD1];
      end 
    end 
 end

always @(RAD2 or OE)
   begin : read_w
   if (REN == 1'b1 && OE == 1'b1)
    begin
     if (|(RAD2 & ~RAD2) === 1'bx)
      begin
        // if RAD2 is x send RD to x immediately
        dataout = 4'bx;
        $display("(error) illegal address input so RDATA goes x: @ %.3f ",$realtime);
      end
     else
     begin
        dataout = mem[RAD2];
      end 
    end 
 end

always @(dataout or OE)
 
  begin
   if (OE == 1'b1)
        ramout_w = dataout;
  end

assign  RDATA1 = ramout;
assign  RDATA2 = ramout_w;
endmodule

module beh_R_DAR(RDATA1,RDATA2,OE,REN,RAD1,RAD2,ADRCLK);
parameter tRDO = 3000;
parameter tDOH = 1000;
input [4:0] RAD1;
input [4:0] RAD2;
input REN,OE,ADRCLK;
output [3:0] RDATA1;
output [3:0] RDATA2;
reg [4:0] RD_ADD_1, RD_ADD_2;
reg [3:0] ramout, ramout_w, dataout;
wire [3:0] RDATA1;
wire [3:0] RDATA2;
wire [4:0] rd_add_1 = RD_ADD_1;
wire [4:0] rd_add_2 = RD_ADD_2;
reg [3:0] mem [31:0];
integer output_delay,output_delay_w;
integer i;
reg notifier7,notifier8,notifier9,notifier10,notifier11,notifier12,notifier7_W,notifier8_W,notifier9_W,notifier10_W,notifier11_W;

initial
 begin
   notifier7 = 0;
   notifier8 = 0;
   notifier9 = 0;
   notifier10 = 0;
   notifier11 = 0;
   notifier12 = 0;
   notifier7_W = 0;
   notifier8_W = 0;
   notifier9_W = 0;
   notifier10_W = 0;
   notifier11_W = 0;
   $readmemb("rom_data",mem,0,31);
   //ramout = 4'bzzzz;
   //dataout = 4'bzzzz;
 end

   always @(posedge ADRCLK)
     if (ADRCLK == 1'b1)
      begin
       RD_ADD_1 = RAD1;
       RD_ADD_2 = RAD2;
     end

always @(notifier7 or notifier8 or notifier9 or notifier10 or notifier11 or notifier12)

  begin
	// send RD to x immediately
	disable read;
	//output_delay = 0;
	ramout = 4'bx;
  end

always @(notifier7_W or notifier8_W or notifier9_W or notifier10_W or notifier11_W or notifier12)

  begin
	// send RD to x immediately
	disable read_w;
	//output_delay_w = 0;
	dataout = 4'bx;
  end

always @(RD_ADD_1)
   begin : read
   if (REN == 1'b1 )
    begin
     if (|(RD_ADD_1 & ~RD_ADD_1) === 1'bx)
      begin
        // if RAD1 is x send RD to x immediately
        //output_delay = 0;
        ramout = 4'bx;
        $display("(error) illegal address input so RDATA1 goes x: @ %.3f ",$realtime);
      end
     else
     begin
        //output_delay = tDOH;
        //ramout = 4'bx;
        ramout = mem[RD_ADD_1];
      end 
    end 
 end

always @(RD_ADD_2)
   begin : read_w
   if (REN == 1'b1)
    begin
     if (|(RD_ADD_2 & ~RD_ADD_2) === 1'bx)
      begin
        // if RAD2 is x send RD to x immediately
        //output_delay_w = 0;
        //dataout = 4'bx;
        $display("(error) illegal address input so RDATA2 goes x: @ %.3f ",$realtime);
      end
     else
     begin
        //output_delay_w = tDOH;
        //dataout = 4'bx;
        dataout = mem[RD_ADD_2];
      end 
    end 
 end

always @(dataout or REN or OE)
 
  begin
   if (REN == 1'b1 && OE == 1'b1)
        ramout_w = dataout;
  end

assign RDATA1 = ramout;
assign RDATA2 = ramout_w;
endmodule

module beh_R_SAR(RDATA,REN,RAD,ADRCLK);

parameter tRDO = 3000;
parameter tDOH = 1000;
parameter tRLO = 2000;
input [4:0] RAD;
input REN;
input ADRCLK;
output [3:0] RDATA;
reg [4:0] RD_ADD;
reg [3:0] ramout;
wire [3:0] RDATA;
wire [4:0] rd_add = RD_ADD;
reg [3:0] mem [31:0];
integer output_delay;
integer i;
reg notifier7,notifier8,notifier10,notifier11;

initial
 begin
   notifier7 = 0;
   notifier8 = 0;
   notifier10 = 0;
   notifier11 = 0;
   $readmemb("rom_data",mem,0,31);
 end


    always @(posedge ADRCLK)  
    begin
    if (ADRCLK == 1'b1)
	RD_ADD = RAD;
    end
always @(notifier7 or notifier8 or notifier10 or notifier11)

  begin
	// send RD to x immediately
	disable read;
//	output_delay = 0;
	ramout = 4'bx;
  end

always @(RD_ADD)
    begin : read
    if (REN == 1'b1)
    begin
     if (|(RD_ADD & ~RD_ADD) === 1'bx)
      begin
	// if RAD is x send RD to x immediately
//	output_delay = 0;
	ramout = 4'bx;
	$display("(error) illegal address input so RDATA goes x: @ %.3f ",$realtime);
    end
    else
     begin
//	output_delay = tDOH;
        //ramout = 4'bx;
        ramout = mem[RD_ADD];
      end
    end
  end
assign RDATA = ramout;

endmodule

primitive  VF1_DFF(Q,D,CLK,R,S,NOTIFIER);
output Q;
reg Q;
input CLK,
      D,
      R,S,
      NOTIFIER;

// FUNCTION : POSITIVE EDGE TRIGGERED D-FLIP FLOP WITH ACTIVE LOW 
//              ASYNCHRONOUS SET AND CLEAR
 table
//D      CLK     R   S   NOTIFIER      Q(t)    Q(t+1)
       
  1      (01)    1   ?      ?       :   ?   :   1;  // clocked data
  0      (01)    ?   1      ?       :   ?   :   0;  // clocked data

  1       ?      1   *      ?       :   1   :   1;  // pessimism
  ?       0      1   *      ?       :   1   :   1;  // pessimism
  ?       1      1   *      ?       :   1   :   1;  // pessimism
  1       ?      0   (10)      ?       :   0   :   x;  // pessimism
  ?       0      0   (10)      ?       :   0   :   x;  // pessimism
  ?       1      0   (10)      ?       :   0   :   x;  // pessimism

  0       ?      *   1      ?       :   0   :   0;  // pessimism
  ?       0      *   1      ?       :   0   :   0;  // pessimism
  ?       1      *   1      ?       :   0   :   0;  // pessimism
  0       ?      (10)   0      ?       :   1   :   x;  // pessimism
  ?       0      (10)   0      ?       :   1   :   x;  // pessimism
  ?       1      (10)   0      ?       :   1   :   x;  // pessimism

  1       p      1   1      ?       :   1   :   1;  // reducing pessimism
  0       p      1   1      ?       :   0   :   0;
 
  ?       ?      0   1      ?       :   ?   :   0;  // asynchronous clear
  ?       ?      1   0      ?       :   ?   :   1;  // asynchronous set

  ?      (?0)    ?   ?      ?       :   ?   :   -;  // ignore falling clock
  0      (?x)    ?   ?      ?       :   0   :   -;  // retain state when D == Qt
  1      (?x)    ?   ?      ?       :   1   :   -;  // retain state when D == Qt
  *       1      ?   ?      ?       :   ?   :   -;  // ignore data edges
  *       0      ?   ?      ?       :   ?   :   -;  // ignore data edges
  ?       ?      ?   ?      *       :   ?   :   -;
 
endtable
endprimitive
primitive  VF1_DFF_CE(Q,D,CLK,R,S,CE,NOTIFIER);
output Q;
reg Q;
input CLK,
      D,
      R,S,
      CE,  //clock enable active high
      NOTIFIER;

// FUNCTION : POSITIVE EDGE TRIGGERED D-FLIP FLOP WITH ACTIVE HIGH CLOCK ENABLE 
//              AND ACTIVE LOW ASYNCHRONOUS SET AND RESET

 table
//D      CLK     R   S   CE   NOTIFIER      Q(t)    Q(t+1)
       
  1      (01)    1   ?   1       ?       :   ?   :   1;  // clocked data
  0      (01)    ?   1   1       ?       :   ?   :   0;  // clocked data

  1       ?      1   *   1       ?       :   1   :   1;  // pessimism
  ?       0      1   *   1       ?       :   1   :   1;  // pessimism
  ?       1      1   *   1       ?       :   1   :   1;  // pessimism

  0       ?      *   1   1       ?       :   0   :   0;  // pessimism
  ?       0      *   1   1       ?       :   0   :   0;  // pessimism
  ?       1      *   1   1       ?       :   0   :   0;  // pessimism

  1       p      1   1   1       ?       :   1   :   1;  // reducing pessimism
  0       p      1   1   1       ?       :   0   :   0;
 
  ?       ?      0   1   ?       ?       :   ?   :   0;  // asynchronous clear
  ?       ?      1   0   ?       ?       :   ?   :   1;  // asynchronous set

  ?      (?0)    ?   ?   1       ?       :   ?   :   -;  // ignore falling clock
  0      (?x)    ?   ?   1       ?       :   0   :   -;  // retain state when D == Qt
  1      (?x)    ?   ?   1       ?       :   1   :   -;  // retain state when D == Qt
  *       1      ?   ?   1       ?       :   ?   :   -;  // ignore data edges
  *       0      ?   ?   1       ?       :   ?   :   -;  // ignore data edges
  ?       ?      1   1   0       ?       :   ?   :   -;
  ?	  ?      ?   ?   ?       *       :   ?   :   -;
  ?       ?      1   1   *       ?       :   ?   :   -; 
endtable
endprimitive
primitive  VF1_DFF_CE_X(Q,D,CLK,R,S,CE,NOTIFIER);
output Q;
reg Q;
input CLK, D, R,S, CE, NOTIFIER;  //clock enable active high

// FUNCTION : POSITIVE EDGE TRIGGERED D-FLIP FLOP WITH ACTIVE HIGH CLOCK ENABLE 
//              AND ACTIVE LOW ASYNCHRONOUS SET AND RESET

 table
//D      CLK     R   S   CE   NOTIFIER Q(t)    Q(t+1)
       
  1      (01)    1   ?   1      ?:   ?   :   1;  // clocked data
  0      (01)    ?   1   1      ?:   ?   :   0;  // clocked data

  1       ?      1   *   1      ?:   1   :   1;  // pessimism
  ?       0      1   *   1      ?:   1   :   1;  // pessimism
  ?       1      1   *   1      ?:   1   :   1;  // pessimism

  
  0       ?      *   1   1      ?:   0   :   0;  // pessimism
  ?       0      *   1   1      ?:   0   :   0;  // pessimism
  ?       1      *   1   1      ?:   0   :   0;  // pessimism

  1       p      1   1   1      ?:   1   :   1;  // reducing pessimism
  0       p      1   1   1      ?:   0   :   0;
 
  ?       ?      0   1   ?      ?:   ?   :   0;  // asynchronous clear
  ?       ?      1   0   ?      ?:   ?   :   1;  // asynchronous set

  ?      (?0)    ?   ?   1      ?:   ?   :   -;  // ignore falling clock
  0      (?x)    ?   ?   1      ?:   0   :   -;  // retain state when D == Qt
  1      (?x)    ?   ?   1      ?:   1   :   -;  // retain state when D == Qt
  *       1      ?   ?   1      ?:   ?   :   -;  // ignore data edges
  *       0      ?   ?   1      ?:   ?   :   -;  // ignore data edges
  ?       ?      1   1   0      ?:   ?   :   -;
  ?       ?      ?   ?   ?      *:   ?   :   x;
  ?       ?      1   1   *      ?:   ?   :   -; 
 
endtable
endprimitive
primitive  VF1_DFF_X (Q,D,CLK,R,S,NOTIFIER);
output Q;
reg Q;
input D, CLK, R,S, NOTIFIER;

// FUNCTION : POSITIVE EDGE TRIGGERED D-FLIP FLOP WITH ACTIVE LOW 
//              ASYNCHRONOUS SET AND CLEAR
 table
//D      CLK     R   S   NOTIFIER      Q(t)    Q(t+1)
       
  1      (01)    1   ?      ?       :   ?   :   1;  // clocked data
  0      (01)    ?   1      ?       :   ?   :   0;  // clocked data

  1       ?      1   *      ?       :   1   :   1;  // pessimism
  ?       0      1   *      ?       :   1   :   1;  // pessimism
  ?       1      1   *      ?       :   1   :   1;  // pessimism
  1       ?      0   *      ?       :   0   :   0;  // pessimism
  ?       0      0   *      ?       :   0   :   0;  // pessimism
  ?       1      0   *      ?       :   0   :   0;  // pessimism

  0       ?      *   1      ?       :   0   :   0;  // pessimism
  ?       0      *   1      ?       :   0   :   0;  // pessimism
  ?       1      *   1      ?       :   0   :   0;  // pessimism
  0       ?      *   0      ?       :   1   :   1;  // pessimism
  ?       0      *   0      ?       :   1   :   1;  // pessimism
  ?       1      *   0      ?       :   1   :   1;  // pessimism

  1       p      1   1      ?       :   1   :   1;  // reducing pessimism
  0       p      1   1      ?       :   0   :   0;
 
  ?       ?      0   1      ?       :   ?   :   0;  // asynchronous clear
  ?       ?      1   0      ?       :   ?   :   1;  // asynchronous set

  ?      (?0)    ?   ?      ?       :   ?   :   -;  // ignore falling clock
  0      (?x)    ?   ?      ?       :   0   :   -;  // retain state when D == Qt
  1      (?x)    ?   ?      ?       :   1   :   -;  // retain state when D == Qt
  *       1      ?   ?      ?       :   ?   :   -;  // ignore data edges
  *       0      ?   ?      ?       :   ?   :   -;  // ignore data edges
  ?       ?      ?   ?      *       :   ?   :   x;
 
endtable
endprimitive
primitive VF1_JKFF(Q,CLK,J,K,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      J,K,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;

 //POSITIVE EDGE TRIGGERED JK-FLIP FLOP WITH ACTIVE LOW ASYNCHRONOUS SET AND CLEAR

table

// CLK  J   K   S   R  NOTIFIER   Q(t)   Q(t+1) 
    ?   ?   ?   0   1     ?       : ? :    1;
    ?   ?   ?   *   1     ?       : 1 :    1; // Reset logic
    ?   ?   ?   1   0     ?       : ? :    0;
    ?   ?   ?   1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0   0   1   1     ?       : ? :    -;
    r   0   1   1   1     ?       : ? :    0;
    r   1   0   1   1     ?       : ? :    1;
    r   1   1   1   1     ?       : 1 :    0;
    r   1   1   1   1     ?       : 0 :    1;
    f   ?   ?   ?   ?     ?       : ? :    - ;   
                                   // J K transition cases
    b   *   ?   ?   ?     ?       : ? :    -;
    b   ?   *   ?   ?     ?       : ? :    -;
                                    // cases reducing pessimism
    p   0   0   1   1     ?       : ? :    -;
    p   0   ?   1   ?     ?       : 0 :    -;
    p   ?   0   ?   1     ?       : 1 :    -;
   (x0) ?   ?   ?   ?     ?       : ? :    -;
   (1x) 0   0   1   1     ?       : ? :    -;
   (1x) 0   ?   1   ?     ?       : 0 :    -;
   (1x) ?   0   ?   1     ?       : 1 :    -;
     x  *   0   ?   1     ?       : 1 :    -;
     x  0   *   1   ?     ?       : 0 :    -;
     ?  ?   ?   ?   ?     *       : ? :    -;

endtable
endprimitive 
   
primitive VF1_JKFF_X(Q,CLK,J,K,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      J,K,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;

 //POSITIVE EDGE TRIGGERED JK-FLIP FLOP WITH ACTIVE LOW ASYNCHRONOUS SET AND CLEAR

table

// CLK  J   K   S   R  NOTIFIER   Q(t)   Q(t+1) 
    ?   ?   ?   0   1     ?       : ? :    1;
    ?   ?   ?   *   1     ?       : 1 :    1; // Reset logic
    ?   ?   ?   1   0     ?       : ? :    0;
    ?   ?   ?   1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0   0   1   1     ?       : ? :    -;
    r   0   1   1   1     ?       : ? :    0;
    r   1   0   1   1     ?       : ? :    1;
    r   1   1   1   1     ?       : 1 :    0;
    r   1   1   1   1     ?       : 0 :    1;
    f   ?   ?   ?   ?     ?       : ? :    - ;   
                                   // J K transition cases
    b   *   ?   ?   ?     ?       : ? :    -;
    b   ?   *   ?   ?     ?       : ? :    -;
                                    // cases reducing pessimism
    p   0   0   1   1     ?       : ? :    -;
    p   0   ?   1   ?     ?       : 0 :    -;
    p   ?   0   ?   1     ?       : 1 :    -;
   (x0) ?   ?   ?   ?     ?       : ? :    -;
   (1x) 0   0   1   1     ?       : ? :    -;
   (1x) 0   ?   1   ?     ?       : 0 :    -;
   (1x) ?   0   ?   1     ?       : 1 :    -;
     x  *   0   ?   1     ?       : 1 :    -;
     x  0   *   1   ?     ?       : 0 :    -;
     ?  ?   ?   ?   ?     *       : ? :    x;  
endtable
endprimitive 
   
primitive VF1_LATCH(Q,D,LAT,R,S,NOTIFIER);
output Q;
reg Q;
input D,                                     // D input
      LAT,                                   //  Clock input
      R,S,                                   //   Active Low RESET and SET
      NOTIFIER;

// FUNCTION : POSITIVE LEVEL SENSITIVE D-TYPE LATCH WITH ACTIVE LOW ASYNCHRONOUS
//            RESET AND SET. (Q OUTPUT UDP)
table
//  D  LAT   R   S    NOTIFIER  :Q(t) :  Q(t+1)
    *   0    1   1      ?       :  ?  :  -  ;
    ?   ?    0   1      ?       :  ?  :  0  ;
    ?   ?    1   0      ?       :  ?  :  1  ;
    ?  (?0)  1   1      ?       :  ?  :  -  ;
    ?  (1x)  1   1      ?       :  ?  :  -  ;
    0  (x1)  ?   1      ?       :  ?  :  0  ;
    1  (x1)  1   ?      ?       :  ?  :  1  ;
    0  (0x)  1   1      ?       :  0  :  0  ;
    1  (0x)  1   1      ?       :  1  :  1  ;
  (?0)  1    ?   1      ?       :  ?  :  0  ;
  (?1)  1    1   ?      ?       :  ?  :  1  ;
    0  (01)  ?   1      ?       :  ?  :  0  ;
    1  (01)  1   ?      ?       :  ?  :  1  ;
    ?   0    1  (?1)    ?       :  ?  :  -  ; // ignore edge on SE
    ?   0   (?1) 1      ?       :  ?  :  -  ; // ignore edge on RE
    0   1    ?  (?1)    ?       :  ?  :  0  ;
    1   1   (?1) ?      ?       :  ?  :  1  ;
    1   1    1  (?1)    ?       :  ?  :  1  ;
    0   1   (?1) 1      ?       :  ?  :  0  ;
   (?1) x    1   ?      ?       :  1  :  1  ;
   (?0) x    ?   1      ?       :  0  :  0  ;
    ?   ?    ?   ?      *       :  ?  :  -  ;

endtable
 
endprimitive
primitive VF1_LATCH_X(Q,D,LAT,R,S,NOTIFIER);
output Q;
reg Q;
input D,                                     // D input
      LAT,                                   //  Clock input
      R,S,                                   //   Active Low RESET and SET
      NOTIFIER;

// FUNCTION : POSITIVE LEVEL SENSITIVE D-TYPE LATCH WITH ACTIVE LOW ASYNCHRONOUS
//            RESET AND SET. (Q OUTPUT UDP)
table
//  D  LAT   R   S    NOTIFIER  :Q(t) :  Q(t+1)
    *   0    1   1      ?       :  ?  :  -  ;
    ?   ?    0   1      ?       :  ?  :  0  ;
    ?   ?    1   0      ?       :  ?  :  1  ;
    ?  (?0)  1   1      ?       :  ?  :  -  ;
    ?  (1x)  1   1      ?       :  ?  :  -  ;
    0  (x1)  ?   1      ?       :  ?  :  0  ;
    1  (x1)  1   ?      ?       :  ?  :  1  ;
    0  (0x)  1   1      ?       :  0  :  0  ;
    1  (0x)  1   1      ?       :  1  :  1  ;
  (?0)  1    ?   1      ?       :  ?  :  0  ;
  (?1)  1    1   ?      ?       :  ?  :  1  ;
    0  (01)  ?   1      ?       :  ?  :  0  ;
    1  (01)  1   ?      ?       :  ?  :  1  ;
    ?   0    1  (?1)    ?       :  ?  :  -  ; // ignore edge on SE
    ?   0   (?1) 1      ?       :  ?  :  -  ; // ignore edge on RE
    0   1    ?  (?1)    ?       :  ?  :  0  ;
    1   1   (?1) ?      ?       :  ?  :  1  ;
    1   1    1  (?1)    ?       :  ?  :  1  ;
    0   1   (?1) 1      ?       :  ?  :  0  ;
   (?1) x    1   ?      ?       :  1  :  1  ;
   (?0) x    ?   1      ?       :  0  :  0  ;
    ?   ?    ?   ?      *       :  ?  :  x  ;
endtable
 
endprimitive
primitive VF1_RSFF(Q,CLK,RE,SE,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      RE,SE,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;

 //POSITIVE EDGE TRIGGERED SR-FLIP FLOP WITH ACTIVE LOW ASYNCHRONOUS SET AND CLEAR

table

// CLK  RE  SE  S   R  NOTIFIER   Q(t)   Q(t+1) 
                                         // Set logic
    ?   ?   ?   0   1     ?       : ? :    1;
    ?   ?   ?   *   1     ?       : 1 :    1;
                                        // Reset logic
    ?   ?   ?   1   0     ?       : ? :    0;
    ?   ?   ?   1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0   0   1   1     ?       : ? :    -;
    r   0   1   1   1     ?       : ? :    1;
    r   1   0   1   1     ?       : ? :    0;
    f   ?   ?   ?   ?     ?       : ? :    - ;   
                                   // S R transition cases

                                    // cases reducing pessimism
    p   0   0   1   1     ?       : ? :    -;
    p   1   1   1   ?     ?       : 0 :    x;
//  p   ?   1   ?   1     ?       : 1 :    x;
   (x0) ?   ?   ?   ?     ?       : ? :    -;
   (1x) 0   0   1   1     ?       : ? :    -;
   (1x) 0   ?   1   ?     ?       : 0 :    -;
   (1x) ?   0   ?   1     ?       : 1 :    -;
     x  *   0   ?   1     ?       : 1 :    -;
     x  0   *   1   ?     ?       : 0 :    -;
     ?  ?   ?   ?   ?     *	  : ? :    -;
     ?  *   ?   1   1     ?       : ? :    -;
     ?  ?   *   1   1     ?       : ? :    -;

endtable
endprimitive 
primitive VF1_RSFF_X(Q,CLK,RE,SE,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      RE,SE,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;

 //POSITIVE EDGE TRIGGERED SR-FLIP FLOP WITH ACTIVE LOW ASYNCHRONOUS SET AND CLEAR

table

// CLK  RE  SE  S   R  NOTIFIER   Q(t)   Q(t+1) 
                                         // Set logic
    ?   ?   ?   0   1     ?       : ? :    1;
//  ?   ?   ? (?1)   1     ?      : ? :    -;
    ?   1   1 (?1)   1     ?      : ? :    x;
//  ?   ?   ?   *   1     ?       : 1 :    1;
                                        // Reset logic
    ?   ?   ?   1   0     ?       : ? :    0;
//  ?   ?   ?   1   *     ?       : 0 :    0;
//  ?   ?   ?   1 (?1)    ?       : ? :    -;
    ?   1   1   1 (?1)    ?       : ? :    x;
                                       // normal clocking cases
    r   0   0   1   1     ?       : ? :    -;
    r   0   1   1   1     ?       : ? :    1;
    r   1   0   1   1     ?       : ? :    0;
    f   ?   ?   ?   ?     ?       : ? :    - ;   
                                   // S R transition cases
                                    // cases reducing pessimism
    p   0   0   1   1     ?       : ? :    -;
    p   1   1   1   ?     ?       : 0 :    x;
//  p   ?   1   ?   1     ?       : 1 :    -;
   (x0) ?   ?   ?   ?     ?       : ? :    -;
   (1x) 0   0   1   1     ?       : ? :    -;
   (1x) 0   ?   1   ?     ?       : 0 :    -;
   (1x) ?   0   ?   1     ?       : 1 :    -;
     x  *   0   ?   1     ?       : 1 :    -;
     x  0   *   1   ?     ?       : 0 :    -;
     ?  ?   ?   ?   ?     *       : ? :    x;
     ?  *   ?   1   1     ?       : ? :    -;
     ?  ?   *   1   1     ?       : ? :    -;
endtable
endprimitive 
primitive VF1_TFF(Q,CLK,T,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      T,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;


table

// CLK  T      S   R  NOTIFIER   Q(t)   Q(t+1) 
                                         // Set logic
    ?   ?      0   1     ?       : ? :    1;
    ?   ?      *   1     ?       : 1 :    1;
                                        // Reset logic
    ?   ?      1   0     ?       : ? :    0;
    ?   ?      1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0      1   1     ?       : ? :    -;
    r   1      1   1     ?       : 1 :    0;
    r   1      1   1     ?       : 0 :    1;
    f   ?      ?   ?     ?       : ? :    - ;   
                                   // T  transition cases
    b   *      ?   ?     ?       : ? :    -;
                                    // cases reducing pessimism
    p   0      1   1     ?       : ? :    -;
    p   0      1   ?     ?       : 0 :    -;
    p   0      ?   1     ?       : 1 :    -;
   (x0) ?      ?   ?     ?       : ? :    -;
   (1x) 0      1   1     ?       : ? :    -;
   (1x) ?      ?   1     ?       : 1 :    -;
     x  0      1   ?     ?       : 0 :    -;
     ?  ?      ?   ?     *       : ? :    -;

endtable
endprimitive 
primitive VF1_TFF_X(Q,CLK,T,S,R,NOTIFIER);
output Q;
reg Q;
input CLK,  //clock input
      T,  // FF inputs
      S,R,  // Reset,Set inputs
      NOTIFIER;


table

// CLK  T      S   R  NOTIFIER   Q(t)   Q(t+1) 
                                         // Set logic
    ?   ?      0   1     ?       : ? :    1;
    ?   ?      *   1     ?       : 1 :    1;
                                        // Reset logic
    ?   ?      1   0     ?       : ? :    0;
    ?   ?      1   *     ?       : 0 :    0;
                                       // normal clocking cases
    r   0      1   1     ?       : ? :    -;
    r   1      1   1     ?       : 1 :    0;
    r   1      1   1     ?       : 0 :    1;
    f   ?      ?   ?     ?       : ? :    - ;   
                                   // T  transition cases
    b   *      ?   ?     ?       : ? :    -;
                                    // cases reducing pessimism
    p   0      1   1     ?       : ? :    -;
    p   0      1   ?     ?       : 0 :    -;
    p   0      ?   1     ?       : 1 :    -;
   (x0) ?      ?   ?     ?       : ? :    -;
   (1x) 0      1   1     ?       : ? :    -;
   (1x) ?      ?   1     ?       : 1 :    -;
     x  0      1   ?     ?       : 0 :    -;
     ?  ?      ?   ?     *       : ? :    x;
endtable
endprimitive 
