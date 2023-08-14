-- --------------------------------------------------------------------
--
-- Copyright 2020 Mentor Graphics Corporation
--
-- All Rights Reserved.
--
-- THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
-- MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
--  
-- --------------------------------------------------------------------

-- VHDL Transaction API
--
-- The vsim tool's available API used for recording transactions in
-- VHDL are:
--
--    create_transaction_stream -- creates the transaction stream
--    begin_transaction -- starts a transaction
--    add_attribute -- adds attributes to an existing transaction
--    end_transaction -- ends the transaction
--    add_relation -- records relations on an exisiting transaction
--    add_color -- specifies a color for an existing transaction
--    delete_transaction -- delete an active transaction before logging
--    free_transaction -- frees the transaction handle

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;

package Transactions is
  type TrHandle is range integer'low to integer'high;
  subtype TrStream is Trhandle;
  subtype TrArray is Trhandle;
  subtype TrTransaction is Natural;
  

  -- Create a transaction stream that can be used to record transactions.
  -- The stream handle must be saved for use in other transaction API calls.
  --
  -- A handle returned by create_transaction_stream() will be non-zero
  -- unless there is an error. The error is reported to the transcript.
  --
  -- Argument
  --   Name    Type    Description
  --   streamName  string  The name of the stream to be created.
  --   streamKind  string  The kind of stream to be created.  At this
  --                       time, the kind can be any string and it is not
  --                       interpreted. It is stored in the WLF file.
  --
  function create_transaction_stream(
    streamName : in String;
    streamKind : in String
  ) return TrStream;
  attribute foreign of create_transaction_stream [String,String return TrStream] : function
    is "mtivhdl_CreateTransactionStream";
 
  function create_transaction_stream(
    streamName : in String
  ) return TrStream;
  attribute foreign of create_transaction_stream [String return TrStream] : function
    is "mtivhdl_CreateTransactionStream2";
 
  -- Begin a transaction on the specified stream. The transaction
  -- handle must be saved for use in other transaction API calls.
  -- begin_transaction is used to start all transactions. The
  -- optional fourth parameter allows you to specify a parent
  -- transaction, making the new transaction a phase transaction of the
  -- parent.
  --
  -- A handle returned by begin_transaction() will be non-zero
  -- unless there is an error. The error is reported to the transcript.
  --
  -- Arguments
  --   Name              Type     Description
  --   stream            integer  Handle to the previously created stream.
  --   transactionName   string   Name of the transaction to begin.
  --   beginTime         time     The absolute simulation time that
  --                              the transaction will begin.
  --                              Default: The current simulation time.
  --   parentTransaction integer  Handle to an existing transaction that
  --                              is the parent to the new one. The new
  --                              transaction will be a phase transaction
  --                              of the parent. Default: 0
  --
  function begin_transaction(
    stream : in TrStream;
    transactionName : in String;
    beginTime : in Time;
    parentTransaction : in TrTransaction
  ) return TrTransaction;
  attribute foreign of begin_transaction [TrStream,String,Time,TrTransaction return TrTransaction] : function
    is "mtivhdl_BeginTransactionAll";
  
  function begin_transaction(
    stream : in TrStream;
    transactionName : in String
  ) return TrTransaction;
  attribute foreign of begin_transaction  [TrStream,String return TrTransaction]: function
    is "mtivhdl_BeginTransaction2";
  
  function begin_transaction(
    stream : in TrStream;
    transactionName : in String;
    beginTime : in Time
  ) return TrTransaction;
  attribute foreign of begin_transaction  [TrStream,String,Time return TrTransaction]: function
    is "mtivhdl_BeginTransaction3";
  
  function begin_transaction(
    stream : in TrStream;
    transactionName : in String;
    parentTransaction : in TrTransaction
  ) return TrTransaction;
  attribute foreign of begin_transaction  [TrStream,String,TrTransaction return TrTransaction]: function
    is "mtivhdl_BeginTransaction4";
  
  -- End the specified transaction. Ending the transaction simply
  -- sets the end-time for the transaction and may be done only once.
  -- However, if free is not specified, the transaction handle is still
  -- valid for use in recording relations and attributes until a call to
  -- free_transaction().
  --
  -- Arguments
  --   Name         Type       Description
  --   transaction  integer    Handle to the name of the transaction
  --                           being ended.
  --   endTime      time       Optional. The absolute simulation time that
  --                           the transaction will end. Default: The current
  --                           simulation time.
  --   free         boolean    Optional. If this argument is true, the memory
  --                           allotted for this transaction will be 
  --                           freed. This is for convenience, and is
  --                           equivalent to a call to free_transaction for
  --                           this transaction. Use only when no more
  --                           attributes will be recorded for this transaction
  --                           and no relations will be made for this
  --                           transaction. Default: false - do not free memory.
  --
  procedure end_transaction(
    transaction : in TrTransaction
  );
  attribute foreign of end_transaction [TrTransaction] : procedure
    is "mtivhdl_EndTransaction1";
  
  procedure end_transaction(
    transaction : in TrTransaction; 
    endTime : in Time
  );
  attribute foreign of end_transaction [TrTransaction,Time]: procedure
    is "mtivhdl_EndTransaction2";
  
  procedure end_transaction(
    transaction : in TrTransaction; 
    endTime : in Time;
    free : in Boolean
  );
  attribute foreign of end_transaction [TrTransaction,Time,Boolean]: procedure
    is "mtivhdl_EndTransaction3";

  procedure end_transaction(
    transaction : in TrTransaction; 
    free : in Boolean
  );
  attribute foreign of end_transaction [TrTransaction,Boolean]: procedure
    is "mtivhdl_EndTransaction4";
  
  -- Delete a transaction. This call allows the memory allotted for this
  -- transaction to be freed and the transaction to never enter the permanent
  -- WLF record.  The handle will no longer be valid.
  -- Attributes can no longer be recorded for the transaction.
  -- Relations can no longer be made with the transaction.
  --
  -- Arguments
  --   Name         Type     Description
  --   transaction  integer  Handle to the transaction to be deleted.
  --  
  procedure delete_transaction(
    transaction : in TrTransaction
  );
  attribute foreign of delete_transaction: procedure
    is "mti_DeleteTransaction";

  -- Free a transaction. This call allows the memory allotted for this
  -- transaction to be freed. The handle will no longer be valid.
  -- Attributes can no longer be recorded for the transaction.
  -- Relations can no longer be made with the transaction.
  --
  -- Arguments
  --   Name         Type     Description
  --   transaction  integer  Handle to the transaction to be freed.
  --  
  procedure free_transaction(
    transaction : in TrTransaction
  );
  attribute foreign of free_transaction: procedure
    is "mti_FreeTransaction";

  -- Add an attribute to a transaction.
  -- Arguments
  --   Name          Type     Description
  --   transaction   integer  Handle for the transaction to which you are add
  --                          adding the attribute.
  --   value         object   VHDL constant, variable, signal or generic that
  --                          is the value to be used for the attribute.
  --                          Valid types: integer, real, bit, boolean,
  --                                       bit_vetor, std_logic,
  --                                       std_logic_vector
  --   attributeName string   The name of the attribut to be added to the
  --                          transaction.
  --
  procedure add_attribute(
    transaction : in TrTransaction;
    value : in Integer;
    attributeName : in String
  );
  attribute foreign of add_attribute [TrTransaction,Integer,String]: procedure
    is "mtivhdl_AddAttribute_i";

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in real;
    attributeName : in String
  );
  attribute foreign of add_attribute [TrTransaction,real,String]: procedure
    is "mtivhdl_AddAttribute_r";

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in boolean;
    attributeName : in String
  );
  attribute foreign of add_attribute [TrTransaction,boolean,String]: procedure
    is "mtivhdl_AddAttribute_i";

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in bit;
    attributeName : in String
  );
  attribute foreign of add_attribute [TrTransaction,bit,String]: procedure
    is "mtivhdl_AddAttribute_i";

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in bit_vector;
    attributeName : in String
  );
  attribute foreign of add_attribute [TrTransaction,bit_vector,String]: procedure
    is "mtivhdl_AddAttribute";

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in std_ulogic;
    attributeName : in String
  );
  attribute foreign of add_attribute [TrTransaction,std_ulogic,String]: procedure
    is "mtivhdl_AddAttribute_stdlogic";

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in std_logic_vector;
    attributeName : in String
  );
  attribute foreign of add_attribute [TrTransaction,std_logic_vector,String]: procedure
    is "mtivhdl_AddAttribute";

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in std_ulogic_vector;
    attributeName : in String
  );
  attribute foreign of add_attribute [TrTransaction,std_ulogic_vector,String]: procedure
    is "mtivhdl_AddAttribute";

  -- Add a relation from the source transaction to the target transaction
  -- Arguments
  --   Name    Type    Description
  --   sourceTransaction  integer  Handle to the source transaction for which
  --                               the relationship is to be established.
  --   targetTransaction  integer  Handle to the target transcation for which
  --                               the relationship is to be established.
  --   relationName       string   The name of the relationship
  --
  procedure add_relation(
    sourceTransaction : in TrTransaction;
    targetTransaction : in TrTransaction;
    relationName : in String
  );
  attribute foreign of add_relation: procedure
    is "mtivhdl_AddRelation";

  -- Specify a color for the indicated transaction
  -- Arguments
  --   Name          Type    Description
  --                          adding the attribute.
  --   colorName     string   The name of the color to be added to the
  --                          transaction.
  --
  procedure add_color(
    transaction : in TrTransaction;
    colorName   : in String
  );
  attribute foreign of add_color: procedure
    is "mtivhdl_AddColor";

