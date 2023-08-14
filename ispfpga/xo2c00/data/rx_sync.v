`ifndef RXSYNC
`define RXSYNC
`timescale 1ns / 1ps

module rx_sync (
  rstn,
  clk,
  init,
  lock,
  uddcntln,
  freeze,
  rx_stop,
  rx_reset,
  rx_start
)
;
input rstn ;
input clk ;
input init ;
input lock ;
output uddcntln ;
output freeze ;
output rx_stop ;
output rx_reset ;
output rx_start ;
wire rstn ;
wire clk ;
wire init ;
wire lock ;
wire uddcntln ;
wire freeze ;
wire rx_stop ;
wire rx_reset ;
wire rx_start ;
wire [2:0] ctrl_cnt;
wire [5:0] state;
wire [1:0] state_ns;
wire [1:1] state_ns_i_1;
wire [2:2] ctrl_cnte_0;
wire [0:0] state_ns_i_x1_1;
wire [2:2] ctrl_cnt_fast;
wire [2:2] ctrl_cnte_0_fast;
wire [0:0] state_ns_i_mb_1;
wire lock_p1 ;
wire lock_p2 ;
wire ctrl_cnt_n0 ;
wire ctrl_cnt_n1 ;
wire N_118_li ;
wire N_166 ;
wire N_137 ;
wire N_169_i ;
wire N_170_i ;
wire N_171_i ;
wire N_172_i ;
wire N_161_i ;
wire freezee_0 ;
wire rx_starte_0 ;
wire rx_stope_0 ;
wire uddcntlne_0 ;
wire freeze_RNO_0 ;
wire lock_p2_fast ;
wire rx_start_fast ;
wire rx_starte_0_fast ;
wire N_169_i_sx ;
wire ctrl_cnt_n0_0_s_sx ;
wire ctrl_cnt_n1_0_s_0_x0 ;
wire ctrl_cnt_n1_0_s_0_x1 ;
wire g0_1_s_fast_sx ;
wire g0_1_s_sx ;
wire rstn_i ;
  INV rstn_RNIB582 (
	.A(rstn),
	.Z(rstn_i)
);
// @4:162
  FD1S3BX uddcntln_reg (
	.D(uddcntlne_0),
	.CK(clk),
	.PD(rstn_i),
	.Q(uddcntln)
);
  FD1S3BX \state_reg[0]  (
	.D(state_ns[0]),
	.CK(clk),
	.PD(rstn_i),
	.Q(state[0])
);
// @4:148
  FD1S3DX \state_reg[1]  (
	.D(state_ns[1]),
	.CK(clk),
	.CD(rstn_i),
	.Q(state[1])
);
// @4:138
  FD1S3DX \state_reg[2]  (
	.D(N_172_i),
	.CK(clk),
	.CD(rstn_i),
	.Q(state[2])
);
  FD1S3DX \state_reg[3]  (
	.D(N_171_i),
	.CK(clk),
	.CD(rstn_i),
	.Q(state[3])
);
// @4:145
  FD1S3DX \state_reg[4]  (
	.D(N_170_i),
	.CK(clk),
	.CD(rstn_i),
	.Q(state[4])
);
  FD1S3DX \state_reg[5]  (
	.D(N_169_i),
	.CK(clk),
	.CD(rstn_i),
	.Q(state[5])
);
// @4:107
  FD1S3DX rx_stop_reg (
	.D(rx_stope_0),
	.CK(clk),
	.CD(rstn_i),
	.Q(rx_stop)
);
// @4:107
  FD1S3DX rx_start_fast_reg (
	.D(rx_starte_0_fast),
	.CK(clk),
	.CD(rstn_i),
	.Q(rx_start_fast)
);
// @4:107
  FD1S3DX rx_start_reg (
	.D(rx_starte_0),
	.CK(clk),
	.CD(rstn_i),
	.Q(rx_start)
);
// @4:107
  FD1S3DX rx_reset_reg (
	.D(state[2]),
	.CK(clk),
	.CD(rstn_i),
	.Q(rx_reset)
);
// @4:94
  FD1S3DX lock_p2_fast_reg (
	.D(lock_p1),
	.CK(clk),
	.CD(rstn_i),
	.Q(lock_p2_fast)
);
// @4:94
  FD1S3DX lock_p2_reg (
	.D(lock_p1),
	.CK(clk),
	.CD(rstn_i),
	.Q(lock_p2)
);
// @4:94
  FD1S3DX lock_p1_reg (
	.D(lock),
	.CK(clk),
	.CD(rstn_i),
	.Q(lock_p1)
);
// @4:107
  FD1S3DX freeze_reg (
	.D(freezee_0),
	.CK(clk),
	.CD(rstn_i),
	.Q(freeze)
);
// @4:107
  FD1P3DX \ctrl_cnt_reg[0]  (
	.D(ctrl_cnt_n0),
	.SP(N_161_i),
	.CK(clk),
	.CD(rstn_i),
	.Q(ctrl_cnt[0])
);
// @4:107
  FD1P3DX \ctrl_cnt_reg[1]  (
	.D(ctrl_cnt_n1),
	.SP(N_161_i),
	.CK(clk),
	.CD(rstn_i),
	.Q(ctrl_cnt[1])
);
// @4:107
  FD1S3DX \ctrl_cnt_fast_reg[2]  (
	.D(ctrl_cnte_0_fast[2]),
	.CK(clk),
	.CD(rstn_i),
	.Q(ctrl_cnt_fast[2])
);
// @4:107
  FD1S3DX \ctrl_cnt_reg[2]  (
	.D(ctrl_cnte_0[2]),
	.CK(clk),
	.CD(rstn_i),
	.Q(ctrl_cnt[2])
);
assign N_118_li = (~ctrl_cnt[0] & ctrl_cnt[1] & ~ctrl_cnt_fast[2]);
assign N_166 = (~init & rx_start) | (~lock_p2_fast & rx_start) | (~init & 
   lock_p2_fast & rx_start);
assign N_137 = (init & lock_p2 & state[5]) | (~rx_start & state[5]) | (init & 
   lock_p2 & rx_start & state[5]);
assign N_172_i = (N_118_li & state[1]) | (N_118_li & state[1] & ~state[2]) | 
   (~N_118_li & ~N_166 & state[2]) | (~N_118_li & ~N_166 & ~state[1] & 
   state[2]) | (N_118_li & state[1] & state[2]) | (~N_166 & state[1] & 
   state[2]) | (N_118_li & N_166 & state[1] & state[2]);
assign N_171_i = (N_118_li & state[2]) | (N_118_li & state[2] & ~state[3]) | 
   (~N_118_li & ~N_166 & state[3]) | (~N_118_li & ~N_166 & ~state[2] & 
   state[3]) | (N_118_li & state[2] & state[3]) | (~N_166 & state[2] & 
   state[3]) | (N_118_li & N_166 & state[2] & state[3]);
assign N_170_i = (N_118_li & state[3]) | (N_118_li & state[3] & ~state[4]) | 
   (~N_118_li & ~N_166 & state[4]) | (~N_118_li & ~N_166 & ~state[3] & 
   state[4]) | (N_118_li & state[3] & state[4]) | (~N_166 & state[3] & 
   state[4]) | (N_118_li & N_166 & state[3] & state[4]);
assign state_ns_i_1[1] = (~init & rx_start) | (~init & rx_start & ~state[0]) | 
   (~lock_p2 & rx_start & ~state[0]) | (~init & lock_p2 & rx_start & ~state[0]) | 
   (~init & state[0]);
assign state_ns[1] = (state[0] & ~state_ns_i_1[1]) | (state[0] & ~state[1] & 
   ~state_ns_i_1[1]) | (~N_118_li & state[1] & ~state_ns_i_1[1]) | (~N_118_li & 
   ~state[0] & state[1] & ~state_ns_i_1[1]) | (state[0] & state[1] & ~state_ns_i_1[1]);
assign rx_stope_0 = (state[2]) | (rx_stop & ~state[4]) | (rx_stop & ~state[2] & 
   ~state[4]) | (state[2] & ~state[4]) | (state[2] & state[4]);
assign uddcntlne_0 = (~state[2] & uddcntln);
assign N_161_i = (~ctrl_cnt[1]) | (~ctrl_cnt_fast[2]) | (~ctrl_cnt[1] & 
   ctrl_cnt_fast[2]) | (~ctrl_cnt[1] & ~state[0]) | (~ctrl_cnt_fast[2] & 
   ~state[0]) | (~ctrl_cnt[1] & ctrl_cnt_fast[2] & ~state[0]) | (state[0]);
assign freeze_RNO_0 = (~ctrl_cnt[0] & ~ctrl_cnt[2] & state[4]);
assign freezee_0 = (~freeze_RNO_0 & freeze) | (~ctrl_cnt[1] & freeze) | 
   (~freeze_RNO_0 & ctrl_cnt[1] & freeze) | (~freeze_RNO_0 & freeze & 
   ~state[1]) | (~ctrl_cnt[1] & freeze & ~state[1]) | (~freeze_RNO_0 & 
   ctrl_cnt[1] & freeze & ~state[1]) | (state[1]);
assign ctrl_cnte_0[2] = (ctrl_cnt[0] & ctrl_cnt[1] & ~state[0]) | (ctrl_cnt[0] & 
   ctrl_cnt[1] & ~ctrl_cnt[2] & ~state[0]) | (ctrl_cnt[2] & ~state[0]);
assign state_ns_i_x1_1[0] = (~rx_start_fast) | (~ctrl_cnt_fast[2] & ~state[5]) | 
   (~rx_start_fast & ~state[5]) | (~ctrl_cnt_fast[2] & rx_start_fast & 
   ~state[5]) | (~rx_start_fast & state[5]);
assign ctrl_cnte_0_fast[2] = (ctrl_cnt[0] & ctrl_cnt[1] & ~state[0]) | 
   (ctrl_cnt[0] & ctrl_cnt[1] & ~ctrl_cnt_fast[2] & ~state[0]) | (ctrl_cnt_fast[2] & 
   ~state[0]);
assign N_169_i_sx = (~ctrl_cnt[0] & ctrl_cnt[1] & ~ctrl_cnt[2] & state[4]);
assign N_169_i = (N_137) | (N_137 & ~N_169_i_sx) | (N_169_i_sx);
assign ctrl_cnt_n0_0_s_sx = (ctrl_cnt[0]) | (ctrl_cnt[0] & ~state[0]) | 
   (state[0]);
assign ctrl_cnt_n0 = (~ctrl_cnt[1] & ~ctrl_cnt_n0_0_s_sx) | (~ctrl_cnt[1] & 
   ~ctrl_cnt[2] & ~ctrl_cnt_n0_0_s_sx) | (ctrl_cnt[2] & ~ctrl_cnt_n0_0_s_sx) | 
   (~ctrl_cnt[1] & ~ctrl_cnt_n0_0_s_sx & ~state[5]) | (~ctrl_cnt[1] & 
   ~ctrl_cnt[2] & ~ctrl_cnt_n0_0_s_sx & ~state[5]) | (ctrl_cnt[2] & ~ctrl_cnt_n0_0_s_sx & 
   ~state[5]) | (~ctrl_cnt_n0_0_s_sx & state[5]);
assign ctrl_cnt_n1_0_s_0_x0 = (ctrl_cnt[0] & ~state[0]);
assign ctrl_cnt_n1_0_s_0_x1 = (~ctrl_cnt[0] & ctrl_cnt[2] & ~state[0]) | 
   (~ctrl_cnt[0] & ctrl_cnt[2] & ~state[0] & ~state[5]) | (~ctrl_cnt[0] & 
   ~state[0] & state[5]);
// @4:107
  PFUMX ctrl_cnt_n1_0_s_0 (
	.ALUT(ctrl_cnt_n1_0_s_0_x1),
	.BLUT(ctrl_cnt_n1_0_s_0_x0),
	.C0(ctrl_cnt[1]),
	.Z(ctrl_cnt_n1)
);
assign g0_1_s_fast_sx = (~ctrl_cnt[2] & ~rx_start_fast) | (~lock_p2 & ~rx_start_fast) | 
   (~ctrl_cnt[2] & lock_p2 & ~rx_start_fast) | (~state[5]) | (~ctrl_cnt[2] & 
   ~rx_start_fast & state[5]) | (~lock_p2 & ~rx_start_fast & state[5]) | 
   (~ctrl_cnt[2] & lock_p2 & ~rx_start_fast & state[5]);
assign rx_starte_0_fast = (~ctrl_cnt[0] & ctrl_cnt[1] & ~g0_1_s_fast_sx) | 
   (~ctrl_cnt[0] & ctrl_cnt[1] & ~g0_1_s_fast_sx & ~rx_start_fast) | (~g0_1_s_fast_sx & 
   rx_start_fast);
assign g0_1_s_sx = (~ctrl_cnt[2] & ~rx_start) | (~lock_p2 & ~rx_start) | 
   (~ctrl_cnt[2] & lock_p2 & ~rx_start) | (~state[5]) | (~ctrl_cnt[2] & 
   ~rx_start & state[5]) | (~lock_p2 & ~rx_start & state[5]) | (~ctrl_cnt[2] & 
   lock_p2 & ~rx_start & state[5]);
assign rx_starte_0 = (~ctrl_cnt[0] & ctrl_cnt[1] & ~g0_1_s_sx) | (~ctrl_cnt[0] & 
   ctrl_cnt[1] & ~g0_1_s_sx & ~rx_start) | (~g0_1_s_sx & rx_start);
assign state_ns_i_mb_1[0] = (ctrl_cnt[0] & ~rx_start_fast) | (~ctrl_cnt[1] & 
   ~rx_start_fast) | (ctrl_cnt[0] & ctrl_cnt[1] & ~rx_start_fast) | (ctrl_cnt[0] & 
   ~rx_start_fast & ~state_ns_i_x1_1[0]) | (~ctrl_cnt[1] & ~rx_start_fast & 
   ~state_ns_i_x1_1[0]) | (ctrl_cnt[0] & ctrl_cnt[1] & ~rx_start_fast & 
   ~state_ns_i_x1_1[0]) | (~ctrl_cnt[0] & ctrl_cnt[1] & state_ns_i_x1_1[0]) | 
   (~rx_start_fast & state_ns_i_x1_1[0]) | (~ctrl_cnt[0] & ctrl_cnt[1] & 
   rx_start_fast & state_ns_i_x1_1[0]);
assign state_ns[0] = (~init & state[0]) | (~init & ~state_ns_i_mb_1[0]) | 
   (~init & ~state[0] & ~state_ns_i_mb_1[0]) | (~lock_p2 & ~state[0] & 
   ~state_ns_i_mb_1[0]) | (~init & lock_p2 & ~state[0] & ~state_ns_i_mb_1[0]) | 
   (~init & state[0] & ~state_ns_i_mb_1[0]) | (~init & state[0] & state_ns_i_mb_1[0]);
//@4:107
endmodule /* rx_sync */
`endif
