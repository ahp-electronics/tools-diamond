// ---------------------------------------------------------------------------
//
// Name : jtaghub16.v
//
// Description:
//
//    This module contains the ER1 register and JTAG controller.
//
// Revision 1.0  01/12/2007 mph
//
// Copyright (C) 2007-2011 Lattice Semiconductor Corp.  All rights reserved.
//
// ---------------------------------------------------------------------------
// fpga\verilog\pkg\versclibs\data\pmi\jtaghub16.v 1.3 19-JAN-2011 12:02:54 IALMOHAN

module jtaghub16 #(
    parameter  LSCC_FAMILY = "XO",
    parameter  IP_ENABLE_VAL = "0x0000",
    parameter  HUB_00 = "0x00",
    parameter  HUB_01 = "0x00",
    parameter  HUB_02 = "0x00",
    parameter  HUB_03 = "0x00",
    parameter  HUB_04 = "0x00",
    parameter  HUB_05 = "0x00",
    parameter  HUB_06 = "0x00",
    parameter  HUB_07 = "0x00",
    parameter  HUB_08 = "0x00",
    parameter  HUB_09 = "0x00",
    parameter  HUB_10 = "0x00",
    parameter  HUB_11 = "0x00",
    parameter  HUB_12 = "0x00",
    parameter  HUB_13 = "0x00",
    parameter  HUB_14 = "0x00",
    parameter  HUB_15 = "0x00")
