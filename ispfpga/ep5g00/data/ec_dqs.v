#define SLASH2 //
#define STARTCOMM /*
#define ENDCOMM */
#log _circuit_name.v
module _circuit_name (
		dq, dqs, clk, reset, uddcntl, read, datain_p, datain_n, 
		dqsc, prmbdet, lock, ddrclkpol, clk90, dataout_p, dataout_n, 
		ddrclk,
		#if #_clock_en_ddr_inreg == "ON"
		ddr_enable,
		#endif
		#if #_tristate_data_outreg == "ON"
		datatri_p, datatri_n,
		#else
		datatri,
		#endif
		#if #_tristate_dqs == "ON"
		dqstri_p, dqstri_n
		#else
		dqstri
		#endif
		)STARTCOMM synthesis syn_noprune=1 ENDCOMM; SLASH2 exemplar attribute _circuit_name dont_touch true

#define -r _DDR_MSB=_ddr_data_width-1
#define -r _DQS_MSB=_number_of_dqs-1
#if #_io_buffer_config == "SSTL25_I"
#define -r _clk_buffer_config SSTL25D_I
#endif
#if #_io_buffer_config == "SSTL25_II"
#define -r _clk_buffer_config SSTL25D_II
#endif

//From DDR MEM
inout [_DDR_MSB:0] dq STARTCOMM synthesis IO_TYPE=#_io_buffer_config ENDCOMM;
#if #_number_of_dqs == "1"
inout		dqs STARTCOMM synthesis IO_TYPE=#_io_buffer_config ENDCOMM;
#else
inout [_DQS_MSB:0] dqs STARTCOMM synthesis IO_TYPE=#_io_buffer_config ENDCOMM;
#endif
input clk, clk90, reset, uddcntl;
#if #_number_of_dqs == "1"
input		read;
#else
input [_DQS_MSB:0] read;
#endif
input [_DDR_MSB:0] dataout_p, dataout_n;
#if #_tristate_data_outreg == "ON"
input  datatri_p, datatri_n;
#else
input  datatri;
#endif
#if #_tristate_dqs == "ON"
input dqstri_p, dqstri_n;
#else
input dqstri;
#endif

output [_DDR_MSB:0] datain_p;
output [_DDR_MSB:0] datain_n;
output lock;
#if #_number_of_dqs == "1"
output		dqsc, prmbdet, ddrclkpol;
#else
output [_DQS_MSB:0] dqsc, prmbdet, ddrclkpol;
#endif
output ddrclk STARTCOMM synthesis IO_TYPE=#_clk_buffer_config ENDCOMM;
#if #_clock_en_ddr_inreg == "ON"
input		ddr_enable;
#endif

wire vcc_net,gnd_net;
wire dqsdel, clk;
wire clk_i STARTCOMM synthesis syn_keep=1 ENDCOMM;
#if #_tristate_dqs == "ON"
#if #_number_of_dqs == "1"
wire	ddrclkpol_sig, tridqs;
#else
wire [_DQS_MSB:0] ddrclkpol_sig, tridqs;	
#endif
#else
#if #_number_of_dqs == "1"
wire		ddrclkpol_sig;
#else
wire [_DQS_MSB:0] ddrclkpol_sig;
#endif
#endif

#if #_tristate_data_outreg == "ON"
wire [_DDR_MSB:0] ddrin, ddrout, tridata;
#else
wire [_DDR_MSB:0] ddrin, ddrout;
#endif

#if #_number_of_dqs == "1"
wire		dqsout, dqsin, dqsbuf;
#else
wire [_DQS_MSB:0] dqsout, dqsin, dqsbuf;
#endif
wire ddrclk;
wire ce_net;

INV inv_clk (.A(clk), .Z(clk_i));
VLO vlo_inst (.Z(gnd_net));
VHI vhi_inst (.Z(vcc_net));

#if #_clock_en_ddr_inreg == "ON"
assign ce_net = ddr_enable;
#else
assign ce_net = vcc_net;
#endif

//Bidirectional Strobe, DQS
#for (j=0;j<=_DQS_MSB;j=j+1)
#define -r _DDR_MSB_TIMES=(j*8)
#define -r _DDR_MSB_TIMES1=_DDR_MSB_TIMES+1
#define -r _DDR_MSB_TIMES2=_DDR_MSB_TIMES+2
#define -r _DDR_MSB_TIMES3=_DDR_MSB_TIMES+3
#define -r _DDR_MSB_TIMES4=_DDR_MSB_TIMES+4
#define -r _DDR_MSB_TIMES5=_DDR_MSB_TIMES+5
#define -r _DDR_MSB_TIMES6=_DDR_MSB_TIMES+6
#define -r _DDR_MSB_TIMES7=_DDR_MSB_TIMES+7

