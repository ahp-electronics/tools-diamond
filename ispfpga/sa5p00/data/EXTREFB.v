module EXTREFB (
   // EXTREF Pins
   input  REFCLKP, REFCLKN,
   output REFCLKO
   // No of ports = 2 inputs + 1 outputs = 3

   // Total no of ports = 3
  ); //synthesis syn_black_box

   // EXTREF Attr
   parameter REFCK_PWDNB = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter REFCK_RTERM = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   parameter REFCK_DCBIAS_EN = "DONTCARE"; //"DONTCARE" "0b0" "0b1"
   // No of parameters = 3

   // Total no of parameters = 3
endmodule

