
-- These packages are compiled in the MGC_AMS library

--======================================================================
-- Predefined attributes determining where to found the ELDO subcircuit
PACKAGE Eldo IS
  TYPE Eldo_device_kind IS (Eldo_subckt);
                        -- only subckt for the moment

  ATTRIBUTE Eldo_device : Eldo_device_kind;

  -- In addition for subcircuits
  ATTRIBUTE Eldo_subckt_name : String;
  ATTRIBUTE Eldo_file_name : String;
  ATTRIBUTE Eldo_assoc_file  : String;
  ATTRIBUTE Eldo_default_discipline  : String;
END PACKAGE Eldo;

--======================================================================
-- Common conversion functions
PACKAGE Conversion IS
  FUNCTION time2real(tt: TIME) RETURN REAL;

  FUNCTION real2time(tt: REAL) RETURN TIME;

END PACKAGE Conversion;

PACKAGE BODY Conversion IS
  FUNCTION time2real(tt: TIME) RETURN REAL IS
  BEGIN
    RETURN time'pos(tt) * 1.0e-15;
  END time2real;

  FUNCTION real2time(tt: REAL) RETURN TIME IS
  BEGIN
    RETURN tt * 1e6 us;
  END real2time;

END Conversion;


--======================================================================
-- Common license_check function
PACKAGE License_check IS
  FUNCTION check_license(id: integer) RETURN integer;
END PACKAGE License_check;



--======================================================================
-- procedures for the checkpoint facility
-- the checkpoint facility tells Eldo to save the simulation transient step
PACKAGE Checkpoint IS
  PROCEDURE checkpoint(fileBaseName : in String := ""; replace : in Boolean := true);
  ATTRIBUTE FOREIGN OF checkpoint : PROCEDURE IS "checkpoint $AMS_MODEL_TECH/MS/OS/$AMS_VCO/libADMs$AMS_SLIB_EXT";
END PACKAGE Checkpoint;

PACKAGE BODY Checkpoint IS
  PROCEDURE checkpoint(fileBaseName : in String := ""; replace : in Boolean := true) IS 
  BEGIN 
    REPORT  "ERROR: foreign subprogram checkpoint not called"; 
  END;
END;

--======================================================================
-- $table implementation
PACKAGE look_up_table_v1x IS

  -- 1-Dim tables
  TYPE interpolation1 IS (linear, spline);

  PURE FUNCTION table1a(
      y_var   : Real;                     -- abscissa
      y_array : Real_vector;              -- table of abscisses
      f_array : Real_vector;              -- table of ordinates (Y-axis)
      method  : interpolation1 := linear  -- interpolation method
  ) return Real;

  IMPURE FUNCTION table1f(
      y_var     : Real;                    -- abscissa
      file_name : String;                  -- file containing the 1-D table description
      method    : interpolation1 := linear -- interpolation method  
  ) return Real;

  -- 2-Dim tables
  TYPE interpolation2 IS (linear, x_spline, y_spline, spline);

  PURE FUNCTION table2a(
      x_var   : Real;                      -- 1st abscissa
      y_var   : Real;                      -- 2nd abscissa
      x_array : Real_vector;               -- table of 1st abscisses
      y_array : Real_vector;               -- table of 2nd abscisses
      f_array : Real_vector;               -- table of function values
      method  : interpolation2 := y_spline -- interpolation method
  ) return Real;

  IMPURE FUNCTION table2f(
      x_var     : Real;                      -- 1st abscissa
      y_var     : Real;                      -- 2nd abscissa      
      file_name : String;                    -- file containing the 2-D table description
      method    : interpolation2 := y_spline -- interpolation method  
  ) return Real;

  -- 3-Dim tables
  TYPE interpolation3 IS (linear, x_spline, y_spline, xy_spline);

  PURE FUNCTION table3a(
      w_var   : Real;                      -- 1st abscissa
      x_var   : Real;                      -- 2nd abscissa
      y_var   : Real;                      -- 3rd abscissa      
      w_array : Real_vector;               -- table of 1st abscisses
      x_array : Real_vector;               -- table of 2nd abscisses
      y_array : Real_vector;               -- table of 3rd abscisses
      f_array : Real_vector;               -- table of function values
      method  : interpolation3 := y_spline -- interpolation method
  ) return Real;

  IMPURE FUNCTION table3f(
      w_var     : Real;                      -- 1st abscissa
      x_var     : Real;                      -- 2nd abscissa
      y_var     : Real;                      -- 3rd abscissa      
      file_name : String;                    -- file containing the 3-D table description
      method    : interpolation3 := y_spline -- interpolation method
  ) return Real;
  
END PACKAGE look_up_table_v1x;

