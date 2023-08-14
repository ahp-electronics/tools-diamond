#define SLASH2 //
#define STARTCOMM /*
#define ENDCOMM */
#log _circuit_name.v
module _circuit_name (
		//Interface to the external memory
		DQS,
		CK90,
		CK,
		RST,
		UPDATE_CNTL,
		#if #_postamble_solution == "Yes"
		CK_TURN_OFF,
		#endif
		#if #_tristate_dqs == "ON"
		DQSTRI_POS, DQSTRI_NEG,
		#else
		DQSTRI,
		#endif
		//
		#if #_postamble_solution == "Yes"
		CK_OUT
		#else
		DQS_DEL
		#endif
		)STARTCOMM synthesis syn_noprune=1 ENDCOMM; SLASH2 exemplar attribute _circuit_name dont_touch true

#define -r _DQS_MSB=_number_of_dqs-1
#define -r _DDR_MSB=(_number_of_dqs*8)-1

#if #_number_of_dqs == "1"
inout			DQS;
#else
inout	[_DQS_MSB:0]	DQS;
#endif
input			CK90;
input			CK;
input			RST;
input			UPDATE_CNTL;
#if #_postamble_solution == "Yes"
input			CK_TURN_OFF;
#endif
#if #_tristate_dqs == "ON"
input			DQSTRI_POS, DQSTRI_NEG;
#else
input			DQSTRI;
#endif
#if #_postamble_solution == "Yes"
 #if #_number_of_dqs == "1"
output			CK_OUT;
 #else
output	[_DQS_MSB:0]	CK_OUT;
 #endif
#else
 #if #_number_of_dqs == "1"
output			DQS_DEL;
 #else
output	[_DQS_MSB:0]	DQS_DEL;
 #endif
#endif

#if #_number_of_dqs == "1"
wire			DQS_DEL;
#else
wire	[_DQS_MSB:0]	DQS_DEL;
#endif

wire	[8:0]	dcntl_bus;

#if #_number_of_dqs == "1"
wire			dqsin, dqsout;
#else
wire	[_DQS_MSB:0] 	dqsin, dqsout;
#endif

#if #_tristate_dqs == "ON"
#if #_number_of_dqs == "1"
wire			tridqs;
#else
wire [_DQS_MSB:0] 	tridqs;
#endif
#endif
#if #_postamble_solution == "Yes"
#if #_number_of_dqs == "1"
wire			CK_OUT_DEL /*synthesis syn_keep=1 */;
#else
wire	[_DQS_MSB:0]	CK_OUT_DEL /*synthesis syn_keep=1 */;
#endif
#endif
wire CK_t STARTCOMM synthesis syn_keep=1 FREQUENCY = #_frquency_of_dqs ENDCOMM;

wire RSTN;
wire gnd_net, vcc_net;

INV inv_rst (.A(RST), .Z(RSTN));
VLO vlo_inst (.Z(gnd_net));
VHI vhi_inst (.Z(vcc_net));

//Master DLL

//synopsys translate_off
    defparam DLL0.CLKOS_DIV = 1;
    defparam DLL0.CLKOS_FPHASE = 0;
    defparam DLL0.CLKOS_PHASE = 0;
    defparam DLL0.CLKOP_PHASE = 90;
//synopsys translate_on

