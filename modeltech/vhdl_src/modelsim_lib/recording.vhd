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
--
-- VHDL Recording API
--
--
--
-- The vsim tool's available API used for recording qwavedb objects in
-- VHDL are:
--
--    qwavedb_dumpvars              -- record objects in the qwave db
--    qwavedb_dumpvars_from_file    -- specify file from which to get object list
--    qwavedb_dumpvars_filename     -- specify the file into which to record
--    qwavedb_dumpvars_exclude      -- specify object to exclude from recording
--    qwavedb_dumpvars_on           -- start recording
--    qwavedb_dumpvars_off          -- suspend recording
--    qwavedb_dumpvars_flush        -- flush recording data from memory to file
--    qwavedb_dumpvars_buffer       -- specify the memory buffer size

package Recording is

  -- Enable qwave recording
  --
  -- Argument
  --   Name        Type    Description
  --   Depth       integer Specifies how many hierarchy levels deep to record
  --                       signals.  Zero means all levels, so
  --                       qwavedb_dumpvars(0); is the same as
  --                       qwavedb_dumpvars;
  --   Object      string  The name of a signal or module to record
  --                       Only the signal or module will be recorded
  --
  procedure qwavedb_dumpvars ;
  attribute foreign of qwavedb_dumpvars :
    procedure is "mti_QwavedbDumpvars";

  procedure qwavedb_dumpvars(Depth : in integer);
  attribute foreign of qwavedb_dumpvars [integer] :
    procedure is "mti_QwavedbDumpvars1";

  procedure qwavedb_dumpvars(
    Depth : in integer;
    Object : in string 
  );
  attribute foreign of qwavedb_dumpvars [integer,string] :
    procedure is "mti_QwavedbDumpvars2";

  procedure qwavedb_dumpvars(Object : in string);
  attribute foreign of qwavedb_dumpvars [string] :
    procedure is "mti_QwavedbDumpvars3";


  -- Enable qwave recording, get dumpvar information from a file
  --
  -- Argument
  --   Name        Type    Description
  --   FromFile    string  The name of the file from which to get object list
  --   Script      string  Optional.  A script to translate foreign FromFile to
  --                       the formate expected by QWave.
  --   ToFile      string  Optional.  The name of the output file for the
  --                       translation script.
  procedure qwavedb_dumpvars_from_file(FromFile : in string);
  attribute foreign of qwavedb_dumpvars_from_file [string] :
    procedure is "mti_QwavedbDumpvarsFromFile";

  procedure qwavedb_dumpvars_from_file(FromFile : in string;
                                       Script   : in string);
  attribute foreign of qwavedb_dumpvars_from_file [string,string] :
    procedure is "mti_QwavedbDumpvarsFromFile1";

  procedure qwavedb_dumpvars_from_file(FromFile : in string;
                                       Script   : in string;
                                       ToFile   : in string);
  attribute foreign of qwavedb_dumpvars_from_file [string,string,string] :
    procedure is "mti_QwavedbDumpvarsFromFile2";



  -- Specify the name of the file into which to record
  --
  -- Argument
  --   Name        Type    Description
  --   WaveFile    string  The name of the file into which to record
  --
  procedure qwavedb_dumpvars_filename(WaveFile : in string);
  attribute foreign of qwavedb_dumpvars_filename [string] :
    procedure is "mti_QwavedbDumpvarsFileName";


  -- Specify objects which should be excluded from recording
  --
  -- Argument
  --   Name        Type    Description
  --   ExcludeName string  The name of the object which to exclude
  --
  procedure qwavedb_dumpvars_exclude(ExcludeName : in string);
  attribute foreign of qwavedb_dumpvars_exclude [string] :
    procedure is "mti_QwavedbDumpvarsExclude";

  -- Turn on recording
  --
  -- No Arguments
  --
  procedure qwavedb_dumpvars_on;
  attribute foreign of qwavedb_dumpvars_on :
    procedure is "mti_QwavedbDumpvarsOn";

  -- Turn off recording
  --
  -- No Arguments
  --
  procedure qwavedb_dumpvars_off;
  attribute foreign of qwavedb_dumpvars_off :
    procedure is "mti_QwavedbDumpvarsOff";

  -- Flush all events in memory to the wave file
  --
  -- No Arguments
  --
  procedure qwavedb_dumpvars_flush;
  attribute foreign of qwavedb_dumpvars_flush :
    procedure is "mti_QwavedbDumpvarsFlush";

  -- Reset the size of the memory buffer used to store wave information prior to
  -- writing to a file
  --
  -- Argument
  --   Name        Type    Description
  --   BufferSize  integer The new size of the waveform in memory buffer
  --
  procedure qwavedb_dumpvars_buffer(BufferSize : in integer);
  attribute foreign of qwavedb_dumpvars_buffer [integer] :
    procedure is "mti_QwavedbDumpvarsBuffer";

end;

--
-- Package Body - should never really be used...
--

package body Recording is

  procedure qwavedb_dumpvars is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars not called"
    severity note;
  end;

  procedure qwavedb_dumpvars(
    Depth : in integer
  ) is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars not called"
    severity note;
  end;

  procedure qwavedb_dumpvars(
    Depth : in integer;
    Object : in string
  ) is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars not called"
    severity note;
  end;

  procedure qwavedb_dumpvars(
    Object : in string
  ) is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars not called"
    severity note;
  end;

  procedure qwavedb_dumpvars_from_file(
    FromFile : in string
  ) is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars_from_file not called"
    severity note;
  end;

  procedure qwavedb_dumpvars_from_file(
    FromFile : in string;
    Script   : in string
  ) is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars_from_file not called"
    severity note;
  end;

  procedure qwavedb_dumpvars_from_file(
    FromFile : in string;
    Script   : in string;
    ToFile   : in string
  ) is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars_from_file not called"
    severity note;
  end;

  procedure qwavedb_dumpvars_filename(
    WaveFile : in string
  ) is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars_filename not called"
    severity note;
  end;

  procedure qwavedb_dumpvars_exclude(
    ExcludeName : in string
  ) is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars_exclude not called"
    severity note;
  end;

  procedure qwavedb_dumpvars_on is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars_on not called"
    severity note;
  end;

  procedure qwavedb_dumpvars_off is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars_off not called"
    severity note;
  end;

  procedure qwavedb_dumpvars_flush is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars_flush not called"
    severity note;
  end;

  procedure qwavedb_dumpvars_buffer(
    BufferSize : in integer
  ) is
  begin
    assert false
    report "ERROR: builtin procedure " &
           "modelsim_lib.Recording.qwavedb_dumpvars_buffer not called"
    severity note;
  end;

end;
