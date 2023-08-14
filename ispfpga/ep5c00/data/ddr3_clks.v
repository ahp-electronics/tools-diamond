`timescale 1ns/1ps

`ifdef SIM
 `define TMR_WIDTH   4
 `define RTY_WIDTH   6
 `define TMR_MAX_CNT 4'hf
 `define RTY_MAX_CNT 6'h3f
`else
 `define TMR_WIDTH   8
 `define RTY_WIDTH   8
 `define TMR_MAX_CNT 8'hff
 `define RTY_MAX_CNT 8'hff
`endif


module ddr3_clks_pll_control(reset, lock, clk, phase, align_status, 
       reset_datapath,
       reset_datapath_out,
		   stop_out,
		   `ifdef DEBUG_MARGIN
		   margin_code,
		   `endif
       good_int, err);

input                       reset;
input                       lock;   
input                       clk;
output [3:0]                phase;
input  [1:0]                align_status;
`ifdef DEBUG_MARGIN
   input [5:0] margin_code;
`else
   parameter margin_code=6'b111100;
`endif
input                       reset_datapath;
output                      reset_datapath_out;
   output                   stop_out;
output                      err;
output                      good_int;

   
   
reg    [3:0]                phase;

reg    [2:0]                state;
reg    [1:0]                align_status_ff;
   reg [5:0]                last_align_status_0;
reg    [`RTY_WIDTH - 1:0]   retry_cnt;
reg    [`TMR_WIDTH - 1:0]   timer;   
wire                        rst_dp_in;
reg                         reset_datapath_ff;   
   wire 	                 stop_out;   
reg                         good_int /* synthesis syn_preserve = 1 */;
//pragma attribute good_int preserve_driver true
reg [2:0]                   next_state;
reg                         lock_reg;

parameter   state_idle             = 3'h0;
parameter   state_rotate           = 3'h1;
parameter   state_check_bit0       = 3'h2;
parameter   state_check_bit1       = 3'h3;
parameter   state_clear_retry_cnt  = 3'h4;
parameter   state_reset_datapath   = 3'h5;
parameter   state_good             = 3'h6;
parameter   state_err              = 3'h7;
      
always @(posedge clk or posedge reset) begin
   if (reset)
      state <= state_idle;
   else
      state <= next_state;
end

   always @(*
            ) begin
   case (state)/*synthesis full_case parallel_case*/

   state_idle: begin
      if (lock_reg ) 
          next_state = state_rotate;
      else
          next_state = state_idle;    
   end
   
   state_rotate: begin
      if (retry_cnt ==`RTY_MAX_CNT) 
          next_state = state_err;
      else if (timer==`TMR_MAX_CNT && lock_reg==1'b1) 
          next_state = state_check_bit0;
      else
          next_state = state_rotate;     
   end
   
   state_check_bit0: begin
	   if(last_align_status_0==margin_code && align_status_ff[0] ==1'b0) 
          next_state = state_clear_retry_cnt;
      else 
          next_state = state_rotate;     
   end
   
   state_clear_retry_cnt: begin
      if (reset_datapath_ff==1'b0)
          next_state = state_reset_datapath;
      else
          next_state = state_clear_retry_cnt;       
   end
   
   state_check_bit1: begin
      if (align_status_ff[1] ==1'b0) 
          next_state = state_good;
      else 
          next_state = state_reset_datapath;
   end
   
   state_reset_datapath: begin
      if (retry_cnt==`RTY_MAX_CNT ) 
          next_state = state_err;
    else if(timer ==`TMR_MAX_CNT - 1 ) 
          next_state = state_check_bit1;
      else
          next_state = state_reset_datapath;    
   end
   
   state_good: begin
      if (~lock_reg) 
          next_state = state_good;    
      else if (align_status_ff[0] == 1'b1)
          next_state = state_idle;        
	   else if((align_status_ff[1] == 1'b1))
          next_state = state_clear_retry_cnt;     
      else if (reset_datapath_ff)
          next_state = state_clear_retry_cnt;     
      else
          next_state = state_good;
   end
   
   state_err: begin
      if (reset_datapath_ff)
          next_state = state_clear_retry_cnt;     
      else
          next_state = state_err;     
      
   end 
   
   default: begin
      next_state = state_idle;
   end   

   endcase 
end 
   
always @(posedge clk or posedge reset) begin
   if (reset) begin
      lock_reg <=1'b0;  
   end
   else begin
      lock_reg<=lock;   
   end
end

always @(posedge clk or posedge reset) begin
   if (reset) begin
      align_status_ff<=2'b00;
   end
   else begin
   if (lock_reg==1'b1)
      align_status_ff<=align_status;  
   end
end

   
always @(posedge clk or posedge reset) begin
   if (reset) begin
	 last_align_status_0 <= 6'b000000;	
   end
   else begin
      if (state==state_idle)
	   last_align_status_0 <= 6'b000000;	
	 
      else if (state == state_rotate && timer==2) begin
         last_align_status_0[0] <=  align_status_ff[0];
         last_align_status_0[1] <=  last_align_status_0[0];   
	    last_align_status_0[2] <=  last_align_status_0[1];	 
	    last_align_status_0[3] <=  last_align_status_0[2];	 
	    last_align_status_0[4] <=  last_align_status_0[3];	 
	    last_align_status_0[5] <=  last_align_status_0[4];	 
      end
   end
end

always @(posedge clk or posedge reset) begin
   if (reset) begin
      phase <= 4'b0000;
   end
   else if (state == state_rotate && timer==4) begin
      phase <= phase + 1;      
   end
end


always @(posedge clk or posedge reset) begin
   if(reset) begin  
      timer <= 'd0;
   end
   else begin
	 if((state!=state_rotate && state!=state_reset_datapath
	     && state != state_good)
	    || (state==state_good && next_state ==state_reset_datapath)
	    )
           timer <='d0;
       else
          if(timer<`TMR_MAX_CNT)
             timer <=timer + 1;
  end
