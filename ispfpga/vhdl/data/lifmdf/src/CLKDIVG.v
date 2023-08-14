// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2005 by Lattice Semiconductor Corporation
// --------------------------------------------------------------------
//
//
//                     Lattice Semiconductor Corporation
//                     5555 NE Moore Court
//                     Hillsboro, OR 97214
//                     U.S.A.
//
//                     TEL: 1-800-Lattice  (USA and Canada)
//                          1-408-826-6000 (other locations)
//
//                     web: http://www.latticesemi.com/
//                     email: techsupport@latticesemi.com
//
// --------------------------------------------------------------------
//
// Simulation Library File for CLKDIVG in LIFMD
//
// $Header: 
//
`resetall
`timescale 1 ns / 1 ps

`celldefine

module CLKDIVG (CLKI, RST, ALIGNWD, CDIVX);
   input CLKI, RST, ALIGNWD;
   output CDIVX;

   parameter GSR = "DISABLED";
   parameter DIV = "2.0";

  reg cdiv_sigx, SRN;
  wire SR, CLKIB, RSTB, ALIGNWDB ;
  reg even_op, mc1_div3p5, mc1_div5;
  reg last_CLKIB, rst_reg0, rstn_reg0, slip_reg0, slipn_reg1, rst_reg1;
  reg slip_async, slip_state_reg, cnt_reg0, cntn_reg0,last_cnt_reg0;
  wire sel_inven, cnt_en, cnt_rstn, rst_reg2;
  reg cnt_reg1, cntn_reg1, sel_reg, sel_regn, cdiv_out, cnt_xfr;
  reg cnt_reg2, cntn_reg2; 
//  reg cnt_reg3, cntn_reg3,
  reg last_cnt_reg1;	  //div by 8.0
  reg cnt_reg7, cntn_reg7;
  reg div3,last_div3;	  
  reg cnt_reg8,cntn_reg8;	
  reg [2:0] state,nstate;
  parameter IDLE=3'b111, cyc0=3'b000,cyc1=3'b001,cyc2=3'b010,cyc3=3'b011,cyc4=3'b100,cyc5=3'b101,cyc6=3'b110;
  buf inst_buf1 (CDIVX, cdiv_sigx);
  buf inst_buf2 (CLKIB, CLKI);
  buf inst_buf3 (RSTB, RST);
  buf inst_buf4 (ALIGNWDB, ALIGNWD);

tri1 GSR_sig, PUR_sig;
`ifndef mixed_hdl
   assign GSR_sig = GSR_INST.GSRNET;
   assign PUR_sig = PUR_INST.PURNET;
`else
   gsr_pur_assign gsr_pur_assign_inst (GSR_sig, PUR_sig);
`endif

  initial 
  begin
     even_op = 1'b1;
     mc1_div3p5 = 1'b0;
     cdiv_sigx = 1'b0;
     rst_reg0 = 1'b0;
     rstn_reg0 = 1'b1;
     slip_reg0 = 1'b0;
     slipn_reg1 = 1'b0;
     rst_reg1 = 1'b0;
     slip_state_reg = 1'b0;
     cnt_reg0 = 1'b0;
     cntn_reg0 = 1'b1;
     cnt_reg1 = 1'b0;
     cntn_reg1 = 1'b1;		
	 cnt_reg7 = 1'b0;
     cntn_reg7 = 1'b1;
	 cnt_reg8= 1'b0;
	 cntn_reg8= 1'b1;
     sel_reg = 1'b0;
     sel_regn = 1'b1;
     cdiv_out = 1'b0;
     cnt_xfr = 1'b0;
     mc1_div5 = 1'b0;

     if (DIV == "5.0")
     begin
        mc1_div5 = 1'b1;
     end

     if (DIV == "2.0" || DIV == "4.0"|| DIV == "8.0" || DIV == "5.0"||DIV=="7.0")
     begin
        even_op = 1'b1;
        mc1_div3p5 = 1'b0;
     end        
     else if (DIV == "3.5")
     begin
        even_op = 1'b0;
        mc1_div3p5 = 1'b1;
     end        
  end

//  tri1 GSR_sig = GSR_INST.GSRNET;
//  tri1 PUR_sig = PUR_INST.PURNET;

  always @ (GSR_sig or PUR_sig ) begin
    if (GSR == "ENABLED") begin
      SRN = GSR_sig & PUR_sig ;
    end
    else if (GSR == "DISABLED")
      SRN = PUR_sig;
  end

  not (SR1, SRN);
  or INST1 (RSTB2, RSTB, SR1);

initial
begin
last_CLKIB = 1'b0;
end

always @ (CLKIB)
begin
   last_CLKIB <= CLKIB;
end

always @ (CLKIB)
begin
   last_div3 <= div3;
end

always @ (cnt_reg1)
begin
   last_cnt_reg1 <= cnt_reg1;
