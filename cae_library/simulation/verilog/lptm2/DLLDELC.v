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
// Simulation Library File for XO2
//
// $Header: 
//
`resetall
`timescale 1 ns / 1 ps

`celldefine

module DLLDELC (CLKI, DQSDEL, CLKO);

input CLKI, DQSDEL;
output CLKO;

parameter DEL_ADJ = "PLUS";
parameter DEL_VAL = 0;

wire CLKIB, DQSDELB;
realtime quarter_period, clk_last_rising_edge;
reg CLKOB;
integer clk_rising_edge_count;

   buf (CLKIB, CLKI);
   buf (DQSDELB, DQSDEL);
   buf (CLKO, CLKOB);

initial 
begin
   quarter_period = 0.0;
   clk_rising_edge_count = 0.0;
end

   always @(posedge CLKIB)
   begin
      clk_rising_edge_count <= clk_rising_edge_count + 1;
      clk_last_rising_edge = $realtime;
   end
                                                                                          
                                                                                          
   always @(negedge CLKIB)
   begin
      if (clk_rising_edge_count >= 1)
         quarter_period = ($realtime - clk_last_rising_edge)/2;
   end

  always @(CLKIB)
  begin
     if (DQSDELB == 1'b1)
        CLKOB <= #quarter_period CLKIB;
     else 
        CLKOB <= CLKIB;
  end


endmodule

`endcelldefine
