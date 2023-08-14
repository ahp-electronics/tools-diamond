#log _circuit_name.v

`define NULL 0
`timescale 1ns/ 10 ps

module _circuit_name
( rstn     ,
  clk      ,

  umi_rdata,
  umi_ack  ,
  umi_retry,
  umi_err  ,
  umi_clk  ,
  umi_addr ,
  umi_wdata,
  umi_size ,
  umi_rst_n,
  umi_wr_n ,
  umi_burst,
  umi_rdy  ,
  umi_lock ,
  umi_irq
) /* synthesis syn_hier=hard */;

input         rstn     ;
input         clk      ;

input  [35:0] umi_rdata;
input         umi_ack  ;
input         umi_retry;
input         umi_err  ;
output        umi_clk  ;
output [17:0] umi_addr ;
output [35:0] umi_wdata;
output [ 1:0] umi_size ;
output        umi_rst_n;
output        umi_wr_n ;
output        umi_burst;
output        umi_rdy  ;
output        umi_lock ;
output        umi_irq  ;

jtagconn16 jtagconn16_orcastra
(   .er2_tdo  (er2_tdo),
    .jtck     (jtck   ),
    .jtdi     (jtdi   ),
    .jshift   (jshift ),
    .jupdate  (jupdate),
    .jrstn    (jrstn  ),
    .jce2     (jce2   ),
    .ip_enable (ip_enable)
) /* synthesis JTAG_IP="ORCA" IP_ID="0" HUB_ID="0" syn_noprune=1 */ ;

ORCAstra_sub ORCAstra_sub_inst
(  .rstn      (rstn     ),
   .clk       (clk      ),

   .er2_tdo   (er2_tdo  ),
   .jtck      (jtck     ),
   .jtdi      (jtdi     ),
   .jshift    (jshift   ),
   .jupdate   (jupdate  ),
   .jrstn     (jrstn    ),
   .jce2      (jce2     ),
   .ip_enable (ip_enable),

   .umi_rdata (umi_rdata),
   .umi_ack   (umi_ack  ),
   .umi_retry (umi_retry),
   .umi_err   (umi_err  ),
   .umi_clk   (umi_clk  ),
   .umi_addr  (umi_addr ),
   .umi_wdata (umi_wdata),
   .umi_size  (umi_size ),
   .umi_rst_n (umi_rst_n),
   .umi_wr_n  (umi_wr_n ),
   .umi_burst (umi_burst),
   .umi_rdy   (umi_rdy  ),
   .umi_lock  (umi_lock ),
   .umi_irq   (umi_irq  )
) /* synthesis syn_noprune=1 */;

endmodule

// *****************************************************************************

module ORCAstra_sub
( rstn     ,
  clk      ,

  er2_tdo  ,
  jtck     ,
  jtdi     ,
  jshift   ,
  jupdate  ,
  jrstn    ,
  jce2     ,
  ip_enable,

  umi_rdata,
  umi_ack  ,
  umi_retry,
  umi_err  ,
  umi_clk  ,
  umi_addr ,
  umi_wdata,
  umi_size ,
  umi_rst_n,
  umi_wr_n ,
  umi_burst,
  umi_rdy  ,
  umi_lock ,
  umi_irq
) /* synthesis syn_hier=hard */;

input         rstn     ;
input         clk      ;

input         jtck     ;
input         jtdi     ;
input         jshift   ;
input         jupdate  ;
input         jrstn    ;
input         jce2     ;
input         ip_enable;
output        er2_tdo  ;

input  [35:0] umi_rdata;
input         umi_ack  ;
input         umi_retry;
input         umi_err  ;
output        umi_clk  ;
output [17:0] umi_addr ;
output [35:0] umi_wdata;
output [ 1:0] umi_size ;
output        umi_rst_n;
output        umi_wr_n ;
output        umi_burst;
output        umi_rdy  ;
output        umi_lock ;
output        umi_irq  ;

reg           PC_Ready  ;
reg [31:0]    BSRing1   ;
reg [26:0]    DataInReg ;
reg [ 4:0]    c         ;

reg           umi_wr_n ;
reg           UMackReg ;
reg           UMretryReg ;
reg           UMerrReg ;
reg           UMready2 ;

reg           PCready2 ;
reg           PCready3 ;
reg           PCready4 ;
wire          UMset ;
wire          UMclear ;
reg           umi_rdy ;
reg           UMlockI ;
reg           Enable_1;                         // 2008-08-11

