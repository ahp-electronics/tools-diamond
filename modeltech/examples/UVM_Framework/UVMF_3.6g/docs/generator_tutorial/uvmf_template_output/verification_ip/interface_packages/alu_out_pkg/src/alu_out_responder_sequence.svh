//----------------------------------------------------------------------
//----------------------------------------------------------------------
// Created by      : graemej
// Creation Date   : 2017 Sep 03
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
// Project         : alu_out responder sequence
// Unit            : Interface UVM Responder
// File            : alu_out_responder_sequence.svh
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
// ****************************************************************************
// ****************************************************************************
//----------------------------------------------------------------------
//
class alu_out_responder_sequence  #(
      int ALU_OUT_RESULT_WIDTH = 16     )
extends alu_out_sequence_base  #(
          .ALU_OUT_RESULT_WIDTH(ALU_OUT_RESULT_WIDTH)       ) ;

  `uvm_object_param_utils( alu_out_responder_sequence #(    ALU_OUT_RESULT_WIDTH          ))

  function new(string name = "alu_out_responder_sequence");
    super.new(name);
  endfunction

  task body();
    req=alu_out_transaction #(      .ALU_OUT_RESULT_WIDTH(ALU_OUT_RESULT_WIDTH)            ) ::type_id::create("req");
    forever begin
      start_item(req);
      finish_item(req);
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("RESPSEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
    end
  endtask

endclass
