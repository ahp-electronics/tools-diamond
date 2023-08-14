
`include "eval_params.v"
`timescale 1ns/10ps

module uart_tb;

 reg         STB_I;
 reg         CYC_I;
 reg [15:0]  DAT_I;
 reg [7:0]  ADR_I;
 reg [3:0]   SEL_I;
 reg [2:0]   CTI_I;
 reg [1:0]   BTE_I;
 reg         WE_I;
 reg         RESET;
 reg         SIN;
 wire [15:0] DAT_O;     
 wire        ACK_O;
 wire        INTR;
 wire        RXRDY_N;
 wire        SOUT;
 wire        TXRDY_N;
 `ifdef MODEM
 reg        DCD_N;
 reg        CTS_N;
 reg        DSR_N;
 reg        RI_N;
 wire       DTR_N;
 wire       RTS_N; 
 `endif

 wire [15:0]      DIV_CLK;
 assign DIV_CLK = ((`CLK_IN_MHZ*1000*1000)/(`BAUD_RATE));
 reg       CLK;
 reg [15:0] regData_readBack  ;
 
 integer   dataBit;
 integer   numDataBits;
 real      stopBitLength;
 reg [5:0] TestID ;
 integer   i;
 integer   j;
 integer   c;
 reg       okToReceiveSIN;

 parameter HALF_MCLK_CLK_PERIOD = 1000 / (`CLK_IN_MHZ*2);
 parameter ONE_UART_CYCLE = (1000 * 1000 * 1000) / (`BAUD_RATE);
 //changed for mico8 support
   parameter RBR = 4'b0000;//00
   parameter THR = 4'b1000;//08
   parameter IER = 4'b0001;//01
   parameter IIR = 4'b0010;//02
   parameter LCR = 4'b0011;//03
   parameter LSR = 4'b0101;//05
   parameter DIV = 4'b0111;//07 

 
 parameter WAIT_TIMEOUT = 16000;


 