assign er2_tdo   = BSRing1[0] ;
assign umi_clk   = clk;
assign umi_addr  = DataInReg[25:8] ;
assign umi_wdata = ({4'b0000, DataInReg[7:0],  DataInReg[7:0],  DataInReg[7:0],  DataInReg[7:0]});
assign umi_size  = 2'b00;
assign umi_rst_n = rstn;
assign umi_burst = 1'b0;
assign umi_lock  = 1'b0;
assign umi_irq   = 1'b0;
assign PC_Read   = DataInReg[26] ;

assign UMset = PCready3 & ~PCready4 ;
assign UMclear = ~PCready3 & PCready4 ;

always @(negedge jtck)                          // 2008-08-11
begin                                           // 2008-08-11
    Enable_1 <= (jshift & ip_enable & jce2);    // 2008-08-11
end                                             // 2008-08-11

always @(posedge jtck)     // 2009-05-05
begin
    if ( ~Enable_1 )                            // 2009-05-05
    begin
      c <= 5'b00000;
    end
    else                                        // 2009-05-05
    begin
      c <= c + 1;
    end
end

always @(posedge jtck or negedge rstn)
begin
    if (~rstn)
    begin
       PC_Ready <= 1'b0 ;
       DataInReg <= 27'h0000000 ;
       BSRing1 <= 32'h00000000 ;
    end
//  else if ( jshift & ip_enable & jce2)        // 2008-08-11
    else if (         Enable_1         )        // 2008-08-11
    begin
//    if (c == 5'b11110)                        // 2008-08-11
      if (c == 5'b11101)                        // 2008-08-11
      begin
          PC_Ready <= 1'b0 ;
          DataInReg <= BSRing1[29:3] ;
      end
//    else if (c == 5'b11111)                   // 2008-08-11
      else if (c == 5'b11110)                   // 2008-08-11
      begin
          PC_Ready <= BSRing1[30] ;
          BSRing1 <= ({19'b0000000000000000000, UMackReg, UMackReg, UMretryReg, UMerrReg, umi_rdata[7:0], 1'b0}) ;
      end
      else
          BSRing1 <= ({jtdi, BSRing1[31:1]}) ;
    end
end

always @ (posedge umi_clk or negedge rstn)
begin
  if (~rstn)
    begin
       PCready2 <= 1'b0 ;
       PCready3 <= 1'b0 ;
       PCready4 <= 1'b0 ;
       umi_rdy <= 1'b0 ;
    end
  else
   begin
     PCready2 <= PC_Ready ;
     PCready3 <= PCready2 ;
     PCready4 <= PCready3 ;
     umi_rdy <= UMlockI & umi_ack & ~UMready2 ;
   end
end

always @ (posedge umi_clk or negedge rstn)
begin
   if (~rstn)
      UMready2 <= 1'b0 ;
   else if (UMclear)
      UMready2 <= 1'b0 ;
   else if (UMlockI && umi_ack)
      UMready2 <= 1'b1 ;
   else if (umi_ack && ~umi_rdy && UMready2)
       UMready2 <= 1'b0 ;
end

always @ (posedge umi_clk or negedge rstn)
begin
    if (~rstn)
       begin
         umi_wr_n <= 1'b0 ;
         UMlockI <= 1'b0 ;
       end
    else if (UMclear)
       begin
         umi_wr_n <= 1'b0 ;
         UMlockI <= 1'b0 ;
       end
    else if (UMset)
       begin
         umi_wr_n <= ~PC_Read ;
         UMlockI <= 1'b1 ;
       end
    else if (umi_ack && ~umi_rdy && UMready2)
       begin
         umi_wr_n <= 1'b0 ;
         UMlockI <= 1'b0 ;
       end
end

always @ (posedge umi_clk or negedge rstn)
begin
   if (~rstn)
      begin
         UMackReg <= 1'b0 ;
         UMretryReg <= 1'b0 ;
         UMerrReg <= 1'b0 ;
      end
   else if (UMclear)
      begin
         UMackReg <= 1'b0 ;
         UMretryReg <= 1'b0 ;
         UMerrReg <= 1'b0 ;
      end
   else if (umi_ack && ~umi_rdy && UMready2)
      begin
         UMackReg <= 1'b1 ;
         UMretryReg <= umi_retry ;
         UMerrReg <= umi_err ;
      end
end
endmodule

module jtagconn16
(  er2_tdo  ,
   jtck     ,
   jtdi     ,
   jshift   ,
   jupdate  ,
   jrstn    ,
   jce2     ,
   ip_enable
);
input  er2_tdo  ;
output jtck     ;
output jtdi     ;
output jshift   ;
output jupdate  ;
output jrstn    ;
output jce2     ;
output ip_enable;
endmodule

#include <pcs/ORCAstra.tft>

