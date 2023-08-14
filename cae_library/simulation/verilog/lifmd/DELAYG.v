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
// Simulation Library File for DELAYG in LIFMD
//
// $Header: $ 
//
`resetall
`timescale 1 ns / 1 ps
`celldefine
module DELAYG (A, Z);
  input A;
  output Z;
 
  parameter DEL_MODE = "USER_DEFINED";
  parameter DEL_VALUE = 0;

  localparam DEL_VALUE_ALI =0;
  localparam DEL_VALUE_ECLK_ALIGNED =37;
  localparam DEL_VALUE_ECLK_CENTERED =28;
  localparam DEL_VALUE_ECLK_CENTERED_MIPI =25;
  localparam DEL_VALUE_ECLK_CENTERED_SLVS =25;
  localparam DEL_VALUE_SCLK_ALIGNED =49;
  localparam DEL_VALUE_SCLK_CENTERED =35;
  localparam DEL_VALUE_SCLK_ZEROHOLD =59;
  localparam DEL_VALUE_PLL_ZEROHOLD =35;

reg  [6:0] cntl_reg, cntl_reg_load;
realtime delta, cntl_delay;
reg ZB;

initial
begin
   ZB = 0;
   cntl_delay = 0.0;
   delta = 0.025;

   if (DEL_MODE=="USER_DEFINED") begin 
   cntl_reg = (DEL_VALUE);
   end
   else if (DEL_MODE=="ECLK_ALIGNED") begin 
   cntl_reg = (DEL_VALUE_ECLK_ALIGNED);
   end
   else if (DEL_MODE=="ECLK_CENTERED") begin 
   cntl_reg = (DEL_VALUE_ECLK_CENTERED);
   end
   else if (DEL_MODE=="ECLK_CENTERED_MIPI") begin 
   cntl_reg = (DEL_VALUE_ECLK_CENTERED_MIPI);
   end
   else if (DEL_MODE=="ECLK_CENTERED_SLVS") begin 
   cntl_reg = (DEL_VALUE_ECLK_CENTERED_SLVS);
   end
   else if (DEL_MODE=="SCLK_ALIGNED") begin 
   cntl_reg = (DEL_VALUE_SCLK_ALIGNED);
   end
   else if (DEL_MODE=="SCLK_CENTERED") begin 
   cntl_reg = (DEL_VALUE_SCLK_CENTERED);
   end
   else if (DEL_MODE=="SCLK_ZEROHOLD") begin 
   cntl_reg = (DEL_VALUE_SCLK_ZEROHOLD);
   end
   else if (DEL_MODE=="PLL_ZEROHOLD") begin 
   cntl_reg = (DEL_VALUE_PLL_ZEROHOLD);
   end
   else begin 
   cntl_reg = (DEL_VALUE_ALI);
   end

   cntl_reg_load = cntl_reg;
   cntl_delay = cntl_reg_load * delta;
end

  always @(*)
  begin
        ZB <= #cntl_delay A;
  end
 
  buf (Z, ZB);

endmodule
`endcelldefine
