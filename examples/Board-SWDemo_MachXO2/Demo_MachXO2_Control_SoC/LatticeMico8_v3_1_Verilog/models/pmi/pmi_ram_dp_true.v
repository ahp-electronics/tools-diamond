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
// Simulation Library File for True Dual Port Block RAM PMI
//
// Parameter Definition
//Name                        Value                             Default
/*
-------------------------------------------------------------------------
pmi_addr_depth_a            <integer>                              512
pmi_addr_width_a            <integer>                              9
pmi_data_width_a            <integer>                              18
pmi_addr_depth_b            <integer>                              512
pmi_addr_width_b            <integer>                              9
pmi_data_width_b            <integer>                              18
pmi_regmode_a             "reg"|"noreg"                           "reg"
pmi_regmode_b             "reg"|"noreg"                           "reg"
pmi_gsr                 "enable"|"disable"                      "disable"
pmi_resetmode             "async"|"sync"                          "sync"
pmi_init_file               <string>                              "none"
pmi_init_file_format      "binary"|"hex"                         "binary"
pmi_write_mode_a     "normal"|"writethrough"|"readbeforewrite"   "normal"
pmi_write_mode_b     "normal"|"writethrough"|"readbeforewrite"   "normal"
pmi_family  "EC"|"XP"|"XP2"|"SC"|"SCM"|"ECP"|"ECP2"|"ECP2M"|"XO"   "EC"
-------------------------------------------------------------------------
WARNING: Do not change the default parameters in this model. Parameter 
redefinition must be done using defparam or in-line (#) paramater 
redefinition in a top level file that instantiates this model.
  
*/
//
// $Header: /home/dmsys/pvcs/RCSMigTest/rcs/verilog/pkg/versclibs/data/pmi/RCS/pmi_ram_dp_true.v,v 1.7 2005/08/15 13:06:44 rag Exp $