(   
    input          tcka,
    input          tmsa,
    input          tdia,
    input [15 :0]  er2_tdo,

    output         tdoa,
    output         jtck,
    output         jtdi,
    output         jshift,
    output         jupdate,
    output         jrstn,
    output         jce2,
    output reg     cdn,
    output reg [15 :0] ip_enable
) /* synthesis GSR=DISABLED */ ;

  function [4*4-1:0] hexstr2bin_4(input [(4+2)*8-1:0] hexstr);
    integer i, j;
    reg [1:8] ch;
    begin
      for (i=4; i>=1; i=i-1)
      begin
	for (j=1; j<=8; j=j+1)
        	ch[j] = hexstr[i*8-j];
	case (ch)
		"0" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h0;
		"1" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h1;
		"2" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h2;
		"3" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h3;
		"4" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h4;
		"5" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h5;
		"6" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h6;
		"7" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h7;
		"8" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h8;
		"9" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'h9;
		"a",
		"A" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'hA;
		"b",
		"B" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'hB;
		"c",
		"C" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'hC;
		"d",
		"D" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'hD;
		"e",
		"E" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'hE;
		"f",
		"F" : {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'hF;
		default: {hexstr2bin_4[i*4-1], hexstr2bin_4[i*4-2], hexstr2bin_4[i*4-3], hexstr2bin_4[(i-1)*4]} = 4'hX;
	endcase
      end
    end
  endfunction

  function [2*4-1:0] hexstr2bin_2(input [(2+2)*8-1:0] hexstr);
    integer i, j;
    reg [1:8] ch;
    begin
      for (i=2; i>=1; i=i-1)
      begin
	for (j=1; j<=8; j=j+1)
        	ch[j] = hexstr[i*8-j];
	case (ch)
		"0" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h0;
		"1" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h1;
		"2" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h2;
		"3" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h3;
		"4" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h4;
		"5" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h5;
		"6" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h6;
		"7" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h7;
		"8" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h8;
		"9" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'h9;
		"a",
		"A" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'hA;
		"b",
		"B" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'hB;
		"c",
		"C" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'hC;
		"d",
		"D" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'hD;
		"e",
		"E" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'hE;
		"f",
		"F" : {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'hF;
		default: {hexstr2bin_2[i*4-1], hexstr2bin_2[i*4-2], hexstr2bin_2[i*4-3], hexstr2bin_2[(i-1)*4]} = 4'hX;
	endcase
      end
    end
  endfunction

localparam [7:0] JTAGHUB_ID = 8'h43;
localparam [255:0] ROM_INITVAL = {104'h00000000000000000000000000,
	                          hexstr2bin_2(HUB_15),hexstr2bin_2(HUB_14),hexstr2bin_2(HUB_13),hexstr2bin_2(HUB_12),
				  hexstr2bin_2(HUB_11),hexstr2bin_2(HUB_10),hexstr2bin_2(HUB_09),hexstr2bin_2(HUB_08),
				  hexstr2bin_2(HUB_07),hexstr2bin_2(HUB_06),hexstr2bin_2(HUB_05),hexstr2bin_2(HUB_04),
				  hexstr2bin_2(HUB_03),hexstr2bin_2(HUB_02),hexstr2bin_2(HUB_01),hexstr2bin_2(HUB_00),
				  hexstr2bin_4(IP_ENABLE_VAL),JTAGHUB_ID};

reg         jtdo2_int;
reg  [20:0] er1_shift_reg;
reg         id_enable;
reg         jce1_d1;
reg         jshift_d1;
reg  [4:0]  bit_count;
reg  [7:0]  rom_rd_addr;
wire        rom_dout;
wire        jce1;
wire        jtdo1;
wire        jtdo2;
wire        jrstn_int;

//  jrst signal from JTAGD is inverted relative to all other jtag controllers
assign jrstn = (LSCC_FAMILY == "XO" || LSCC_FAMILY == "LPTM") ? ~jrstn_int : jrstn_int;

assign jtdo1 = jce1 & jshift & ((bit_count == 0) ? 1'b0 : (bit_count == 1) ? 1'b1 : 
	           (bit_count == 2) ?  1'b1 : er1_shift_reg[1]);
assign jtdo2 = jce2 & jshift & jtdo2_int;

// select the active jtdo2 using the IP enables
// if multiple enables are active, the lowest numerical enable has precedence
always @(*) begin

         if (id_enable   )  jtdo2_int <= rom_dout;
    else if (ip_enable[0])  jtdo2_int <= er2_tdo[0];
    else if (ip_enable[1])  jtdo2_int <= er2_tdo[1];
    else if (ip_enable[2])  jtdo2_int <= er2_tdo[2];
    else if (ip_enable[3])  jtdo2_int <= er2_tdo[3];
    else if (ip_enable[4])  jtdo2_int <= er2_tdo[4];
    else if (ip_enable[5])  jtdo2_int <= er2_tdo[5];
    else if (ip_enable[6])  jtdo2_int <= er2_tdo[6];
    else if (ip_enable[7])  jtdo2_int <= er2_tdo[7];
    else if (ip_enable[8])  jtdo2_int <= er2_tdo[8];
    else if (ip_enable[9])  jtdo2_int <= er2_tdo[9];
    else if (ip_enable[10]) jtdo2_int <= er2_tdo[10];
    else if (ip_enable[11]) jtdo2_int <= er2_tdo[11];
    else if (ip_enable[12]) jtdo2_int <= er2_tdo[12];
    else if (ip_enable[13]) jtdo2_int <= er2_tdo[13];
    else if (ip_enable[14]) jtdo2_int <= er2_tdo[14];
    else                    jtdo2_int <= er2_tdo[15];
end

// shift and latch er1
always @(negedge jtck or negedge jrstn) begin

    if (jrstn == 1'b0) begin
        er1_shift_reg <= 0;
        ip_enable <= 0;
	cdn       <= 0;
        jshift_d1 <= 0;
        jce1_d1   <= 0;
	bit_count <= 0;
	rom_rd_addr <= 0;
    end
    else begin

        // reclock jshift and jce1 to falling edge of jtck
	jshift_d1 <= jshift;
	jce1_d1   <= jce1;

	// shift in
        if (jce1_d1 && jshift_d1) begin
            er1_shift_reg <= er1_shift_reg >> 1;
            er1_shift_reg[20] <= jtdi;
        end

	if (jshift & !jshift_d1)
	    bit_count <= 1;

	else if (jshift_d1) 
	    bit_count <= bit_count + 1;

        else if (!jshift)
            bit_count <= 0;

	if (jupdate) begin
            cdn       <= er1_shift_reg[3];
            ip_enable <= er1_shift_reg[19:4];
            id_enable <= er1_shift_reg[20];
	end

	if (!jshift)
	    rom_rd_addr <= 0;
        else 
	    rom_rd_addr <= rom_rd_addr + 1;
    end
end

// instantiate the 256-bit ROM primitive
generate
    if (LSCC_FAMILY == "ECP3" || LSCC_FAMILY == "XO2") begin

ROM256X1A #(
   .initval    ( ROM_INITVAL )
)
jtaghub_rom (
   .AD0        (rom_rd_addr[0]),
   .AD1        (rom_rd_addr[1]),
   .AD2        (rom_rd_addr[2]),
   .AD3        (rom_rd_addr[3]),
   .AD4        (rom_rd_addr[4]),
   .AD5        (rom_rd_addr[5]),
   .AD6        (rom_rd_addr[6]),
   .AD7        (rom_rd_addr[7]),
   .DO0        (rom_dout)
);

    end
    else begin

ROM256X1 #(
   .initval    ( ROM_INITVAL )
)
jtaghub_rom (
   .AD0        (rom_rd_addr[0]),
   .AD1        (rom_rd_addr[1]),
   .AD2        (rom_rd_addr[2]),
   .AD3        (rom_rd_addr[3]),
   .AD4        (rom_rd_addr[4]),
   .AD5        (rom_rd_addr[5]),
   .AD6        (rom_rd_addr[6]),
   .AD7        (rom_rd_addr[7]),
   .DO0        (rom_dout)
);

    end
endgenerate

// instantiate the hardwired jtag controller based on selected technology
generate

    if ((LSCC_FAMILY == "SC") || (LSCC_FAMILY == "SCM")) begin
        JTAGA jtaga_u (
            .TCK             (tcka),
            .TMS             (tmsa),
            .TDI             (tdia),
            .PSROUT1         (1'b0),
            .PSROUT2         (1'b0),
            .PSROUT3         (1'b0),
            .JTDO1           (jtdo1),
            .JTDO2           (jtdo2),
            .JTDO3           (1'b0),
            .JTDO4           (1'b0),
            .JTDO5           (1'b0),
            .JTDO6           (1'b0),
            .JTDO7           (1'b0),
            .JTDO8           (1'b0),
            .TDO             (tdoa),
            .TRESET          (),
            .PSRSFTN         (),
            .PSRCAP          (),
            .PSRENABLE1      (),
            .PSRENABLE2      (),
            .PSRENABLE3      (),
            .SCANENABLE1     (),
            .SCANENABLE2     (),
            .SCANENABLE3     (),
            .SCANENABLE4     (),
            .SCANENABLE5     (),
            .SCANENABLE6     (),
            .SCANENABLE7     (),
            .SCANENABLE8     (),
            .SCANI           (),
            .JTCK            (jtck),
            .JTDI            (jtdi),
            .JSHIFT          (jshift),
            .JUPDATE         (jupdate),
            .JRSTN           (jrstn_int),
            .JCE1            (jce1),
            .JCE2            (jce2),
            .JCE3            (),
            .JCE4            (),
            .JCE5            (),
            .JCE6            (),
            .JCE7            (),
            .JCE8            (),
            .JRTI1           (),
            .JRTI2           (),
            .JRTI3           (),
            .JRTI4           (),
            .JRTI5           (),
            .JRTI6           (),
            .JRTI7           (),
            .JRTI8           ()
        ) /* synthesis ER1=ENABLED */
	  /* synthesis ER2=ENABLED */;
    end
    
    if ((LSCC_FAMILY == "EC") || (LSCC_FAMILY == "ECP") || (LSCC_FAMILY == "XP")) begin
        JTAGB jtagb_u (
            .TCK     (tcka),
            .TMS     (tmsa),
            .TDI     (tdia),
            .JTDO1   (jtdo1),
            .JTDO2   (jtdo2),
            .TDO     (tdoa),
            .JTCK    (jtck),
            .JTDI    (jtdi),
            .JSHIFT  (jshift),
            .JUPDATE (jupdate),
            .JRSTN   (jrstn_int),
            .JCE1    (jce1),
            .JCE2    (jce2),
            .JRTI1   (),
            .JRTI2   ()
    );
    end
    
    if ((LSCC_FAMILY == "ECP2") || (LSCC_FAMILY == "ECP2M")) begin
        JTAGC jtagc_u (
            .TCK     (tcka),
            .TMS     (tmsa),
            .TDI     (tdia),
            .ITCK    (1'b0),
            .ITMS    (1'b0),
            .ITDI    (1'b0),
            .IJTAGEN (1'b1),
            .JTDO1   (jtdo1),
            .JTDO2   (jtdo2),
            .TDO     (tdoa),
            .ITDO    (),
            .JTCK    (jtck),
            .JTDI    (jtdi),
            .JSHIFT  (jshift),
            .JUPDATE (jupdate),
            .JRSTN   (jrstn_int),
            .JCE1    (jce1),
            .JCE2    (jce2),
            .JRTI1   (),
            .JRTI2   ()
    );
    end

    if (LSCC_FAMILY == "XO" || LSCC_FAMILY == "LPTM") begin

        JTAGD jtagd_u (
            .TCK     (tcka),
            .TMS     (tmsa),
            .TDI     (tdia),
            .JTDO1   (jtdo1),
            .JTDO2   (jtdo2),
            .TDO     (tdoa),
            .JTCK    (jtck),
            .JTDI    (jtdi),
            .JSHIFT  (jshift),
            .JUPDATE (jupdate),
            .JRST    (jrstn_int),
            .JCE1    (jce1),
            .JCE2    (jce2),
            .JRTI1   (),
            .JRTI2   ()
    );
    end

    if (LSCC_FAMILY == "XP2" || LSCC_FAMILY == "ECP3") begin
        JTAGE jtage_u (
            .TCK     (tcka),
            .TMS     (tmsa),
            .TDI     (tdia),
            .JTDO1   (jtdo1),
            .JTDO2   (jtdo2),
            .TDO     (tdoa),
            .JTDI    (jtdi),
            .JTCK    (jtck),
            .JRTI1   (),
            .JRTI2   (),
            .JSHIFT  (jshift),
            .JUPDATE (jupdate),
            .JRSTN   (jrstn_int),
            .JCE1    (jce1),
            .JCE2    (jce2)
    );
    end

    if (LSCC_FAMILY == "XO2") begin
        JTAGF jtagf_u (
            .TCK     (tcka),
            .TMS     (tmsa),
            .TDI     (tdia),
            .JTDO1   (jtdo1),
            .JTDO2   (jtdo2),
            .TDO     (tdoa),
            .JTDI    (jtdi),
            .JTCK    (jtck),
            .JRTI1   (),
            .JRTI2   (),
            .JSHIFT  (jshift),
            .JUPDATE (jupdate),
            .JRSTN   (jrstn_int),
            .JCE1    (jce1),
            .JCE2    (jce2)
    );
    end
endgenerate

endmodule

