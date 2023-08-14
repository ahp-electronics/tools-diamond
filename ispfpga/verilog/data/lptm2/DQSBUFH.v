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

module DQSBUFH(DQSI, SCLK, READ, READCLKSEL1, READCLKSEL0, DQSDEL, RST, 
               DDRCLKPOL, DQSR90, DQSW90, BURSTDET, DATAVALID);
   input DQSI, SCLK, READ, DQSDEL, RST, READCLKSEL1, READCLKSEL0;
   output DDRCLKPOL, DQSR90, DQSW90, DATAVALID, BURSTDET;

   parameter DQS_LI_DEL_ADJ = "MINUS";
   parameter DQS_LI_DEL_VAL = 4;
   parameter DQS_LO_DEL_ADJ = "PLUS";
   parameter DQS_LO_DEL_VAL = 0;
   parameter LPDDR = "DISABLED";
   parameter GSR = "ENABLED";

   realtime quarter_period, clk_last_rising_edge;
   integer clk_rising_edge_count;
   wire RSTB, DQSIB, SCLKB, READCLKSEL1B, READB, READCLKSEL0B, DQSDELB;
   reg read_shift_clk, last_SCLKB, last_read_shift_clk, read_q, read_post;
   reg read_pre, dqs_ena, last_dqs_clean, node_c, last_node_c;
   reg dqs_clean_int, dqs_rise_cnt0, dqs_rise_cnt1, dqs_fall_cnt0, dqs_fall_cnt1;
   reg dqs_1st_fall_cnt0, dqs_1st_fall_cnt1, last_DQSR90_int;
   reg sclk2, last_sclk2;
   reg DDRCLKPOL_int, DQSW90_int;
   reg DATAVALID_int, sclk_cnt_0, sclk_cnt_1;
   reg latch_cnt_0, latch_cnt_1, sclk2_cnt_0, sclk2_cnt_1;
   reg dqs_cnt_0, dqs_cnt_1;

   wire dqs_clean, read_ena, set_dqs_ena, I1, I2, I3, DQSR90_int;
   wire cnt_rstn_pulse, cnt_rstn, dqs_rise_cnt_ok, dqs_fall_cnt_ok;
   wire dqs_1st_fall_cnt_ok, BURSTDET_int;
   wire diff_bit0, diff_bit1, new_data;
   reg SRN;

  tri1 GSR_sig = GSR_INST.GSRNET;
  tri1 PUR_sig = PUR_INST.PURNET;

   buf (RSTB1, RST);
   buf (DQSIB, DQSI);
   buf (SCLKB, SCLK);
   buf (READCLKSEL1B, READCLKSEL1);
   buf (READCLKSEL0B, READCLKSEL0);
   buf (READB, READ);
   buf (DQSDELB, DQSDEL);
   buf inst_buf0 (DDRCLKPOL, DDRCLKPOL_int);
   buf inst_buf2 (DQSW90, DQSW90_int);
   buf inst_buf3 (DQSR90, DQSR90_int);
   buf inst_buf4 (BURSTDET, BURSTDET_int);
   buf inst_buf5 (DATAVALID, DATAVALID_int);
   
initial
begin
   quarter_period = 0.0;
   clk_rising_edge_count = 0.0;
   read_shift_clk = 1'b0;
   last_SCLKB = 1'b0;
   last_read_shift_clk = 1'b0;
   read_q = 1'b0;
   read_post = 1'b0;
   read_pre = 1'b0;
   dqs_ena = 1'b0;
   last_dqs_clean = 1'b0;
   node_c = 1'b0;
   last_node_c = 1'b0;
   dqs_clean_int = 1'b0;
   dqs_rise_cnt0 = 1'b0;
   dqs_rise_cnt1 = 1'b0;
   dqs_fall_cnt0 = 1'b0;
   dqs_fall_cnt1 = 1'b0;
   dqs_1st_fall_cnt0 = 1'b0;
   dqs_1st_fall_cnt1 = 1'b0;
   last_DQSR90_int = 1'b0;
   dqs_cnt_0 = 1'b0;
   dqs_cnt_1 = 1'b0;
   sclk2 = 1'b0;
   sclk2_cnt_0 = 1'b0;
   sclk2_cnt_1 = 1'b0;
   last_sclk2 = 1'b0;
   DDRCLKPOL_int = 1'b0;
   DQSW90_int = 1'b0;
   latch_cnt_0 = 1'b0;
   latch_cnt_1 = 1'b0;
   sclk_cnt_0 = 1'b0;
   sclk_cnt_1 = 1'b0;

