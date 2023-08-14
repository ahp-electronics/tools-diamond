-- --------------------------------------------------------------------
--
-- Copyright © 2008 by IEEE.
--
-- This source file is an essential part of IEEE Std 1076-2008,
-- IEEE Standard VHDL Language Reference Manual. Verbatim copies of this 
-- source file may be used and distributed without restriction. 
-- Modifications to this source file as permitted in IEEE Std 1076-2008
-- may also be made and distributed. All other uses require permission 
-- from the IEEE Standards Department(stds-ipr@ieee.org). 
-- All other rights reserved.
--
-- This source file is provided on an AS IS basis. The IEEE disclaims ANY 
-- WARRANTY EXPRESS OR IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY 
-- AND FITNESS FOR USE FOR A PARTICULAR PURPOSE. The user of the source file 
-- shall indemnify and hold IEEE harmless from any damages or liability 
-- arising out of the use thereof.
--
--   Title     :  Floating-point package (Generic package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  Accellera VHDL-TC and IEEE P1076 Working Group
--             :
--   Purpose   :  This packages defines basic binary floating point
--             :  arithmetic functions
--             :
--   Note      :  This package may be modified to include additional data
--             :  required by tools, but it must in no way change the
--             :  external interfaces or simulation behavior of the
--             :  description. It is permissible to add comments and/or
--             :  attributes to the package declarations, but not to change
--             :  or delete any original lines of the package declaration.
--             :  The package body may be changed only in accordance with
--             :  the terms of Clause 16 of this standard.
--             :
-- --------------------------------------------------------------------
-- $Revision: 1220 $
-- $Date: 2008-04-10 17:16:09 +0930 (Thu, 10 Apr 2008) $
-- --------------------------------------------------------------------

use STD.TEXTIO.all;
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.fixed_float_types.all;

package float_generic_pkg is
  generic (
    -- Defaults for sizing routines, when you do a "to_float" this will be
    -- the default size.  Example float32 would be 8 and 23 (8 downto -23)
    float_exponent_width : NATURAL    := 8;
    float_fraction_width : NATURAL    := 23;
    -- Rounding algorithm, "round_nearest" is default, other valid values
    -- are "round_zero" (truncation), "round_inf" (round up), and
    -- "round_neginf" (round down)
    float_round_style    : round_type := round_nearest;
    -- Denormal numbers (very small numbers near zero) true or false
    float_denormalize    : BOOLEAN    := true;
    -- Turns on NAN processing (invalid numbers and overflow) true of false
    float_check_error    : BOOLEAN    := true;
    -- Guard bits are added to the bottom of every operation for rounding.
    -- any natural number (including 0) are valid.
    float_guard_bits     : NATURAL    := 3;
    -- If TRUE, then turn off warnings on "X" propagation
    no_warning           : BOOLEAN    := false;
    package fixed_pkg is new IEEE.fixed_generic_pkg
                           generic map (<>) );

  -- Author David Bishop (dbishop@vhdl.org)
  constant CopyRightNotice : STRING :=
    "Copyright 2008 by IEEE. All rights reserved.";

  use fixed_pkg.all;

  attribute builtin_subprogram: string;
  -- Note that this is "INTEGER range <>", thus if you use a literal, then the
  -- default range will be (INTEGER'low to INTEGER'low + X)
  type UNRESOLVED_float is array (INTEGER range <>) of STD_ULOGIC;  -- main type
  alias U_float is UNRESOLVED_float;

  subtype float is (resolved) UNRESOLVED_float;
  -----------------------------------------------------------------------------
  -- Use the float type to define your own floating point numbers.
  -- There must be a negative index or the packages will error out.
  -- Minimum supported is "subtype float7 is float (3 downto -3);"
  -- "subtype float16 is float (6 downto -9);" is probably the smallest
  -- practical one to use.
  -----------------------------------------------------------------------------

  -- IEEE 754 single precision
  subtype UNRESOLVED_float32 is UNRESOLVED_float (8 downto -23);
  alias U_float32 is UNRESOLVED_float32;
  subtype float32 is float (8 downto -23);
  -----------------------------------------------------------------------------
  -- IEEE-754 single precision floating point.  This is a "float"
  -- in C, and a FLOAT in Fortran.  The exponent is 8 bits wide, and
  -- the fraction is 23 bits wide.  This format can hold roughly 7 decimal
  -- digits.  Infinity is 2**127 = 1.7E38 in this number system.
  -- The bit representation is as follows:
  -- 1 09876543 21098765432109876543210
  -- 8 76543210 12345678901234567890123
  -- 0 00000000 00000000000000000000000
  -- 8 7      0 -1                  -23
  -- +/-   exp.  fraction
  -----------------------------------------------------------------------------

  -- IEEE 754 double precision
  subtype UNRESOLVED_float64 is UNRESOLVED_float (11 downto -52);
  alias U_float64 is UNRESOLVED_float64;
  subtype float64 is float (11 downto -52);
  -----------------------------------------------------------------------------
  -- IEEE-754 double precision floating point.  This is a "double float"
  -- in C, and a FLOAT*8 in Fortran.  The exponent is 11 bits wide, and
  -- the fraction is 52 bits wide.  This format can hold roughly 15 decimal
  -- digits.  Infinity is 2**2047 in this number system.
  -- The bit representation is as follows:
  --  3 21098765432 1098765432109876543210987654321098765432109876543210
  --  1 09876543210 1234567890123456789012345678901234567890123456789012
  --  S EEEEEEEEEEE FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
  -- 11 10        0 -1                                               -52
  -- +/-  exponent    fraction
  -----------------------------------------------------------------------------

  -- IEEE 854 & C extended precision
  subtype UNRESOLVED_float128 is UNRESOLVED_float (15 downto -112);
  alias U_float128 is UNRESOLVED_float128;
  subtype float128 is float (15 downto -112);
  -----------------------------------------------------------------------------
  -- The 128 bit floating point number is "long double" in C (on
  -- some systems this is a 70 bit floating point number) and FLOAT*32
  -- in Fortran.  The exponent is 15 bits wide and the fraction is 112
  -- bits wide. This number can handle approximately 33 decimal digits.
  -- Infinity is 2**32,767 in this number system.
  -----------------------------------------------------------------------------

  -- purpose: Checks for a valid floating point number
  type valid_fpstate is (nan,           -- Signaling NaN (C FP_NAN)
                         quiet_nan,     -- Quiet NaN (C FP_NAN)
                         neg_inf,       -- Negative infinity (C FP_INFINITE)
                         neg_normal,    -- negative normalized nonzero
                         neg_denormal,  -- negative denormalized (FP_SUBNORMAL)
                         neg_zero,      -- -0 (C FP_ZERO)
                         pos_zero,      -- +0 (C FP_ZERO)
                         pos_denormal,  -- Positive denormalized (FP_SUBNORMAL)
                         pos_normal,    -- positive normalized nonzero
                         pos_inf,       -- positive infinity
                         isx);          -- at least one input is unknown

  -- This deferred constant will tell you if the package body is synthesizable
  -- or implemented as real numbers.
  constant fphdlsynth_or_real : BOOLEAN;  -- deferred constant

  -- Returns the class which X falls into
  function Classfp (
    x           : UNRESOLVED_float;              -- floating point input
    check_error : BOOLEAN := float_check_error)  -- check for errors
    return valid_fpstate;
   attribute builtin_subprogram of
        CLASSFP[UNRESOLVED_float, BOOLEAN return valid_fpstate]: function is "floatlib_classfp";

  -- Arithmetic functions, these operators do not require parameters.
  function "abs" (arg : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "ABS"[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_abs_ff";
  function "-"   (arg : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "-"[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_unary_minus_ff";

  -- These allows the base math functions to use the default values
  -- of their parameters.  Thus they do full IEEE floating point.

  function "+"   (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "+"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_plus_fff";
  function "-"   (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "-"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_minus_fff";
  function "*"   (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "*"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_mult_fff";
  function "/"   (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "/"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_div_fff";
  function "rem" (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "REM"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_rem_fff";
  function "mod" (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "MOD"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_mod_fff";

  -- Basic parameter list
  -- round_style - Selects the rounding algorithm to use
  -- guard - extra bits added to the end if the operation to add precision
  -- check_error - When "false" turns off NAN and overflow checks
  -- denormalize - When "false" turns off denormal number processing

  function add (
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  ADD[UNRESOLVED_float, UNRESOLVED_float, round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_add_var_args";

  function subtract (
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  SUBTRACT[UNRESOLVED_float, UNRESOLVED_float, round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_subtract_var_args";

  function multiply (
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  MULTIPLY[UNRESOLVED_float, UNRESOLVED_float, round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_multiply_var_args";

  function divide (
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  DIVIDE[UNRESOLVED_float, UNRESOLVED_float, round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_divide_var_args";

  function remainder (
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  REMAINDER[UNRESOLVED_float, UNRESOLVED_float, round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_remainder_var_args";

  function modulo (
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  MODULO[UNRESOLVED_float, UNRESOLVED_float, round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_modulo_var_args";

  -- reciprocal
  function reciprocal (
    arg                  : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  RECIPROCAL[UNRESOLVED_float, round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_reciprocal_var_args";

  function dividebyp2 (
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  DIVIDEBYP2[UNRESOLVED_float, UNRESOLVED_float, round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_dividebyp2_var_args";

  -- Multiply accumulate  result = l*r + c
  function mac (
    l, r, c              : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant guard       : NATURAL    := float_guard_bits;  -- number of guard bits
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  MAC[UNRESOLVED_float, UNRESOLVED_float, UNRESOLVED_float,  round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_mac_var_args";

  -- Square root (all 754 based implementations need this)
  function sqrt (
    arg                  : UNRESOLVED_float;       -- floating point input
    constant round_style : round_type := float_round_style;
    constant guard       : NATURAL    := float_guard_bits;
    constant check_error : BOOLEAN    := float_check_error;
    constant denormalize : BOOLEAN    := float_denormalize)
    return UNRESOLVED_float;
	attribute builtin_subprogram of  SQRT[UNRESOLVED_float, round_type, NATURAL, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_sqrt_var_args";

  function Is_Negative (arg : UNRESOLVED_float) return BOOLEAN;
  attribute builtin_subprogram of  IS_NEGATIVE[UNRESOLVED_float  return BOOLEAN] : function is "floatlib_is_negative";


  -----------------------------------------------------------------------------
  -- compare functions
  -- =, /=, >=, <=, <, >, maximum, minimum

  function eq (                               -- equal =
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant check_error : BOOLEAN := float_check_error;
    constant denormalize : BOOLEAN := float_denormalize)
    return BOOLEAN;
	attribute builtin_subprogram of  EQ[UNRESOLVED_float, UNRESOLVED_float, BOOLEAN, BOOLEAN  return BOOLEAN] : function is "floatlib_is_eq_var_args";

  function ne (                               -- not equal /=
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant check_error : BOOLEAN := float_check_error;
    constant denormalize : BOOLEAN := float_denormalize)
    return BOOLEAN;
	attribute builtin_subprogram of  NE[UNRESOLVED_float, UNRESOLVED_float, BOOLEAN, BOOLEAN  return BOOLEAN] : function is "floatlib_is_ne_var_args";

  function lt (                               -- less than <
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant check_error : BOOLEAN := float_check_error;
    constant denormalize : BOOLEAN := float_denormalize)
    return BOOLEAN;
	attribute builtin_subprogram of  LT[UNRESOLVED_float, UNRESOLVED_float, BOOLEAN, BOOLEAN  return BOOLEAN] : function is "floatlib_is_lt_var_args";

  function gt (                               -- greater than >
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant check_error : BOOLEAN := float_check_error;
    constant denormalize : BOOLEAN := float_denormalize)
    return BOOLEAN;
	attribute builtin_subprogram of  GT[UNRESOLVED_float, UNRESOLVED_float, BOOLEAN, BOOLEAN  return BOOLEAN] : function is "floatlib_is_gt_var_args";

  function le (                               -- less than or equal to <=
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant check_error : BOOLEAN := float_check_error;
    constant denormalize : BOOLEAN := float_denormalize)
    return BOOLEAN;
	attribute builtin_subprogram of  LE[UNRESOLVED_float, UNRESOLVED_float, BOOLEAN, BOOLEAN  return BOOLEAN] : function is "floatlib_is_le_var_args";

  function ge (                               -- greater than or equal to >=
    l, r                 : UNRESOLVED_float;  -- floating point input
    constant check_error : BOOLEAN := float_check_error;
    constant denormalize : BOOLEAN := float_denormalize)
    return BOOLEAN;
	attribute builtin_subprogram of  GE[UNRESOLVED_float, UNRESOLVED_float, BOOLEAN, BOOLEAN  return BOOLEAN] : function is "floatlib_is_ge_var_args";

  -- Need to overload the default versions of these
  function "="  (l, r : UNRESOLVED_float) return BOOLEAN;
	attribute builtin_subprogram of  "="[UNRESOLVED_float, UNRESOLVED_float  return BOOLEAN] : function is "floatlib_is_eq_ffb";
  function "/=" (l, r : UNRESOLVED_float) return BOOLEAN;
	attribute builtin_subprogram of  "/="[UNRESOLVED_float, UNRESOLVED_float  return BOOLEAN] : function is "floatlib_is_ne_ffb";
  function ">=" (l, r : UNRESOLVED_float) return BOOLEAN;
	attribute builtin_subprogram of  ">="[UNRESOLVED_float, UNRESOLVED_float  return BOOLEAN] : function is "floatlib_is_ge_ffb";
  function "<=" (l, r : UNRESOLVED_float) return BOOLEAN;
	attribute builtin_subprogram of  "<="[UNRESOLVED_float, UNRESOLVED_float  return BOOLEAN] : function is "floatlib_is_le_ffb";
  function ">"  (l, r : UNRESOLVED_float) return BOOLEAN;
	attribute builtin_subprogram of  ">"[UNRESOLVED_float, UNRESOLVED_float  return BOOLEAN] : function is "floatlib_is_gt_ffb";
  function "<"  (l, r : UNRESOLVED_float) return BOOLEAN;
	attribute builtin_subprogram of  "<"[UNRESOLVED_float, UNRESOLVED_float  return BOOLEAN] : function is "floatlib_is_lt_ffb";

  function "?="  (l, r : UNRESOLVED_float) return STD_ULOGIC;
	attribute builtin_subprogram of  "?="[UNRESOLVED_float, UNRESOLVED_float  return STD_ULOGIC] : function is "floatlib_is_eq_ffs";
  function "?/=" (l, r : UNRESOLVED_float) return STD_ULOGIC;
	attribute builtin_subprogram of  "?/="[UNRESOLVED_float, UNRESOLVED_float  return STD_ULOGIC] : function is "floatlib_is_neq_ffs";
  function "?>"  (l, r : UNRESOLVED_float) return STD_ULOGIC;
	attribute builtin_subprogram of  "?>"[UNRESOLVED_float, UNRESOLVED_float  return STD_ULOGIC] : function is "floatlib_is_gt_ffs";
  function "?>=" (l, r : UNRESOLVED_float) return STD_ULOGIC;
	attribute builtin_subprogram of  "?>="[UNRESOLVED_float, UNRESOLVED_float  return STD_ULOGIC] : function is "floatlib_is_ge_ffs";
  function "?<"  (l, r : UNRESOLVED_float) return STD_ULOGIC;
	attribute builtin_subprogram of  "?<"[UNRESOLVED_float, UNRESOLVED_float  return STD_ULOGIC] : function is "floatlib_is_lt_ffs";
  function "?<=" (l, r : UNRESOLVED_float) return STD_ULOGIC;
	attribute builtin_subprogram of  "?<="[UNRESOLVED_float, UNRESOLVED_float  return STD_ULOGIC] : function is "floatlib_is_le_ffs";

  function std_match (l, r : UNRESOLVED_float) return BOOLEAN;
    attribute builtin_subprogram of
        STD_MATCH[UNRESOLVED_float, UNRESOLVED_float  return BOOLEAN]: function is "floatlib_std_match";
  	
  function find_rightmost (arg : UNRESOLVED_float; y : STD_ULOGIC) return INTEGER;
	attribute builtin_subprogram of  FIND_RIGHTMOST[UNRESOLVED_float, STD_ULOGIC  return INTEGER] : function is "floatlib_find_rightmost";
  function find_leftmost (arg : UNRESOLVED_float; y : STD_ULOGIC) return INTEGER;
	attribute builtin_subprogram of  FIND_LEFTMOST[UNRESOLVED_float, STD_ULOGIC  return INTEGER] : function is "floatlib_find_leftmost";

  function maximum (l, r : UNRESOLVED_float) return UNRESOLVED_float;
	attribute builtin_subprogram of  MAXIMUM[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float] : function is "floatlib_maximum_fff";
  function minimum (l, r : UNRESOLVED_float) return UNRESOLVED_float;
	attribute builtin_subprogram of  MINIMUM[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float] : function is "floatlib_minimum_fff";

  -- conversion functions
  -- Converts one floating point number into another.

  function resize (
    arg                     : UNRESOLVED_float;  -- Floating point input
    constant exponent_width : NATURAL    := float_exponent_width;  -- length of FP output exponent
    constant fraction_width : NATURAL    := float_fraction_width;  -- length of FP output fraction
    constant round_style    : round_type := float_round_style;  -- rounding option
    constant check_error    : BOOLEAN    := float_check_error;
    constant denormalize_in : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP
    constant denormalize    : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  RESIZE[UNRESOLVED_float, NATURAL, NATURAL, round_type,  BOOLEAN, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_resize_var_args_width";

  function resize (
    arg                     : UNRESOLVED_float;  -- Floating point input
    size_res                : UNRESOLVED_float;
    constant round_style    : round_type := float_round_style;  -- rounding option
    constant check_error    : BOOLEAN    := float_check_error;
    constant denormalize_in : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP
    constant denormalize    : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  RESIZE[UNRESOLVED_float, UNRESOLVED_float, round_type,  BOOLEAN, BOOLEAN, BOOLEAN  return UNRESOLVED_float] : function is "floatlib_resize_var_args_size";

  function to_float32 (
    arg                     : UNRESOLVED_float;
    constant round_style    : round_type := float_round_style;  -- rounding option
    constant check_error    : BOOLEAN    := float_check_error;
    constant denormalize_in : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP
    constant denormalize    : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float32;
	attribute builtin_subprogram of  TO_FLOAT32[UNRESOLVED_float, round_type,  BOOLEAN, BOOLEAN, BOOLEAN  return UNRESOLVED_float32] : function is "floatlib_to_float32_var_args";

  function to_float64 (
    arg                     : UNRESOLVED_float;
    constant round_style    : round_type := float_round_style;  -- rounding option
    constant check_error    : BOOLEAN    := float_check_error;
    constant denormalize_in : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP
    constant denormalize    : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float64;
	attribute builtin_subprogram of  TO_FLOAT64[UNRESOLVED_float, round_type,  BOOLEAN, BOOLEAN, BOOLEAN  return UNRESOLVED_float64] : function is "floatlib_to_float64_var_args";

  function to_float128 (
    arg                     : UNRESOLVED_float;
    constant round_style    : round_type := float_round_style;  -- rounding option
    constant check_error    : BOOLEAN    := float_check_error;
    constant denormalize_in : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP
    constant denormalize    : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float128;
	attribute builtin_subprogram of  TO_FLOAT128[UNRESOLVED_float, round_type,  BOOLEAN, BOOLEAN, BOOLEAN  return UNRESOLVED_float128] : function is "floatlib_to_float128_var_args";

  -- Converts an fp into an SLV (needed for synthesis)
  function to_slv (arg : UNRESOLVED_float) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        TO_SLV[UNRESOLVED_float return STD_LOGIC_VECTOR]: function is "floatlib_to_slv_fx";

  alias to_StdLogicVector is to_slv [UNRESOLVED_float return STD_LOGIC_VECTOR];
  alias to_Std_Logic_Vector is to_slv [UNRESOLVED_float return STD_LOGIC_VECTOR];

  -- Converts an fp into an std_ulogic_vector (sulv)
  function to_sulv (arg : UNRESOLVED_float) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        TO_SULV[UNRESOLVED_float return STD_ULOGIC_VECTOR]: function is "floatlib_to_sulv_fu";

  alias to_StdULogicVector is to_sulv [UNRESOLVED_float return STD_ULOGIC_VECTOR];
  alias to_Std_ULogic_Vector is to_sulv [UNRESOLVED_float return STD_ULOGIC_VECTOR];

  -- std_ulogic_vector to float
  function to_float (
    arg                     : STD_ULOGIC_VECTOR;
    constant exponent_width : NATURAL := float_exponent_width;  -- length of FP output exponent
    constant fraction_width : NATURAL := float_fraction_width)  -- length of FP output fraction
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[STD_ULOGIC_VECTOR, NATURAL, NATURAL return UNRESOLVED_float] : function is "floatlib_sulv_to_float_var_args_width";

  -- Integer to float
  function to_float (
    arg                     : INTEGER;
    constant exponent_width : NATURAL    := float_exponent_width;  -- length of FP output exponent
    constant fraction_width : NATURAL    := float_fraction_width;  -- length of FP output fraction
    constant round_style    : round_type := float_round_style)  -- rounding option
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[INTEGER, NATURAL, NATURAL, round_type return UNRESOLVED_float] : function is "floatlib_integer_to_float_var_args_width";

  -- real to float
  function to_float (
    arg                     : REAL;
    constant exponent_width : NATURAL    := float_exponent_width;  -- length of FP output exponent
    constant fraction_width : NATURAL    := float_fraction_width;  -- length of FP output fraction
    constant round_style    : round_type := float_round_style;  -- rounding option
    constant denormalize    : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  to_float[REAL,NATURAL,NATURAL, round_type, BOOLEAN return UNRESOLVED_float] : function is "floatlib_real_to_float_var_args_width";

  -- unsigned to float
  function to_float (
    arg                     : UNRESOLVED_UNSIGNED;
    constant exponent_width : NATURAL    := float_exponent_width;  -- length of FP output exponent
    constant fraction_width : NATURAL    := float_fraction_width;  -- length of FP output fraction
    constant round_style    : round_type := float_round_style)  -- rounding option
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[UNRESOLVED_UNSIGNED, NATURAL, NATURAL, round_type return UNRESOLVED_float] : function is "floatlib_unsigned_to_float_var_args_width";

  -- signed to float
  function to_float (
    arg                     : UNRESOLVED_SIGNED;
    constant exponent_width : NATURAL    := float_exponent_width;  -- length of FP output exponent
    constant fraction_width : NATURAL    := float_fraction_width;  -- length of FP output fraction
    constant round_style    : round_type := float_round_style)  -- rounding option
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[UNRESOLVED_SIGNED, NATURAL, NATURAL, round_type return UNRESOLVED_float] : function is "floatlib_signed_to_float_var_args_width";

  -- unsigned fixed point to float
  function to_float (
    arg                     : UNRESOLVED_ufixed;  -- unsigned fixed point input
    constant exponent_width : NATURAL    := float_exponent_width;  -- width of exponent
    constant fraction_width : NATURAL    := float_fraction_width;  -- width of fraction
    constant round_style    : round_type := float_round_style;  -- rounding
    constant denormalize    : BOOLEAN    := float_denormalize)  -- use ieee extensions
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[UNRESOLVED_ufixed, NATURAL, NATURAL, round_type, BOOLEAN return UNRESOLVED_float] : function is "floatlib_ufixed_to_float_var_args_width";

  -- signed fixed point to float
  function to_float (
    arg                     : UNRESOLVED_sfixed;
    constant exponent_width : NATURAL    := float_exponent_width;  -- length of FP output exponent
    constant fraction_width : NATURAL    := float_fraction_width;  -- length of FP output fraction
    constant round_style    : round_type := float_round_style;  -- rounding
    constant denormalize    : BOOLEAN    := float_denormalize)  -- rounding option
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[UNRESOLVED_sfixed, NATURAL, NATURAL, round_type, BOOLEAN return UNRESOLVED_float] : function is "floatlib_sfixed_to_float_var_args_width";

  -- size_res functions
  -- Integer to float
  function to_float (
    arg                  : INTEGER;
    size_res             : UNRESOLVED_float;
    constant round_style : round_type := float_round_style)  -- rounding option
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[INTEGER, UNRESOLVED_float, round_type return UNRESOLVED_float] : function is "floatlib_integer_to_float_var_args_size";

  -- real to float
  function to_float (
    arg                  : REAL;
    size_res             : UNRESOLVED_float;
    constant round_style : round_type := float_round_style;  -- rounding option
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[REAL, UNRESOLVED_float, round_type,BOOLEAN return UNRESOLVED_float] : function is "floatlib_real_to_float_var_args_size";

  -- unsigned to float
  function to_float (
    arg                  : UNRESOLVED_UNSIGNED;
    size_res             : UNRESOLVED_float;
    constant round_style : round_type := float_round_style)  -- rounding option
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[UNRESOLVED_UNSIGNED, UNRESOLVED_float, round_type return UNRESOLVED_float] : function is "floatlib_unsigned_to_float_var_args_size";

  -- signed to float
  function to_float (
    arg                  : UNRESOLVED_SIGNED;
    size_res             : UNRESOLVED_float;
    constant round_style : round_type := float_round_style)  -- rounding option
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[UNRESOLVED_SIGNED, UNRESOLVED_float, round_type return UNRESOLVED_float] : function is "floatlib_signed_to_float_var_args_size";

  -- sulv to float
  function to_float (
    arg      : STD_ULOGIC_VECTOR;
    size_res : UNRESOLVED_float)
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[STD_ULOGIC_VECTOR, UNRESOLVED_float return UNRESOLVED_float] : function is "floatlib_sulv_to_float_size";

  -- unsigned fixed point to float
  function to_float (
    arg                  : UNRESOLVED_ufixed;  -- unsigned fixed point input
    size_res             : UNRESOLVED_float;
    constant round_style : round_type := float_round_style;  -- rounding
    constant denormalize : BOOLEAN    := float_denormalize)  -- use ieee extensions
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[UNRESOLVED_ufixed, UNRESOLVED_float, round_type, BOOLEAN return UNRESOLVED_float] : function is "floatlib_ufixed_to_float_var_args_size";

  -- signed fixed point to float
  function to_float (
    arg                  : UNRESOLVED_sfixed;
    size_res             : UNRESOLVED_float;
    constant round_style : round_type := float_round_style;  -- rounding
    constant denormalize : BOOLEAN    := float_denormalize)  -- rounding option
    return UNRESOLVED_float;
	attribute builtin_subprogram of  TO_FLOAT[UNRESOLVED_sfixed, UNRESOLVED_float, round_type, BOOLEAN return UNRESOLVED_float] : function is "floatlib_sfixed_to_float_var_args_size";

  -- float to unsigned
  function to_unsigned (
    arg                  : UNRESOLVED_float;  -- floating point input
    constant size        : NATURAL;     -- length of output
    constant round_style : round_type := float_round_style;  -- rounding option
    constant check_error : BOOLEAN    := float_check_error)  -- check for errors
    return UNRESOLVED_UNSIGNED;
	attribute builtin_subprogram of  TO_UNSIGNED[UNRESOLVED_float, NATURAL, round_type, BOOLEAN return UNRESOLVED_UNSIGNED] : function is "floatlib_to_unsigned_var_args_width";

  -- float to signed
  function to_signed (
    arg                  : UNRESOLVED_float;  -- floating point input
    constant size        : NATURAL;     -- length of output
    constant round_style : round_type := float_round_style;  -- rounding option
    constant check_error : BOOLEAN    := float_check_error)  -- check for errors
    return UNRESOLVED_SIGNED;
	attribute builtin_subprogram of  TO_SIGNED[UNRESOLVED_float, NATURAL, round_type, BOOLEAN return UNRESOLVED_SIGNED] : function is "floatlib_to_signed_var_args_width";

  -- purpose: Converts a float to unsigned fixed point
  function to_ufixed (
    arg                     : UNRESOLVED_float;  -- fp input
    constant left_index     : INTEGER;  -- integer part
    constant right_index    : INTEGER;  -- fraction part
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;  -- saturate
    constant round_style    : fixed_round_style_type    := fixed_round_style;  -- rounding
    constant check_error    : BOOLEAN                   := float_check_error;  -- check for errors
    constant denormalize    : BOOLEAN                   := float_denormalize)
    return UNRESOLVED_ufixed;
	attribute builtin_subprogram of  TO_UFIXED[UNRESOLVED_float, INTEGER, INTEGER, fixed_overflow_style_type, fixed_round_style_type,
	 	 	 	 	 	 	 	 	 	BOOLEAN, BOOLEAN return UNRESOLVED_ufixed] : function is "floatlib_to_ufixed_var_args_width";

  -- float to signed fixed point
  function to_sfixed (
    arg                     : UNRESOLVED_float;  -- fp input
    constant left_index     : INTEGER;  -- integer part
    constant right_index    : INTEGER;  -- fraction part
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;  -- saturate
    constant round_style    : fixed_round_style_type    := fixed_round_style;  -- rounding
    constant check_error    : BOOLEAN                   := float_check_error;  -- check for errors
    constant denormalize    : BOOLEAN                   := float_denormalize)
    return UNRESOLVED_sfixed;
	attribute builtin_subprogram of  TO_SFIXED[UNRESOLVED_float, INTEGER, INTEGER, fixed_overflow_style_type, fixed_round_style_type, 
	 	 	 	 	 	 	 	 	 	BOOLEAN, BOOLEAN return UNRESOLVED_sfixed] : function is "floatlib_to_sfixed_var_args_width";

  -- size_res versions
  -- float to unsigned
  function to_unsigned (
    arg                  : UNRESOLVED_float;  -- floating point input
    size_res             : UNRESOLVED_UNSIGNED;
    constant round_style : round_type := float_round_style;  -- rounding option
    constant check_error : BOOLEAN    := float_check_error)  -- check for errors
    return UNRESOLVED_UNSIGNED;
	attribute builtin_subprogram of  TO_UNSIGNED[UNRESOLVED_float, UNRESOLVED_UNSIGNED, round_type, BOOLEAN return UNRESOLVED_UNSIGNED] : function is "floatlib_to_unsigned_var_args_size";

  -- float to signed
  function to_signed (
    arg                  : UNRESOLVED_float;  -- floating point input
    size_res             : UNRESOLVED_SIGNED;
    constant round_style : round_type := float_round_style;  -- rounding option
    constant check_error : BOOLEAN    := float_check_error)  -- check for errors
    return UNRESOLVED_SIGNED;
	attribute builtin_subprogram of  TO_SIGNED[UNRESOLVED_float, UNRESOLVED_SIGNED, round_type, BOOLEAN return UNRESOLVED_SIGNED] : function is "floatlib_to_signed_var_args_size";

  -- purpose: Converts a float to unsigned fixed point
  function to_ufixed (
    arg                     : UNRESOLVED_float;  -- fp input
    size_res                : UNRESOLVED_ufixed;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;  -- saturate
    constant round_style    : fixed_round_style_type    := fixed_round_style;  -- rounding
    constant check_error    : BOOLEAN                   := float_check_error;  -- check for errors
    constant denormalize    : BOOLEAN                   := float_denormalize)
    return UNRESOLVED_ufixed;
	attribute builtin_subprogram of  TO_UFIXED[UNRESOLVED_float, UNRESOLVED_ufixed, fixed_overflow_style_type, fixed_round_style_type,
	 	 	 	 	 	 	 	 	 	BOOLEAN, BOOLEAN return UNRESOLVED_ufixed] : function is "floatlib_to_ufixed_var_args_size";

  -- float to signed fixed point
  function to_sfixed (
    arg                     : UNRESOLVED_float;  -- fp input
    size_res                : UNRESOLVED_sfixed;
    constant overflow_style : fixed_overflow_style_type := fixed_overflow_style;  -- saturate
    constant round_style    : fixed_round_style_type    := fixed_round_style;  -- rounding
    constant check_error    : BOOLEAN                   := float_check_error;  -- check for errors
    constant denormalize    : BOOLEAN                   := float_denormalize)
    return UNRESOLVED_sfixed;
	attribute builtin_subprogram of  TO_SFIXED[UNRESOLVED_float, UNRESOLVED_sfixed, fixed_overflow_style_type, fixed_round_style_type,
	 	 	 	 	 	 	 	 	 	BOOLEAN, BOOLEAN return UNRESOLVED_sfixed] : function is "floatlib_to_sfixed_var_args_size";

  -- float to real
  function to_real (
    arg                  : UNRESOLVED_float;  -- floating point input
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return REAL;
   attribute builtin_subprogram of
        TO_REAL[UNRESOLVED_float, BOOLEAN, BOOLEAN return REAL]: function is "floatlib_to_real";

  -- float to integer
  function to_integer (
    arg                  : UNRESOLVED_float;  -- floating point input
    constant round_style : round_type := float_round_style;  -- rounding option
    constant check_error : BOOLEAN    := float_check_error)  -- check for errors
    return INTEGER;
   attribute builtin_subprogram of
        TO_INTEGER[UNRESOLVED_float, round_type, BOOLEAN return INTEGER]: function is "floatlib_to_integer_var_args";

  -- For Verilog compatability
  function realtobits (arg : REAL) return STD_ULOGIC_VECTOR;
  function bitstoreal (arg : STD_ULOGIC_VECTOR) return REAL;

  -- Maps metalogical values
  function to_01 (arg  : UNRESOLVED_float; XMAP : STD_LOGIC := '0') return UNRESOLVED_float;
    attribute builtin_subprogram of
        TO_01[UNRESOLVED_float, STD_LOGIC return UNRESOLVED_float]: function is "floatlib_to_01_ff";
  
  function Is_X (arg    : UNRESOLVED_float) return BOOLEAN;
    attribute builtin_subprogram of
        IS_X[UNRESOLVED_float  return BOOLEAN]: function is "numstd_isx_u";
  function to_X01 (arg  : UNRESOLVED_float) return UNRESOLVED_float;
    attribute builtin_subprogram of
        TO_X01[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_to_X01_ff";

  function to_X01Z (arg : UNRESOLVED_float) return UNRESOLVED_float;
    attribute builtin_subprogram of
        TO_X01Z[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_to_X01Z_ff";
  function to_UX01 (arg : UNRESOLVED_float) return UNRESOLVED_float;
    attribute builtin_subprogram of
        TO_UX01[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_to_UX01_ff";

  -- These two procedures were copied out of the body because they proved
  -- very useful for vendor specific algorithm development
  -- Break_number converts a floating point number into it's parts
  -- Exponent is biased by -1
--- not done
  procedure break_number (
    arg         : in  UNRESOLVED_float;
    denormalize : in  BOOLEAN := float_denormalize;
    check_error : in  BOOLEAN := float_check_error;
    fract       : out UNRESOLVED_UNSIGNED;
    expon       : out UNRESOLVED_SIGNED;  -- NOTE:  Add 1 to get the real exponent!
    sign        : out STD_ULOGIC);

  procedure break_number (
    arg         : in  UNRESOLVED_float;
    denormalize : in  BOOLEAN := float_denormalize;
    check_error : in  BOOLEAN := float_check_error;
    fract       : out UNRESOLVED_ufixed;  -- a number between 1.0 and 2.0
    expon       : out UNRESOLVED_SIGNED;  -- NOTE:  Add 1 to get the real exponent!
    sign        : out STD_ULOGIC);

  -- Normalize takes a fraction and and exponent and converts them into
  -- a floating point number.  Does the shifting and the rounding.
  -- Exponent is assumed to be biased by -1

  function normalize (
    fract                   : UNRESOLVED_UNSIGNED;  -- fraction, unnormalized
    expon                   : UNRESOLVED_SIGNED;   -- exponent - 1, normalized
    sign                    : STD_ULOGIC;         -- sign bit
    sticky                  : STD_ULOGIC := '0';  -- Sticky bit (rounding)
    constant exponent_width : NATURAL    := float_exponent_width;  -- size of output exponent
    constant fraction_width : NATURAL    := float_fraction_width;  -- size of output fraction
    constant round_style    : round_type := float_round_style;  -- rounding option
    constant denormalize    : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP
    constant nguard         : NATURAL    := float_guard_bits)   -- guard bits
    return UNRESOLVED_float;
	attribute builtin_subprogram of  NORMALIZE[UNRESOLVED_UNSIGNED, UNRESOLVED_SIGNED,STD_ULOGIC, STD_ULOGIC, NATURAL, NATURAL,
	 	 	 	 	 	 	 	 	 	 	  round_type, BOOLEAN, NATURAL return UNRESOLVED_float] : function is "floatlib_normalize_us_var_args_width";

  -- Exponent is assumed to be biased by -1
  function normalize (
    fract                   : UNRESOLVED_ufixed;   -- unsigned fixed point
    expon                   : UNRESOLVED_SIGNED;   -- exponent - 1, normalized
    sign                    : STD_ULOGIC;         -- sign bit
    sticky                  : STD_ULOGIC := '0';  -- Sticky bit (rounding)
    constant exponent_width : NATURAL    := float_exponent_width;  -- size of output exponent
    constant fraction_width : NATURAL    := float_fraction_width;  -- size of output fraction
    constant round_style    : round_type := float_round_style;  -- rounding option
    constant denormalize    : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP
    constant nguard         : NATURAL    := float_guard_bits)   -- guard bits
    return UNRESOLVED_float;
	attribute builtin_subprogram of  NORMALIZE[UNRESOLVED_ufixed, UNRESOLVED_SIGNED, STD_ULOGIC, STD_ULOGIC, NATURAL, NATURAL,
	 	 	 	 	 	 	 	 	 	 	  round_type, BOOLEAN, NATURAL return UNRESOLVED_float] : function is "floatlib_normalize_fs_var_args_width";

  function normalize (
    fract                : UNRESOLVED_UNSIGNED;    -- unsigned
    expon                : UNRESOLVED_SIGNED;      -- exponent - 1, normalized
    sign                 : STD_ULOGIC;  -- sign bit
    sticky               : STD_ULOGIC := '0';  -- Sticky bit (rounding)
    size_res             : UNRESOLVED_float;   -- used for sizing only
    constant round_style : round_type := float_round_style;  -- rounding option
    constant denormalize : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP
    constant nguard      : NATURAL    := float_guard_bits)   -- guard bits
    return UNRESOLVED_float;
	attribute builtin_subprogram of  NORMALIZE[UNRESOLVED_UNSIGNED, UNRESOLVED_SIGNED,STD_ULOGIC, STD_ULOGIC, UNRESOLVED_float,
	 	 	 	 	 	 	 	 	 	 	  round_type, BOOLEAN, NATURAL return UNRESOLVED_float] : function is "floatlib_normalize_us_var_args_size";

  -- Exponent is assumed to be biased by -1
  function normalize (
    fract                : UNRESOLVED_ufixed;      -- unsigned fixed point
    expon                : UNRESOLVED_SIGNED;      -- exponent - 1, normalized
    sign                 : STD_ULOGIC;  -- sign bit
    sticky               : STD_ULOGIC := '0';  -- Sticky bit (rounding)
    size_res             : UNRESOLVED_float;   -- used for sizing only
    constant round_style : round_type := float_round_style;  -- rounding option
    constant denormalize : BOOLEAN    := float_denormalize;  -- Use IEEE extended FP
    constant nguard      : NATURAL    := float_guard_bits)   -- guard bits
    return UNRESOLVED_float;
	attribute builtin_subprogram of  NORMALIZE[UNRESOLVED_ufixed, UNRESOLVED_SIGNED, STD_ULOGIC, STD_ULOGIC, UNRESOLVED_float,
	 	 	 	 	 	 	 	 	 	 	  round_type, BOOLEAN, NATURAL return UNRESOLVED_float] : function is "floatlib_normalize_fs_var_args_size";

  -- overloaded versions
  function "+"   (l : UNRESOLVED_float; r : REAL)    return UNRESOLVED_float;
  attribute builtin_subprogram of "+"[UNRESOLVED_float, REAL return UNRESOLVED_float]: function is "floatlib_plus_frf";
  function "+"   (l : REAL; r : UNRESOLVED_float)    return UNRESOLVED_float;
  attribute builtin_subprogram of "+"[REAL, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_plus_rff";
  function "+"   (l : UNRESOLVED_float; r : INTEGER) return UNRESOLVED_float;
  attribute builtin_subprogram of "+"[UNRESOLVED_float, INTEGER return UNRESOLVED_float]: function is "floatlib_plus_fif";
  function "+"   (l : INTEGER; r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "+"[INTEGER, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_plus_iff";
  function "-"   (l : UNRESOLVED_float; r : REAL)    return UNRESOLVED_float;
  attribute builtin_subprogram of "-"[UNRESOLVED_float, REAL return UNRESOLVED_float]: function is "floatlib_minus_frf";
  function "-"   (l : REAL; r : UNRESOLVED_float)    return UNRESOLVED_float;
  attribute builtin_subprogram of "-"[REAL, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_minus_rff";
  function "-"   (l : UNRESOLVED_float; r : INTEGER) return UNRESOLVED_float;
  attribute builtin_subprogram of "-"[UNRESOLVED_float, INTEGER return UNRESOLVED_float]: function is "floatlib_minus_fif";
  function "-"   (l : INTEGER; r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "-"[INTEGER, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_minus_iff";
  function "*"   (l : UNRESOLVED_float; r : REAL)    return UNRESOLVED_float;
  attribute builtin_subprogram of "*"[UNRESOLVED_float, REAL return UNRESOLVED_float]: function is "floatlib_mult_frf";
  function "*"   (l : REAL; r : UNRESOLVED_float)    return UNRESOLVED_float;
  attribute builtin_subprogram of "*"[REAL, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_mult_rff";
  function "*"   (l : UNRESOLVED_float; r : INTEGER) return UNRESOLVED_float;
  attribute builtin_subprogram of "*"[UNRESOLVED_float, INTEGER return UNRESOLVED_float]: function is "floatlib_mult_fif";
  function "*"   (l : INTEGER; r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "*"[INTEGER, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_mult_iff";
  function "/"   (l : UNRESOLVED_float; r : REAL)    return UNRESOLVED_float;
  attribute builtin_subprogram of "/"[UNRESOLVED_float, REAL return UNRESOLVED_float]: function is "floatlib_div_frf";
  function "/"   (l : REAL; r : UNRESOLVED_float)    return UNRESOLVED_float;
  attribute builtin_subprogram of "/"[REAL, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_div_rff";
  function "/"   (l : UNRESOLVED_float; r : INTEGER) return UNRESOLVED_float;
  attribute builtin_subprogram of "/"[UNRESOLVED_float, INTEGER return UNRESOLVED_float]: function is "floatlib_div_fif";
  function "/"   (l : INTEGER; r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "/"[INTEGER, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_div_iff";
  function "rem" (l : UNRESOLVED_float; r : REAL)    return UNRESOLVED_float;
  attribute builtin_subprogram of "REM"[UNRESOLVED_float, REAL return UNRESOLVED_float]: function is "floatlib_rem_frf";
  function "rem" (l : REAL; r : UNRESOLVED_float)    return UNRESOLVED_float;
  attribute builtin_subprogram of "REM"[REAL, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_rem_rff";
  function "rem" (l : UNRESOLVED_float; r : INTEGER) return UNRESOLVED_float;
  attribute builtin_subprogram of "REM"[UNRESOLVED_float, INTEGER return UNRESOLVED_float]: function is "floatlib_rem_fif";
  function "rem" (l : INTEGER; r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "REM"[INTEGER, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_rem_iff";
  function "mod" (l : UNRESOLVED_float; r : REAL)    return UNRESOLVED_float;
  attribute builtin_subprogram of "MOD"[UNRESOLVED_float, REAL return UNRESOLVED_float]: function is "floatlib_mod_frf";
  function "mod" (l : REAL; r : UNRESOLVED_float)    return UNRESOLVED_float;
  attribute builtin_subprogram of "MOD"[REAL, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_mod_rff";
  function "mod" (l : UNRESOLVED_float; r : INTEGER) return UNRESOLVED_float;
  attribute builtin_subprogram of "MOD"[UNRESOLVED_float, INTEGER return UNRESOLVED_float]: function is "floatlib_mod_fif";
  function "mod" (l : INTEGER; r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "MOD"[INTEGER, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_mod_iff";

  -- overloaded compare functions
  function "="   (l : UNRESOLVED_float; r : REAL)    return BOOLEAN;
  attribute builtin_subprogram of "="[UNRESOLVED_float, REAL return BOOLEAN]: function is "floatlib_is_eq_frb";
  function "/="  (l : UNRESOLVED_float; r : REAL)    return BOOLEAN;
  attribute builtin_subprogram of "/="[UNRESOLVED_float, REAL return BOOLEAN]: function is "floatlib_is_neq_frb";
  function ">="  (l : UNRESOLVED_float; r : REAL)    return BOOLEAN;
  attribute builtin_subprogram of ">="[UNRESOLVED_float, REAL return BOOLEAN]: function is "floatlib_is_ge_frb";
  function "<="  (l : UNRESOLVED_float; r : REAL)    return BOOLEAN;
  attribute builtin_subprogram of "<="[UNRESOLVED_float, REAL return BOOLEAN]: function is "floatlib_is_le_frb";
  function ">"   (l : UNRESOLVED_float; r : REAL)    return BOOLEAN;
  attribute builtin_subprogram of ">"[UNRESOLVED_float, REAL return BOOLEAN]: function is "floatlib_is_gt_frb";
  function "<"   (l : UNRESOLVED_float; r : REAL)    return BOOLEAN;
  attribute builtin_subprogram of "<"[UNRESOLVED_float, REAL return BOOLEAN]: function is "floatlib_is_lt_frb";
  function "="   (l : REAL; r : UNRESOLVED_float)    return BOOLEAN;
  attribute builtin_subprogram of "="[REAL, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_eq_rfb";
  function "/="  (l : REAL; r : UNRESOLVED_float)    return BOOLEAN;
  attribute builtin_subprogram of "/="[REAL, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_neq_rfb";
  function ">="  (l : REAL; r : UNRESOLVED_float)    return BOOLEAN;
  attribute builtin_subprogram of ">="[REAL, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_ge_rfb";
  function "<="  (l : REAL; r : UNRESOLVED_float)    return BOOLEAN;
  attribute builtin_subprogram of "<="[REAL, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_le_rfb";
  function ">"   (l : REAL; r : UNRESOLVED_float)    return BOOLEAN;
  attribute builtin_subprogram of ">"[REAL, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_gt_rfb";
  function "<"   (l : REAL; r : UNRESOLVED_float)    return BOOLEAN;
  attribute builtin_subprogram of "<"[REAL, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_lt_rfb";
  function "="   (l : UNRESOLVED_float; r : INTEGER) return BOOLEAN;
  attribute builtin_subprogram of "="[UNRESOLVED_float, INTEGER return BOOLEAN]: function is "floatlib_is_eq_fib";
  function "/="  (l : UNRESOLVED_float; r : INTEGER) return BOOLEAN;
  attribute builtin_subprogram of "/="[UNRESOLVED_float, INTEGER return BOOLEAN]: function is "floatlib_is_neq_fib";
  function ">="  (l : UNRESOLVED_float; r : INTEGER) return BOOLEAN;
  attribute builtin_subprogram of ">="[UNRESOLVED_float, INTEGER return BOOLEAN]: function is "floatlib_is_ge_fib";
  function "<="  (l : UNRESOLVED_float; r : INTEGER) return BOOLEAN;
  attribute builtin_subprogram of "<="[UNRESOLVED_float, INTEGER return BOOLEAN]: function is "floatlib_is_le_fib";
  function ">"   (l : UNRESOLVED_float; r : INTEGER) return BOOLEAN;
  attribute builtin_subprogram of ">"[UNRESOLVED_float, INTEGER return BOOLEAN]: function is "floatlib_is_gt_fib";
  function "<"   (l : UNRESOLVED_float; r : INTEGER) return BOOLEAN;
  attribute builtin_subprogram of "<"[UNRESOLVED_float, INTEGER return BOOLEAN]: function is "floatlib_is_lt_fib";
  function "="   (l : INTEGER; r : UNRESOLVED_float) return BOOLEAN;
  attribute builtin_subprogram of "="[INTEGER, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_eq_ifb";
  function "/="  (l : INTEGER; r : UNRESOLVED_float) return BOOLEAN;
  attribute builtin_subprogram of "/="[INTEGER, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_neq_ifb";
  function ">="  (l : INTEGER; r : UNRESOLVED_float) return BOOLEAN;
  attribute builtin_subprogram of ">="[INTEGER, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_ge_ifb";
  function "<="  (l : INTEGER; r : UNRESOLVED_float) return BOOLEAN;
  attribute builtin_subprogram of "<="[INTEGER, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_le_ifb";
  function ">"   (l : INTEGER; r : UNRESOLVED_float) return BOOLEAN;
  attribute builtin_subprogram of ">"[INTEGER, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_gt_ifb";
  function "<"   (l : INTEGER; r : UNRESOLVED_float) return BOOLEAN;
  attribute builtin_subprogram of "<"[INTEGER, UNRESOLVED_float return BOOLEAN]: function is "floatlib_is_lt_ifb";
  function "?="  (l : UNRESOLVED_float; r : REAL)    return STD_ULOGIC;
  attribute builtin_subprogram of "?="[UNRESOLVED_float, REAL return STD_ULOGIC]: function is "floatlib_is_eq_frs";
  function "?/=" (l : UNRESOLVED_float; r : REAL)    return STD_ULOGIC;
  attribute builtin_subprogram of "?/="[UNRESOLVED_float, REAL return STD_ULOGIC]: function is "floatlib_is_neq_frs";
  function "?>"  (l : UNRESOLVED_float; r : REAL)    return STD_ULOGIC;
  attribute builtin_subprogram of "?>"[UNRESOLVED_float, REAL return STD_ULOGIC]: function is "floatlib_is_gt_frs";
  function "?>=" (l : UNRESOLVED_float; r : REAL)    return STD_ULOGIC;
  attribute builtin_subprogram of "?>="[UNRESOLVED_float, REAL return STD_ULOGIC]: function is "floatlib_is_ge_frs";
  function "?<"  (l : UNRESOLVED_float; r : REAL)    return STD_ULOGIC;
  attribute builtin_subprogram of "?<"[UNRESOLVED_float, REAL return STD_ULOGIC]: function is "floatlib_is_lt_frs";
  function "?<=" (l : UNRESOLVED_float; r : REAL)    return STD_ULOGIC;
  attribute builtin_subprogram of "?<="[UNRESOLVED_float, REAL return STD_ULOGIC]: function is "floatlib_is_le_frs";
  function "?="  (l : REAL; r : UNRESOLVED_float)    return STD_ULOGIC;
  attribute builtin_subprogram of "?="[REAL, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_eq_rfs";
  function "?/=" (l : REAL; r : UNRESOLVED_float)    return STD_ULOGIC;
  attribute builtin_subprogram of "?/="[REAL, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_neq_rfs";
  function "?>"  (l : REAL; r : UNRESOLVED_float)    return STD_ULOGIC;
  attribute builtin_subprogram of "?>"[REAL, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_gt_rfs";
  function "?>=" (l : REAL; r : UNRESOLVED_float)    return STD_ULOGIC;
  attribute builtin_subprogram of "?>="[REAL, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_ge_rfs";
  function "?<"  (l : REAL; r : UNRESOLVED_float)    return STD_ULOGIC;
  attribute builtin_subprogram of "?<"[REAL, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_lt_rfs";
  function "?<=" (l : REAL; r : UNRESOLVED_float)    return STD_ULOGIC;
  attribute builtin_subprogram of "?<="[REAL, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_le_rfs";
  function "?="  (l : UNRESOLVED_float; r : INTEGER) return STD_ULOGIC;
  attribute builtin_subprogram of "?="[UNRESOLVED_float, INTEGER return STD_ULOGIC]: function is "floatlib_is_eq_fis";
  function "?/=" (l : UNRESOLVED_float; r : INTEGER) return STD_ULOGIC;
  attribute builtin_subprogram of "?/="[UNRESOLVED_float, INTEGER return STD_ULOGIC]: function is "floatlib_is_neq_fis";
  function "?>"  (l : UNRESOLVED_float; r : INTEGER) return STD_ULOGIC;
  attribute builtin_subprogram of "?>"[UNRESOLVED_float, INTEGER return STD_ULOGIC]: function is "floatlib_is_gt_fis";
  function "?>=" (l : UNRESOLVED_float; r : INTEGER) return STD_ULOGIC;
  attribute builtin_subprogram of "?>="[UNRESOLVED_float, INTEGER return STD_ULOGIC]: function is "floatlib_is_ge_fis";
  function "?<"  (l : UNRESOLVED_float; r : INTEGER) return STD_ULOGIC;
  attribute builtin_subprogram of "?<"[UNRESOLVED_float, INTEGER return STD_ULOGIC]: function is "floatlib_is_lt_fis";
  function "?<=" (l : UNRESOLVED_float; r : INTEGER) return STD_ULOGIC;
  attribute builtin_subprogram of "?<="[UNRESOLVED_float, INTEGER return STD_ULOGIC]: function is "floatlib_is_le_fis";
  function "?="  (l : INTEGER; r : UNRESOLVED_float) return STD_ULOGIC;
  attribute builtin_subprogram of "?="[INTEGER, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_eq_ifs";
  function "?/=" (l : INTEGER; r : UNRESOLVED_float) return STD_ULOGIC;
  attribute builtin_subprogram of "?/="[INTEGER, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_neq_ifs";
  function "?>"  (l : INTEGER; r : UNRESOLVED_float) return STD_ULOGIC;
  attribute builtin_subprogram of "?>"[INTEGER, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_gt_ifs";
  function "?>=" (l : INTEGER; r : UNRESOLVED_float) return STD_ULOGIC;
  attribute builtin_subprogram of "?>="[INTEGER, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_ge_ifs";
  function "?<"  (l : INTEGER; r : UNRESOLVED_float) return STD_ULOGIC;
  attribute builtin_subprogram of "?<"[INTEGER, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_lt_ifs";
  function "?<=" (l : INTEGER; r : UNRESOLVED_float) return STD_ULOGIC;
  attribute builtin_subprogram of "?<="[INTEGER, UNRESOLVED_float return STD_ULOGIC]: function is "floatlib_is_le_ifs";
  -- minimum and maximum overloads
  function maximum (l : UNRESOLVED_float; r : REAL)    return UNRESOLVED_float;
  attribute builtin_subprogram of MAXIMUM[UNRESOLVED_float, REAL return UNRESOLVED_float]: function is "floatlib_maximum_frf";
  function minimum (l : UNRESOLVED_float; r : REAL)    return UNRESOLVED_float;
  attribute builtin_subprogram of MINIMUM[UNRESOLVED_float, REAL return UNRESOLVED_float]: function is "floatlib_minimum_frf";
  function maximum (l : REAL; r : UNRESOLVED_float)    return UNRESOLVED_float;
  attribute builtin_subprogram of MAXIMUM[REAL, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_maximum_rff";
  function minimum (l : REAL; r : UNRESOLVED_float)    return UNRESOLVED_float;
  attribute builtin_subprogram of MINIMUM[REAL, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_minimum_rff";
  function maximum (l : UNRESOLVED_float; r : INTEGER) return UNRESOLVED_float;
  attribute builtin_subprogram of MAXIMUM[UNRESOLVED_float, INTEGER return UNRESOLVED_float]: function is "floatlib_maximum_fif";
  function minimum (l : UNRESOLVED_float; r : INTEGER) return UNRESOLVED_float;
  attribute builtin_subprogram of MINIMUM[UNRESOLVED_float, INTEGER return UNRESOLVED_float]: function is "floatlib_minimum_fif";
  function maximum (l : INTEGER; r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of MAXIMUM[INTEGER, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_maximum_frf";
  function minimum (l : INTEGER; r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of MINIMUM[INTEGER, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_minimum_frf";
----------------------------------------------------------------------------
  -- logical functions
  ----------------------------------------------------------------------------

  function "not"  (l    : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "NOT"[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_not_ff";
  function "and"  (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "AND"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_and_fff";
  function "or"   (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "OR"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_or_fff";
  function "nand" (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "NAND"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_nand_fff";
  function "nor"  (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "NOR"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_nor_fff";
  function "xor"  (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "XOR"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_xor_fff";
  function "xnor" (l, r : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of "XNOR"[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_xnor_fff";
  -- Vector and std_ulogic functions, same as functions in numeric_std
  function "and" (l : STD_ULOGIC; r : UNRESOLVED_float)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "AND"[STD_ULOGIC, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_and_sff";
  function "and" (l : UNRESOLVED_float; r : STD_ULOGIC)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "AND"[UNRESOLVED_float, STD_ULOGIC return UNRESOLVED_float]: function is "floatlib_and_fsf";
  function "or" (l : STD_ULOGIC; r : UNRESOLVED_float)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "OR"[STD_ULOGIC, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_or_sff";
  function "or" (l : UNRESOLVED_float; r : STD_ULOGIC)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "OR"[UNRESOLVED_float, STD_ULOGIC return UNRESOLVED_float]: function is "floatlib_or_fsf";
  function "nand" (l : STD_ULOGIC; r : UNRESOLVED_float)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "NAND"[STD_ULOGIC, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_nand_sff";
  function "nand" (l : UNRESOLVED_float; r : STD_ULOGIC)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "NAND"[UNRESOLVED_float, STD_ULOGIC return UNRESOLVED_float]: function is "floatlib_nand_fsf";
  function "nor" (l : STD_ULOGIC; r : UNRESOLVED_float)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "NOR"[STD_ULOGIC, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_nor_sff";
  function "nor" (l : UNRESOLVED_float; r : STD_ULOGIC)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "NOR"[UNRESOLVED_float, STD_ULOGIC return UNRESOLVED_float]: function is "floatlib_nor_fsf";
  function "xor" (l : STD_ULOGIC; r : UNRESOLVED_float)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "XOR"[STD_ULOGIC, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_xor_sff";
  function "xor" (l : UNRESOLVED_float; r : STD_ULOGIC)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "XOR"[UNRESOLVED_float, STD_ULOGIC return UNRESOLVED_float]: function is "floatlib_xor_fsf";
  function "xnor" (l : STD_ULOGIC; r : UNRESOLVED_float)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "XNOR"[STD_ULOGIC, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_xnor_sff";
  function "xnor" (l : UNRESOLVED_float; r : STD_ULOGIC)
    return UNRESOLVED_float;
  attribute builtin_subprogram of "XNOR"[UNRESOLVED_float, STD_ULOGIC return UNRESOLVED_float]: function is "floatlib_xnor_fsf";
  -- Reduction operators, same as numeric_std functions
  function "and"  (l : UNRESOLVED_float) return STD_ULOGIC;
    attribute builtin_subprogram of
        "AND"[UNRESOLVED_float return STD_ULOGIC]: function is "and_reduce_1164";
		
  function "nand" (l : UNRESOLVED_float) return STD_ULOGIC;
    attribute builtin_subprogram of
        "NAND"[UNRESOLVED_float return STD_ULOGIC]: function is "nand_reduce_1164";
		
  function "or"   (l : UNRESOLVED_float) return STD_ULOGIC;
    attribute builtin_subprogram of
        "OR"[UNRESOLVED_float return STD_ULOGIC]: function is "or_reduce_1164";
		
  function "nor"  (l : UNRESOLVED_float) return STD_ULOGIC;
    attribute builtin_subprogram of
       "NOR"[UNRESOLVED_float return STD_ULOGIC]: function is "nor_reduce_1164";
		
  function "xor"  (l : UNRESOLVED_float) return STD_ULOGIC;
    attribute builtin_subprogram of
        "XOR"[UNRESOLVED_float return STD_ULOGIC]: function is "xor_reduce_1164";
		
  function "xnor" (l : UNRESOLVED_float) return STD_ULOGIC;
    attribute builtin_subprogram of
        "XNOR"[UNRESOLVED_float return STD_ULOGIC]: function is "xnor_reduce_1164";

  -- Note: "sla", "sra", "sll", "slr", "rol" and "ror" not implemented.

  -----------------------------------------------------------------------------
  -- Recommended Functions from the IEEE 754 Appendix
  -----------------------------------------------------------------------------

  -- returns x with the sign of y.
  function Copysign (x, y : UNRESOLVED_float) return UNRESOLVED_float;
  attribute builtin_subprogram of COPYSIGN[UNRESOLVED_float, UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_copysign";

  -- Returns y * 2**n for integral values of N without computing 2**n
  function Scalb (
    y                    : UNRESOLVED_float;  -- floating point input
    N                    : INTEGER;     -- exponent to add    
    constant round_style : round_type := float_round_style;  -- rounding option
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
  attribute builtin_subprogram of SCALB[UNRESOLVED_float, INTEGER, round_type, BOOLEAN, BOOLEAN return UNRESOLVED_float]: function is "floatlib_scalb_var_args_width";

  -- Returns y * 2**n for integral values of N without computing 2**n
  function Scalb (
    y                    : UNRESOLVED_float;  -- floating point input
    N                    : UNRESOLVED_SIGNED;      -- exponent to add    
    constant round_style : round_type := float_round_style;  -- rounding option
    constant check_error : BOOLEAN    := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN    := float_denormalize)  -- Use IEEE extended FP
    return UNRESOLVED_float;
  attribute builtin_subprogram of SCALB[UNRESOLVED_float, UNRESOLVED_SIGNED, round_type, BOOLEAN, BOOLEAN return UNRESOLVED_float]: function is "floatlib_scalb__var_args_size";

  -- returns the unbiased exponent of x
  function Logb (x : UNRESOLVED_float) return INTEGER;
  attribute builtin_subprogram of LOGB[UNRESOLVED_float return INTEGER]: function is "floatlib_logb_fi";
  function Logb (x : UNRESOLVED_float) return UNRESOLVED_SIGNED;
  attribute builtin_subprogram of LOGB[UNRESOLVED_float return UNRESOLVED_SIGNED]: function is "floatlib_logb_fs";

  -- returns the next representable neighbor of x in the direction toward y
  function Nextafter (
    x, y                 : UNRESOLVED_float;  -- floating point input
    constant check_error : BOOLEAN := float_check_error;  -- check for errors
    constant denormalize : BOOLEAN := float_denormalize)
    return UNRESOLVED_float;
  attribute builtin_subprogram of NEXTAFTER[UNRESOLVED_float,UNRESOLVED_float, BOOLEAN, BOOLEAN return UNRESOLVED_float]: function is "floatlib_nextafter_var_args";

  -- Returns TRUE if X is unordered with Y.
  function Unordered (x, y : UNRESOLVED_float) return BOOLEAN;
    attribute builtin_subprogram of
        UNORDERED[UNRESOLVED_float, UNRESOLVED_float return BOOLEAN]: function is "floatlib_unordered";
  function Finite (x       : UNRESOLVED_float) return BOOLEAN;
    attribute builtin_subprogram of
        FINITE[UNRESOLVED_float return BOOLEAN]: function is "floatlib_finite";
  function Isnan (x        : UNRESOLVED_float) return BOOLEAN;
    attribute builtin_subprogram of
        ISNAN[UNRESOLVED_float return BOOLEAN]: function is "floatlib_isnan";

  -- Function to return constants.
  function zerofp (
    constant exponent_width : NATURAL := float_exponent_width;  -- exponent
    constant fraction_width : NATURAL := float_fraction_width)  -- fraction
    return UNRESOLVED_float;
  attribute builtin_subprogram of ZEROFP[NATURAL,NATURAL return UNRESOLVED_float]: function is "floatlib_zerofp_var_args_width";
  function nanfp (
    constant exponent_width : NATURAL := float_exponent_width;  -- exponent
    constant fraction_width : NATURAL := float_fraction_width)  -- fraction
    return UNRESOLVED_float;
  attribute builtin_subprogram of NANFP[NATURAL,NATURAL return UNRESOLVED_float]: function is "floatlib_nanfp_var_args_width";
  function qnanfp (
    constant exponent_width : NATURAL := float_exponent_width;  -- exponent
    constant fraction_width : NATURAL := float_fraction_width)  -- fraction
    return UNRESOLVED_float;
  attribute builtin_subprogram of QNANFP[NATURAL,NATURAL return UNRESOLVED_float]: function is "floatlib_qnanfp_var_args_width";
  function pos_inffp (
    constant exponent_width : NATURAL := float_exponent_width;  -- exponent
    constant fraction_width : NATURAL := float_fraction_width)  -- fraction
    return UNRESOLVED_float;
  attribute builtin_subprogram of POS_INFFP[NATURAL,NATURAL return UNRESOLVED_float]: function is "floatlib_pos_inffp_var_args_width";
  function neg_inffp (
    constant exponent_width : NATURAL := float_exponent_width;  -- exponent
    constant fraction_width : NATURAL := float_fraction_width)  -- fraction
    return UNRESOLVED_float;
  attribute builtin_subprogram of NEG_INFFP[NATURAL,NATURAL return UNRESOLVED_float]: function is "floatlib_neg_inffp_var_args_width";
  function neg_zerofp (
    constant exponent_width : NATURAL := float_exponent_width;  -- exponent
    constant fraction_width : NATURAL := float_fraction_width)  -- fraction
    return UNRESOLVED_float;
  attribute builtin_subprogram of NEG_ZEROFP[NATURAL,NATURAL return UNRESOLVED_float]: function is "floatlib_neg_zerofp_var_args_width";
  -- size_res versions
  function zerofp (
    size_res : UNRESOLVED_float)        -- variable is only use for sizing
    return UNRESOLVED_float;
  attribute builtin_subprogram of ZEROFP[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_zerofp_size";
  function nanfp (
    size_res : UNRESOLVED_float)        -- variable is only use for sizing
    return UNRESOLVED_float;
  attribute builtin_subprogram of NANFP[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_nanfp_size";
  function qnanfp (
    size_res : UNRESOLVED_float)        -- variable is only use for sizing
    return UNRESOLVED_float;
  attribute builtin_subprogram of QNANFP[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_qnanfp_size";
  function pos_inffp (
    size_res : UNRESOLVED_float)        -- variable is only use for sizing
    return UNRESOLVED_float;
  attribute builtin_subprogram of POS_INFFP[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_pos_inffp_size";
  function neg_inffp (
    size_res : UNRESOLVED_float)        -- variable is only use for sizing
    return UNRESOLVED_float;
  attribute builtin_subprogram of NEG_INFFP[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_neg_inffp_size";
  function neg_zerofp (
    size_res : UNRESOLVED_float)        -- variable is only use for sizing
    return UNRESOLVED_float;
  attribute builtin_subprogram of NEG_ZEROFP[UNRESOLVED_float return UNRESOLVED_float]: function is "floatlib_neg_zerofp_size";

  function short_divide (lx, rx : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        SHORT_DIVIDE[UNSIGNED, UNSIGNED return UNSIGNED]: function is "floatlib_short_div_uuu";
 
  --===========================================================================
  -- string and textio Functions
  --===========================================================================

  -- writes S:EEEE:FFFFFFFF
  procedure WRITE (
    L         : inout LINE;              -- access type (pointer)
    VALUE     : in    UNRESOLVED_float;  -- value to write
    JUSTIFIED : in    SIDE  := right;    -- which side to justify text
    FIELD     : in    WIDTH := 0);       -- width of field

  -- Reads SEEEEFFFFFFFF, "." and ":" are ignored
  procedure READ (L    : inout LINE; VALUE : out UNRESOLVED_float);
  procedure READ (L    : inout LINE; VALUE : out UNRESOLVED_float;
                  GOOD : out   BOOLEAN);

  alias BREAD is READ [LINE, UNRESOLVED_float, BOOLEAN];
  alias BREAD is READ [LINE, UNRESOLVED_float];
  alias BWRITE is WRITE [LINE, UNRESOLVED_float, SIDE, WIDTH];
  alias BINARY_READ is READ [LINE, UNRESOLVED_FLOAT, BOOLEAN];
  alias BINARY_READ is READ [LINE, UNRESOLVED_FLOAT];
  alias BINARY_WRITE is WRITE [LINE, UNRESOLVED_float, SIDE, WIDTH];

  procedure OWRITE (
    L         : inout LINE;              -- access type (pointer)
    VALUE     : in    UNRESOLVED_float;  -- value to write
    JUSTIFIED : in    SIDE  := right;    -- which side to justify text
    FIELD     : in    WIDTH := 0);       -- width of field

  -- Octal read with padding, no separators used
  procedure OREAD (L    : inout LINE; VALUE : out UNRESOLVED_float);
  procedure OREAD (L    : inout LINE; VALUE : out UNRESOLVED_float;
                   GOOD : out   BOOLEAN);
  alias OCTAL_READ is OREAD [LINE, UNRESOLVED_FLOAT, BOOLEAN];
  alias OCTAL_READ is OREAD [LINE, UNRESOLVED_FLOAT];
  alias OCTAL_WRITE is OWRITE [LINE, UNRESOLVED_FLOAT, SIDE, WIDTH];

  -- Hex write with padding, no separators
  procedure HWRITE (
    L         : inout LINE;              -- access type (pointer)
    VALUE     : in    UNRESOLVED_float;  -- value to write
    JUSTIFIED : in    SIDE  := right;    -- which side to justify text
    FIELD     : in    WIDTH := 0);       -- width of field

  -- Hex read with padding, no separators used
  procedure HREAD (L : inout LINE; VALUE : out UNRESOLVED_float);
  procedure HREAD (L    : inout LINE; VALUE : out UNRESOLVED_float;
                   GOOD : out   BOOLEAN);
  alias HEX_READ is HREAD [LINE, UNRESOLVED_FLOAT, BOOLEAN];
  alias HEX_READ is HREAD [LINE, UNRESOLVED_FLOAT];
  alias HEX_WRITE is HWRITE [LINE, UNRESOLVED_FLOAT, SIDE, WIDTH];

  -- returns "S:EEEE:FFFFFFFF"
  function to_string (value : UNRESOLVED_float) return STRING;
  alias TO_BSTRING is TO_STRING [UNRESOLVED_FLOAT return STRING];
  alias TO_BINARY_STRING is TO_STRING [UNRESOLVED_FLOAT return STRING];

  -- Returns a HEX string, with padding
  function to_hstring (value : UNRESOLVED_float) return STRING;
  alias TO_HEX_STRING is TO_HSTRING [UNRESOLVED_FLOAT return STRING];

  -- Returns and octal string, with padding
  function to_ostring (value : UNRESOLVED_float) return STRING;
  alias TO_OCTAL_STRING is TO_OSTRING [UNRESOLVED_FLOAT return STRING];

  function from_string (
    bstring                 : STRING;   -- binary string
    constant exponent_width : NATURAL := float_exponent_width;
    constant fraction_width : NATURAL := float_fraction_width)
    return UNRESOLVED_float;
  alias from_bstring is from_string [STRING, NATURAL, NATURAL
                                     return UNRESOLVED_float];
  alias from_binary_string is from_string [STRING, NATURAL, NATURAL
                                           return UNRESOLVED_float];
  function from_ostring (
    ostring                 : STRING;   -- Octal string
    constant exponent_width : NATURAL := float_exponent_width;
    constant fraction_width : NATURAL := float_fraction_width)
    return UNRESOLVED_float;
  alias from_octal_string is from_ostring [STRING, NATURAL, NATURAL
                                           return UNRESOLVED_float];

  function from_hstring (
    hstring                 : STRING;   -- hex string
    constant exponent_width : NATURAL := float_exponent_width;
    constant fraction_width : NATURAL := float_fraction_width)
    return UNRESOLVED_float;
  alias from_hex_string is from_hstring [STRING, NATURAL, NATURAL
                                         return UNRESOLVED_float];

  function from_string (
    bstring  : STRING;                  -- binary string
    size_res : UNRESOLVED_float)        -- used for sizing only 
    return UNRESOLVED_float;
  alias from_bstring is from_string [STRING, UNRESOLVED_float
                                     return UNRESOLVED_float];
  alias from_binary_string is from_string [STRING, UNRESOLVED_float
                                           return UNRESOLVED_float];

  function from_ostring (
    ostring  : STRING;                  -- Octal string
    size_res : UNRESOLVED_float)        -- used for sizing only 
    return UNRESOLVED_float;
  alias from_octal_string is from_ostring [STRING, UNRESOLVED_float
                                           return UNRESOLVED_float];

  function from_hstring (
    hstring  : STRING;                  -- hex string
    size_res : UNRESOLVED_float)        -- used for sizing only 
    return UNRESOLVED_float;
  alias from_hex_string is from_hstring [STRING, UNRESOLVED_float
                                         return UNRESOLVED_float];

end package float_generic_pkg;
