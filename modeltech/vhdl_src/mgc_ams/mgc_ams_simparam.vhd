package simparam is
   -- integer parameter
   impure function simparam(param_name : string ; default_value : integer := 0) return integer;
   attribute FOREIGN of simparam [string, integer return integer]: function is "mgc_ams_simparam_integer $AMS_MODEL_TECH/MS/OS/$AMS_VCO/simparam$AMS_SLIB_EXT";
   -- real parameter
   impure function simparam(param_name : string ; default_value : real := 0.0) return real;
   attribute FOREIGN of simparam [string, real return real] : function is "mgc_ams_simparam_real $AMS_MODEL_TECH/MS/OS/$AMS_VCO/simparam$AMS_SLIB_EXT";
   -- string parameter
   impure function simparam(param_name : string ; default_value : string := "<undefined>") return string;
   -- Note: string parameter is not supported from VHDL
end package simparam;

package body simparam is
   -- integer parameter
   impure function simparam(param_name : string ; default_value : integer := 0) return integer is
   begin
      report "Foreign function simparam [string, integer return integer] not called" severity error;
      return default_value;
   end function simparam;
   -- real parameter
   impure function simparam(param_name : string ; default_value : real := 0.0) return real is
   begin
      report "Foreign function simparam [string, real return real] not called" severity error;
      return default_value;
   end function simparam;
   -- string parameter
   impure function simparam(param_name : string ; default_value : string := "<undefined>") return string is
   begin
      report "Calling mgc_ams.simparam[string, string return string] is not supported from VHDL" severity error;
      return default_value;
   end function simparam;
end package body simparam;