--======================================================================
-- $param implementation
-- programmable accuracy control
PACKAGE eldo_parameters is
  
  PURE FUNCTION param(paramName : String) return Real;

  -- Predefined values for TUNING parameter:
  constant TUNING_FAST     : real;
  constant TUNING_STANDARD : real;
  constant TUNING_ACCURATE : real;
  constant TUNING_HIGH     : real;
  constant TUNING_VHIGH    : real;

  -- Global accuracy control with real delay
  procedure set_global_accuracy(paramName : string ; paramValue : real ; delay : real := real'high);
  attribute FOREIGN of set_global_accuracy [string, real, real] : procedure is
     "mgc_ams_set_global_accuracy $AMS_MODEL_TECH/MS/OS/$AMS_VCO/mgc_ams_eldo_parameters$AMS_SLIB_EXT";

  -- Global accuracy control with time delay
  procedure set_global_accuracy(paramName : string ; paramValue : real ; delay : time );

  -- Reading global accuracy
  impure function get_global_accuracy(paramName : string) return real;
  attribute FOREIGN of get_global_accuracy : function is
     "mgc_ams_get_global_accuracy $AMS_MODEL_TECH/MS/OS/$AMS_VCO/mgc_ams_eldo_parameters$AMS_SLIB_EXT";

  -- Instance accuracy control with real delay
  procedure set_instance_accuracy(instancePathName : string;
                                  paramName : string;
                                  paramValue : real;
                                  recursive : boolean := false);
  attribute FOREIGN of set_instance_accuracy [string, string, real, boolean] : procedure is
     "mgc_ams_set_instance_accuracy $AMS_MODEL_TECH/MS/OS/$AMS_VCO/mgc_ams_eldo_parameters$AMS_SLIB_EXT";

  -- Reading instance accuracy
  impure function get_instance_accuracy(instancePathName : string ; paramName : string) return real;
  attribute FOREIGN of get_instance_accuracy : function is
     "mgc_ams_get_instance_accuracy $AMS_MODEL_TECH/MS/OS/$AMS_VCO/mgc_ams_eldo_parameters$AMS_SLIB_EXT";

  -- Model accuracy control
  procedure set_model_accuracy(modelName : string ; paramName : string ; paramValue : real);
  attribute FOREIGN of set_model_accuracy : procedure is
     "mgc_ams_set_model_accuracy $AMS_MODEL_TECH/MS/OS/$AMS_VCO/mgc_ams_eldo_parameters$AMS_SLIB_EXT";

END PACKAGE eldo_parameters;

library mgc_ams;
  use mgc_ams.conversion.all;
package body eldo_parameters is

  PURE FUNCTION param(paramName : String) return Real is
  begin
    report "Foreign function param not called" severity error;
    return 0.0;
  end function param;

  -- Predefined values for TUNING parameter:
  constant TUNING_FAST     : real := 1.0;
  constant TUNING_STANDARD : real := 2.0;
  constant TUNING_ACCURATE : real := 3.0;
  constant TUNING_HIGH     : real := 4.0;
  constant TUNING_VHIGH    : real := 5.0;

  -- Global accuracy control with real delay
  procedure set_global_accuracy(paramName : string ; paramValue : real ; delay : real := real'high) is
  begin
    report "Foreign procedure set_global_accuracy [string, real, real] not called" severity error;
  end procedure set_global_accuracy;

  -- Global accuracy control with time delay
  procedure set_global_accuracy(paramName : string ; paramValue : real ; delay : time) is
    variable realDelay : real;
  begin
    realDelay := time2real(delay);
    set_global_accuracy(paramName, paramValue, realDelay);
  end procedure set_global_accuracy;

  -- Reading global accuracy
  impure function get_global_accuracy(paramName : string) return real is
  begin
    report "Foreign function get_global_accuracy not called" severity error;
    return 0.0;
  end function get_global_accuracy;

  -- Instance accuracy control with real delay
  procedure set_instance_accuracy(instancePathName : string ;
                                  paramName : string ;
                                  paramValue : real ;
                                  recursive : boolean := false) is
  begin
    report "Foreign procedure set_instance_accuracy [string, string, real, boolean] not called" severity error;
  end procedure set_instance_accuracy;

  -- Reading instance accuracy
  impure function get_instance_accuracy(instancePathName : string ; paramName : string) return real is
  begin
    report "Foreign function get_instance_accuracy not called" severity error;
    return 0.0;
  end function get_instance_accuracy;

  -- Model accuracy control
  procedure set_model_accuracy(modelName : string ; paramName : string ; paramValue : real) is
  begin
    report "Foreign procedure set_model_accuracy not called" severity error;
  end procedure set_model_accuracy;

end package body eldo_parameters;

--======================================================================
-- procedures for the analog_start facility
-- the analog_start facility tells Eldo to start the simulation 
PACKAGE Analog_start IS
  PROCEDURE analog_start;
  ATTRIBUTE FOREIGN OF analog_start : PROCEDURE IS "analog_start $AMS_MODEL_TECH/MS/OS/$AMS_VCO/libADMs$AMS_SLIB_EXT";
END PACKAGE Analog_start;

PACKAGE BODY Analog_start IS
  PROCEDURE analog_start IS 
  BEGIN 
    REPORT  "ERROR: foreign subprogram analog_start not called"; 
  END;
END;

--======================================================================
-- Package aspdetect
PACKAGE ASPDETECT IS
  SIGNAL ASPDETECT : Bit := '0';
END PACKAGE ASPDETECT;