#if #_number_of_dqs == "1"
DQSBUFB SLAVE##j (.DQSI(dqsin), .CLK(clk), .READ(read), .DQSDEL(dqsdel), 
	.DDRCLKPOL(ddrclkpol_sig), .DQSC(dqsc), .PRMBDET(prmbdet), 
	.DQSO(dqsbuf));
#else	
DQSBUFB SLAVE##j (.DQSI(dqsin[##j]), .CLK(clk), .READ(read[##j]), .DQSDEL(dqsdel), 
	.DDRCLKPOL(ddrclkpol_sig[##j]), .DQSC(dqsc[##j]), .PRMBDET(prmbdet[##j]), 
	.DQSO(dqsbuf[##j]));
#endif	

//synopsys translate_off
defparam IDDR_INST##j##0.REGSET = #_lsr_for_ddr_inreg;
//synopsys translate_on
#if #_number_of_dqs == "1"
IDDRXB IDDR_INST##j##0 (.D(ddrin[##_DDR_MSB_TIMES]), .ECLK(dqsbuf), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES]), .QB(datain_n[##_DDR_MSB_TIMES]))
#else
IDDRXB IDDR_INST##j##0 (.D(ddrin[##_DDR_MSB_TIMES]), .ECLK(dqsbuf[##j]), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig[##j]), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES]), .QB(datain_n[##_DDR_MSB_TIMES]))
#endif
	STARTCOMM synthesis REGSET=#_lsr_for_ddr_inreg ENDCOMM;

//synopsys translate_off
defparam IDDR_INST##j##1.REGSET = #_lsr_for_ddr_inreg;
//synopsys translate_on
#if #_number_of_dqs == "1"
IDDRXB IDDR_INST##j##1 (.D(ddrin[##_DDR_MSB_TIMES1]), .ECLK(dqsbuf), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES1]), .QB(datain_n[##_DDR_MSB_TIMES1]))
#else
IDDRXB IDDR_INST##j##1 (.D(ddrin[##_DDR_MSB_TIMES1]), .ECLK(dqsbuf[##j]), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig[##j]), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES1]), .QB(datain_n[##_DDR_MSB_TIMES1]))
#endif
	STARTCOMM synthesis REGSET=#_lsr_for_ddr_inreg ENDCOMM;

//synopsys translate_off
defparam IDDR_INST##j##2.REGSET = #_lsr_for_ddr_inreg;
//synopsys translate_on
#if #_number_of_dqs == "1"
IDDRXB IDDR_INST##j##2 (.D(ddrin[##_DDR_MSB_TIMES2]), .ECLK(dqsbuf), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES2]), .QB(datain_n[##_DDR_MSB_TIMES2]))
#else
IDDRXB IDDR_INST##j##2 (.D(ddrin[##_DDR_MSB_TIMES2]), .ECLK(dqsbuf[##j]), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig[##j]), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES2]), .QB(datain_n[##_DDR_MSB_TIMES2]))
#endif
	STARTCOMM synthesis REGSET=#_lsr_for_ddr_inreg ENDCOMM;

//synopsys translate_off
defparam IDDR_INST##j##3.REGSET = #_lsr_for_ddr_inreg;
//synopsys translate_on
#if #_number_of_dqs == "1"
IDDRXB IDDR_INST##j##3 (.D(ddrin[##_DDR_MSB_TIMES3]), .ECLK(dqsbuf), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES3]), .QB(datain_n[##_DDR_MSB_TIMES3]))
#else
IDDRXB IDDR_INST##j##3 (.D(ddrin[##_DDR_MSB_TIMES3]), .ECLK(dqsbuf[##j]), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig[##j]), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES3]), .QB(datain_n[##_DDR_MSB_TIMES3]))
#endif
	STARTCOMM synthesis REGSET=#_lsr_for_ddr_inreg ENDCOMM;

//synopsys translate_off
defparam IDDR_INST##j##4.REGSET = #_lsr_for_ddr_inreg;
//synopsys translate_on
#if #_number_of_dqs == "1"
IDDRXB IDDR_INST##j##4 (.D(ddrin[##_DDR_MSB_TIMES4]), .ECLK(dqsbuf), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES4]), .QB(datain_n[##_DDR_MSB_TIMES4]))
#else
IDDRXB IDDR_INST##j##4 (.D(ddrin[##_DDR_MSB_TIMES4]), .ECLK(dqsbuf[##j]), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig[##j]), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES4]), .QB(datain_n[##_DDR_MSB_TIMES4]))
#endif
	STARTCOMM synthesis REGSET=#_lsr_for_ddr_inreg ENDCOMM;

//synopsys translate_off
defparam IDDR_INST##j##5.REGSET = #_lsr_for_ddr_inreg;
//synopsys translate_on
#if #_number_of_dqs == "1"
IDDRXB IDDR_INST##j##5 (.D(ddrin[##_DDR_MSB_TIMES5]), .ECLK(dqsbuf), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES5]), .QB(datain_n[##_DDR_MSB_TIMES5]))
#else
IDDRXB IDDR_INST##j##5 (.D(ddrin[##_DDR_MSB_TIMES5]), .ECLK(dqsbuf[##j]), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig[##j]), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES5]), .QB(datain_n[##_DDR_MSB_TIMES5]))
#endif
	STARTCOMM synthesis REGSET=#_lsr_for_ddr_inreg ENDCOMM;

//synopsys translate_off
defparam IDDR_INST##j##6.REGSET = #_lsr_for_ddr_inreg;
//synopsys translate_on
#if #_number_of_dqs == "1"
IDDRXB IDDR_INST##j##6 (.D(ddrin[##_DDR_MSB_TIMES6]), .ECLK(dqsbuf), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES6]), .QB(datain_n[##_DDR_MSB_TIMES6]))
#else
IDDRXB IDDR_INST##j##6 (.D(ddrin[##_DDR_MSB_TIMES6]), .ECLK(dqsbuf[##j]), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig[##j]), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES6]), .QB(datain_n[##_DDR_MSB_TIMES6]))
#endif
	STARTCOMM synthesis REGSET=#_lsr_for_ddr_inreg ENDCOMM;

//synopsys translate_off
defparam IDDR_INST##j##7.REGSET = #_lsr_for_ddr_inreg;
//synopsys translate_on
#if #_number_of_dqs == "1"
IDDRXB IDDR_INST##j##7 (.D(ddrin[##_DDR_MSB_TIMES7]), .ECLK(dqsbuf), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES7]), .QB(datain_n[##_DDR_MSB_TIMES7]))
#else
IDDRXB IDDR_INST##j##7 (.D(ddrin[##_DDR_MSB_TIMES7]), .ECLK(dqsbuf[##j]), .SCLK(clk), .CE(ce_net), .DDRCLKPOL(ddrclkpol_sig[##j]), .LSR(reset), .QA(datain_p[##_DDR_MSB_TIMES7]), .QB(datain_n[##_DDR_MSB_TIMES7]))
#endif
	STARTCOMM synthesis REGSET=#_lsr_for_ddr_inreg ENDCOMM;
#if #_number_of_dqs == "1"
assign ddrclkpol = ddrclkpol_sig;
#else
assign ddrclkpol[##j] = ddrclkpol_sig[##j];
#endif
#endfor

//Master DLL
// synopsys translate_off
defparam MASTERDLLINST.LOCK_SENSITIVITY = #_lock_jitter_sensitivity;
// synopsys translate_on	 
DQSDLL MASTERDLLINST (.CLK(clk), .UDDCNTL(uddcntl), .RST(reset), .DQSDEL(dqsdel), .LOCK(lock))
STARTCOMM synthesis LOCK_SENSITIVITY =#_lock_jitter_sensitivity ENDCOMM
STARTCOMM synthesis FREQUENCY_PIN_CLK =#_frquency_of_dqs ENDCOMM ;

//----TRISTATE Instantiations-----
#if #_tristate_data_outreg == "ON"
// DDR Trisate for data, DQ
#for (k=0;k<=_DDR_MSB;k=k+1)
ODDRXB ODDR_DQ_TRI_INST##k (.DA(datatri_p), .DB(datatri_n), .LSR(reset), .CLK(clk_i), .Q(tridata[##k]));
//-----------DQ output--------
ODDRXB ODDR_DQ_INST##k (.DA(dataout_p[##k]), .DB(dataout_n[##k]), .LSR(reset), .CLK(clk_i), .Q(ddrout[##k]));
//-------Bidirectional Data Buffers -----
BB bidiInst##k (.I(ddrout[##k]), .T(tridata[##k]), .O(ddrin[##k]), .B(dq[##k]));
#endfor
#else
#for (k=0;k<=_DDR_MSB;k=k+1)
//-----------DQ output--------
ODDRXB ODDR_DQ_INST##k (.DA(dataout_p[##k]), .DB(dataout_n[##k]), .LSR(reset), .CLK(clk_i), .Q(ddrout[##k]));
//-------Bidirectional Data Buffers -----
BB bidiInst##k (.I(ddrout[##k]), .T(datatri), .O(ddrin[##k]), .B(dq[##k]));
#endfor
#endif

#if #_tristate_dqs == "ON"
// DDR Trisate for strobe, DQS
#for (l=0;l<=_DQS_MSB;l=l+1)
#if #_number_of_dqs == "1"
ODDRXB ODDR_DQS_TRI_INST##l (.DA(dqstri_p), .DB(dqstri_n), .LSR(reset), .CLK(clk90), .Q(tridqs));
#else
ODDRXB ODDR_DQS_TRI_INST##l (.DA(dqstri_p), .DB(dqstri_n), .LSR(reset), .CLK(clk90), .Q(tridqs[##l]));
#endif
//--------------- DQS output-------------------
#if #_number_of_dqs == "1"
ODDRXB ODDR_DQS_INST##l (.DA(gnd_net), .DB(vcc_net), .LSR(reset), .CLK(clk90), .Q(dqsout));
#else
ODDRXB ODDR_DQS_INST##l (.DA(gnd_net), .DB(vcc_net), .LSR(reset), .CLK(clk90), .Q(dqsout[##l]));
#endif
//-------Bidirectional DQS Buffers -----
#if #_number_of_dqs == "1"
BB bididqsInst##l (.I(dqsout), .T(tridqs), .O(dqsin), .B(dqs));
#else
BB bididqsInst##l (.I(dqsout[##l]), .T(tridqs[##l]), .O(dqsin[##l]), .B(dqs[##l]));
#endif
#endfor
#else
#for (l=0;l<=_DQS_MSB;l=l+1)
//--------------- DQS output-------------------
#if #_number_of_dqs == "1"
ODDRXB ODDR_DQS_INST##l (.DA(gnd_net), .DB(vcc_net), .LSR(reset), .CLK(clk90), .Q(dqsout));
#else
ODDRXB ODDR_DQS_INST##l (.DA(gnd_net), .DB(vcc_net), .LSR(reset), .CLK(clk90), .Q(dqsout[##l]));
#endif
//-------Bidirectional DQS Buffers -----
#if #_number_of_dqs == "1"
BB bididqsInst##l (.I(dqsout), .T(dqstri), .O(dqsin), .B(dqs));
#else
BB bididqsInst##l (.I(dqsout[##l]), .T(dqstri), .O(dqsin[##l]), .B(dqs[##l]));
#endif
#endfor
#endif
//--------------- CLKOUTP and CLKOUTN Generation-----------------

ODDRXB O9 (.DA(gnd_net), .DB(vcc_net), .LSR(reset), .CLK(clk90), .Q(ddrclk));

//Attributes for Mentor

SLASH2 exemplar begin
SLASH2 exemplar attribute dq IO_TYPE _io_buffer_config
SLASH2 exemplar attribute dqs IO_TYPE _io_buffer_config
SLASH2 exemplar attribute ddrclk IO_TYPE _clk_buffer_config

SLASH2 exemplar attribute MASTERDLLINST LOCK_SENSITIVITY _lock_jitter_sensitivity
SLASH2 exemplar attribute MASTERDLLINST FREQUENCY_PIN_CLK _frquency_of_dqs

#for (z=0;z<=_DQS_MSB;z=z+1)
#define -r _DDR_MSB_TIMES=(j*8)
#define -r _DDR_MSB_TIMES1=_DDR_MSB_TIMES+1
#define -r _DDR_MSB_TIMES2=_DDR_MSB_TIMES+2
#define -r _DDR_MSB_TIMES3=_DDR_MSB_TIMES+3
#define -r _DDR_MSB_TIMES4=_DDR_MSB_TIMES+4
#define -r _DDR_MSB_TIMES5=_DDR_MSB_TIMES+5
#define -r _DDR_MSB_TIMES6=_DDR_MSB_TIMES+6
#define -r _DDR_MSB_TIMES7=_DDR_MSB_TIMES+7

SLASH2 exemplar attribute IDDR_INST##z##0 REGSET _lsr_for_ddr_inreg
SLASH2 exemplar attribute IDDR_INST##z##1 REGSET _lsr_for_ddr_inreg
SLASH2 exemplar attribute IDDR_INST##z##2 REGSET _lsr_for_ddr_inreg
SLASH2 exemplar attribute IDDR_INST##z##3 REGSET _lsr_for_ddr_inreg
SLASH2 exemplar attribute IDDR_INST##z##4 REGSET _lsr_for_ddr_inreg
SLASH2 exemplar attribute IDDR_INST##z##5 REGSET _lsr_for_ddr_inreg
SLASH2 exemplar attribute IDDR_INST##z##6 REGSET _lsr_for_ddr_inreg
SLASH2 exemplar attribute IDDR_INST##z##7 REGSET _lsr_for_ddr_inreg

#endfor
SLASH2 exemplar end
endmodule
