//Test Case 1
//UART Tx test: 5/6/7/8 bit, even/odd parity, parity/non-parity/stick parity, 1/1.5/2 stop bit
  wire [7:0] golden_data1 =   8'b01010101;//55
  wire [7:0] golden_data2 =   8'b10101010;//AA
  wire [7:0] golden_data3 =   8'b01011010;//5A
  wire [7:0] golden_data4 =   8'b10100101;//A5
  
  initial
  begin
  
    @(posedge CLK);
    // Test 1 ////////////////////////////////////////////////////
    //   5-bit data, even parity, 1 stop
    numDataBits = 5;
    stopBitLength = 1.0;
    sout_chk(1,golden_data1, 1'b0,  1'b1);
    sout_chk(1,golden_data2, 1'b1,  1'b1);
    sout_chk(1,golden_data3, 1'b0,  1'b1);
    sout_chk(1,golden_data4, 1'b1,  1'b1);
 
    // Test 2 ////////////////////////////////////////////////////
    //   5-bidata, even parity, 1.5 stop  
    numDataBits = 5;       
    stopBitLength = 1.5; 
    sout_chk(2,golden_data1, 1'b1, 1'b1);
    sout_chk(2,golden_data2, 1'b0, 1'b1);
    sout_chk(2,golden_data3, 1'b1, 1'b1);
    sout_chk(2,golden_data4, 1'b0, 1'b1);

    // Test 3 ////////////////////////////////////////////////////
    //   5-bit data, odd parity, 1 stop 
    numDataBits = 5;
    stopBitLength = 1.0; 
    sout_chk(3,golden_data1, 1'b0, 1'b1);
    sout_chk(3,golden_data2, 1'b1, 1'b1);
    sout_chk(3,golden_data3, 1'b0, 1'b1);
    sout_chk(3,golden_data4, 1'b1, 1'b1);
                                     
    // Test 4 ////////////////////////////////////////////////////
    //   5-bit data, odd parity, 1.5 stop  
    numDataBits = 5;                  
    stopBitLength = 1.5;              
    sout_chk(4,golden_data1, 1'b0, 1'b1);
    sout_chk(4,golden_data2, 1'b1, 1'b1);
    sout_chk(4,golden_data3, 1'b0, 1'b1);
    sout_chk(4,golden_data4, 1'b1, 1'b1);

    // Test 5 ////////////////////////////////////////////////////
    //   5-bit data, stick even parity, 1 stop 
    numDataBits = 5;
    stopBitLength = 1.0;
    sout_chk(5,golden_data1, 1'b0,1'b1);
    sout_chk(5,golden_data2, 1'b0,1'b1);
    sout_chk(5,golden_data3, 1'b0,1'b1);
    sout_chk(5,golden_data4, 1'b0,1'b1);

    // Test 6 ////////////////////////////////////////////////////
    //   5-bit data, stick even parity, 1.5 stop   
    numDataBits = 5;
    stopBitLength = 1.5;
    sout_chk(6,golden_data1, 1'b0, 1'b1);
    sout_chk(6,golden_data2, 1'b0, 1'b1);
    sout_chk(6,golden_data3, 1'b0, 1'b1);
    sout_chk(6,golden_data4, 1'b0, 1'b1);

    // Test 7 ////////////////////////////////////////////////////
    //   5-bit data, stick odd parity, 1 stop    
    numDataBits = 5;
    stopBitLength = 1.0;
    sout_chk(7,golden_data1, 1'b1,1'b1);
    sout_chk(7,golden_data2, 1'b1,1'b1);
    sout_chk(7,golden_data3, 1'b1,1'b1);
    sout_chk(7,golden_data4, 1'b1,1'b1);

    // Test 8 ////////////////////////////////////////////////////
    //   5-bit data, stick odd parity, 1.5 stop    
    numDataBits = 5;
    stopBitLength = 1.5;
    sout_chk(8,golden_data1, 1'b1, 1'b1);
    sout_chk(8,golden_data2, 1'b1, 1'b1);
    sout_chk(8,golden_data3, 1'b1, 1'b1);
    sout_chk(8,golden_data4, 1'b1, 1'b1);

    // Test 9 ////////////////////////////////////////////////////
    //   5-bit data, no parity, 1 stop    
    numDataBits = 5;
    stopBitLength = 1.0;
    sout_chk(9,golden_data1, 1'b0, 1'b0);
    sout_chk(9,golden_data2, 1'b0, 1'b0);
    sout_chk(9,golden_data3, 1'b0, 1'b0);
    sout_chk(9,golden_data4, 1'b0, 1'b0);

    // Test 10 //////////////////////////////////////////////////-
    //   5-bit data, no parity, 1.5 stop
    numDataBits = 5;
    stopBitLength = 1.5;
    sout_chk(10,golden_data1, 1'b0, 1'b0);
    sout_chk(10,golden_data2, 1'b0, 1'b0);
    sout_chk(10,golden_data3, 1'b0, 1'b0);
    sout_chk(10,golden_data4, 1'b0, 1'b0);

    // Test 11 //////////////////////////////////////////////////-
    //   6-bit data, even parity, 1 stop 
    numDataBits = 6;
    stopBitLength = 1.0;
    sout_chk(11,golden_data1, 1'b1, 1'b1);
    sout_chk(11,golden_data2, 1'b1, 1'b1);
    sout_chk(11,golden_data3, 1'b1, 1'b1);
    sout_chk(11,golden_data4, 1'b1, 1'b1);

    // Test 12 //////////////////////////////////////////////////-
    //   6-bit data, even parity, 2 stop
    stopBitLength = 2.0;
    sout_chk(12,golden_data1, 1'b1, 1'b1);
    sout_chk(12,golden_data2, 1'b1, 1'b1);
    sout_chk(12,golden_data3, 1'b1, 1'b1);
    sout_chk(12,golden_data4, 1'b1, 1'b1);

    // Test 13 //////////////////////////////////////////////////-
    //   6-bit data, odd parity, 1 stop
    stopBitLength = 1.0;
    sout_chk(13,golden_data1, 1'b0, 1'b1);
    sout_chk(13,golden_data2, 1'b0, 1'b1);
    sout_chk(13,golden_data3, 1'b0, 1'b1);
    sout_chk(13,golden_data4, 1'b0, 1'b1);

    // Test 14 //////////////////////////////////////////////////-
    //   6-bit data, odd parity, 2 stop
    stopBitLength = 2.0;
    sout_chk(14,golden_data1, 1'b0, 1'b1);
    sout_chk(14,golden_data2, 1'b0, 1'b1);
    sout_chk(14,golden_data3, 1'b0, 1'b1);
    sout_chk(14,golden_data4, 1'b0, 1'b1);

    // Test 15 //////////////////////////////////////////////////-
    //   6-bit data, stick even parity, 1 stop
    stopBitLength = 1.0;
    sout_chk(15,golden_data1, 1'b0,  1'b1);
    sout_chk(15,golden_data2, 1'b0,  1'b1);
    sout_chk(15,golden_data3, 1'b0,  1'b1);
    sout_chk(15,golden_data4, 1'b0,  1'b1);

    // Test 16 //////////////////////////////////////////////////-
    //   6-bit data, stick even parity, 2 stop
    stopBitLength = 2.0;
    sout_chk(16,golden_data1, 1'b0, 1'b1);
    sout_chk(16,golden_data2, 1'b0, 1'b1);
    sout_chk(16,golden_data3, 1'b0, 1'b1);
    sout_chk(16,golden_data4, 1'b0, 1'b1);

    // Test 17 //////////////////////////////////////////////////-
    //   6-bit data, stick odd parity, 1 stop
    stopBitLength = 1.0;
    sout_chk(17,golden_data1, 1'b1, 1'b1);
    sout_chk(17,golden_data2, 1'b1, 1'b1);
    sout_chk(17,golden_data3, 1'b1, 1'b1);
    sout_chk(17,golden_data4, 1'b1, 1'b1);

    // Test 18 //////////////////////////////////////////////////-
    //   6-bit data, stick odd parity, 2 stop
    stopBitLength = 2.0;
    sout_chk(18,golden_data1, 1'b1, 1'b1);
    sout_chk(18,golden_data2, 1'b1, 1'b1);
    sout_chk(18,golden_data3, 1'b1, 1'b1);
    sout_chk(18,golden_data4, 1'b1, 1'b1);

    // Test 19 //////////////////////////////////////////////////-
    //   6-bit data, no parity, 1 stop
    stopBitLength = 1.0;
    sout_chk(19,golden_data1, 1'b0, 1'b0);
    sout_chk(19,golden_data2, 1'b0, 1'b0);
    sout_chk(19,golden_data3, 1'b0, 1'b0);
    sout_chk(19,golden_data4, 1'b0, 1'b0);

    // Test 20 //////////////////////////////////////////////////-
    //   6-bit data, no parity, 2 stop
    stopBitLength = 2.0;
    sout_chk(20,golden_data1, 1'b0,1'b0);
    sout_chk(20,golden_data2, 1'b0,1'b0);
    sout_chk(20,golden_data3, 1'b0,1'b0);
    sout_chk(20,golden_data4, 1'b0,1'b0);

  
  end
    
  task write_thr;
  input [5:0] ID;       
  input [7:0] LCR_value;       
  begin
    @(posedge CLK);
    TestID = ID;
    i = 1;
    read_reg(LSR);
    //Wait till Tx buffer empty
    while (regData_readBack[6] !== 1'b1)  begin
      if (i < WAIT_TIMEOUT)  begin
         @(posedge CLK);
         read_reg(LSR);
         i=i+1; end 
      else begin
         $display("Data Transmission Failed");
         $stop; end
      end  
    
    @(posedge CLK); 
    write_reg (LCR,LCR_value); 
    
    // Write 1st data to THR 
    @(posedge CLK); 
    write_reg (THR,golden_data1); 
    // Write 2nd data to THR
    @(posedge CLK); 
    wait (~TXRDY_N);    
    @(posedge CLK);
    write_reg (THR,golden_data2); 
    // Write 3rd data to THR
    @(posedge CLK); 
    wait (~TXRDY_N);    
    @(posedge CLK);
    write_reg (THR,golden_data3); 
    // Write 4th data to THR
    @(posedge CLK); 
    wait (~TXRDY_N);    
    @(posedge CLK);
    write_reg (THR,golden_data4); 
    end
  endtask  
    
    
//////////////////////////////////////////////////////////////////////-
// Test UART Transmitter/Receiver Functions
//////////////////////////////////////////////////////////////////////- 
 initial

  begin: UART_Stim_Proc 
    RESET = 1'b1;
    CYC_I = 1'b0;
    STB_I = 1'b0;
    WE_I  = 1'b1;
    ADR_I = 32'h0;
    DAT_I = 32'h0;
    SEL_I = 4'b0000; 
    CTI_I = 3'b000;
    BTE_I = 2'b00;       
    regData_readBack =8'h00;
    
    #100;
    RESET = 1'b0;
    # ONE_UART_CYCLE;
    
    @(posedge CLK);
    // Test 1 ////////////////////////////////////////////////////
    //   5-bit data, even parity, 1 stop
    write_thr(1, 8'b00001000);
    // Test 2 ////////////////////////////////////////////////////
    //   5-bit data, even parity, 1.5 stop
   write_thr(2, 8'b00011100);
    // Test 3 ////////////////////////////////////////////////////
    //   5-bit data, odd parity, 1 stop
    write_thr(3, 8'b00001000);
    // Test 4 ////////////////////////////////////////////////////
    //   5-bit data, odd parity, 1.5 stop
    write_thr(4, 8'b00001100);
    // Test 5 ////////////////////////////////////////////////////
    //   5-bit data, stick even parity, 1 stop
    write_thr(5, 8'b00111000);
    // Test 6 ////////////////////////////////////////////////////
    //   5-bit data, stick even parity, 1.5 stop
    write_thr(6, 8'b00111100);
    // Test 7 ////////////////////////////////////////////////////
    //   5-bit data, stick odd parity, 1 stop
    write_thr(7, 8'b00101000);
    // Test 8 ////////////////////////////////////////////////////
    //   5-bit data, stick odd parity, 1.5 stop
    write_thr(8, 8'b00101100);
    // Test 9 ////////////////////////////////////////////////////
    //   5-bit data, no parity, 1 stop
    write_thr(9, 8'b00000000);
    // Test 10 //////////////////////////////////////////////////-
    //   5-bit data, stick odd parity, 1.5 stop
    write_thr(10, 8'b00000100);
    // Test 11 ////////////////////////////////////////////////////
    //   6-bit data, even parity, 1 stop
    write_thr(11, 8'b00011001);
    // Test 12 ////////////////////////////////////////////////////
    //   6-bit data, even parity, 1.5 stop
    write_thr(12, 8'b00011101);
    // Test 13 ////////////////////////////////////////////////////
    //   6-bit data, odd parity, 1 stop
    write_thr(13, 8'b00001001);
    // Test 14 ////////////////////////////////////////////////////
    //   6-bit data, odd parity, 1.5 stop
    write_thr(14, 8'b00001101);
    // Test 15 ////////////////////////////////////////////////////
    //   6-bit data, stick even parity, 1 stop
    write_thr(15, 8'b00111001);
    // Test 16 ////////////////////////////////////////////////////
    //   6-bit data, stick even parity, 1.5 stop
    write_thr(16, 8'b00111101);
    // Test 17 ////////////////////////////////////////////////////
    //   6-bit data, stick odd parity, 1 stop
    write_thr(17, 8'b00101001);
    // Test 18 ////////////////////////////////////////////////////
    //   6-bit data, stick odd parity, 1.5 stop
    write_thr(18, 8'b00101101);
    // Test 19 ////////////////////////////////////////////////////
    //   6-bit data, no parity, 1 stop
    write_thr(19, 8'b00000001);
    // Test 20 //////////////////////////////////////////////////-
    //   6-bit data, stick odd parity, 1.5 stop
    write_thr(20, 8'b00000101);
   
    
    // end of tests //////////////////////////////////////////////
    $display("End of UART Transmitter Tests .....");
    $finish;
end
