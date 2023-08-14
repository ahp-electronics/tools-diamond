#log _circuit_name.v
`define NULL 0
`timescale 1 ps / 1 ps

module _circuit_name
(  rstn,
   scirmxdata,
   sciwdata,
   sciaddr,
   sciwstn,
   scird,
   jcex
)/* synthesis syn_hier="hard" */;

input         rstn         ;
input  [ 7:0] scirmxdata   ;
output [ 7:0] sciwdata     ;
output [17:0] sciaddr      ;
output        sciwstn      ;
output        scird        ;
output        jcex         ;

ORCAstra_JTAGE_Hub_sub ORCAstra_sub_inst
(   .rstn      (rstn      ),
    .scirmxdata(scirmxdata),
    .sciwdata  (sciwdata  ),
    .sciaddr   (sciaddr   ),
    .sciwstn   (sciwstn   ),
    .scird     (scird     ),
    .jcex      (jcex      ),
    .jtck      (jtck      ),
    .jtdi      (jtdi      ),
    .jshift    (jshift    ),
    .jupdate   (jupdate   ),
    .jrstn     (jrstn     ),
    .jce2      (jce2      ),
    .ip_enable (ip_enable ),
    .er2_tdo   (er2_tdo   )
)/* synthesis syn_noprune=1 */;

jtagconn16 jtagconn16_orcastra
(   .er2_tdo   (er2_tdo   ),
    .jtck      (jtck      ),
    .jtdi      (jtdi      ),
    .jshift    (jshift    ),
    .jupdate   (jupdate   ),
    .jrstn     (jrstn     ),
    .jce2      (jce2      ),
    .ip_enable (ip_enable )
)/* synthesis JTAG_IP="ORCA" */
 /* synthesis IP_ID="0"      */
 /* synthesis HUB_ID="0"     */
 /* synthesis syn_noprune=1  */;

endmodule


module ORCAstra_JTAGE_Hub_sub
(  rstn,
   scirmxdata,sciwdata,
   sciaddr,sciwstn,scird,
   jcex,
   jtck,jtdi,jshift,jupdate,jrstn,jce2,ip_enable,
   er2_tdo
) /* synthesis syn_hier="hard" */;

input          rstn;

input   [ 7:0] scirmxdata;
output  [ 7:0] sciwdata;
output  [17:0] sciaddr;
output         sciwstn;
output         scird;

output        jcex         ;

// these connect to the jtagconn16 element
input         jtck         ;
input         jtdi         ;
input         jshift       ;
input         jupdate      ;
input         jrstn        ;
input         jce2         ;
input         ip_enable    ;
output        er2_tdo      ;

wire jtck      /* synthesis syn_keep=1 */ ;
wire jtdi      /* synthesis syn_keep=1 */ ;
wire jshift    /* synthesis syn_keep=1 */ ;
wire jupdate   /* synthesis syn_keep=1 */ ;
wire jrstn     /* synthesis syn_keep=1 */ ;
wire jce2      /* synthesis syn_keep=1 */ ;
wire ip_enable /* synthesis syn_keep=1 */ ;
wire er2_tdo   /* synthesis syn_keep=1 */ ;

reg     [31:0] bs_ring;
reg     [25:0] DataInReg;
reg     [ 4:0] shift_cnt;
reg     [ 7:0] scirmxdatareg;
reg            scird ;
reg            sciwstn ;

reg            jtdi_reg;
reg            shift_dr_reg;
reg            jcex_reg;

assign jcex         = jcex_reg;

assign er2_tdo      = bs_ring[0];

always @(negedge jtck)
begin
    shift_dr_reg <= jshift;
    jcex_reg     <= jce2 & ip_enable;
    jtdi_reg     <= jtdi;
    if (shift_cnt == 5'b11110)
        scirmxdatareg <= scirmxdata;
end

always @(posedge jtck) begin
   if (jcex_reg & ~shift_dr_reg)
   begin
      shift_cnt <= 5'b00000;
   end
   else if (jcex_reg & shift_dr_reg)
   begin
      shift_cnt <= shift_cnt + 1;
   end
end

always @(posedge jtck or negedge rstn) begin
   if (~rstn)
   begin
      scird <= 1'b1 ;
      DataInReg[25:0] <= 26'h0000000 ;
      bs_ring         <= 32'h00000000 ;
      scird		  <= 1'b0;
      sciwstn	  <= 1'b0;
   end
   else
   begin
      if (jcex_reg & shift_dr_reg)
      begin
         if (shift_cnt == 5'b11110)
         begin
            DataInReg[25:0] <= bs_ring[28:3] ;
            if (bs_ring[30])
            begin
               scird    <=  bs_ring[29];
               sciwstn	<= !bs_ring[29];
            end
         end
         else if (shift_cnt == 5'b11111)
         begin
            bs_ring[31:0] <= ({20'b00000000000000000000,  1'b1,   1'b1,   1'b0,     1'b0,  scirmxdatareg}) ;
                                    // signal assgnment: pc_ack, pc_ack, pc_retry, pc_err, scirmxdata
         end
         else
         begin
            bs_ring[31:0] <= ({jtdi_reg, bs_ring[31:1]}) ;
            sciwstn      <= 1'b0;
         end
      end
   end
end

assign  sciwdata   = DataInReg[ 7:0] ;
assign	sciaddr    = DataInReg[25:8] ;

endmodule

#include <pcs/chip.v>
#include <pcs/ORCAstra.tft>

