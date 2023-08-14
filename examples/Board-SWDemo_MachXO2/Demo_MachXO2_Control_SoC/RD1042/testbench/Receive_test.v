//Test Case 2
//Single data transfer for 550
//Test1 : receive data successful
//Test2 : Frame Error test, stop bit is 0
//Test3 : receive data is all 0 including stop bit, BI test
//Test4 : Parity error test
reg EOT;
wire [7:0] golden_data1 = 8'h55;
wire [7:0] golden_data2 = 8'haa;
wire [7:0] golden_data3 = 8'h00; 
wire [7:0] golden_data4 = 8'hab;
reg test;

initial
begin : SIN_proc
  SIN = 1'B1;
  EOT = 0;
  #500;
  EOT = 1;
  stopBitLength = 1.0;


  
  @(posedge okToReceiveSIN)
  EOT = 0;
  sin_gen(8, golden_data1, 1'b0, 0, 1);
  EOT = 1;

  
  @(posedge okToReceiveSIN)
  EOT = 0;
  sin_gen(8,golden_data2,1'b0,0,0);
  EOT = 1;

  @(posedge okToReceiveSIN)
  EOT = 0;
  sin_gen(8, golden_data3, 1'b0, 0, 0);
  EOT = 1;

  @(posedge okToReceiveSIN)
  EOT = 0;
  sin_gen(8, golden_data4, 1'b0, 1'b1,1);
  EOT = 1;

end


initial
begin : UART_Stim_Proc
 RESET = 1'B1;
 CYC_I = 1'B0;
 STB_I = 1'B0;
 WE_I  = 1'B1;
 ADR_I = 32'H0;
 DAT_I = 32'H0;
 SEL_I = 4'H0;
 CTI_I = 3'H0;
 BTE_I = 2'B0;
 okToReceiveSIN = 1'b0;
 regData_readBack = 8'h00;

 #100;
 RESET = 1'B0;
 #5;


 
/****************************************************/
/*********   TEST1: Receive one data test************/
/****************************************************/
@(posedge CLK);
 $display("Receiver Test 1: Receive golden_data1  Test Start!");
 /* receive one data right */
wait(EOT);
TestID = 1;
@(posedge CLK);
write_reg (IER, 8'b00000001); // receiver buffer register interrupt
@(posedge CLK);
write_reg(LCR, 8'B00000011);  // 8bit, 1 stop,  parity disable, 
okToReceiveSIN = 1'b1;
#100;
okToReceiveSIN = 1'b0;

// wait for INTR high
i = 1;
while (!INTR) begin
   @(posedge CLK);
   if (i < WAIT_TIMEOUT)
      i = i + 1;
   else begin
     $display("Interrupt Generation Failed");
     $stop; 
   end
end



#1000;
@(posedge CLK);
read_reg(IIR);
if (regData_readBack !== 8'b00000100) // if not receiver data-ready flag , stop
begin
  $display("Invalid IIR");
  $stop; 
end

@(posedge CLK);
read_reg (LSR);
if (regData_readBack[0] !== 1'b1) // if no receiver data-ready, stop
begin
  $display("Receiver Data Ready bit in LSR is not set");
  $stop;
end



#10000;
@(posedge CLK);
read_reg(IIR);
if (regData_readBack !== 8'b00000100)
 begin
 $display("Invald IIR");
 $stop;
 end

@(posedge CLK);
read_reg(RBR);
if (regData_readBack !== golden_data1)
begin
$display("Invalid RBR");
//$stop;
end

else
begin $display("Received golden_data1- Test Passed");
end



@(posedge CLK);
read_reg(LSR);
if (regData_readBack !== 8'b01100000)
begin
$display("Invalid LSR");
#100000;
$stop;
end



/****************************************************/
/*********   TEST2: FE test     *********************/
/****************************************************/
$display("Receiver Test 2: Receive golden_data2 & Frame Error test Start!");
 /* FRAME ERROR TEST */
wait(EOT);


TestID = 2;
@(posedge CLK);
write_reg (IER, 8'b00000100);   //  receiver line status interrupt
@(posedge CLK);
write_reg(LCR, 8'B00000011);    // 8 bit 
okToReceiveSIN = 1'b1;
#100;
okToReceiveSIN = 1'b0;
// wait for INTR high

i = 1;
while (!INTR) begin
   @(posedge CLK);
   if (i < WAIT_TIMEOUT)
	begin
      i = i + 1;
      read_reg(RBR);
	end
   else begin
     $display("Interrupt Generation Failed");
     $stop; 
   end
end

if (regData_readBack !== golden_data2)
begin
	$display("Invalid RBR");
	$stop;
end
else
begin $display("Received golden_data2-Test Passed");
end



@(posedge CLK);
read_reg(IIR);
if (regData_readBack !== 8'b00000110) // LSR error flags 
begin
  $display("Invalid IIR");
  $stop; 
end

@(posedge CLK);
read_reg (LSR);
if (regData_readBack[3] !== 1'b1)  // FE
begin
  $display("Frame Error in LSR is not set");
  $stop;
end

else
begin $display("Frame Error set in LSR");
end



@(posedge CLK);
read_reg(IIR);
if (regData_readBack !== 8'b00000001) // WHenever the IIR is read, the current pending interrupt is cleared
 begin
 $display("Invald IIR");
 $stop;
 end






/****************************************************/
/*********   TEST3: BI test     *********************/
/****************************************************/
$display("Receiver Test 3: Receive golden_data3 & Break Interupt test Start!");
 /* FRAME ERROR TEST */
wait(EOT);
TestID = 3;
@(posedge CLK);
write_reg (IER, 8'b00000100);   //  receiver line status interrupt
@(posedge CLK);
write_reg(LCR, 8'B00000011);    // 8 bit 
okToReceiveSIN = 1'b1;
#100;
okToReceiveSIN = 1'b0;
// wait for INTR high

#1000;
i = 1;
while (!INTR) begin
   @(posedge CLK);
   if (i < WAIT_TIMEOUT)
    begin
		i = i + 1;
	    read_reg(RBR);
	 end
		 else begin
     $display("Interrupt Generation Failed");
     $stop; 
   end
end

if (regData_readBack !== golden_data3)
begin
	$display("Invalid RBR");
   #100000;
	$stop;
end

else
begin $display("Received golden_data3- Test Passed");
end


@(posedge CLK);
read_reg(IIR);
if (regData_readBack !== 8'b00000110) // LSR error flags 
begin
  $display("Invalid IIR");
  $stop; 
end

@(posedge CLK);
read_reg (LSR);
if (regData_readBack[4] !== 1'b1)  // BI
begin
  $display("BREAK INT in LSR is not set");
  #1000000;
  $stop;
end

else
begin $display("Break Interrupt Set In LSR");
end



#10000;
@(posedge CLK);
read_reg(IIR);
if (regData_readBack !== 8'b00000001) // WHenever the IIR is read, the current pending interrupt is cleared
 begin
 $display("Invald IIR");
 $stop;
 end




@(posedge CLK);
read_reg(LSR);
if (regData_readBack !== 8'b01100000)
begin
$display("Invalid LSR and the break int not cleared successful");
#100000;
$stop;
end

/****************************************************/
/*********   TEST4: PE test     *********************/
/****************************************************/
$display("Receiver Test 4: Receive golden_data4 & Parity Check test Start!");
 /* FRAME ERROR TEST */
wait(EOT);
TestID = 4;
@(posedge CLK);
write_reg (IER, 8'b00000100);   //  Receiver line status interrupt enabled
@(posedge CLK);
write_reg(LCR, 8'B00011011);    // 8 bit, 1Stop,Parity enabledeven parity
okToReceiveSIN = 1'b1;
#100;
okToReceiveSIN = 1'b0;
// wait for INTR high

#10000;
i = 1;
while (!INTR) begin
   @(posedge CLK);
   if (i < WAIT_TIMEOUT)
      begin
         i = i + 1;
         read_reg(RBR);
      end
   else begin
     $display("Interrupt Generation Failed");
     $stop; 
   end
end
@(posedge CLK)
if (regData_readBack !== golden_data4)
begin
   test = 1;
$display("Invalid RBR");
#200000;
$stop;
end

else
begin $display("Received golden_data4-Test Passed");
end

@(posedge CLK);
read_reg(IIR);
if (regData_readBack !== 8'b00000110) // LSR error flags 
begin
  $display("Invalid IIR");
  $stop; 
end

@(posedge CLK);
read_reg (LSR);
if (regData_readBack[2] !== 1'b1)  // PE
begin
  $display("PE INT in LSR is not set");
  #1000000;
  $stop;
end

else
begin $display("Parity Error is Set In LSR");
end



#10000;
@(posedge CLK);
read_reg(IIR);
if (regData_readBack !== 8'b00000001) // WHenever the IIR is read, the current pending interrupt is cleared
 begin
 $display("Invald IIR");
 $stop;
 end





@(posedge CLK);
read_reg(LSR);
if (regData_readBack !== 8'b01100000)
begin
$display("Invalid LSR and PE is not cleared successful");
#100000;
$stop;
end








@(posedge CLK);
read_reg(LSR);
if (regData_readBack !== 8'b01100000)
begin
$display("Invalid LSR and the frame_err not generated successful");
$stop;
end




if (1)
begin
$display("END OF UART TEST");
$finish;
end



end
