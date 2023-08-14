package ENV is

	procedure STOP (STATUS: INTEGER);
	procedure STOP;

	procedure FINISH (STATUS: INTEGER);
	procedure FINISH;

	function RESOLUTION_LIMIT return DELAY_LENGTH;

end package ENV;

--   There is no true source-code package body for env
--   since the implementation is within the simulator.
package body env is

  -- For both STOP and FINISH the STATUS values are those used
  -- in the Verilog $finish task
  -- 0 prints nothing (same for no-argument versions of these)
  -- 1 prints simulation time and location
  -- 2 prints simulation time, location, and statistics about
  --   the memory and CPU times used in simulation

  -- Other STATUS values are interpreted as 0.

  procedure STOP (STATUS : INTEGER) is
  begin
    assert false
    report "ERROR: builtin subprogram STOP not called"
    severity note;
  end;

  procedure STOP is
  begin
    assert false
    report "ERROR: builtin subprogram STOP not called"
    severity note;
  end;

  procedure FINISH (STATUS : INTEGER) is
  begin
    assert false
    report "ERROR: builtin subprogram FINISH not called"
    severity note;
  end;
   
  procedure FINISH is
  begin
    assert false
    report "ERROR: builtin subprogram FINISH not called"
    severity note;
  end;
   
  function RESOLUTION_LIMIT return delay_length is
  begin
    assert false 
    report "ERROR: builtin function RESOLUTION_LIMIT not called" 
    severity note;
    return 0 hr;
  end;     
  

end env;

