// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// Copyright (c) 2005-2010 by Lattice Semiconductor Corporation
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
// Simulation Library File for MachXO3D
//
// fpga\verilog\pkg\versclibs\data\machxo3d\OSCJ.v 0.9.0 - 11/1/2017
//
`resetall
`timescale 1 ns / 1 ps

`celldefine

module OSCJ (STDBY, OSC, SEDSTDBY,OSCESB);
  input  STDBY;
  output OSC, SEDSTDBY,OSCESB;
  parameter  NOM_FREQ = "2.08";

  wire STDBYb;
  reg OSCb, OSC_r;
  reg OSCESBb, OSCESB_r;
  realtime half_clk;
  realtime half_clk5;

  buf (STDBYb, STDBY);
  buf (SEDSTDBY, STDBY);

  initial
  begin
     OSCb = 1'b0;
     OSCESBb = 1'b0;

     if (NOM_FREQ == "2.08")
        half_clk = 240.38;
     else if (NOM_FREQ == "2.15")
        half_clk = 232.558;
     else if (NOM_FREQ == "2.22")
        half_clk = 225.22;
     else if (NOM_FREQ == "2.29")
        half_clk = 218.34;
     else if (NOM_FREQ == "2.38")
        half_clk = 210.08;
     else if (NOM_FREQ == "2.46")
        half_clk = 203.25;
     else if (NOM_FREQ == "2.56")
        half_clk = 195.31;
     else if (NOM_FREQ == "2.66")
        half_clk = 187.97;
     else if (NOM_FREQ == "2.77")
        half_clk = 180.5;
     else if (NOM_FREQ == "2.89")
        half_clk = 173.0;
     else if (NOM_FREQ == "3.02")
        half_clk = 165.56;
     else if (NOM_FREQ == "3.17")
        half_clk = 157.73;
     else if (NOM_FREQ == "3.33")
        half_clk = 150.1;
     else if (NOM_FREQ == "3.5" || NOM_FREQ == "3.50")
        half_clk = 142.86;
     else if (NOM_FREQ == "3.69")
        half_clk = 135.5;
     else if (NOM_FREQ == "3.91")
        half_clk = 127.88;
     else if (NOM_FREQ == "4.16")
        half_clk = 120.19;
     else if (NOM_FREQ == "4.29")
        half_clk = 116.55;
     else if (NOM_FREQ == "4.43")
        half_clk = 112.866;
     else if (NOM_FREQ == "4.59")
        half_clk = 108.93;
     else if (NOM_FREQ == "4.75")
        half_clk = 105.26;
     else if (NOM_FREQ == "4.93")
        half_clk = 101.42;
     else if (NOM_FREQ == "5.12")
        half_clk = 97.656;
     else if (NOM_FREQ == "5.32")
        half_clk = 93.98;
     else if (NOM_FREQ == "5.54")
        half_clk = 90.25;
     else if (NOM_FREQ == "5.78")
        half_clk = 86.5;
     else if (NOM_FREQ == "6.05")
        half_clk = 82.64;
     else if (NOM_FREQ == "6.33")
        half_clk = 79.0;
     else if (NOM_FREQ == "6.65")
        half_clk = 75.19;
     else if (NOM_FREQ == "7.0" || NOM_FREQ == "7.00")
        half_clk = 71.43;
     else if (NOM_FREQ == "7.39")
        half_clk = 67.66;
     else if (NOM_FREQ == "7.82")
        half_clk = 63.94;
     else if (NOM_FREQ == "8.31")
        half_clk = 60.17;
     else if (NOM_FREQ == "8.58")
        half_clk = 58.27;
     else if (NOM_FREQ == "8.87")
        half_clk = 56.37;
     else if (NOM_FREQ == "9.17")
        half_clk = 54.52;
     else if (NOM_FREQ == "9.5" || NOM_FREQ == "9.50")
        half_clk = 52.63;
     else if (NOM_FREQ == "9.85")
        half_clk = 50.76;
     else if (NOM_FREQ == "10.23")
        half_clk = 48.875;
     else if (NOM_FREQ == "10.64")
        half_clk = 47.0;
     else if (NOM_FREQ == "11.08")
        half_clk = 45.12;
     else if (NOM_FREQ == "11.57")
        half_clk = 43.21;
     else if (NOM_FREQ == "12.09")
        half_clk = 41.35;
     else if (NOM_FREQ == "12.67")
        half_clk = 39.46;
     else if (NOM_FREQ == "13.3" || NOM_FREQ == "13.30")
        half_clk = 37.59;
     else if (NOM_FREQ == "14.0" || NOM_FREQ == "14.00")
        half_clk = 35.71;
     else if (NOM_FREQ == "14.78")
        half_clk = 33.83;
     else if (NOM_FREQ == "15.65")
        half_clk = 31.95;
     else if (NOM_FREQ == "16.63")
        half_clk = 30.06;
     else if (NOM_FREQ == "17.73")
        half_clk = 28.2;
     else if (NOM_FREQ == "19.0" || NOM_FREQ == "19.00")
        half_clk = 26.31;
     else if (NOM_FREQ == "20.46")
        half_clk = 24.44;
     else if (NOM_FREQ == "22.17")
        half_clk = 22.55;
     else if (NOM_FREQ == "24.18")
        half_clk = 20.68;
     else if (NOM_FREQ == "26.6" || NOM_FREQ == "26.60")
        half_clk = 18.8;
     else if (NOM_FREQ == "29.56")
        half_clk = 16.91;
     else if (NOM_FREQ == "33.25")
        half_clk = 15.04;
     else if (NOM_FREQ == "38.0" || NOM_FREQ == "38.00")
        half_clk = 13.16;
     else if (NOM_FREQ == "44.33")
        half_clk = 11.28;
     else if (NOM_FREQ == "53.2" || NOM_FREQ == "53.20")
        half_clk = 9.4;
     else if (NOM_FREQ == "66.5" || NOM_FREQ == "66.50")
        half_clk = 7.52;
     else if (NOM_FREQ == "88.67")
        half_clk = 5.638;
     else if (NOM_FREQ == "133.0" || NOM_FREQ == "133.00")
        half_clk = 3.76;
     else
     begin
        half_clk = 240.38;
        $display ("Warning! Wrong oscillator frequency; default to 2.08 MHz.");
     end
	 half_clk5 = 9.398; 
//     forever begin
//        #half_clk OSCb = ~OSCb;
//     end
//     forever begin
//        #half_clk5  OSCESBb = ~OSCESBb;
//     end
  end

  always #half_clk5 OSCESBb = ~OSCESBb;

  always #half_clk OSCb = ~OSCb;


  always @ (STDBYb or OSCb or OSCESBb)
  begin
     if (STDBYb == 1'b1)		  
     begin
        OSC_r <= 1'b0;
        OSCESB_r <= 1'b0;
	 end
     else
	 begin
        OSC_r <= OSCb;
        OSCESB_r <= OSCESBb;
	 end
  end

  buf (OSC, OSC_r);
  buf (OSCESB, OSCESB_r);

endmodule 

`endcelldefine
