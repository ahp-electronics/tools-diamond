--
--
-- This is Package ENV as defined in the VHDL 2008 Language Reference Manual.
-- It will be compiled into VHDL library 'std'
--
-- Version information: @(#)env_2008.vhd
--
package ENV is
    procedure STOP (STATUS: INTEGER);
    procedure STOP;
    procedure FINISH (STATUS: INTEGER);
    procedure FINISH;
    function  RESOLUTION_LIMIT  return  DELAY_LENGTH;
end package ENV;
