/* Verilog netlist generated by SCUBA ispLever_v8.1_ALPHA_Build (578) */
/* Module Version: 3.1 */
/* C:\lscc\diamond\1.0\ispfpga\bin\nt\scuba.exe -w -lang verilog -synth synplify -bus_exp 7 -bb -arch ep5m00 -type add -width 16 -unsigned -pipeline 0 -e  */
/* Fri Apr 09 16:13:44 2010 */


`timescale 1 ns / 1 ps
module add8 (DataA, DataB, Result);
    input wire [15:0] DataA;
    input wire [15:0] DataB;
    output wire [15:0] Result;

    wire scuba_vhi;
    wire co0;
    wire co1;
    wire co2;
    wire co3;
    wire co4;
    wire co5;
    wire co6;
    wire co7d;
    wire co7;
    wire scuba_vlo;

    VHI scuba_vhi_inst (.Z(scuba_vhi));

    FADD2B addsub_0 (.A0(DataA[0]), .A1(DataA[1]), .B0(DataB[0]), .B1(DataB[1]), 
        .CI(scuba_vlo), .COUT(co0), .S0(Result[0]), .S1(Result[1]));

    FADD2B addsub_1 (.A0(DataA[2]), .A1(DataA[3]), .B0(DataB[2]), .B1(DataB[3]), 
        .CI(co0), .COUT(co1), .S0(Result[2]), .S1(Result[3]));

    FADD2B addsub_2 (.A0(DataA[4]), .A1(DataA[5]), .B0(DataB[4]), .B1(DataB[5]), 
        .CI(co1), .COUT(co2), .S0(Result[4]), .S1(Result[5]));

    FADD2B addsub_3 (.A0(DataA[6]), .A1(DataA[7]), .B0(DataB[6]), .B1(DataB[7]), 
        .CI(co2), .COUT(co3), .S0(Result[6]), .S1(Result[7]));

    FADD2B addsub_4 (.A0(DataA[8]), .A1(DataA[9]), .B0(DataB[8]), .B1(DataB[9]), 
        .CI(co3), .COUT(co4), .S0(Result[8]), .S1(Result[9]));

    FADD2B addsub_5 (.A0(DataA[10]), .A1(DataA[11]), .B0(DataB[10]), .B1(DataB[11]), 
        .CI(co4), .COUT(co5), .S0(Result[10]), .S1(Result[11]));

    FADD2B addsub_6 (.A0(DataA[12]), .A1(DataA[13]), .B0(DataB[12]), .B1(DataB[13]), 
        .CI(co5), .COUT(co6), .S0(Result[12]), .S1(Result[13]));

    FADD2B addsub_7 (.A0(DataA[14]), .A1(DataA[15]), .B0(DataB[14]), .B1(DataB[15]), 
        .CI(co6), .COUT(co7), .S0(Result[14]), .S1(Result[15]));

    VLO scuba_vlo_inst (.Z(scuba_vlo));

    FADD2B addsubd (.A0(scuba_vlo), .A1(scuba_vlo), .B0(scuba_vlo), .B1(scuba_vlo), 
        .CI(co7), .COUT(), .S0(co7d), .S1());



    // exemplar begin
    // exemplar end

endmodule
