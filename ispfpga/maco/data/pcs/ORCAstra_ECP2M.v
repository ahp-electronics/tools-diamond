#log _circuit_name.v
`define NULL 0
`timescale 1ns/ 10 ps

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

ECP2M_ORCAstra_JTAG_Hub_sub ORCAstra_sub_inst
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


module ECP2M_ORCAstra_JTAG_Hub_sub
  ( rstn,
   scirmxdata,sciwdata,
   sciaddr,sciwstn,scird,
   jcex,
   jtck,jtdi,jshift,jupdate,jrstn,jce2,ip_enable,
   er2_tdo
  ) /* synthesis syn_hier="hard" */;

input         rstn         ;

input  [ 7:0] scirmxdata   ;
output [ 7:0] sciwdata     ;
output [17:0] sciaddr      ;
output        sciwstn      ;
output        scird        ;

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

wire jtdi      /* synthesis syn_keep=1 */ ;
wire er2_tdo   /* synthesis syn_keep=1 */ ;
wire jshift    /* synthesis syn_keep=1 */ ;
wire jupdate   /* synthesis syn_keep=1 */ ;
wire jce2      /* synthesis syn_keep=1 */ ;
wire ip_enable /* synthesis syn_keep=1 */ ;
wire jtck      /* synthesis syn_keep=1 */ ;
wire jrstn     /* synthesis syn_keep=1 */ ;

reg           PC_Ready     ;
reg    [31:0] BS_Ring      ;
reg    [25:0] DataInReg    ;
reg    [ 4:0] c            ;

reg           sciwstn      ;
reg           scird        ;
reg    [ 7:0] scirmxdatareg;
reg    [ 7:0] scirmxdata_l1;

reg           Shift_DRa    ;
reg           JCE_1a       ;
reg           JTDIa        ;
reg           BS_Ring_0    ;

assign jcex     = JCE_1a & ip_enable ;
assign er2_tdo  = BS_Ring_0        ;

always @(negedge jtck)       
begin                        
    Shift_DRa  <= jshift     ;  
    JCE_1a     <= jce2       ;     
    JTDIa      <= jtdi       ;      
    BS_Ring_0  <= BS_Ring[0] ;
end                          

always @(posedge jtck)
begin
    if (JCE_1a & ~Shift_DRa)     
    begin
        c <= 5'b00000;
    end
    else if (JCE_1a & Shift_DRa) 
    begin
        c <= c + 1;
    end
end

always @(posedge jtck or negedge rstn)

    if (~rstn)
    begin
        PC_Ready        <=  1'b0 ;
        DataInReg[25:0] <= 26'h0000000 ;
        BS_Ring         <= 32'h00000000 ;
        scirmxdatareg   <= 0;
        scirmxdata_l1   <= 0;
        sciwstn         <= 1'b0;
        scird           <= 1'b0;
    end
    else 
    begin
        if (JCE_1a & Shift_DRa)
        begin
            scirmxdatareg <= scirmxdata_l1;
            scirmxdata_l1 <= scirmxdata;
            if (c == 5'b11101)
            begin
                DataInReg[25:0] <= BS_Ring[29:4] ;
            end
            if (c == 5'b11110) begin
                if (BS_Ring[30]) begin      
                    scird   <=  BS_Ring[29];
                    sciwstn <= ~BS_Ring[29];
                end
            end else begin
                sciwstn <= 1'b0;
            end

            if (c == 5'b11110) begin
                BS_Ring[31:0] <= ({20'b00000000000000000000,     1'b1,     1'b1,       1'b0,     1'b0, scirmxdatareg      }) ;
            end else begin
                BS_Ring[31:0] <= ({JTDIa, BS_Ring[31:1]}) ;
            end
        end
    end

  assign sciaddr[17:0] = DataInReg[25:8] ;
  assign sciwdata[7:0] = DataInReg[ 7:0] ;

endmodule

#include <pcs/chip.v>
#include <pcs/ORCAstra.tft>