end

  always @ (CLKIB or RSTB2)
  begin
     if (RSTB2 == 1'b1)
     begin
        rst_reg0 <= 1'b0;
        rstn_reg0 <= 1'b1;
     end
     else if (CLKIB === 1'b1 && last_CLKIB === 1'b0)
     begin
        rst_reg0 <= 1'b1;
        rstn_reg0 <= 1'b0;
     end
  end

  always @ (CLKIB or rstn_reg0)
  begin
     if (rstn_reg0 == 1'b1)
     begin
        slip_async <= 1'b0;
        slip_reg0 <= 1'b0;
        slipn_reg1 <= 1'b1;
     end
     else if (CLKIB === 1'b1 && last_CLKIB === 1'b0)
     begin
        slip_async <= ALIGNWDB;
        slip_reg0 <= slip_async;
        slipn_reg1 <= ~slip_reg0;
     end
  end

  and INST2 (slip_rst, slip_reg0, slipn_reg1);
  and INST3 (slip_trig, even_op, slip_rst);

  always @ (CLKIB or rstn_reg0)
  begin
     if (rstn_reg0 == 1'b1)
     begin
        slip_state_reg <= 1'b0;
     end
     else if (CLKIB === 1'b1 && last_CLKIB === 1'b0)
     begin
        if (slip_trig == 1'b1)
        begin
           slip_state_reg <= ~slip_state_reg;
        end
        else 
        begin
           slip_state_reg <= slip_state_reg;
        end
     end
  end
 //clock divided by 2.0
  always @ (CLKIB or rstn_reg0)
  begin
     if (rstn_reg0 == 1'b1)
     begin
        cnt_reg0 <= 1'b1;
        cntn_reg0 <= 1'b0;
     end
     else if (CLKIB === 1'b1 && last_CLKIB === 1'b0)
     begin
        if (cnt_en == 1'b1)
        begin
           cnt_reg0 <= cntn_reg0 & cnt_rstn;
           cntn_reg0 <= ~(cntn_reg0 & cnt_rstn);
        end
        else if (cnt_en == 1'b0)
        begin
           cnt_reg0 <= cnt_reg0;
           cntn_reg0 <= ~cnt_reg0;
        end
     end
  end
// clock divider by 4.0	 & 5.0
  always @ (CLKIB or rstn_reg0)
  begin
     if (rstn_reg0 == 1'b1)
     begin
        cnt_reg1 <= 1'b1;
        cntn_reg1 <= 1'b0;
     end
     else if (CLKIB === 1'b1 && last_CLKIB === 1'b0)	 //posedge CLKIB
     begin
        if (cnt_en == 1'b1)
        begin
           cnt_reg1 <= (cnt_reg0 ^ cnt_reg1) & cnt_rstn;
           cntn_reg1 <= ~((cnt_reg0 ^ cnt_reg1) & cnt_rstn);
        end
        else if (cnt_en == 1'b0)
        begin
           cnt_reg1 <= cnt_reg1;
           cntn_reg1 <= ~cnt_reg1;
        end
     end
  end
  
  ///////////////////////	  
    always @ (cnt_reg1 or rstn_reg0)
  begin
     if (rstn_reg0 == 1'b1)
     begin
        cnt_reg8 <= 1'b0;
        cntn_reg8 <= 1'b1;
     end
     else if (cnt_reg1 === 1'b0 && last_cnt_reg1 === 1'b1)	 //posedge CLKIB
     begin
        if (cnt_en == 1'b1)
        begin
           cnt_reg8 <= cntn_reg8 & cnt_rstn;
           cntn_reg8 <= ~(cntn_reg8 & cnt_rstn);
        end
        else if (cnt_en == 1'b0)
        begin
           cnt_reg8 <= cnt_reg8;
           cntn_reg8 <= ~cnt_reg8;
        end
     end
  end
  
  

  ////////////////////////
 // clock divider by 8.0	 
  always @ (CLKIB or rstn_reg0)
  begin
     if (rstn_reg0 == 1'b1)
     begin
        cnt_reg2 <= 1'b0;
        cntn_reg2 <= 1'b1;
     end
     else if (CLKIB === 1'b1 && last_CLKIB === 1'b0)		
     begin
        if (cnt_en == 1'b1)
        begin
           cnt_reg2 <= ((cnt_reg0 & cnt_reg1) ^ cnt_reg2) & cnt_rstn;
           cntn_reg2 <= ~(((cnt_reg0 & cnt_reg1) ^ cnt_reg2) & cnt_rstn);
        end
        else if (cnt_en == 1'b0)
        begin
           cnt_reg2 <= cnt_reg2;
           cntn_reg2 <= ~cnt_reg2;
        end
     end
  end

  always @ (CLKIB or rstn_reg0)
  begin
     if (rstn_reg0 == 1'b1)
     begin
        sel_reg <= 1'b0;
        sel_regn <= 1'b1;
     end
     else if (CLKIB === 1'b1 && last_CLKIB === 1'b0)
     begin
        if (sel_inven == 1'b1)
        begin
           sel_reg <= sel_regn;
           sel_regn <= ~sel_regn;
        end
        else if (sel_inven == 1'b0)
        begin
           sel_reg <= sel_reg;
           sel_regn <= ~sel_reg;
        end
     end
  end

  always @ (CLKIB or rstn_reg0)
  begin
     if (rstn_reg0 == 1'b1)
     begin
        cnt_xfr <= 1'b0;
     end
     else if (CLKIB === 1'b0 && last_CLKIB === 1'b1)
     begin
        cnt_xfr <= cntn_reg1;
     end
  end
  
  
  always @( CLKIB)
	begin
     if (rstn_reg0 == 1'b1)
     begin
        cnt_reg7 <= 1'b0; 
		cntn_reg7 <= 1'b1; 
		state<=cyc0;
		nstate<=cyc0; 
		state<=IDLE;
     end
     else if (CLKIB === 1'b1 && last_CLKIB === 1'b0)
		 if (cnt_en == 1'b1)  state<=nstate;  
		 else if (cnt_en == 1'b0) 	state<=state;

	end		   
  always @(state,nstate)
	  begin
		  case(state)
			  IDLE:begin
				  cnt_reg7<=1'b0;
				  end
			  cyc0:begin
				if (cnt_en == 1'b1) begin
					cnt_reg7<=1'b1& cnt_rstn;
					cntn_reg7<=~(cnt_reg7& cnt_rstn);
					nstate<=cyc1;
				end	
				end
			 cyc1:begin
				if (cnt_en == 1'b1) begin
					cnt_reg7<=1'b1& cnt_rstn;
					cntn_reg7<=~(cnt_reg7& cnt_rstn);
					nstate<=cyc2;
				end	
				end
			 cyc2:begin
				if (cnt_en == 1'b1) begin
					cnt_reg7<=1'b1& cnt_rstn;
					cntn_reg7<=~(cnt_reg7& cnt_rstn);
					nstate<=cyc3;
				end	
				end
			 cyc3:begin
				if (cnt_en == 1'b1) begin
					cnt_reg7<=1'b0& cnt_rstn;
					cntn_reg7<=~(cnt_reg7& cnt_rstn);
					nstate<=cyc4;
				end	
				end
			 cyc4:begin
				if (cnt_en == 1'b1) begin
					cnt_reg7<=1'b0& cnt_rstn;
					cntn_reg7<=~(cnt_reg7& cnt_rstn);
					nstate<=cyc5;
				end	
				end
			 cyc5:begin
				if (cnt_en == 1'b1) begin
					cnt_reg7<=1'b0& cnt_rstn;
					cntn_reg7<=~(cnt_reg7& cnt_rstn);
					nstate<=cyc6;
				end	
  
				end
			 cyc6:begin
				if (cnt_en == 1'b1) begin
					cnt_reg7<=1'b0& cnt_rstn;
					cntn_reg7<=~(cnt_reg7& cnt_rstn);
					nstate<=cyc0;
				end	
				end
			default: begin
				nstate<=cyc0; 
				end
			endcase	
		end
  assign sel_inven = (cnt_reg1 & cnt_reg0 & mc1_div3p5 & sel_reg) | ((cnt_reg1 & cntn_reg0 & sel_regn & mc1_div3p5) & (~slip_rst));
  assign cnt_rstn = ~((cnt_reg1 & cntn_reg0 & sel_regn & mc1_div3p5) | (cnt_reg2 & cntn_reg1 & cntn_reg0 & mc1_div5));
  assign cnt_en = (~slip_rst & mc1_div3p5) | (~(slip_rst & slip_state_reg) & even_op);
                                                                                                       
  always @ (cntn_reg1, cnt_xfr, sel_reg)
  begin
     if (sel_reg == 1'b1)  begin
        cdiv_out <= cnt_xfr; 
		end
     else
        cdiv_out <= cntn_reg1;
  end
  always @(cdiv_out) div3 <=cdiv_out;                                                                                                     
  always @ (cdiv_out, cntn_reg0, CLKIB,cnt_reg7,cnt_reg8)
  begin
     if (DIV == "1.0")
        cdiv_sigx <= CLKIB;
     else if (DIV == "2.0")
        cdiv_sigx <= cntn_reg0;	
	 else if (DIV == "4.0")
        cdiv_sigx <= cntn_reg1;	
	 else if (DIV == "8.0")	
		cdiv_sigx <= cnt_reg8;	   
	 else if (DIV == "7.0")	
		cdiv_sigx <= cnt_reg7;
     else if (DIV == "3.5")
        cdiv_sigx <= cdiv_out;
  end


endmodule

`endcelldefine