end;

--
-- Package Body - should never really be used...
--

package body Transactions is

  function create_transaction_stream(
    streamName : in String;
    streamKind : in String
  ) return TrStream is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.create_transaction_stream not called"
    severity note;
    return 0;
  end;

  function create_transaction_stream(
    streamName : in String
  ) return TrStream is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.create_transaction_stream not called"
    severity note;
    return 0;
  end;

 
  function begin_transaction(
    stream : in TrStream;
    transactionName : in String;
    beginTime : in Time;
    parentTransaction : in TrTransaction
  ) return TrTransaction is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.begin_transaction not called"
    severity note;
    return 0;
  end;
  
  function begin_transaction(
    stream : in TrStream;
    transactionName : in String
  ) return TrTransaction is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.begin_transaction not called"
    severity note;
    return 0;
  end;
  
  function begin_transaction(
    stream : in TrStream;
    transactionName : in String;
    beginTime : in Time
  ) return TrTransaction is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.begin_transaction not called"
    severity note;
    return 0;
  end;
  
  function begin_transaction(
    stream : in TrStream;
    transactionName : in String;
    parentTransaction : in TrTransaction
  ) return TrTransaction is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.begin_transaction not called"
    severity note;
    return 0;
  end;
  
  procedure end_transaction(
    transaction : in TrTransaction
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.end_transaction not called"
    severity note;
  end;

  procedure end_transaction(
    transaction : in TrTransaction; 
    endTime : in Time
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.end_transaction not called"
    severity note;
  end;

  procedure end_transaction(
    transaction : in TrTransaction; 
    endTime : in Time;
    free : in Boolean
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.end_transaction not called"
    severity note;
  end;

  procedure end_transaction(
    transaction : in TrTransaction; 
    free : in Boolean
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.end_transaction not called"
    severity note;
  end;

  procedure delete_transaction(
    transaction : in TrTransaction
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.delete_transaction not called"
    severity note;
  end;

  procedure free_transaction(
    transaction : in TrTransaction
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.free_transaction not called"
    severity note;
  end;

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in Integer;
    attributeName : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_attribute not called"
    severity note;
  end;
  
  procedure add_attribute(
    transaction : in TrTransaction;
    value : in real;
    attributeName : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_attribute not called"
    severity note;
  end;
  

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in boolean;
    attributeName : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_attribute not called"
    severity note;
  end;
  
  procedure add_attribute(
    transaction : in TrTransaction;
    value : in bit;
    attributeName : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_attribute not called"
    severity note;
  end;
  
  procedure add_attribute(
    transaction : in TrTransaction;
    value : in bit_vector;
    attributeName : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_attribute not called"
    severity note;
  end;
  
  procedure add_attribute(
    transaction : in TrTransaction;
    value : in std_ulogic;
    attributeName : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_attribute not called"
    severity note;
  end;

  procedure add_attribute(
    transaction : in TrTransaction;
    value : in std_logic_vector;
    attributeName : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_attribute not called"
    severity note;
  end;
  
  procedure add_attribute(
    transaction : in TrTransaction;
    value : in std_ulogic_vector;
    attributeName : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_attribute not called"
    severity note;
  end;
  
  procedure add_relation(
    sourceTransaction : in TrTransaction;
    targetTransaction : in TrTransaction;
    relationName : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_relation not called"
    severity note;
  end;

  procedure add_color(
    transaction : in TrTransaction;
    colorName   : in String
  ) is
  begin
    assert false
    report "ERROR: builtin procedure modelsim_lib.Transactions.add_color not called"
    severity note;
  end;

end;
