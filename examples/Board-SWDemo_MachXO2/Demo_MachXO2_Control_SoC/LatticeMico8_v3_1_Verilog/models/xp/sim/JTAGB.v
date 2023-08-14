`resetall
`timescale 1 ns / 1 ps

`celldefine

module JTAGB (TCK, TMS, TDI, JTDO1, JTDO2, 
              TDO, JTCK, JTDI, JSHIFT, JUPDATE, JRSTN,
              JCE1, JCE2, JRTI1, JRTI2);

 input   TCK, TMS, TDI, JTDO1, JTDO2;

 output  TDO, JTCK, JTDI, JSHIFT, JUPDATE, JRSTN;
 output  JCE1, JCE2, JRTI1, JRTI2;

 parameter ER1 = "ENABLED";
 parameter ER2 = "ENABLED";

 supply0 GND;
 buf (TDO, GND);
 buf (JTCK, GND);
 buf (JTDI, GND);
 buf (JSHIFT, GND);
 buf (JUPDATE, GND);
 buf (JRSTN, GND);
 buf (JCE1, GND);
 buf (JCE2, GND);
 buf (JRTI1, GND);
 buf (JRTI2, GND);

endmodule

`endcelldefine