`timescale 1ns/1ps
module pmi_ram_dp_true
 #(parameter pmi_addr_depth_a = 512,
   parameter pmi_addr_width_a = 9,
   parameter pmi_data_width_a = 18,
   parameter pmi_addr_depth_b = 512,
   parameter pmi_addr_width_b = 9,
   parameter pmi_data_width_b = 18,
   parameter pmi_regmode_a = "reg",
   parameter pmi_regmode_b = "reg",
   parameter pmi_gsr = "disable",
   parameter pmi_resetmode = "sync",
   parameter pmi_init_file = "none",
   parameter pmi_init_file_format = "binary",
   parameter pmi_write_mode_a = "normal",
   parameter pmi_write_mode_b = "normal",
   parameter pmi_family = "EC",
   parameter module_type = "pmi_ram_dp_true")

  
  (input [(pmi_data_width_a-1):0]	DataInA,
   input [(pmi_data_width_b-1):0]	DataInB,
   input [(pmi_addr_width_a-1):0] AddressA,
   input [(pmi_addr_width_b-1):0] AddressB,
   input  ClockA,
   input  ClockB,
   input  ClockEnA,
   input  ClockEnB,
   input  WrA,
   input  WrB,
   input  ResetA,
   input  ResetB,
   output [(pmi_data_width_a-1):0]  QA,
   output [(pmi_data_width_b-1):0]  QB)/*synthesis syn_black_box */;

//pragma translate_off
   localparam array_size_a = pmi_addr_depth_a * pmi_data_width_a;
   localparam array_size_b = pmi_addr_depth_b * pmi_data_width_b;

   reg [pmi_data_width_a-1:0] mem [(2**pmi_addr_width_a)-1:0];
     
//Define internal Signals

   reg [(pmi_data_width_a-1):0]   DataInA_reg = 0;
   reg [(pmi_data_width_b-1):0]   DataInB_reg = 0;
   reg [(pmi_addr_width_a-1):0]   AddressA_reg = 0;
   reg [(pmi_addr_width_b-1):0]   AddressB_reg = 0;
   reg 				  WrA_reg = 0;
   reg 				  WrB_reg = 0;
   
   reg [(pmi_data_width_a-1):0]   DataInA_reg_async = 0;
   reg [(pmi_data_width_b-1):0]   DataInB_reg_async = 0;
   reg [(pmi_addr_width_a-1):0]   AddressA_reg_async = 0;
   reg [(pmi_addr_width_b-1):0]   AddressB_reg_async = 0;
   reg 				  WrA_reg_async = 0;
   reg 				  WrB_reg_async = 0;
   
   reg [(pmi_data_width_a-1):0]   DataInA_reg_sync = 0;
   reg [(pmi_data_width_b-1):0]   DataInB_reg_sync = 0;
   reg [(pmi_addr_width_a-1):0]   AddressA_reg_sync = 0;
   reg [(pmi_addr_width_b-1):0]   AddressB_reg_sync = 0;
   reg 				  WrA_reg_sync = 0;
   reg 				  WrB_reg_sync = 0;

   reg [(pmi_data_width_a-1):0]   QA_rbr = 0;
   reg [(pmi_data_width_b-1):0]   QB_rbr = 0;
   
   reg [(pmi_data_width_a-1):0]   QA_int = 0;
   reg [(pmi_data_width_b-1):0]   QB_int = 0;

   reg [(pmi_data_width_a-1):0]   QA_reg = 0;
   reg [(pmi_data_width_a-1):0]   QA_reg_sync = 0;
   reg [(pmi_data_width_a-1):0]   QA_reg_async = 0;

   reg [(pmi_data_width_b-1):0]   QB_reg = 0;
   reg [(pmi_data_width_b-1):0]   QB_reg_sync = 0;
   reg [(pmi_data_width_b-1):0]   QB_reg_async = 0;

   integer 				h, i, j, k, l, m, z, j_plus_k, j_plus_k_div_a, l_plus_m, l_plus_m_div_a, j_plus_k_div_b, j_plus_k_mod_a, n, j_plus_n, j_plus_n_div_a;

   reg 					memchg = 0;
   
   reg ClockA_valid = 0;
   reg ClockB_valid = 0;

   reg [pmi_data_width_a-1:0] dummy_wa, dummy_wa2b, dummy_wa3b;
   reg [pmi_data_width_b-1:0] dummy_wb, dummy_wb3;


   reg [(pmi_data_width_a-1):0] QQA = 0;
   reg [(pmi_data_width_b-1):0] QQB = 0;
//   reg 				SRN;
 				
   assign 			QA = QQA;
   assign 			QB = QQB;
 			
   //Function to calculate log2 of depth   
 function  integer clogb2 (input integer depth);
    begin
        for(clogb2=0; depth>0;  clogb2=clogb2+1)
             depth=depth>>>1;
    end
 endfunction // clogb2					


   //Error Checks
   
   initial begin
      if(array_size_a !== array_size_b) begin
	$display("\nError! Total value of (Address Depth * Data Width) must be the same for A and B ports!");
      $stop;
      end
   end

   //Check for Address_width vs Address_depth
initial begin
   if (clogb2(pmi_addr_depth_a-1) > pmi_addr_width_a) begin
       $display("\nError! Address depth on Port A can not exceed (2**pmi_addr_width_a)!");
       $stop;
       end
end

initial begin
   if (clogb2(pmi_addr_depth_b-1) > pmi_addr_width_b) begin
       $display("\nError! Address depth on Port B can not exceed (2**pmi_addr_width_b)!");
       $stop;
       end
end

//Check if Ratio of Port A/Port B or Port B/Port A Data width is a power of 2.
//Module Manager supports 1, 2, 4, 8 and 16 only.
   

initial begin
   if (pmi_data_width_a > pmi_data_width_b)
     begin
	  if ((pmi_data_width_a / pmi_data_width_b) >16)
	    begin
	       $display("\nError! The ratio of Port A and Port B Data width values can not be greater than 16!");
	       $stop;
	    end
	  else if ( (pmi_data_width_a / pmi_data_width_b !== 2) && (pmi_data_width_a / pmi_data_width_b !== 4) && (pmi_data_width_a / pmi_data_width_b !== 8) && (pmi_data_width_a / pmi_data_width_b !== 16))
	    begin
	     $display("\nError! The ratio of Port A and Port B Data widths is: %d !", pmi_data_width_a / pmi_data_width_b);
 	     $display("Error! It must be a power of 2!");
	     $stop;
	    end
     end
   else if (pmi_data_width_a < pmi_data_width_b)
     begin
	if ((pmi_data_width_b / pmi_data_width_a) >16)
	    begin
	       $display("\nError! The ratio of Port B and Port B Data width values can not be greater than 16!");
	       $stop;
	    end
	  else if ( (pmi_data_width_b / pmi_data_width_a !== 2) && (pmi_data_width_b / pmi_data_width_a !== 4) && (pmi_data_width_b / pmi_data_width_a !== 8) && (pmi_data_width_b / pmi_data_width_a !== 16))
	    begin
	     $display("\nError! The ratio of Port B and Port A Data widths is: %d !", pmi_data_width_b / pmi_data_width_a);
 	     $display("Error! It must be a power of 2!");
	     $stop;
	    end
	end
end // initial begin

//Read-before-Write is supported for memory configurations in x9, x18, x36 datawidth. Data width should be set to match this requirement.

   initial begin
      if ((pmi_family != "SC") && (pmi_family != "SCM") && (pmi_family != "XO") && (pmi_write_mode_a == "readbeforewrite"))
	begin
	   if (pmi_data_width_a % 9 !== 0)
	     begin
		$display("\nError! Read-before-Write is supported for memory configurations in x9, x18, x36 datawidth. Data width for port A should be set to match this requirement.");
		$stop;
	     end
	end
      if ((pmi_family != "SC") && (pmi_family != "SCM") && (pmi_family != "XO") && (pmi_write_mode_b == "readbeforewrite"))
	begin
	   if (pmi_data_width_b % 9 !== 0)
	     begin
		$display("\nError! Read-before-Write is supported for memory configurations in x9, x18, x36 datawidth. Data width for port B should be set to match this requirement.");
		$stop;
	     end
	end
     end
 
//initialize the Memory. 
//X for SC, 0 for other families. 
initial begin
   if ((pmi_init_file == "none") && ((pmi_family == "SC") || (pmi_family == "SCM"))) begin
      for (h = 0; h < 2**pmi_addr_width_a; h = h+1)
      	begin
	   mem[h] = {pmi_data_width_a{1'bx}};
        end // for (h = 0; h < 2**pmi_addr_width_a; h = h+1)
      end
       else
       if ((pmi_init_file == "none") && (pmi_family != "SC") && (pmi_family != "SCM")) begin
	   for (h = 0; h < 2**pmi_addr_width_a; h = h+1) 
	   begin
	    mem[h] = {pmi_data_width_a{1'b0}};
           end // for (h = 0; h < 2**pmi_addr_width_a; h = h+1)
           end	   
       
       else if ((pmi_init_file_format == "binary") && (pmi_init_file != "none"))
       begin
       $readmemb(pmi_init_file, mem);
       end
       else
       if ((pmi_init_file_format == "hex") && (pmi_init_file != "none")) 
       begin
       $readmemh(pmi_init_file, mem);
       end
end // initial begin

/*
   not (SR1, SRN);
   or INST1 (ResetA_sig, ResetA, SR1);
   or INST2 (ResetB_sig, ResetB, SR1);
*/

  buf (ResetA_sig, ResetA);
  buf (ResetB_sig, ResetB);

/*
   always @(SR1, DataInA, AddressA, WrA, DataInB, AddressB, WrB)
     begin
	if (SR1 == 1)
	  begin
	     assign DataInA_reg = 0;
	     assign AddressA_reg = 0;
	     assign WrA_reg = 0;
	     assign DataInB_reg = 0;
	     assign AddressB_reg = 0;
	     assign WrB_reg = 0;
	     assign QA_reg = 0;
	     assign QB_reg = 0;
	  end
	else begin
	   deassign DataInA_reg;
	   deassign AddressA_reg;
	   deassign WrA_reg;
	   deassign DataInB_reg;
	   deassign AddressB_reg;
	   deassign WrB_reg;
	   deassign QA_reg;
	   deassign QB_reg;
	end // else: !if(SR1 == 1)
     end //
*/

   always @(posedge ClockA)
     begin
	if (ResetA_sig == 1)
	  ClockA_valid <=0;
	else
	  begin
	     if (ClockEnA == 1)
	       begin
	     ClockA_valid <= 1;
	     #0.010 ClockA_valid <= 0;
	       end
	  end
     end

   always @(posedge ClockB)
     begin
	if (ResetB_sig == 1)
	  ClockB_valid <=0;
	else
	  begin
	     if (ClockEnB == 1)
	       begin
	     ClockB_valid <= 1;
	     #0.010 ClockB_valid <= 0;
	       end
	  end
     end
 
//Asynchronous Reset   
   always @(posedge ClockA, posedge ResetA_sig)
     begin
	if (ResetA_sig)
	  begin
	     DataInA_reg_async <= 0;
	     AddressA_reg_async <= 0;
	     WrA_reg_async <= 0;
	     QA_reg_async <= 0;
	  end
	else
	  begin
	     if (ClockEnA == 1) 
	       begin
		  DataInA_reg_async <= DataInA;
		  AddressA_reg_async <= AddressA;
		  WrA_reg_async <= WrA;
		  QA_reg_async <= QA_int;
		end
	     
	  end // else: !if(ResetA)
     end // always @ (posedge ClockA, posedge ResetA)

   always @(posedge ClockB, posedge ResetB_sig)
     begin
	if (ResetB_sig)
	  begin
	     DataInB_reg_async <= 0;
	     AddressB_reg_async <= 0;
	     WrB_reg_async <= 0;
	     QB_reg_async <= 0;
	  end
	else
	  begin
	     if (ClockEnB == 1) 
	       begin
		  DataInB_reg_async <= DataInB;
		  AddressB_reg_async <= AddressB;
		  WrB_reg_async <= WrB;
		  QB_reg_async <= QB_int;
	       end
	     
	    end // else: !if(ResetB)
     end // always @ (posedge ClockB, posedge ResetB)
   
//Synchronous Reset   
   always @(posedge ClockA)
     begin
	if (ResetA_sig)
	  begin
	     DataInA_reg_sync <= 0;
	     AddressA_reg_sync <= 0;
	     WrA_reg_sync <= 0;
	     //QA_reg_sync <= 0;
	  end
	else
	  begin
	     if (ClockEnA == 1) 
	       begin
		  DataInA_reg_sync <= DataInA;
		  AddressA_reg_sync <= AddressA;
		  WrA_reg_sync <= WrA;
		  //QA_reg_sync <= QA_int;
		end  
	  end // else: !if(ResetA)
     end // always @ (posedge ClockA)

   always @(posedge ClockB)
     begin
	if (ResetB_sig)
	  begin
	     DataInB_reg_sync <= 0;
	     AddressB_reg_sync <= 0;
	     WrB_reg_sync <= 0;
	     //QB_reg_sync <= 0;
	  end
	else
	  begin
	     if (ClockEnB == 1) 
	       begin
		  DataInB_reg_sync <= DataInB;
		  AddressB_reg_sync <= AddressB;
		  WrB_reg_sync <= WrB;
		  //QB_reg_sync <= QB_int;
	       end
	   end // else: !if(ResetB)
     end // always @ (posedge ClockB)  

//Synchronous Reset for Data Out. ClockEn gets precedence over Reset
   always @(posedge ClockA)
     begin
	if (ClockEnA == 1)
	  begin
	     if (ResetA_sig == 1)
	       QA_reg_sync <= 0;
	     else
	       QA_reg_sync <= QA_int;
	  end
     end

   always @(posedge ClockB)
     begin
	if (ClockEnB == 1)
	  begin
	     if (ResetB_sig == 1)
	       QB_reg_sync <= 0;
	     else
	       QB_reg_sync <= QB_int;
	  end
     end

//Choice between async/sync resetmode
   
   always @(ClockA_valid, DataInA_reg_sync, AddressA_reg_sync, WrA_reg_sync, DataInA_reg_async, AddressA_reg_async, WrA_reg_async, QA_reg_async, QA_reg_sync) begin
      if (pmi_resetmode == "async")
	begin
	   DataInA_reg = DataInA_reg_async;
	   AddressA_reg = AddressA_reg_async;
	   WrA_reg = WrA_reg_async;
	   QA_reg = QA_reg_async;
	end
      else
	begin
	   DataInA_reg = DataInA_reg_sync;
	   AddressA_reg = AddressA_reg_sync;
	   WrA_reg = WrA_reg_sync;
	   QA_reg = QA_reg_sync;
	end // else: !if(pmi_resetmode == "async")
   end // always @ (DataInA_reg_sync, AddressA_reg_sync, WrA_reg_sync, DataInA_reg_async, AddressA_reg_async, WrA_reg_async)
   
   always @(ClockB_valid, DataInB_reg_sync, AddressB_reg_sync, WrB_reg_sync, DataInB_reg_async, AddressB_reg_async, WrB_reg_async, QB_reg_async, QB_reg_sync ) begin
      if (pmi_resetmode == "async")
	begin
	   DataInB_reg = DataInB_reg_async;
	   AddressB_reg = AddressB_reg_async;
	   WrB_reg = WrB_reg_async;
	   QB_reg = QB_reg_async;
	end
      else
	begin
	   DataInB_reg = DataInB_reg_sync;
	   AddressB_reg = AddressB_reg_sync;
	   WrB_reg = WrB_reg_sync;
	   QB_reg = QB_reg_sync;
	end // else: !if(pmi_resetmode == "async")
   end // always @ (DataInB_reg_sync, AddressB_reg_sync, WrB_reg_sync, DataInB_reg_async, AddressB_reg_async, WrB_reg_async)

//Write Operation

   always @(WrA_reg, WrB_reg, AddressA_reg, AddressB_reg, DataInA_reg, DataInB_reg, ClockA_valid, ClockB_valid)
     begin
	memchg = ~memchg;
	if (WrA_reg == 1 && ClockA_valid == 1) 
	  begin
	     QA_rbr = mem[AddressA_reg]; //read before write
	     mem[AddressA_reg] = DataInA_reg;
	  end // if (WrA_reg)
	
  	if (WrB_reg == 1 && ClockB_valid == 1) 
	  begin
	        //Adjustments if PortA and PortB have different Data Widths.

	        if (pmi_data_width_a == pmi_data_width_b)
		  begin
	             QB_rbr = mem[AddressB_reg]; //read before write
		     mem[AddressB_reg] = DataInB_reg;
		  end
	        else //if (pmi_data_width_a != pmi_data_width_b)
		  begin
		     j = AddressB_reg * pmi_data_width_b;

		   for (n = 0; n < pmi_data_width_b; n = n+1)
		     begin
			j_plus_n = j + n;
			j_plus_n_div_a = j_plus_n / pmi_data_width_a;
			 //l_plus_m_mod_a = l_plus_m % pmi_data_width_a;
			dummy_wa3b = mem[j_plus_n_div_a];
			dummy_wb3[n] = dummy_wa3b[j_plus_n % pmi_data_width_a];
		     end
		      QB_rbr = dummy_wb3;
  
		   for (k = 0; k < pmi_data_width_b; k = k+1)
		     begin
			j_plus_k = j + k;
			j_plus_k_div_a = j_plus_k / pmi_data_width_a;
			j_plus_k_mod_a = j_plus_k % pmi_data_width_a;
			dummy_wa = mem[j_plus_k_div_a];//??
			dummy_wa[j_plus_k % pmi_data_width_a] = DataInB_reg[k];
			mem[j_plus_k_div_a] = dummy_wa;
		     end
		end // else: if(pmi_data_width_a != pmi_data_width_b)
	
	     	
	  end // if (WrB_reg)
      
 end // always @ (posedge ClockA, WrA_reg, AddressA_reg, DataInA_reg)

//Read Operation
   
   always @(!WrA_reg, AddressA_reg, posedge ResetA, !WrB_reg, AddressB_reg, posedge ResetB, memchg, ClockA_valid, ClockB_valid, mem[AddressA_reg], mem[AddressB_reg])
     begin
	if (ResetA == 1)
	  QA_int = 0;
	  else if (ClockA_valid == 1)begin
	    if (WrA_reg == 0) begin//Normal
	         QA_int = mem[AddressA_reg];
	      	       	       
	    end
	    else
	      if (WrA_reg == 1) //Writethrough or readbeforewrite
		begin
		   if (pmi_write_mode_a == "writethrough") begin
		     QA_int = mem[AddressA_reg];
		      		      end
		   else
		     if (pmi_write_mode_a == "readbeforewrite") begin
			QA_int = QA_rbr;
		     end
		end
	  end // if (ClockA_valid == 1)
	
	if (ResetB == 1)
	  QB_int = 0;
	  else if (ClockB_valid == 1)
	    begin
	      if (pmi_data_width_a == pmi_data_width_b) 
		begin 
		 if (WrB_reg == 0) //Normal
		    QB_int = mem[AddressB_reg];
		 else
		 if (WrB_reg == 1) //Writethrough or readbeforewrite
		   begin
		   if (pmi_write_mode_b == "writethrough") 
		    QB_int = mem[AddressB_reg];
		   else
		   if (pmi_write_mode_b == "readbeforewrite")
			QB_int = QB_rbr;
		   end
		end // if (pmi_data_width_a == pmi_data_width_b)
	      else begin // if (pmi_data_width_a != pmi_data_width_b)
		 if (WrB_reg == 0) 
		   begin //Normal
		     l = AddressB_reg * pmi_data_width_b;
 
		   for (m = 0; m < pmi_data_width_b; m = m+1)
		     begin
			l_plus_m = l + m;
			l_plus_m_div_a = l_plus_m / pmi_data_width_a;
			 //l_plus_m_mod_a = l_plus_m % pmi_data_width_a;
			dummy_wa2b = mem[l_plus_m_div_a];
			dummy_wb[m] = dummy_wa2b[l_plus_m % pmi_data_width_a];
		     end
		      QB_int = dummy_wb;
		   end   
		 else
		 if (WrB_reg == 1) //Writethrough or readbeforewrite
		   begin
		   if (pmi_write_mode_b == "writethrough")
		    begin //Writhethrough
		      l = AddressB_reg * pmi_data_width_b;
 
		    for (m = 0; m < pmi_data_width_b; m = m+1)
		     begin
			l_plus_m = l + m;
			l_plus_m_div_a = l_plus_m / pmi_data_width_a;
			dummy_wa2b = mem[l_plus_m_div_a];
			dummy_wb[m] = dummy_wa2b[l_plus_m % pmi_data_width_a];
		     end
		      QB_int = dummy_wb;
		    end
		   else
		   if (pmi_write_mode_b == "readbeforewrite")
		     QB_int = QB_rbr;
		 end 
	      
	       end end

     
     end // always @ (posedge ClockA, !WrA_reg, AddressA_reg, posedge ResetA)

   //REGMODE
   always @ (QA_reg, QA_int) 
     begin
      if (pmi_regmode_a == "reg")
	QQA = QA_reg;
      else
	QQA = QA_int;
     end

      always @ (QB_reg, QB_int) 
     begin
      if (pmi_regmode_b == "reg")
	QQB = QB_reg;
      else
	QQB = QB_int;
     end

//pragma translate_on
endmodule // pmi_ram_dp_true

