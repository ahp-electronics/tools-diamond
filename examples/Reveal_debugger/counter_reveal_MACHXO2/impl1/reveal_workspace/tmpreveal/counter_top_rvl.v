
module reveal_coretop (clk, reset_n, trigger_din, trigger_en, trace_din)  /* synthesis syn_hier="hard" */ ;
    ///////// PARAMETERS for IO port///////////////
    parameter NUM_CORES = 1 ; 
    parameter TOTAL_TRIGGER_DIN = 6 ; 
    parameter TOTAL_TRACE_DIN = 6 ; 
    ///////// IO port define //////////
    input [(NUM_CORES - 1):0] clk ; 
    input [(NUM_CORES - 1):0] reset_n ; 
    input [(TOTAL_TRIGGER_DIN - 1):0] trigger_din ; 
    input [(TOTAL_TRACE_DIN - 1):0] trace_din ; 
    // other io ports defines, including the triggered out signals
    input [0:0] trigger_en ; 
    /// wires for interconnection ///
    wire [(NUM_CORES - 1):0] trigger_out ; 
    wire [(NUM_CORES - 1):0] jtck ; 
    wire [(NUM_CORES - 1):0] jrstn ; 
    wire [(NUM_CORES - 1):0] jce2 ; 
    wire [(NUM_CORES - 1):0] jtdi ; 
    wire [(NUM_CORES - 1):0] er2_tdo ; 
    wire [(NUM_CORES - 1):0] jshift ; 
    wire [(NUM_CORES - 1):0] jupdate ; 
    wire [(NUM_CORES - 1):0] ip_enable ; 
    wire [5:0] trace_din_net ; 
    wire [5:0] trigger_din_net ; 
    assign trace_din_net[0] = trace_din[0] ; 
    assign trace_din_net[1] = trace_din[1] ; 
    assign trace_din_net[2] = trace_din[2] ; 
    assign trace_din_net[3] = trace_din[3] ; 
    assign trace_din_net[4] = trace_din[4] ; 
    assign trace_din_net[5] = trace_din[5] ; 
    assign trigger_din_net[0] = trigger_din[0] ; 
    assign trigger_din_net[1] = trigger_din[1] ; 
    assign trigger_din_net[2] = trigger_din[2] ; 
    assign trigger_din_net[3] = trigger_din[3] ; 
    assign trigger_din_net[4] = trigger_din[4] ; 
    assign trigger_din_net[5] = trigger_din[5] ; 
    ////// core instances //////
    counter_top_la0 counter_top_la0_inst_0 (.clk(clk[0]), .reset_n(reset_n[0]), .jtck(jtck[0]), .jrstn(jrstn[0]), .jce2(jce2[0]), .jtdi(jtdi[0]), .er2_tdo(er2_tdo[0]), .jshift(jshift[0]), .jupdate(jupdate[0]), .trigger_din_0(trigger_din_net[5:0]), .trace_din(trace_din_net[5:0]), .trigger_en(trigger_en[0]), .ip_enable(ip_enable[0])) /* synthesis syn_noprune=1 */  ; 
    jtagconn16 jtagconn16_inst_0 (.jtck(jtck[0]), .jtdi(jtdi[0]), .jshift(jshift[0]), .jupdate(jupdate[0]), .jrstn(jrstn[0]), .jce2(jce2[0]), .ip_enable(ip_enable[0]), .er2_tdo(er2_tdo[0])) /* synthesis JTAG_IP="REVEAL" IP_ID="0" HUB_ID="0" syn_noprune=1 */  ; 

//exemplar attribute jtagconn16_inst_0 JTAG_IP "REVEAL"
//exemplar attribute jtagconn16_inst_0 IP_ID "0"
//exemplar attribute jtagconn16_inst_0 HUB_ID "0"
endmodule



//Reveal ECP5 counter and trigger modules
module counter_top (
    input rstn, 
    output LEDPIO_OUT0, 
    output LEDPIO_OUT1, 
    output LEDPIO_OUT2, 
    output LEDPIO_OUT3) ;
    // LatticeECP5 internal oscillator generates platform clock
    wire clk1 ;  /* synthesis syn_keep=1 preserve_signal=1 RVL_DEBUG_core0_clock0="clk1_0" */ 
    reg [31:0] cnt ;  /* synthesis syn_keep=1 preserve_signal=1 RVL_DEBUG_core0_trace0="cnt_5" RVL_DEBUG_core0_trace1="cnt_4" RVL_DEBUG_core0_trace2="cnt_3" RVL_DEBUG_core0_trace3="cnt_2" RVL_DEBUG_core0_trace4="cnt_1" RVL_DEBUG_core0_trace5="cnt_0" RVL_DEBUG_core0_trigger0="cnt_5" RVL_DEBUG_core0_trigger1="cnt_4" RVL_DEBUG_core0_trigger2="cnt_3" RVL_DEBUG_core0_trigger3="cnt_2" RVL_DEBUG_core0_trigger4="cnt_1" RVL_DEBUG_core0_trigger5="cnt_0" */ 
    wire VCC ; 
    OSCF OSCinst0 (.OSC(clk1)) ; 
    defparam OSCinst0.NOM_FREQ = "55.0" ; 
    always
        @(posedge clk1 or negedge rstn)
        begin
            if ((!rstn)) 
                cnt = 0 ;
            else
                cnt = (cnt + 1) ;
        end
    assign LEDPIO_OUT0 = cnt[28] ; 
    assign LEDPIO_OUT1 = cnt[29] ; 
    assign LEDPIO_OUT2 = cnt[30] ; 
    assign LEDPIO_OUT3 = cnt[31] ; 
    VHI VHI_reset_u (.Z(VCC)) ; 
    reveal_coretop counter_top_reveal_coretop_instance (.clk({clk1}), .reset_n({VCC}), .trigger_din({cnt[5],cnt[4],cnt[3],cnt[2],cnt[1],cnt[0]}), .trigger_en({VCC}), .trace_din({cnt[5],cnt[4],cnt[3],cnt[2],cnt[1],cnt[0]})) /* synthesis syn_noprune=1 dont_touch=1 */  ; 
endmodule