TRDLLA	DLL0	(
		.CLKI(CK_t),
		.RSTN(RSTN),
		.ALUHOLD(gnd_net),
		.UDDCNTL(UPDATE_CNTL),
		.SMIADDR9(gnd_net),
		.SMIADDR8(gnd_net),
		.SMIADDR7(gnd_net),
		.SMIADDR6(gnd_net),
		.SMIADDR5(gnd_net),
		.SMIADDR4(gnd_net),
		.SMIADDR3(gnd_net),
		.SMIADDR2(gnd_net),
		.SMIADDR1(gnd_net),
		.SMIADDR0(gnd_net),
		.SMIRD(gnd_net), 
		.SMIWR(gnd_net), 
		.SMICLK(gnd_net), 
        	.SMIWDATA(gnd_net), 
		.SMIRSTN(gnd_net),
		.CLKOP(),
		.CLKOS(),
		.LOCK(),
		.DCNTL0(dcntl_bus[0]), 
		.DCNTL1(dcntl_bus[1]), 
		.DCNTL2(dcntl_bus[2]), 
        	.DCNTL3(dcntl_bus[3]), 
		.DCNTL4(dcntl_bus[4]), 
		.DCNTL5(dcntl_bus[5]), 
        	.DCNTL6(dcntl_bus[6]), 
		.DCNTL7(dcntl_bus[7]), 
		.DCNTL8(dcntl_bus[8]), 
		.SMIRDATA())
             	STARTCOMM synthesis FREQUENCY_PIN_CLKI=#_frquency_of_dqs ENDCOMM
		/* synthesis GSR="DISABLED" */
             	/* synthesis CLKFB_PDEL="DEL0" */
             	/* synthesis CLKI_PDEL="DEL0" */
             	/* synthesis DCNTL_ADJVAL="0" */
             	/* synthesis CLKOS_FPHASE_ADJVAL="0" */
             	/* synthesis CLKOS_FDEL_ADJVAL="0" */
             	/* synthesis GLITCH_TOLERANCE="0" */
             	/* synthesis ALU_UNLOCK_CNT="3" */
             	/* synthesis ALU_LOCK_CNT="3" */
             	/* synthesis CLKOS_DIV="1" */
             	/* synthesis CLKOS_FPHASE="0" */
             	/* synthesis CLKOS_PHASE="0" */
             	/* synthesis CLKOP_PHASE="90" */;

    assign CK_t = CK;

//Slave DLL
#for (j=0;j<=_DQS_MSB;j=j+1) //for

 #if #_number_of_dqs == "1"
DELAY	U10DELAY (
		.A(dqsin), 
		.DCNTL0(dcntl_bus[0]), 
		.DCNTL1(dcntl_bus[1]),
                .DCNTL2(dcntl_bus[2]), 
		.DCNTL3(dcntl_bus[3]), 
		.DCNTL4(dcntl_bus[4]),
                .DCNTL5(dcntl_bus[5]), 
		.DCNTL6(dcntl_bus[6]), 
		.DCNTL7(dcntl_bus[7]),
                .DCNTL8(dcntl_bus[8]), 
		.Z(DQS_DEL))/* synthesis DELAYTYPE="DLL" */ ;
 #else		

