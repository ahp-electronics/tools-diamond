//============================================================================
// @(#) $Id: sv2sc2sv_xl_gp_converter_loopback_dual_ports.sv 1777 2018-01-06 04:54:00Z jstickle $
//============================================================================

   //_______________________
  // Mentor Graphics, Corp. \_________________________________________________
 //                                                                         //
//   (C) Copyright, Mentor Graphics, Corp. 2003-2014                        //
//   All Rights Reserved                                                    //
//                                                                          //
//    Licensed under the Apache License, Version 2.0 (the                   //
//    "License"); you may not use this file except in                       //
//    compliance with the License.  You may obtain a copy of                //
//    the License at                                                        //
//                                                                          //
//        http://www.apache.org/licenses/LICENSE-2.0                        //
//                                                                          //
//    Unless required by applicable law or agreed to in                     //
//    writing, software distributed under the License is                    //
//    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR                //
//    CONDITIONS OF ANY KIND, either express or implied.  See               //
//    the License for the specific language governing                      //
//    permissions and limitations under the License.                      //
//-----------------------------------------------------------------------//

//-----------------------------------------------------------------------------
// Title: UVMC Connection Example - UVMC-based SV to SC to SV
//-----------------------------------------------------------------------------

import uvm_pkg::*; 
import uvmc_pkg::*;

`include "producer_loopback_dual_ports.svh"

module sv_main;

  producer prod = new("prod");

  initial begin

    uvmc_tlm #(uvm_tlm_generic_payload,
        uvm_tlm_phase_e, uvmc_xl_tlm_gp_converter) ::connect(prod.out, "42");
    uvmc_tlm #(uvm_tlm_generic_payload,
        uvm_tlm_phase_e, uvmc_xl_tlm_gp_converter) ::connect(
            prod.out_config, "out_config");

    uvmc_tlm #(uvm_tlm_generic_payload,
        uvm_tlm_phase_e, uvmc_xl_tlm_gp_converter) ::connect(
            prod.in_write.in, "43write" );
    uvmc_tlm #(uvm_tlm_generic_payload,
        uvm_tlm_phase_e, uvmc_xl_tlm_gp_converter) ::connect(
            prod.in_read.in, "43read" );
    uvmc_tlm #(uvm_tlm_generic_payload,
        uvm_tlm_phase_e, uvmc_xl_tlm_gp_converter) ::connect(
            prod.in_config, "in_config" );

    run_test();
  end

endmodule