end

  always @ (GSR_sig or PUR_sig ) begin
    if (GSR == "ENABLED")
      SRN = GSR_sig & PUR_sig ;
    else if (GSR == "DISABLED")
      SRN = PUR_sig;
  end
                                                                                               
  not (SR, SRN);
  or INST1 (RSTB, RSTB1, SR);

  reg    same1, same2;
  wire [1:0] dselect;

      function DataSame;
        input a, b;
        begin
          if (a === b)
            DataSame = a;
          else
            DataSame = 1'bx;
        end
      endfunction
                                                                                             
    assign dselect = {READCLKSEL1B, READCLKSEL0B};
                                                                                             
    always @(SCLKB or DQSW90_int or dselect)
      begin
        case (dselect)
         2'b00 : read_shift_clk = DQSW90_int;
         2'b01 : read_shift_clk = ~SCLKB;
         2'b10 : read_shift_clk = ~DQSW90_int;
         2'b11 : read_shift_clk = SCLKB;
         2'b0x : read_shift_clk = DataSame(DQSW90_int, ~SCLKB);
         2'b1x : read_shift_clk = DataSame(~DQSW90_int, SCLKB);
         2'bx0 : read_shift_clk = DataSame(DQSW90_int, ~DQSW90_int);
         2'bx1 : read_shift_clk = DataSame(SCLKB, ~SCLKB);
         default begin
                 same1 = DataSame(SCLKB, ~DQSW90_int);
                 same2 = DataSame(~SCLKB, DQSW90_int);
                 read_shift_clk = DataSame(same1,same2);
                 end
       endcase
    end

always @ (SCLKB or read_shift_clk or dqs_clean or DQSR90_int or sclk2 or node_c)
begin
   last_SCLKB <= SCLKB;
   last_read_shift_clk <= read_shift_clk;
   last_dqs_clean <= dqs_clean;
   last_DQSR90_int <= DQSR90_int;
   last_sclk2 <= sclk2;
   last_node_c <= node_c;
end

