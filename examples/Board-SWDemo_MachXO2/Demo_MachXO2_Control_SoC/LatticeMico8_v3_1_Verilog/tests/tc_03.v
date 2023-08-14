//===========================================================================
//                        FILE DETAILS                                       
//Project          : isp8_verilog                                              
//File             : tc_03.v                                          
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
reg       tc_error ;
integer   i ;

initial begin
   repeat(20) @(posedge clk);
   rst_n    = 1'b1;
   tc_error = 1'b0 ;

   wait (test_complete);
   for (i = 0; i<=31;i=i+1) begin
      dut_rf_data = rf_dut[i] ;
      model_rf_data = rf_model[i] ;
      if (dut_rf_data !== model_rf_data ) begin
         $display("---ERROR : Reg No. %02d, From DUT : %b, From MODEL : %b", i, dut_rf_data, model_rf_data );
         tc_error = 1'b1 ;
      end
      if (`DEBUG==1'b1)
         $display(" ---INFO : Reg No. %02d, From DUT : %b, From MODEL : %b", i, dut_rf_data, model_rf_data );
   end
   repeat(10) @(posedge clk);
   if (!tc_error) 
      $display("\n ---INFO : Test tc_03 PASSED\n");
   else 
      $display("\n---ERROR : Test tc_03 FAILED\n");

   $stop;
end

// =============================================================================