DELAY	U1##j##DELAY (
		.A(dqsin[##j]), 
		.DCNTL0(dcntl_bus[0]), 
		.DCNTL1(dcntl_bus[1]),
                .DCNTL2(dcntl_bus[2]), 
		.DCNTL3(dcntl_bus[3]), 
		.DCNTL4(dcntl_bus[4]),
                .DCNTL5(dcntl_bus[5]), 
		.DCNTL6(dcntl_bus[6]), 
		.DCNTL7(dcntl_bus[7]),
                .DCNTL8(dcntl_bus[8]), 
		.Z(DQS_DEL[##j]))/* synthesis DELAYTYPE="DLL" */ ;
 #endif		

#if #_postamble_solution == "Yes"
//Clock Control Circuitary
// The 1 ns delay represent the edge clock injection delay.
 #if #_number_of_dqs == "1"
    assign #1 CK_OUT_DEL = CK_OUT;
 #else   
    assign #1 CK_OUT_DEL[##j] = CK_OUT[##j];
 #endif

 #if #_number_of_dqs == "1"
CLKCNTL	U00CLKCNTL (
			.D(DQS_DEL),
			.CLK(CK_OUT_DEL),
			.CE(CK_TURN_OFF),
			.Q(CK_OUT));
 #else
CLKCNTL	U0##j##CLKCNTL (
			.D(DQS_DEL[##j]),
			.CLK(CK_OUT_DEL[##j]),
			.CE(CK_TURN_OFF),
			.Q(CK_OUT[##j]));
 #endif
			
#endif
#endfor // end for

#if #_tristate_dqs == "ON"
#for (l=0;l<=_DQS_MSB;l=l+1)
 #if #_number_of_dqs == "1"
ODDRXA ODDR_DQS_TRI_INST0 (.DA(DQSTRI_POS), .DB(DQSTRI_NEG), .CLK(CK90), .RST(RST), .Q(tridqs));

ODDRXA ODDR_DQS_INST0 (.DA(gnd_net), .DB(vcc_net), .CLK(CK90), .RST(RST), .Q(dqsout));

BB bididqsInst0 (.I(dqsout), .T(tridqs), .O(dqsin), .B(DQS));
 #else
ODDRXA ODDR_DQS_TRI_INST##l (.DA(DQSTRI_POS), .DB(DQSTRI_NEG), .CLK(CK90), .RST(RST), .Q(tridqs[##l]));

ODDRXA ODDR_DQS_INST##l (.DA(gnd_net), .DB(vcc_net), .CLK(CK90), .RST(RST), .Q(dqsout[##l]));

BB bididqsInst##l (.I(dqsout[##l]), .T(tridqs[##l]), .O(dqsin[##l]), .B(DQS[##l]));
 #endif
#endfor
#else
#for (l=0;l<=_DQS_MSB;l=l+1)
 #if #_number_of_dqs == "1"
ODDRXA ODDR_DQS_INST0 (.DA(gnd_net), .DB(vcc_net), .CLK(CK90), .RST(RST), .Q(dqsout));
BB bididqsInst0 (.I(dqsout), .T(DQSTRI), .O(dqsin), .B(DQS));
 #else
ODDRXA ODDR_DQS_INST##l (.DA(gnd_net), .DB(vcc_net), .CLK(CK90), .RST(RST), .Q(dqsout[##l]));
BB bididqsInst##l (.I(dqsout[##l]), .T(DQSTRI), .O(dqsin[##l]), .B(DQS[##l]));
 #endif
#endfor
#endif
SLASH2 exemplar begin
#for (k=0;k<=_DQS_MSB;k=k+1)
SLASH2 exemplar attribute U1##k##DELAY DELAYTYPE DLL
#endfor
SLASH2 exemplar attribute DLL0 FREQUENCY_PIN_CLKI _frquency_of_dqs
SLASH2 exemplar attribute DLL0 GSR DISABLED
SLASH2 exemplar attribute DLL0 CLKFB_PDEL DEL0
SLASH2 exemplar attribute DLL0 CLKI_PDEL DEL0
SLASH2 exemplar attribute DLL0 DCNTL_ADJVAL 0
SLASH2 exemplar attribute DLL0 CLKOS_FPHASE_ADJVAL 0
SLASH2 exemplar attribute DLL0 CLKOS_FDEL_ADJVAL 0
SLASH2 exemplar attribute DLL0 GLITCH_TOLERANCE 0
SLASH2 exemplar attribute DLL0 ALU_UNLOCK_CNT 3
SLASH2 exemplar attribute DLL0 ALU_LOCK_CNT 3
SLASH2 exemplar attribute DLL0 CLKOS_DIV 1
SLASH2 exemplar attribute DLL0 CLKOS_FPHASE 0
SLASH2 exemplar attribute DLL0 CLKOS_PHASE 0
SLASH2 exemplar attribute DLL0 CLKOP_PHASE 90
SLASH2 exemplar attribute DLL0 FREQUENCY _frquency_of_dqs
SLASH2 exemplar end
endmodule
#log _circuit_name##_tmpl.v
// Verilog module instantiation template
_circuit_name __ (
		//Interface to the external memory
		.DQS(__),
		.CK90(__),
		.CK(__),
		.RST(__),
		.UPDATE_CNTL(__),
		#if #_postamble_solution == "Yes"
		.CK_TURN_OFF(__),
		#endif
		#if #_tristate_dqs == "ON"
		.DQSTRI_POS(__), 
		.DQSTRI_NEG(__),
		#else
		.DQSTRI(__),
		#endif
		//
		#if #_postamble_solution == "Yes"
		.CK_OUT(__)
		#else
		.DQS_DEL(__)
		#endif
		)  
