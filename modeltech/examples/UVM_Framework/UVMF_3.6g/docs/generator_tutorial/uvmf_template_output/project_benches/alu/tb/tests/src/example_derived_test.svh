//----------------------------------------------------------------------
//----------------------------------------------------------------------
// Created by      : graemej
// Creation Date   : 2017 Sep 03
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
// Project         : alu Simulation Bench 
// Unit            : rdo configuration
// File            : alu_rdo.svh
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This test extends test_top and makes the following
//    changes to test_top using the UVM factory type_override:
//
//    Test scenario: 
//      This is a template test that can be used to create future tests.
//
//----------------------------------------------------------------------
//

class example_derived_test extends test_top;

  `uvm_component_utils( example_derived_test );

  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

  virtual function void build_phase(uvm_phase phase);
    // The factory override below is an example of how to replace the alu_bench_sequence_base 
    // sequence with the example_derived_test_sequence.
    alu_bench_sequence_base::type_id::set_type_override(example_derived_test_sequence::get_type());
    // Execute the build_phase of test_top AFTER all factory overrides have been created.
    super.build_phase(phase);
  endfunction

endclass

