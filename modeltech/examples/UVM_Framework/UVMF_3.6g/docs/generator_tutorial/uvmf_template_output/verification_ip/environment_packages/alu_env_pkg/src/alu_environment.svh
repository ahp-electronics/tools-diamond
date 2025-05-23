//----------------------------------------------------------------------
//----------------------------------------------------------------------
// Created by      : graemej
// Creation Date   : 2017 Sep 03
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
// Project         : alu Environment 
// Unit            : alu Environment
// File            : alu_environment.svh
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//----------------------------------------------------------------------
//



class alu_environment 
extends uvmf_environment_base #(.CONFIG_T( alu_env_configuration
                             ));

  `uvm_component_utils( alu_environment );




   typedef alu_in_agent alu_in_agent_agent_t;
   alu_in_agent_agent_t alu_in_agent;

   typedef alu_out_agent alu_out_agent_agent_t;
   alu_out_agent_agent_t alu_out_agent;


typedef alu_predictor  alu_pred_t;
alu_pred_t alu_pred;


   typedef uvmf_in_order_scoreboard #(alu_out_transaction)  alu_sb_t;
   alu_sb_t alu_sb;



// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);




  alu_in_agent = alu_in_agent_agent_t::type_id::create("alu_in_agent",this);
  alu_out_agent = alu_out_agent_agent_t::type_id::create("alu_out_agent",this);

  alu_pred = alu_pred_t::type_id::create("alu_pred",this);
  alu_pred.configuration = configuration;


  alu_sb = alu_sb_t::type_id::create("alu_sb",this);


  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

   alu_in_agent.monitored_ap.connect(alu_pred.alu_in_agent_ae);
   alu_pred.alu_sb_ap.connect(alu_sb.expected_analysis_export);
   alu_out_agent.monitored_ap.connect(alu_sb.actual_analysis_export);



  endfunction

endclass