end 

always @(posedge clk or posedge reset) begin
   if (reset) begin  
      retry_cnt <= 'd0;
   end  
   else begin
	 if(state==state_idle
	    || state==state_clear_retry_cnt
	    || state==state_good
	    ) begin
         retry_cnt <= 'd0;
      end
	 
	 else if((state == state_rotate 
		  || state==state_reset_datapath
		  ) && timer==1
		 ) begin	 
         if(retry_cnt<`RTY_MAX_CNT) 
            retry_cnt <= retry_cnt + 1;     
      end
   end
end 
   
assign rst_dp_in = (state == state_reset_datapath) && (timer <8);
assign rst_dp_in_stop = (state == state_reset_datapath) && (timer <12);

FD1S3DX rst_dp_out_inst (.D(rst_dp_in),
                         .CK(clk), 
                         .CD(reset), 
                         .Q(reset_datapath_out))/*synthesis HGROUP="rst_dp_out" PBBOX="1,1" */;
//pragma attribute rst_dp_out_inst HGROUP rst_dp_out
//pragma attribute rst_dp_out_inst PBBOX 1,1

FD1S3DX rst_dp_stop_inst (.D(rst_dp_in_stop),
                         .CK(clk), 
                         .CD(reset), 
                         .Q(stop_out));

always @(posedge clk or posedge reset) begin
   if(reset) 
      reset_datapath_ff<=1'b0;
   else 
      reset_datapath_ff <=reset_datapath;     
end

always @(posedge clk or posedge reset) begin
   if(reset) 
      good_int <=1'b0;
   else begin
      good_int <=(state==state_good && timer ==`TMR_MAX_CNT)?1'b1:1'b0;   
   end
end
 
assign err = (state==state_err);
   
   
endmodule


