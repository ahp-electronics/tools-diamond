//===========================================================================
//                        FILE DETAILS                                       
//Project          : isp8_verilog                                              
//File             : tc_06.v                                          
//Title            :                                                         
//Dependencies     :                                                         
//Description      :                                                         
//===========================================================================
//                       REVISION HISTORY                                    
//$Revision: 1.0 $                                                           
//                                                                           
//===========================================================================
//---------------------------------------------------------------------------
//Permission:                                                                
//                                                                           
//  Lattice Semiconductor grants permission to use this code for use         
//  in synthesis for any Lattice programmable logic product.  Other          
//  use of this code, including the selling or duplication of any            
//  portion is strictly prohibited.                                          
//                                                                           
//Disclaimer:                                                                
//                                                                           
//  This VHDL or Verilog source code is intended as a design reference       
//  which illustrates how these types of functions can be implemented.       
//  It is the user's responsibility to verify their design for               
//  consistency and functionality through the use of formal                  
//  verification methods.  Lattice Semiconductor provides no warranty        
//  regarding the use or functionality of this code.                         
//---------------------------------------------------------------------------
//                                                                           
//   Lattice Semiconductor Corporation                                       
//   5555 NE Moore Court                                                     
//   Hillsboro, OR 97124                                                     
//   U.S.A                                                                   
//                                                                           
//   TEL: 1-800-Lattice (USA and Canada)                                     
//   408-826-6000 (other locations)                                          
//                                                                           
//   web: http://www.latticesemi.com/                                        
//   email: techsupport@latticesemi.com                                      
//                                                                           
//---------------------------------------------------------------------------


reg [7:0] dut_rf_data ;
reg [7:0] model_rf_data ;
reg [7:0] rf_model_temp[0:31] ;
reg       tc_error ;
integer   i ;
integer   j ;
integer   m ;
integer   n ;

`define EXT_SP_MEM

initial begin
   repeat(20) @(posedge clk);
   rst_n    = 1'b1;
   tc_error = 1'b0 ;

   // C model can not handle inputs from outside, so fill
   // expected pattern.
   for (i = 0; i<=15;i=i+1) begin
      if (i==0) rf_model_temp[i] = 31 ;
      else rf_model_temp[i] = i+72 ;
   end
   for (j = 16; j<=31;j=j+1) begin
      rf_model_temp[j] = j+23 ;
   end

   wait (test_complete);
   for (i = 0; i<=31;i=i+1) begin
      dut_rf_data = rf_dut[i] ;
      model_rf_data = rf_model_temp[i] ;
      if (dut_rf_data !== model_rf_data ) begin
         $display("---ERROR : Reg No. %02d, From DUT : %02d, From MODEL : %02d", i, dut_rf_data, model_rf_data );
         tc_error = 1'b1 ;
      end
      if (`DEBUG==1'b1)
         $display(" ---INFO : Reg No. %02d, From DUT : %02d, From MODEL : %02d", i, dut_rf_data, model_rf_data );
   end
   repeat(10) @(posedge clk);
   if (!tc_error) 
      $display("\n ---INFO : Test tc_06 PASSED\n");
   else 
      $display("\n---ERROR : Test tc_06 FAILED\n");

   $stop;
end

// =============================================================================