always @ (SCLKB or RSTB)     // pos edge
begin
   if (RSTB == 1'b1)
   begin
      read_q <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLKB === 1'b0)
      begin
         read_q <= READB;
      end
   end
end

always @ (read_shift_clk or RSTB)     // pos edge
begin
   if (RSTB == 1'b1)
   begin
      read_post <= 1'b0;
   end
   else
   begin
      if (read_shift_clk === 1'b1 && last_read_shift_clk === 1'b0)
      begin
         read_post <= read_q;
      end
   end
end

always @ (read_shift_clk or RSTB)     // neg edge
begin
   if (RSTB == 1'b1)
   begin
      read_pre <= 1'b0;
   end
   else
   begin
      if (read_shift_clk === 1'b0 && last_read_shift_clk === 1'b1)
      begin
         read_pre <= read_post;
      end
   end
end

and INST2 (read_ena, read_pre, read_post);
and INST3 (set_dqs_ena, read_ena, ~RSTB);

always @ (dqs_clean or RSTB or set_dqs_ena)     // neg edge
begin
   if (RSTB == 1'b1)
   begin
      dqs_ena <= 1'b0;
   end
   else if (set_dqs_ena == 1'b1)
   begin
      dqs_ena <= 1'b1;
   end
   else
   begin
      if (dqs_clean === 1'b0 && last_dqs_clean === 1'b1)
      begin
         dqs_ena <= read_ena;
      end
   end
end

and INST4 (dqs_clean, dqs_ena, DQSIB);

always @ (dqs_clean or dqs_ena)     // pos edge
begin
   if (dqs_ena == 1'b0)
   begin
      node_c <= 1'b0;
   end
   else
   begin
      if (dqs_clean === 1'b1 && last_dqs_clean === 1'b0)
      begin
         node_c <= 1'b1;
      end
   end
end

always @ (node_c or RSTB)     // pos edge
begin
   if (RSTB == 1'b1)
   begin
      DDRCLKPOL_int <= 1'b0;
   end
   else
   begin
      if (node_c === 1'b1 && last_node_c === 1'b0)
      begin
         DDRCLKPOL_int <= SCLKB;
      end
   end
end

   always @(posedge SCLKB)
   begin
      clk_rising_edge_count <= clk_rising_edge_count + 1;
      clk_last_rising_edge = $realtime;
   end
                                                                                              
   always @(negedge SCLKB)
   begin
      if (clk_rising_edge_count >= 1)
         quarter_period = ($realtime - clk_last_rising_edge)/2;
   end

   always @(DQSDELB, dqs_clean)
   begin
      if (DQSDELB == 1'b1)
        begin
          dqs_clean_int <= #(quarter_period) dqs_clean;
        end
      else
        begin
          dqs_clean_int <= dqs_clean;
        end
   end

   always @(DQSDELB, SCLKB)
   begin
      if (DQSDELB == 1'b1)
        begin
          DQSW90_int <= #(quarter_period) SCLKB;
        end
      else
        begin
          DQSW90_int <= SCLKB;
        end
   end

   and inst10 (I1, dqs_clean, DQSR90_int);
   and inst11 (I2, dqs_clean, dqs_clean_int);
   and inst12 (I3, DQSR90_int, dqs_clean_int);
   or inst13 (DQSR90_int, I1, I2, I3);

///// burst-det
   assign #0.2 dqs_ena_del = ~dqs_ena;
   nand inst14 (cnt_rstn_pulse, dqs_ena_del, dqs_ena);
   and inst34 (cnt_rstn, cnt_rstn_pulse, ~RSTB);

always @ (dqs_clean or cnt_rstn)     // pos edge
begin
   if (cnt_rstn == 1'b0)
   begin
      dqs_rise_cnt0 <= 1'b0;
      dqs_rise_cnt1 <= 1'b0;
   end
   else
   begin
      if (dqs_clean === 1'b1 && last_dqs_clean === 1'b0)
      begin
         if (dqs_ena == 1'b1)
         begin
            dqs_rise_cnt0 <= ~dqs_rise_cnt0;
            dqs_rise_cnt1 <= dqs_rise_cnt0;
         end
      end
   end
end

always @ (DQSR90_int or cnt_rstn)     // neg edge
begin
   if (cnt_rstn == 1'b0)
   begin
      dqs_1st_fall_cnt0 <= 1'b0;
      dqs_1st_fall_cnt1 <= 1'b0;
   end
   else
   begin
      if (DQSR90_int === 1'b0 && last_DQSR90_int === 1'b1)
      begin
         if (read_ena == 1'b1)
         begin
            dqs_1st_fall_cnt0 <= ~dqs_1st_fall_cnt0;
            dqs_1st_fall_cnt1 <= dqs_1st_fall_cnt0;
         end
      end
   end
end

always @ (dqs_clean or cnt_rstn)     // neg edge
begin
   if (cnt_rstn == 1'b0)
   begin
      dqs_fall_cnt0 <= 1'b0;
      dqs_fall_cnt1 <= 1'b0;
   end
   else
   begin
      if (dqs_clean === 1'b0 && last_dqs_clean === 1'b1)
      begin
         dqs_fall_cnt0 <= ~dqs_fall_cnt0;
         dqs_fall_cnt1 <= dqs_fall_cnt0;
      end
   end
end

   and inst15 (dqs_rise_cnt_ok, ~dqs_rise_cnt0, dqs_rise_cnt1);
   and inst36 (dqs_fall_cnt_ok, ~dqs_fall_cnt0, dqs_fall_cnt1);
   and inst16 (dqs_1st_fall_cnt_ok, dqs_1st_fall_cnt0, ~dqs_1st_fall_cnt1);
   and inst17 (BURSTDET_int, dqs_rise_cnt_ok, ~dqs_ena, dqs_1st_fall_cnt_ok, dqs_fall_cnt_ok);

// data-valid generation

always @ (DQSR90_int or RSTB)     // neg edge
begin
   if (RSTB == 1'b1)
   begin
      dqs_cnt_0 <= 1'b0;
      dqs_cnt_1 <= 1'b0;
   end
   else
   begin
      if (DQSR90_int === 1'b0 && last_DQSR90_int === 1'b1)
      begin
            dqs_cnt_0 <= ~dqs_cnt_1;
            dqs_cnt_1 <= dqs_cnt_0;
      end
   end
end

always @ (DDRCLKPOL_int or SCLKB)
begin
   case (DDRCLKPOL_int)
        1'b0 :  sclk2 = SCLKB;
        1'b1 :  sclk2 = ~SCLKB;
        default sclk2 = DataSame(~SCLKB, SCLKB);
   endcase
end

always @ (sclk2 or RSTB)     // pos edge
begin
   if (RSTB == 1'b1)
   begin
      sclk2_cnt_0 <= 1'b0;
      sclk2_cnt_1 <= 1'b0;
   end
   else
   begin
      if (sclk2 === 1'b1 && last_sclk2 === 1'b0)
      begin
         sclk2_cnt_0 <= dqs_cnt_0;
         sclk2_cnt_1 <= dqs_cnt_1;
      end
   end
end

always @ (SCLKB or RSTB or sclk2_cnt_0 or sclk2_cnt_1)     // pos latch
begin
   if (RSTB == 1'b1)
   begin
      latch_cnt_0 <= 1'b0;
      latch_cnt_1 <= 1'b0;
   end
   else
   begin
      if (SCLKB == 1'b1)
      begin
         latch_cnt_0 <= sclk2_cnt_0;
         latch_cnt_1 <= sclk2_cnt_1;
      end
   end
end

always @ (SCLKB or RSTB)     // pos edge
begin
   if (RSTB == 1'b1)
   begin
      sclk_cnt_0 <= 1'b0;
      sclk_cnt_1 <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLKB === 1'b0)
      begin
         sclk_cnt_0 <= latch_cnt_0;
         sclk_cnt_1 <= latch_cnt_1;
      end
   end
end

   xor inst18 (diff_bit0, sclk_cnt_0, latch_cnt_0);
   xor inst19 (diff_bit1, sclk_cnt_1, latch_cnt_1);
   or inst20 (new_data, diff_bit0, diff_bit1);

always @ (SCLKB or RSTB)     // pos edge
begin
   if (RSTB == 1'b1)
   begin
      DATAVALID_int <= 1'b0;
   end
   else
   begin
      if (SCLKB === 1'b1 && last_SCLKB === 1'b0)
      begin
         DATAVALID_int <= new_data;
      end
   end
end


endmodule

`endcelldefine