module ddr3_clks_clk_stop(reset,eclk,
		reset_datapath,reset_datapath_out, pll_stop, stop);
input         reset;
input         eclk;
input         reset_datapath;
   input pll_stop;
   
output        reset_datapath_out;
output        stop;

   
   reg 	  reset_datapath_ff;
   //use another ff to change stop_mem ealier
   reg 	  reset_datapath_ff2;
   reg    pll_stop_ff;


   
reg           stop_ref;
//stop even or odd reference, making this independent of the vco multiply ratio
//otherwise there is a chance that we stuck at odd (or even) cycles all the time, and status[1] cannot be flipped.
   
   //re-synchronize reset_datapath
   always @(negedge eclk or posedge reset) begin
      if(reset) begin
	reset_datapath_ff<=1'b1;
	reset_datapath_ff2<=1'b1;
   end
      else begin
	 reset_datapath_ff<= reset_datapath;
	 reset_datapath_ff2<= reset_datapath_ff;
      end
   end
      
   always @(negedge eclk or posedge reset) begin
      if(reset)
	pll_stop_ff<=1'b1;
      else 
	pll_stop_ff<= pll_stop;
end

   
   
   assign reset_datapath_out = reset_datapath_ff;   
   
reg [1:0] stop_mem;
//[0]: rise(0), fall (1)
//[1]: even/odd on stop_sig
//try even/odd, rise/fall, total 4 combination.
//one of them should stay away from setup/hold window and avoid stuck
//towards each end of stop_ff count down to 000
always @(negedge eclk or posedge reset) begin
   if(reset) begin
      stop_mem <= 2'b00;
   end
      //change on reset_datapath_ff falling edge
      else if(reset_datapath_ff==1'b0 && reset_datapath_ff2==1'b1 ) begin
	 //gray code here 
	 if(stop_mem==2'b00) stop_mem<=2'b01;
	 else if(stop_mem==2'b01) stop_mem<=2'b11;
	 else if(stop_mem==2'b11) stop_mem<=2'b10;
	 else if(stop_mem==2'b10) stop_mem<=2'b00;
   end
end

reg    stop_gate_ff;
always @(negedge eclk or posedge reset) begin
   if(reset) begin
      stop_gate_ff<=1'b0;
      stop_ref<=1'b0;   
   end
   else begin
      stop_ref<=~stop_ref;  

	 //even odd here
	 //after stop_ff goes low, wait for even/odd depending on stop_ref
	 if(pll_stop_ff)stop_gate_ff<=1'b1;
	 else begin
	    if(stop_mem[1]==1'b0 && stop_ref==1'b0)
	      stop_gate_ff<=1'b0;
	    else if (stop_mem[1]==1'b1 && stop_ref==1'b1)
	      stop_gate_ff<=1'b0;
	 end
	 
   end
end

reg    stop_gate_ff_pos;
//delay another half cycle.
always @(posedge eclk or posedge reset) begin
   if(reset) begin
      stop_gate_ff_pos<=1'b0;
   end
   else begin
      stop_gate_ff_pos<=stop_gate_ff;
   end
end

assign stop = stop_mem[0]? stop_gate_ff_pos : stop_gate_ff;

endmodule



//circuit to use sclk to sample eclk (tapped from eclk tree after eclksync)
//expect to stop at 2'b00 transition to 2'b01 (going back to 2'b00)
module ddr3_clks_clk_phase(eclk,eclksync,sclk,reset,align_status);
input        eclk;//short eclk directly from pll, for bit0
input        eclksync; //after eclksync, for bit 1

input        sclk;
input        reset;
output [1:0] align_status;

//clock eclk by sclk
//create div by 2 to mimic dqs circuit
wire         dqclk1bar_ff /* synthesis syn_keep =1 */;
//pragma attribute dqclk1bar_ff preserve_signal true
wire         phase_ff_1;
wire         phase_ff_0;

//register again to be mapped into io FFs
   

FD1S3DX dqclk1bar_ff_inst (.D(~dqclk1bar_ff),
                           .CK(eclksync), 
                           .CD(reset), 
                           .Q(dqclk1bar_ff))/*synthesis HGROUP="clk_phase1a" PBBOX="1,1" */;
//pragma attribute dqclk1bar_ff_inst HGROUP clk_phase1a
//pragma attribute dqclk1bar_ff_inst PBBOX 1,1
   
FD1S3DX phase_ff_0_inst (.D(eclk),
                         .CK(sclk), 
                         .CD(reset), 
                         .Q(phase_ff_0))/*synthesis HGROUP="clk_phase0" PBBOX="1,1" */;
//pragma attribute phase_ff_0_inst HGROUP clk_phase0
//pragma attribute phase_ff_0_inst PBBOX 1,1

FD1S3DX phase_ff_1_inst (.D(dqclk1bar_ff),
                         .CK(sclk),
                         .CD(reset),
                         .Q(phase_ff_1))/*synthesis HGROUP="clk_phase1b" PBBOX="1,1" */;
//pragma attribute phase_ff_1_inst HGROUP clk_phase1b
//pragma attribute phase_ff_1_inst PBBOX 1,1

assign align_status[0] = phase_ff_0;         
assign align_status[1] = phase_ff_1;         
   
endmodule


//filter status_0
//it detects eclk using sclk.                                  
//due to clock jitter, it can bounce back and forth.
//the back and forth can potentially confuse the state machine 
//in ddr3_clks_pll_control.v
//a filter here should remove jitter induced noise.            

//it is basically a up/down counter                            
//start at 0
//if 1, count up
//if 0, count down
//if count to pre-defined value (15), send out 1.
//once is 1, stay 1 till count down to 0
//once 0, stay there till count up to 15
//this large 15 gap should avoid the jitter region completely.

//11/09/2010, resolve a weakness in jitter filter
//the filter output goes to 0 too quickly in jitter region
//this makes the filter very sensitive to the distribution of jitter.
//needs to count 128 cycles (half of each rotation and wait operation)
//if any 1, stay at 1.
//if all 0, goes to 0.
//this way status will never go to 0 unless it is 100% out of jitter region.
module ddr3_clks_jitter_filter(reset, in,sclk,out_q);
input     reset;
input     in;
input     sclk;
output    out_q;
   reg [6:0] counter;
   reg 	     any1;

reg       out_q;



always @(posedge sclk or posedge reset) begin
   if(reset) begin
	 counter<=7'h00;
	 any1<=1'b0;	 
      out_q<=0;
   end

   else begin


	 //counter continues to roll over per 128 cycles.
          counter<=counter+1;
	 //0-126, check if any 1's
	 //127, latch results and start over again.
	 if(counter!=127 && in==1) any1<=1'b1;
	 if(counter==127) begin
	    out_q<=any1;
	    any1<=1'b0;
	 end

  end

end
   
endmodule


`ifndef SIM
`define status_filter_on
`endif

module ddr3_clks(reset, reset_datapath, refclk, 
		 eclk,sclk,sclk2x, all_lock,
     reset_datapath_out,
     align_status, good, err,
`ifdef DEBUG_MARGIN
		margin_code,
`endif
     uddcntln,dqsdel,pll_phase,pll_lock,clkos)/* synthesis syn_netlist_hierarchy = 0 */;
   
input        reset; 
input        reset_datapath; 
input        refclk;   
`ifdef DEBUG_MARGIN
   input [5:0] margin_code;
`endif
output eclk;
input sclk;
input sclk2x;
output       all_lock; 
output       reset_datapath_out;
output [1:0] align_status;
output       good;
output       err;

input        uddcntln;
output       dqsdel;

output [3:0]     pll_phase;
input            pll_lock;
input            clkos;
wire         sclk2x /* synthesis syn_keep=1 */;
//pragma attribute sclk2x preserve_signal true
wire         eclk /* synthesis syn_keep=1 */;
//pragma attribute eclk preserve_signal true
wire         sclk /* synthesis syn_keep=1 */;
//pragma attribute sclk preserve_signal true
wire [3:0]   pll_phase /* synthesis syn_keep =1 */;
//pragma attribute pll_phase preserve_signal true
wire         reset_datapath_out;   
wire [1:0]   align_status_sig;
wire         good_out; 
wire         clkos /* synthesis syn_keep = 1 */;
//pragma attribute clkos preserve_signal true
wire         stop /*synthesis syn_keep = 1 */;
//pragma attribute stop preserve_signal true
reg          good /* synthesis syn_preserve = 1 */;
//pragma attribute good preserve_driver true


parameter period_eclk = 2.50;

   always @(posedge sclk or posedge reset) begin
   if(reset)
      good <=1'b0;
   else
      good <= good_out;   
end
   
defparam Inst4_DQSDLLB.LOCK_SENSITIVITY = "LOW" ;
   DQSDLLB Inst4_DQSDLLB (.CLK(sclk2x), .RST(reset), .UDDCNTLN(uddcntln), 
                       .LOCK(ddrdll_lock), .DQSDEL(dqsdel));
   
   //move control to sclk to save a primary clock, it is not moving during rotation.
ddr3_clks_pll_control pll_control (.reset(reset),.lock(all_lock), .clk(refclk), .phase(pll_phase),//module
                         .align_status(align_status), 
                         .reset_datapath(reset_datapath), 
                         .reset_datapath_out(pll_reset_datapath), 
			    .stop_out(pll_stop), 
`ifdef DEBUG_MARGIN
				.margin_code(margin_code),
`endif
                         .good_int(good_out), .err(err));
//pragma attribute pll_control hierarchy preserve 

assign all_lock = pll_lock && ddrdll_lock;
   

   //move stop to use sclk2x instead of clkos, the improved code only needs frequency reference
ddr3_clks_clk_stop clk_stop (.reset(reset),.eclk(clkos),//module
                   .reset_datapath(pll_reset_datapath),
		      .reset_datapath_out(reset_datapath_out), 
			  .pll_stop(pll_stop),
			  .stop(stop))/*synthesis HGROUP="clk_stop" PBBOX="3,2" */;
//pragma attribute clk_stop hierarchy preserve
//pragma attribute clk_stop HGROUP clk_stop
//pragma attribute clk_stop PBBOX 3,2
   
ECLKSYNCA sync (.ECLKI(clkos), .STOP(stop), .ECLKO(eclk_sync_net));

   assign eclk = eclk_sync_net;

   ddr3_clks_clk_phase clk_phase(.eclk(clkos), .eclksync(eclk),.sclk(sclk),.reset(reset_datapath_out), .align_status(align_status_sig));//module
 //pragma attribute clk_phase hierarchy preserve
 
`ifdef status_filter_on
    wire [1:0] align_status_filtered;   
    //stable status, jitter noise is removed by the filter and large hysterisis
   ddr3_clks_jitter_filter filter_0 (.reset(reset), .sclk(sclk), .in(align_status_sig[0]), .out_q(align_status_filtered[0]));//module
   wire reset_filter_1;
   //reset filter_1 to allow full 128 cycles before checking status 1;
   assign reset_filter_1 = reset || reset_datapath_out;
   ddr3_clks_jitter_filter filter_1 (.reset(reset_filter_1), .sclk(sclk), .in(align_status_sig[1]), .out_q(align_status_filtered[1]));//module
   
    assign     align_status[1:0] = align_status_filtered[1:0];
`else
    //original, the status bounces back and forth too much in jitter region, the state machine can have problems
    assign     align_status[1:0] = align_status_sig[1:0];         
`endif

endmodule