// UART_Vhdlwrapper UART_Vhdlwrapper_inst( // comment this line for Verilog simulation
 uart_core uart_core_inst(              // comment this line for VHDL  simulation 
       // Global reset and clock
       .RESET    (RESET ),
       .CLK      (CLK),
      
      // wishbone interface
       .UART_ADR_I   (ADR_I ),
       .UART_DAT_I   (DAT_I ),
       .UART_STB_I   (STB_I ),
       .UART_CYC_I   (CYC_I ),
       .UART_WE_I    (WE_I  ),
       .UART_SEL_I   (SEL_I ),
       .UART_BTE_I   (BTE_I ),
       .UART_DAT_O   (DAT_O ),
       .UART_ACK_O   (ACK_O ),      
       .INTR         (INTR  ),
      
       // Receiver interface
       .SIN      (SIN    ),
       .RXRDY_N  (RXRDY_N),
      
       //`ifdef MODEM
       // Modem interface
       .DCD_N    (DCD_N ),
       .CTS_N    (CTS_N ),
       .DSR_N    (DSR_N ),
       .RI_N     (RI_N  ),
       .DTR_N    (DTR_N ),
       .RTS_N    (RTS_N ),
      // `endif
       
       // Transmitter interface
       .SOUT     (SOUT   ),
       .TXRDY_N  (TXRDY_N)
      
       );    
                  
 task write_reg;
 input [4:0] addr;
 input [15:0] data;
 begin
  // wait initial delay
  @(posedge CLK)
  #2;
  // assert cyc_signal
  CYC_I  = 1'b1;   
  STB_I  = 1'b0;
  // wait for stb_assertion
  @(posedge CLK);
  #2;
  // assert wishbone signals
  ADR_I  = addr;
  DAT_I  = data;
  STB_I  = 1'b1;
  WE_I   = 1'b1;
  SEL_I  = 4'b0001;
  @(posedge CLK);
  
  // wait for acknowledge from slave
  // err is treated as normal ack
  // rty is ignored (thus retrying cycle)
  while(!ACK_O ) @(posedge CLK);
  
  // negate wishbone signals
  #1;
  CYC_I  = 1'b0;
  STB_I  = 1'b0;
  ADR_I  = 32'h0;
  DAT_I = 32'hf;
  WE_I   = 1'h1;
  SEL_I  = 4'h0;
 end
 endtask

 task write_reg16;
 input [3:0] addr;
 input [15:0] data;
 begin
  // wait initial delay
  @(posedge CLK)
  #2;
  // assert cyc_signal
  CYC_I  = 1'b1;   
  STB_I  = 1'b0;
  // wait for stb_assertion
  @(posedge CLK);
  #2;
  // assert wishbone signals
  ADR_I  = addr;
  DAT_I  = data;
  STB_I  = 1'b1;
  WE_I   = 1'b1;
  SEL_I  = 4'b0011;
  @(posedge CLK);
  
  // wait for acknowledge from slave
  // err is treated as normal ack
  // rty is ignored (thus retrying cycle)
  while(!ACK_O ) @(posedge CLK);
  
  // negate wishbone signals
  #1;
  CYC_I  = 1'b0;
  STB_I  = 1'b0;
  ADR_I  = 32'h0;
  DAT_I = 32'hf;
  WE_I   = 1'h1;
  SEL_I  = 4'h0;
 end
 endtask
 
 task read_reg;
 input [3:0] addr;       
 begin
  // wait initial delay
  @(posedge CLK);
  #2;
  CYC_I  = 1'b1;
  STB_I  = 1'b0;
  @(posedge CLK);
  #2;
  ADR_I  = addr;
  STB_I  = 1'b1;
  WE_I   = 1'b0;
  SEL_I  = 4'b0001;
  @(posedge CLK);
  // wait for acknowledge from slave
  // err is treated as normal ack
  // rty is ignored (thus retrying cycle)
  while(!ACK_O) @(posedge CLK);
  // negate wishbone signals
  CYC_I  = 1'b0;
  STB_I  = 1'b0;
  ADR_I  = 32'h0;
  WE_I   = 1'h1;
  SEL_I  = 32'h0;
  regData_readBack = DAT_O; 
 end
 endtask
 
 task sin_gen;
 input [3:0] numDataBits;
 input [7:0] data;
 input parity;
 input parityBitExist;
 input stopBitIsHigh;

 begin      
   #2;
   SIN = 1'b0;
   for(j=0;j<DIV_CLK;j=j+1) @(posedge CLK);   //changed
   for(dataBit=0; dataBit<numDataBits; dataBit= dataBit+1)
   begin
      SIN = data[dataBit];
      for(j=0;j<DIV_CLK;j=j+1)
      @(posedge CLK);
   end
   if (parityBitExist)
   begin
      SIN = parity;
      for(j=0;j<DIV_CLK;j=j+1) @(posedge CLK);  // CHANGED
   end
   if (stopBitIsHigh) 
     SIN = 1'b1;
   else
     SIN = 1'b0; // for BREAK & Framing Error generation  
   for(j=0;j<stopBitLength*DIV_CLK;j=j+1)
   @(posedge CLK); // CHANGED
   SIN = 1'b1;
 end
 endtask 
  
 task sout_chk;
 input [5:0] ID;
 input [7:0] TxData;
 input ParityBit;
 input parityBitExist;
 begin
 j=1;
 c=1;
 @(posedge CLK);
 while (SOUT !== 1'b0)  
 begin
   if (j < WAIT_TIMEOUT) begin
      @(posedge CLK);
      j = j + 1; end
   else  begin
      $display("Start bit Generation Failed");
      $stop;  end
   end
   
 //Start Bit check  
 for (j=0;j<DIV_CLK;j=j+1) 
 begin
   @(posedge CLK); // CHANGED
   if (SOUT !== 1'b0) begin
      $display("Start bit too short");
      $stop;  end
   end
   
 //Data bit check
 for (dataBit=0; dataBit<numDataBits; dataBit=dataBit+1)  
 begin
   for(j=0;j<DIV_CLK;j=j+1)  
   begin
      @(posedge CLK); //CHANGED
      if (j == 8)
      begin
        if (SOUT !== TxData[dataBit])  
        begin
         $display("Transmitted Data bits incorrect");
         $display("databit is %x", dataBit);
         $display("j is %x",j);
         #10000;
         $stop; 
      end    
     end
   end                 
 end
      
 //parity bit Checking
 if (parityBitExist) 
 begin
    for (j=0;j<DIV_CLK;j=j+1)  
    begin
      @(posedge CLK); // CHANGED
     if (j == 8)      
     begin
      if (SOUT !== ParityBit) 
      begin
         $display("Transmitted Parity bit incorrect");
        // $stop; 
      end
     end
    end
 end

//Stop bit checking    
 if (stopBitLength == 1.0) 
 begin
    for (j=0;j<DIV_CLK;j=j+1) 
    begin      
       @(posedge CLK); //CHANGED
       if (j == 8)
       begin
        if (SOUT !== 1'b1)  
        begin
          $display("Transmitted 1 Stop bit incorrect");
         // #10000;
        //  $stop;  
        end
       end
    end
 end
 
 else if (stopBitLength == 1.5) 
 begin
    for (j=0;j<DIV_CLK*1.5;j=j+1) 
    begin
       @(posedge CLK)
       if (j == 8) 
       begin
        if (SOUT !== 1'B1)  
        begin
          $display("Transmitted 1.5 Stop bit incorrect");
          $stop; 
        end
       end
    end
 end
 
 else if (stopBitLength == 2.0)  
 begin
    for (j=0;j<DIV_CLK*2;j=j+1) 
    begin
       @(posedge CLK)
       if (j == 8) 
       begin
        if (SOUT !== 1'b1) 
        begin
          $display("Transmitted 2 Stop bit incorrect");
          $stop;  
        end
       end
    end
 end
 
 else begin
    $display("Incorrect Stop bit length specified");
    $stop;
   end


     
      $display("end of check the output of case %d, No Tx Error found!",ID);
 end
  

 endtask

 always
 begin
  CLK = 1'B0;
  # HALF_MCLK_CLK_PERIOD;
  CLK = 1'B1;
  # HALF_MCLK_CLK_PERIOD;
 end
 
 initial
 begin
	 $dumpfile("uart_test.vcd");
    $dumpvars(0, uart_tb);
 end

 `include "transmit_test.v"   // tranmit test
//`include "receive_test.v" // Recive test
 endmodule

