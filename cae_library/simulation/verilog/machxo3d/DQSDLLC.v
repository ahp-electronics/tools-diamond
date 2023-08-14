// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2007 by Lattice Semiconductor Corporation
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
// Simulation Library File for ECP3
//
// $Header:  
//

`celldefine 
`timescale 1 ns / 1 ps
module DQSDLLC (CLK, RST, UDDCNTLN, FREEZE, DQSDEL, LOCK);

parameter DEL_ADJ = "PLUS";
parameter DEL_VAL = 0;
parameter LOCK_SENSITIVITY = "LOW";
parameter FIN = "100";
parameter FORCE_MAX_DELAY = "NO";
parameter GSR = "ENABLED";

parameter   LOCK_CYC   = 2;

input  CLK, RST, UDDCNTLN, FREEZE;
output LOCK, DQSDEL;

wire RST_int, UDDCNTL_int, UDDCNTL_buf;
reg  LOCK_int, DQSDEL_int;
wire clkin_in, FREEZEB, clkin_out;
reg last_clkin_in, freeze_clk_sync, freeze_clk_sync2n;
reg SRN;

  tri1 GSR_sig = GSR_INST.GSRNET;
  tri1 PUR_sig = PUR_INST.PURNET;

buf buf_clkin (clkin_in, CLK);
buf buf_rst  (RSTB1, RST);
buf buf_uddcntl (UDDCNTL_buf, UDDCNTLN);
buf buf_freeze (FREEZEB, FREEZE);

buf buf_lock (LOCK, LOCK_int);
buf buf_dqsdel (DQSDEL, DQSDEL_int);

integer clk_rising_edge_count;

assign UDDCNTL_int = ~UDDCNTL_buf;

initial
begin
   clk_rising_edge_count = 0;
   freeze_clk_sync = 1'b0;
   freeze_clk_sync2n = 1'b1;
   last_clkin_in = 1'b0;
end

  always @ (GSR_sig or PUR_sig ) begin
    if (GSR == "ENABLED")
      SRN = GSR_sig & PUR_sig ;
    else if (GSR == "DISABLED")
      SRN = PUR_sig;
  end

  not (SR, SRN);
  or INST1 (RST_int, RSTB1, SR);

always @ (clkin_in)
begin
   last_clkin_in <= clkin_in;
end

always @ (clkin_in or RST_int)     // neg edge
begin
   if (RST_int == 1'b1)
   begin
      freeze_clk_sync <= 1'b0;
      freeze_clk_sync2n <= 1'b1;
   end 
   else if (clkin_in === 1'b0 && last_clkin_in === 1'b1)
   begin
         freeze_clk_sync <= FREEZEB;
         freeze_clk_sync2n <= ~freeze_clk_sync;
   end
end

and INST2 (clkin_out, clkin_in, freeze_clk_sync2n);

always @(posedge clkin_out or posedge RST_int) 
begin
   if (RST_int)
       clk_rising_edge_count = 0;
   else
       clk_rising_edge_count = clk_rising_edge_count + 1;
end

always @(clk_rising_edge_count or RST_int)
begin
    if (RST_int)
         LOCK_int = 1'b0;
    else if (clk_rising_edge_count > LOCK_CYC)
         LOCK_int = 1'b1;
end

always @(LOCK_int or UDDCNTL_int or RST_int)
begin
  if (RST_int)
      DQSDEL_int = 1'b0;
  else if (UDDCNTL_int == 1'b1)
      DQSDEL_int = LOCK_int;
  else
      DQSDEL_int = DQSDEL_int;
end

specify 
 
(CLK => LOCK) =  0:0:0, 0:0:0;
(CLK => DQSDEL) =  0:0:0, 0:0:0;
(RST => LOCK) =  0:0:0, 0:0:0;
(RST => DQSDEL) =  0:0:0, 0:0:0;
(UDDCNTLN => LOCK) =  0:0:0, 0:0:0;
(UDDCNTLN => DQSDEL) =  0:0:0, 0:0:0;
 
endspecify 

endmodule

`endcelldefine 
