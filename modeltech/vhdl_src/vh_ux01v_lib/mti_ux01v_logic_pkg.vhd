-- --------------------------------------------------------------------
--
-- Copyright 1991-2020 Mentor Graphics Corporation
--
-- All Rights Reserved.
--
-- THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
-- MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
--
-- Based on source provided within the IEEE Std 1076-2008, IEEE Standard VHDL Language
-- Reference Manual Standard multivalue logic package (STD_LOGIC_1164 package
-- declaration) Copyright © 2008 by IEEE.
--  
-- --------------------------------------------------------------------
--
--

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;

package mti_UX01v_logic is

  attribute builtin_subprogram: string;

  type UR_UX01_VECTOR is array (NATURAL range <>) of UX01;
  type UR_UNSIGNED_UX01_VECTOR is array (NATURAL range <>) of UX01;
  type UR_SIGNED_UX01_VECTOR is array (NATURAL range <>) of UX01;

  -------------------------------------------------------------------    
  -- resolution function
  -------------------------------------------------------------------    
  function resolve_ux01 (s : UR_UX01_VECTOR) return UX01;

  subtype UX01_VECTOR is (resolve_ux01) UR_UX01_VECTOR;
  subtype UNSIGNED_UX01_VECTOR is (resolve_ux01) UR_UNSIGNED_UX01_VECTOR;
  subtype SIGNED_UX01_VECTOR is (resolve_ux01) UR_SIGNED_UX01_VECTOR;

  function "=" (l : UR_UX01_VECTOR; r : UR_UX01_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
      "=" [UR_UX01_VECTOR, UR_UX01_VECTOR return BOOLEAN]
	  : function is "mti_ux01v_eq";
  function "/=" (l : UR_UX01_VECTOR; r : UR_UX01_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
      "/=" [UR_UX01_VECTOR, UR_UX01_VECTOR return BOOLEAN]
	  : function is "mti_ux01v_neq";

  function "&" (l : UR_UX01_VECTOR; r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "&"[UR_UX01_VECTOR, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_concat_vv";
  function "&" (l : UX01; r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "&"[UX01, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_concat_cv";
  function "&" (l : UR_UX01_VECTOR; r : UX01) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "&"[UR_UX01_VECTOR, UX01 return UR_UX01_VECTOR]
	  : function is "mti_ux01v_concat_vc";
  function "&" (l : UX01; r : UX01) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "&"[UX01, UX01 return UR_UX01_VECTOR]
	  : function is "mti_ux01v_concat_cc";

 -------------------------------------------------------------------    
  -- vectorized overloaded logical operators
  -------------------------------------------------------------------    
  function "and"  (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "and"[UR_UX01_VECTOR, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_and_vv";
  function "and"  (l : UR_UX01_VECTOR; r : UX01) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "and" [UR_UX01_VECTOR, UX01 return UR_UX01_VECTOR]
	  : function is "mti_ux01v_and_vc";
  function "and"  (l : UX01; r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "and" [UX01, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_and_cv";
  function "and"  (l : UR_UX01_VECTOR) return UX01;
    attribute builtin_subprogram of
      "and" [UR_UX01_VECTOR return UX01]
	  : function is "mti_ux01v_and_v";

  function "or"   (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "or"[UR_UX01_VECTOR, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_or_vv";
  function "or"   (l : UR_UX01_VECTOR; r : UX01) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "or" [UR_UX01_VECTOR, UX01 return UR_UX01_VECTOR]
	  : function is "mti_ux01v_or_vc";
  function "or"   (l : UX01; r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "or" [UX01, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_or_cv";
  function "or"  (l : UR_UX01_VECTOR) return UX01;
    attribute builtin_subprogram of
      "or" [UR_UX01_VECTOR return UX01]
	  : function is "mti_ux01v_or_v";

  function "xor"  (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "xor"[UR_UX01_VECTOR, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_xor_vv";
  function "xor"   (l : UR_UX01_VECTOR; r : UX01) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "xor" [UR_UX01_VECTOR, UX01 return UR_UX01_VECTOR]
	  : function is "mti_ux01v_xor_vc";
  function "xor"   (l : UX01; r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "xor" [UX01, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_xor_cv";
  function "xor"  (l : UR_UX01_VECTOR) return UX01;
    attribute builtin_subprogram of
      "xor" [UR_UX01_VECTOR return UX01]
	  : function is "mti_ux01v_xor_v";

  function "nand" (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "nand"[UR_UX01_VECTOR, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_nand_vv";
  function "nand" (l : UR_UX01_VECTOR; r : UX01) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "nand" [UR_UX01_VECTOR, UX01 return UR_UX01_VECTOR]
	  : function is "mti_ux01v_nand_vc";
  function "nand" (l : UX01; r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "nand" [UX01, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_nand_cv";
  function "nand" (l : UR_UX01_VECTOR) return UX01;
    attribute builtin_subprogram of
      "nand" [UR_UX01_VECTOR return UX01]
	  : function is "mti_ux01v_nand_v";

  function "nor"  (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "nor"[UR_UX01_VECTOR, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_nor_vv";
  function "nor" (l : UR_UX01_VECTOR; r : UX01) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "nor" [UR_UX01_VECTOR, UX01 return UR_UX01_VECTOR]
	  : function is "mti_ux01v_nor_vc";
  function "nor" (l : UX01; r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "nor" [UX01, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_nor_cv";
  function "nor" (l : UR_UX01_VECTOR) return UX01;
    attribute builtin_subprogram of
      "nor" [UR_UX01_VECTOR return UX01]
	  : function is "mti_ux01v_nor_v";

  function "xnor" (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "xnor"[UR_UX01_VECTOR, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_xnor_vv";
  function "xnor" (l : UR_UX01_VECTOR; r : UX01) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "xnor" [UR_UX01_VECTOR, UX01 return UR_UX01_VECTOR]
	  : function is "mti_ux01v_xnor_vc";
  function "xnor" (l : UX01; r : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "xnor" [UX01, UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_xnor_cv";
  function "xnor" (l : UR_UX01_VECTOR) return UX01;
    attribute builtin_subprogram of
      "xnor" [UR_UX01_VECTOR return UX01]
	  : function is "mti_ux01v_xnor_v";

  function "not"  (l    : UR_UX01_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "not"[UR_UX01_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_ux01v_not_v";

  -------------------------------------------------------------------
  -- shift operators
  -------------------------------------------------------------------

  function "sll" (l : UR_UX01_VECTOR; r : INTEGER) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "sll"[UR_UX01_VECTOR, INTEGER return UR_UX01_VECTOR]
	  : function is "mti_ux01v_sll";
  function "srl" (l : UR_UX01_VECTOR; r : INTEGER) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "srl"[UR_UX01_VECTOR, INTEGER return UR_UX01_VECTOR]
	  : function is "mti_ux01v_srl";
  function "rol" (l : UR_UX01_VECTOR; r : INTEGER) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "rol"[UR_UX01_VECTOR, INTEGER return UR_UX01_VECTOR]
	  : function is "mti_ux01v_rol";
  function "ror" (l : UR_UX01_VECTOR; r : INTEGER) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      "ror"[UR_UX01_VECTOR, INTEGER return UR_UX01_VECTOR]
	  : function is "mti_ux01v_ror";

  -------------------------------------------------------------------
  -- textio functions
  -------------------------------------------------------------------
  procedure WRITE (L         : inout LINE; VALUE : in UR_UX01_VECTOR;
                   JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);
  alias BWRITE is WRITE [LINE, UR_UX01_VECTOR, SIDE, WIDTH];
  alias BINARY_WRITE is WRITE [LINE, UR_UX01_VECTOR, SIDE, WIDTH];
  
  procedure OWRITE (L         : inout LINE; VALUE : in UR_UX01_VECTOR;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);
  alias OCTAL_WRITE is OWRITE [LINE, UR_UX01_VECTOR, SIDE, WIDTH];
  
  procedure HWRITE (L         : inout LINE; VALUE : in UR_UX01_VECTOR;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);
  alias HEX_WRITE is HWRITE [LINE, UR_UX01_VECTOR, SIDE, WIDTH];

  -------------------------------------------------------------------
  -- conversion functions
  -------------------------------------------------------------------
  function To_bitvector (s : UR_UX01_VECTOR; xmap : BIT := '0') return BIT_VECTOR;

  function TO_01Vector (s : BIT_VECTOR; xmap : UX01 := '0')
    return UR_UX01_VECTOR;
  function TO_01Vector (s : UR_UX01_VECTOR; xmap : UX01 := '0')
    return UR_UX01_VECTOR;

  function To_X01Vector (b : BIT_VECTOR) return UR_UX01_VECTOR;
  function To_X01Vector (s : UR_UX01_VECTOR) return UR_UX01_VECTOR;

  function To_UX01Vector (b : BIT_VECTOR) return UX01_VECTOR;
  function To_UX01Vector (s : UR_UX01_VECTOR) return UX01_VECTOR;
  function To_UX01Vector (i : integer; len : natural) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      To_UX01Vector [INTEGER, INTEGER return UR_UX01_VECTOR]
	  : function is "mti_int_to_ux01v";
  function To_UX01Vector (s : STD_ULOGIC_VECTOR; xmap : STD_LOGIC) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
      To_UX01Vector [STD_ULOGIC_VECTOR, STD_LOGIC return UR_UX01_VECTOR]
	  : function is "mti_slv_to_ux01v_u";

  function To_StdLogicVector (s : UR_UX01_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
      To_StdLogicVector [UR_UX01_VECTOR return STD_ULOGIC_VECTOR]
	  : function is "mti_ux01v_to_slv";

  function To_Integer (s : UR_UNSIGNED_UX01_VECTOR) return INTEGER;
    attribute builtin_subprogram of
      To_Integer [UR_UNSIGNED_UX01_VECTOR return INTEGER]
	  : function is "mti_ux01v_to_unsigned_int";
  function To_Integer (s : UR_SIGNED_UX01_VECTOR) return INTEGER;
    attribute builtin_subprogram of
      To_Integer [UR_SIGNED_UX01_VECTOR return INTEGER]
	  : function is "mti_ux01v_to_signed_int";

  function To_Unsigned (s : UR_UX01_VECTOR) return UR_UNSIGNED_UX01_VECTOR;
  function To_Signed   (s : UR_UX01_VECTOR) return UR_SIGNED_UX01_VECTOR;

  function To_Unsigned (i : integer; len : natural) return UR_UNSIGNED_UX01_VECTOR;
  function To_Signed   (i : integer; len : natural) return UR_SIGNED_UX01_VECTOR;

  function Convert_Std_Logic_Vector(s : STD_ULOGIC_VECTOR) return UR_UX01_VECTOR;
    attribute builtin_subprogram of
	  Convert_Std_Logic_Vector [STD_ULOGIC_VECTOR return UR_UX01_VECTOR]
	  : function is "mti_slv_to_ux01v";
  function Convert_UX01_Vector(s : UR_UX01_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
	  Convert_UX01_Vector [UR_UX01_VECTOR return STD_ULOGIC_VECTOR]
	  : function is "mti_ux01v_to_slv";
  -------------------------------------------------------------------    
  -- object contains an unknown
  -------------------------------------------------------------------    
  function Is_X (s : UR_UX01_VECTOR) return BOOLEAN;

end package mti_UX01v_logic;

-----------------------------------------------------------------------

package body mti_UX01v_logic is
  -------------------------------------------------------------------    
  -- local types
  -------------------------------------------------------------------    
  type logic_UX01_1d is array (UX01) of UX01;
  type logic_UX01_table is array(UX01, UX01) of UX01;

  -------------------------------------------------------------------    
  -- resolution function
  -------------------------------------------------------------------    
  constant resolution_table : logic_UX01_table := (
    --      ---------------------------------------------------------
    --      |  U    X    0    1        |   |  
    --      ---------------------------------------------------------
             ('U', 'U', 'U', 'U'),  -- | U |
             ('U', 'X', 'X', 'X'),  -- | X |
             ('U', 'X', '0', 'X'),  -- | 0 |
             ('U', 'X', 'X', '1')   -- | 1 |
             );

  function resolve_ux01 (s : UR_UX01_VECTOR) return UX01 is
    variable result : UX01;
  begin
    if (s'length = 1) then return s(s'low);
    else
      for i in s'range loop
        result := resolution_table(result, s(i));
      end loop;
    end if;
    return result;
  end function resolve_ux01;

  function "=" (l : UR_UX01_VECTOR; r : UR_UX01_VECTOR) return BOOLEAN is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
	variable lx, rx : UX01;
  begin
    if (l'length /= r'length) then
      return false;
    end if;
    for i in lv'range loop
		lx := lv(i);
		rx := rv(i);
      if (not (lx = rx)) then
	    return false;
	  end if;
    end loop;
    return true;
  end function "=";

  function "/=" (l : UR_UX01_VECTOR; r : UR_UX01_VECTOR) return BOOLEAN is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
  begin
  	return not (l = r);
  end function "/=";

  function "&" (l : UR_UX01_VECTOR; r : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    alias rv        : UR_UX01_VECTOR (l'length + 1 to l'length + r'length) is r;
	variable result : UR_UX01_VECTOR (1 to l'length + r'length);
  begin
  	for i in lv'range loop
	  result(i) := lv(i);
	end loop;
	for i in rv'range loop
	  result(i) := rv(i);
	end loop;
	return result;
  end function "&";

  function "&" (l : UX01; r : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias rv        : UR_UX01_VECTOR (2 to 1 + r'length) is r;
	variable result : UR_UX01_VECTOR (1 to 1 + r'length);
  begin
  	result(1) := l;
	for i in rv'range loop
	  result(i) := rv(i);
	end loop;
	return result;
  end function "&";

  function "&" (l : UR_UX01_VECTOR; r : UX01) return UR_UX01_VECTOR is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
	variable result : UR_UX01_VECTOR (1 to 1 + l'length);
  begin
    for i in lv'range loop
	  result(i) := lv(i);
	end loop;
	result(1 + l'length) := r;
	return result;
  end function "&";

  function "&" (l : UX01; r : UX01) return UR_UX01_VECTOR is
    variable result : UR_UX01_VECTOR (1 to 2);
  begin
    result(1) := l;
	result(2) := r;
	return result;
  end function "&";

  -------------------------------------------------------------------    
  -- tables for logical operations
  -------------------------------------------------------------------    

  -- truth table for "and" function
  constant and_table : logic_UX01_table := (
    --      ----------------------------------------------------
    --      |  U    X    0    1        |   |  
    --      ----------------------------------------------------
             ('U', 'U', '0', 'U'),  -- | U |
             ('U', 'X', '0', 'X'),  -- | X |
             ('0', '0', '0', '0'),  -- | 0 |
             ('U', 'X', '0', '1')   -- | 1 |
             );

  -- truth table for "or" function
  constant or_table : logic_UX01_table := (
    --      ----------------------------------------------------
    --      |  U    X    0    1        |   |  
    --      ----------------------------------------------------
             ('U', 'U', 'U', '1'),  -- | U |
             ('U', 'X', 'X', '1'),  -- | X |
             ('U', 'X', '0', '1'),  -- | 0 |
             ('1', '1', '1', '1')   -- | 1 |
             );

  -- truth table for "xor" function
  constant xor_table : logic_UX01_table := (
    --      ----------------------------------------------------
    --      |  U    X    0    1        |   |  
    --      ----------------------------------------------------
             ('U', 'U', 'U', 'U'),  -- | U |
             ('U', 'X', 'X', 'X'),  -- | X |
             ('U', 'X', '0', '1'),  -- | 0 |
             ('U', 'X', '1', '0')   -- | 1 |
             );

  -- truth table for "not" function
  constant not_table : logic_UX01_1d :=
    --  -------------------------------------------------
    --  |   U    X    0    1    |
    --  -------------------------------------------------
          ('U', 'X', '1', '0');

  -------------------------------------------------------------------    
  -- and
  -------------------------------------------------------------------    
  function "and" (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to l'length);
	variable x : UX01;
  begin
    assert (l'length = r'length)
      report "MTI_UX01V_LOGIC.""and"": "
      & "arguments of overloaded 'and' operator are not of the same length"
      severity failure;
    for i in result'range loop
      x := and_table (lv(i), rv(i));
      result(i) := x;
    end loop;
    return result;
  end function "and";
  -------------------------------------------------------------------    
  -- nand
  -------------------------------------------------------------------    
  function "nand" (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    assert (l'length = r'length)
      report "MTI_UX01V_LOGIC.""nand"": "
      & "arguments of overloaded 'nand' operator are not of the same length"
      severity failure;
    for i in result'range loop
      result(i) := not_table(and_table (lv(i), rv(i)));
    end loop;
    return result;
  end function "nand";
  -------------------------------------------------------------------    
  -- or
  -------------------------------------------------------------------    
  function "or" (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    if (l'length /= r'length) then
      assert false
        report "MTI_UX01V_LOGIC.""or"": "
        & "arguments of overloaded 'or' operator are not of the same length"
        severity failure;
    else
      for i in result'range loop
        result(i) := or_table (lv(i), rv(i));
      end loop;
    end if;
    return result;
  end function "or";
  -------------------------------------------------------------------    
  -- nor
  -------------------------------------------------------------------    
  function "nor" (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    if (l'length /= r'length) then
      assert false
        report "MTI_UX01V_LOGIC.""nor"": "
        & "arguments of overloaded 'nor' operator are not of the same length"
        severity failure;
    else
      for i in result'range loop
        result(i) := not_table(or_table (lv(i), rv(i)));
      end loop;
    end if;
    return result;
  end function "nor";
  ---------------------------------------------------------------------
  -- xor
  -------------------------------------------------------------------    
  function "xor" (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    if (l'length /= r'length) then
      assert false
        report "MTI_UX01V_LOGIC.""xor"": "
        & "arguments of overloaded 'xor' operator are not of the same length"
        severity failure;
    else
      for i in result'range loop
        result(i) := xor_table (lv(i), rv(i));
      end loop;
    end if;
    return result;
  end function "xor";
  -------------------------------------------------------------------    
  -- xnor
  -------------------------------------------------------------------    
  function "xnor" (l, r : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    if (l'length /= r'length) then
      assert false
        report "MTI_UX01V_LOGIC.""xnor"": "
        & "arguments of overloaded 'xnor' operator are not of the same length"
        severity failure;
    else
      for i in result'range loop
        result(i) := not_table(xor_table (lv(i), rv(i)));
      end loop;
    end if;
    return result;
  end function "xnor";
  -------------------------------------------------------------------    
  -- not
  -------------------------------------------------------------------    
  function "not" (l : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length) := (others => 'X');
  begin
    for i in result'range loop
      result(i) := not_table(lv(i));
    end loop;
    return result;
  end function "not";

  -------------------------------------------------------------------
  -- and
  -------------------------------------------------------------------
  function "and" (l : UR_UX01_VECTOR; r : UX01)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    for i in result'range loop
      result(i) := and_table (lv(i), r);
    end loop;
    return result;
  end function "and";
  -------------------------------------------------------------------
  function "and" (l : UX01; r : UR_UX01_VECTOR)
    return UR_UX01_VECTOR
  is
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to r'length);
  begin
    for i in result'range loop
      result(i) := and_table (l, rv(i));
    end loop;
    return result;
  end function "and";
  -------------------------------------------------------------------
  function "and" (l : UR_UX01_VECTOR) return UX01 is
    variable result : UX01 := '1';
  begin
    for i in l'reverse_range loop
      result := and_table (l(i), result);
    end loop;
    return result;
  end function "and";

  -------------------------------------------------------------------
  -- nand
  -------------------------------------------------------------------
  function "nand" (l : UR_UX01_VECTOR; r : UX01)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    for i in result'range loop
      result(i) := not_table(and_table (lv(i), r));
    end loop;
    return result;
  end function "nand";
  -------------------------------------------------------------------
  function "nand" (l : UX01; r : UR_UX01_VECTOR)
    return UR_UX01_VECTOR
  is
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to r'length);
  begin
    for i in result'range loop
      result(i) := not_table(and_table (l, rv(i)));
    end loop;
    return result;
  end function "nand";

  -------------------------------------------------------------------
  -- or
  -------------------------------------------------------------------
  function "or" (l : UR_UX01_VECTOR; r : UX01)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    for i in result'range loop
      result(i) := or_table (lv(i), r);
    end loop;
    return result;
  end function "or";
  -------------------------------------------------------------------
  function "or" (l : UX01; r : UR_UX01_VECTOR)
    return UR_UX01_VECTOR
  is
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to r'length);
  begin
    for i in result'range loop
      result(i) := or_table (l, rv(i));
    end loop;
    return result;
  end function "or";

  -------------------------------------------------------------------
  -- nor
  -------------------------------------------------------------------
  function "nor" (l : UR_UX01_VECTOR; r : UX01)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    for i in result'range loop
      result(i) := not_table(or_table (lv(i), r));
    end loop;
    return result;
  end function "nor";
  -------------------------------------------------------------------
  function "nor" (l : UX01; r : UR_UX01_VECTOR)
    return UR_UX01_VECTOR
  is
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to r'length);
  begin
    for i in result'range loop
      result(i) := not_table(or_table (l, rv(i)));
    end loop;
    return result;
  end function "nor";

  -------------------------------------------------------------------
  -- xor
  -------------------------------------------------------------------
  function "xor" (l : UR_UX01_VECTOR; r : UX01)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    for i in result'range loop
      result(i) := xor_table (lv(i), r);
    end loop;
    return result;
  end function "xor";
  -------------------------------------------------------------------
  function "xor" (l : UX01; r : UR_UX01_VECTOR)
    return UR_UX01_VECTOR
  is
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to r'length);
  begin
    for i in result'range loop
      result(i) := xor_table (l, rv(i));
    end loop;
    return result;
  end function "xor";

  -------------------------------------------------------------------
  -- xnor
  -------------------------------------------------------------------
  function "xnor" (l : UR_UX01_VECTOR; r : UX01)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length);
  begin
    for i in result'range loop
      result(i) := not_table(xor_table (lv(i), r));
    end loop;
    return result;
  end function "xnor";
  -------------------------------------------------------------------
  function "xnor" (l : UX01; r : UR_UX01_VECTOR)
    return UR_UX01_VECTOR
  is
    alias rv        : UR_UX01_VECTOR (1 to r'length) is r;
    variable result : UR_UX01_VECTOR (1 to r'length);
  begin
    for i in result'range loop
      result(i) := not_table(xor_table (l, rv(i)));
    end loop;
    return result;
  end function "xnor";
  -------------------------------------------------------------------
  -- nand
  -------------------------------------------------------------------
  function "nand" (l : UR_UX01_VECTOR) return UX01 is
    variable result : UX01 := '1';
  begin
    for i in l'reverse_range loop
      result := and_table (l(i), result);
    end loop;
    return not_table(result);
  end function "nand";

  -------------------------------------------------------------------
  -- or
  -------------------------------------------------------------------
  function "or" (l : UR_UX01_VECTOR) return UX01 is
    variable result : UX01 := '0';
  begin
    for i in l'reverse_range loop
      result := or_table (l(i), result);
    end loop;
    return result;
  end function "or";

  -------------------------------------------------------------------
  -- nor
  -------------------------------------------------------------------
  function "nor" (l : UR_UX01_VECTOR) return UX01 is
    variable result : UX01 := '0';
  begin
    for i in l'reverse_range loop
      result := or_table (l(i), result);
    end loop;
    return not_table(result);
  end function "nor";

  -------------------------------------------------------------------
  -- xor
  -------------------------------------------------------------------
  function "xor" (l : UR_UX01_VECTOR) return UX01 is
    variable result : UX01 := '0';
  begin
    for i in l'reverse_range loop
      result := xor_table (l(i), result);
    end loop;
    return result;
  end function "xor";

  -------------------------------------------------------------------
  -- xnor
  -------------------------------------------------------------------
  function "xnor" (l : UR_UX01_VECTOR) return UX01 is
    variable result : UX01 := '0';
  begin
    for i in l'reverse_range loop
      result := xor_table (l(i), result);
    end loop;
    return not_table(result);
  end function "xnor";

  -------------------------------------------------------------------
  -- shift operators
  -------------------------------------------------------------------

  -------------------------------------------------------------------
  -- sll
  -------------------------------------------------------------------
  function "sll" (l : UR_UX01_VECTOR; r : INTEGER)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length) := (others => '0');
  begin
    if r >= 0 then
      result(1 to l'length - r) := lv(r + 1 to l'length);
    else
      result := l srl -r;
    end if;
    return result;
  end function "sll";

  -------------------------------------------------------------------
  -- srl
  -------------------------------------------------------------------
  function "srl" (l : UR_UX01_VECTOR; r : INTEGER)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length) := (others => '0');
  begin
    if r >= 0 then
      result(r + 1 to l'length) := lv(1 to l'length - r);
    else
      result := l sll -r;
    end if;
    return result;
  end function "srl";

  -------------------------------------------------------------------
  -- rol
  -------------------------------------------------------------------
  function "rol" (l : UR_UX01_VECTOR; r : INTEGER)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length);
    constant rm     : INTEGER := r mod l'length;
  begin
    if r >= 0 then
      result(1 to l'length - rm)            := lv(rm + 1 to l'length);
      result(l'length - rm + 1 to l'length) := lv(1 to rm);
    else
      result := l ror -r;
    end if;
    return result;
  end function "rol";

  -------------------------------------------------------------------
  -- ror
  -------------------------------------------------------------------
  function "ror" (l : UR_UX01_VECTOR; r : INTEGER)
    return UR_UX01_VECTOR
  is
    alias lv        : UR_UX01_VECTOR (1 to l'length) is l;
    variable result : UR_UX01_VECTOR (1 to l'length) := (others => '0');
    constant rm     : INTEGER := r mod l'length;
  begin
    if r >= 0 then
      result(rm + 1 to l'length) := lv(1 to l'length - rm);
      result(1 to rm)            := lv(l'length - rm + 1 to l'length);
    else
      result := l rol -r;
    end if;
    return result;
  end function "ror";

  -------------------------------------------------------------------
  -- textio procedures
  -------------------------------------------------------------------
  procedure WRITE (L         : inout LINE; VALUE : in UR_UX01_VECTOR;
                   JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0) is
  begin
  	WRITE(L, To_StdLogicVector(VALUE), JUSTIFIED, FIELD);
  end procedure WRITE;

  procedure OWRITE (L         : inout LINE; VALUE : in UR_UX01_VECTOR;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0) is
  begin
  	OWRITE(L, To_StdLogicVector(VALUE), JUSTIFIED, FIELD);
  end procedure OWRITE;
  
  procedure HWRITE (L         : inout LINE; VALUE : in UR_UX01_VECTOR;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0) is
  begin
  	HWRITE(L, To_StdLogicVector(VALUE), JUSTIFIED, FIELD);
  end procedure HWRITE;

  -------------------------------------------------------------------    
  -- conversion tables
  -------------------------------------------------------------------    
  type logic_x01_table is array (UX01) of X01;
  ----------------------------------------------------------
  -- table name : cvt_to_x01
  --
  -- parameters :
  --        in  :  std_ulogic  -- some logic value
  -- returns    :  x01         -- state value of logic value
  -- purpose    :  to convert state-strength to state only
  --                  
  -- example    : if (cvt_to_x01 (input_signal) = '1' ) then ...
  --
  ----------------------------------------------------------
  constant cvt_to_x01 : logic_x01_table := (
    'X',                                -- 'U'
    'X',                                -- 'X'
    '0',                                -- '0'
    '1'                                 -- '1
    );

  -------------------------------------------------------------------    
  -- conversion functions
  -------------------------------------------------------------------    
  function To_bitvector (s : UR_UX01_VECTOR; xmap : BIT := '0')
    return BIT_VECTOR
  is
    alias sv        : UR_UX01_VECTOR (s'length-1 downto 0) is s;
    variable result : BIT_VECTOR (s'length-1 downto 0);
  begin
    for i in result'range loop
      case sv(i) is
        when '0' => result(i) := '0';
        when '1' => result(i) := '1';
        when others    => result(i) := xmap;
      end case;
    end loop;
    return result;
  end function To_bitvector;
  --------------------------------------------------------------------
  -------------------------------------------------------------------    
  -- strength strippers and type convertors
  -------------------------------------------------------------------    
  -- to_01
  -------------------------------------------------------------------    
  function TO_01Vector (s : UR_UX01_VECTOR; xmap : UX01 := '0')
    return UR_UX01_VECTOR
  is
    variable RESULT      : UR_UX01_VECTOR(s'length-1 downto 0);
    variable BAD_ELEMENT : BOOLEAN := false;
    alias XS             : UR_UX01_VECTOR(s'length-1 downto 0) is s;
  begin
    for I in RESULT'range loop
      case XS(I) is
        when '0' => RESULT(I)   := '0';
        when '1' => RESULT(I)   := '1';
        when others    => BAD_ELEMENT := true;
      end case;
    end loop;
    if BAD_ELEMENT then
      for I in RESULT'range loop
        RESULT(I) := XMAP;              -- standard fixup
      end loop;
    end if;
    return RESULT;
  end function TO_01Vector;
  -------------------------------------------------------------------    
  function TO_01Vector (s : BIT_VECTOR; xmap : UX01 := '0')
    return UR_UX01_VECTOR
  is
    variable RESULT : UR_UX01_VECTOR(s'length-1 downto 0);
    alias XS        : BIT_VECTOR(s'length-1 downto 0) is s;
  begin
    for I in RESULT'range loop
      case XS(I) is
        when '0' => RESULT(I) := '0';
        when '1' => RESULT(I) := '1';
      end case;
    end loop;
    return RESULT;
  end function TO_01Vector;
  -------------------------------------------------------------------    
  -- to_x01
  -------------------------------------------------------------------    
  function To_X01Vector (s : UR_UX01_VECTOR) return UR_UX01_VECTOR is
    alias sv        : UR_UX01_VECTOR (1 to s'length) is s;
    variable result : UR_UX01_VECTOR (1 to s'length);
  begin
    for i in result'range loop
      result(i) := cvt_to_x01 (sv(i));
    end loop;
    return result;
  end function To_X01Vector;
  --------------------------------------------------------------------
  function To_X01Vector (b : BIT_VECTOR) return UR_UX01_VECTOR is
    alias bv        : BIT_VECTOR (1 to b'length) is b;
    variable result : UR_UX01_VECTOR (1 to b'length);
  begin
    for i in result'range loop
      case bv(i) is
        when '0' => result(i) := '0';
        when '1' => result(i) := '1';
      end case;
    end loop;
    return result;
  end function To_X01Vector;
  --------------------------------------------------------------------
  function To_UX01Vector (s : UR_UX01_VECTOR) return UR_UX01_VECTOR is
  begin
    return s;
  end function To_UX01Vector;
  --------------------------------------------------------------------
  function To_UX01Vector (b : BIT_VECTOR) return UR_UX01_VECTOR is
    alias bv        : BIT_VECTOR (1 to b'length) is b;
    variable result : UR_UX01_VECTOR (1 to b'length);
  begin
    for i in result'range loop
      case bv(i) is
        when '0' => result(i) := '0';
        when '1' => result(i) := '1';
      end case;
    end loop;
    return result;
  end function To_UX01Vector;
  --------------------------------------------------------------------
  function To_UX01Vector (s : STD_ULOGIC_VECTOR; xmap : STD_LOGIC) return UR_UX01_VECTOR is
    alias sv          : STD_ULOGIC_VECTOR (1 to s'length) is s;
	variable result   : UR_UX01_VECTOR (1 to s'length);
	variable emitFail : BOOLEAN;
  begin
	emitFail := (xmap < UX01'left or xmap > UX01'right);
    for i in result'range loop
	  case sv(i) is
	    when '0' => result(i) := '0';
		when '1' => result(i) := '1';
		when 'U' => result(i) := 'U';
		when 'X' => result(i) := 'X';
		when others =>
		  if (emitFail) then
			report "MTI_TO_UX01VECTOR.""To_UX01vector"": "
				 & "argument contains metavalue outside 'U', 'X', '0', '1'"
				severity failure;
		  else
			result(i) := xmap;
		  end if;
	  end case;
	end loop;
	return result;
  end function To_UX01Vector;
  --------------------------------------------------------------------
  function To_UX01Vector(i : integer; len : natural) return UR_UX01_VECTOR is
    variable result : UR_UX01_VECTOR(1 to len) := (others => '0');
	variable isneg : boolean := false;
	variable ipos, j : natural;
	variable carry : boolean;
  begin
    if (i < 0) then
	  isneg := true;
	  ipos := -i;
	else
	  ipos := i;
	end if;
	while (ipos /= 0) loop
	  if (ipos mod 2 /= 0) then
		result(ipos) := '1';
	  end if;
	  ipos := ipos / 2;
	end loop;
	if (isneg) then
	  result := not result;
	  carry := true;
	  for j in 1 to len loop
	    if (result(j) = '0') then
		  if (carry) then
		    result(j) := '1';
		  end if;
		  exit;
		end if;
		if (not carry) then
		  exit;
		end if;
		result(j) := '0';
	  end loop;
	end if;
	return result;
  end function To_UX01Vector;
  --------------------------------------------------------------------
  function To_StdLogicVector (s : UR_UX01_VECTOR) return STD_ULOGIC_VECTOR is
    alias sv        : UR_UX01_VECTOR (1 to s'length) is s;
	variable result : STD_ULOGIC_VECTOR (1 to s'length);
  begin
    for i in result'range loop
	  case sv(i) is
	    when '0' => result(i) := '0';
		when '1' => result(i) := '1';
		when 'U' => result(i) := 'U';
		when 'X' => result(i) := 'X';
	  end case;
	end loop;
	return result;
  end function to_StdLogicVector;
  --------------------------------------------------------------------
  function To_Integer (s : UR_UNSIGNED_UX01_VECTOR) return INTEGER is
  	variable result : natural := 0;
	variable pos : natural := 0;
  begin
	for i in s'range loop
	  result := result * 2;
	  case s(i) is
		when 'U' | 'X' =>
		  assert false
			report "MTI_UX01V_LOGIC.""To_Unsigned_Integer"": "
			& "argument contains metavalue"
			severity failure;
		when '1' =>
		  assert (pos < 32)
			report "MTI_UX01V_LOGIC.""To_Unsigned_Integer"": "
			& "bit of argument set beyond representable range"
			severity failure;
		  result := result + 1;
		when '0' => null;
	  end case;
	  pos := pos + 1;
	end loop;
	return result;
  end function To_Integer;
  --------------------------------------------------------------------
  function To_Integer (s : UR_SIGNED_UX01_VECTOR) return INTEGER is
    alias sv : UR_SIGNED_UX01_VECTOR(1 to s'length) is s;
    variable result : integer := 0;
	variable pos : natural := 0;
  begin
    if (s'length <= 31 and s(s'right) = '1') then
	  for i in 1 to 32 loop
	  	result := result * 2;
	  	if (i <= s'length) then
			case sv(i) is
			  when 'U' | 'X' =>
			    assert false
				  report "MTI_UX01V_LOGIC.""To_Signed_Integer"": "
				  & "argument contains metavalue"
				  severity failure;
			  when '1' =>
			    result := result + 1;
			  when '0' => null;
			end case;
		else
			result := result + 1;
		end if;
	  end loop;
	  return result;
	end if;
	for i in s'range loop
	  result := result * 2;
	  case s(i) is
		when 'U' | 'X' =>
		  assert false
			report "MTI_UX01V_LOGIC.""To_Signed_Integer"": "
			& "argument contains metavalue"
			severity failure;
		when '1' =>
		  assert (pos < 32)
			report "MTI_UX01V_LOGIC.""To_Signed_Integer"": "
			& "bit of argument set beyond representable range"
			severity failure;
		  result := result + 1;
		when '0' => null;
	  end case;
	  pos := pos + 1;
	end loop;
	return result;
  end function To_Integer;
  --------------------------------------------------------------------
  function To_Unsigned (s : UR_UX01_VECTOR) return UR_UNSIGNED_UX01_VECTOR is
  begin
    return UR_UNSIGNED_UX01_VECTOR(s);
  end function To_Unsigned;
  --------------------------------------------------------------------
  function To_Signed (s : UR_UX01_VECTOR) return UR_SIGNED_UX01_VECTOR is
  begin
    return UR_SIGNED_UX01_VECTOR(s);
  end function To_Signed;
  --------------------------------------------------------------------
  function To_Unsigned (i : integer; len : natural) return UR_UNSIGNED_UX01_VECTOR is
  begin
  	return To_Unsigned(To_Ux01Vector(i, len));
  end function To_Unsigned;
  --------------------------------------------------------------------
  function To_Signed (i : integer; len : natural) return UR_SIGNED_UX01_VECTOR is
  begin
  	return To_Signed(To_Ux01Vector(i, len));
  end function To_Signed;
  --------------------------------------------------------------------
  -- Conversion functions
  --------------------------------------------------------------------
  function Convert_Std_Logic_Vector(s : STD_ULOGIC_VECTOR) return UR_UX01_VECTOR is
  begin
  	return To_UX01Vector(s, 'Z');
  end function Convert_Std_Logic_Vector;
  --------------------------------------------------------------------
  function Convert_UX01_Vector(s : UR_UX01_VECTOR) return STD_ULOGIC_VECTOR is
  begin
  	return To_StdLogicVector(s);
  end function Convert_UX01_Vector;
  -------------------------------------------------------------------    
  -- object contains an unknown
  -------------------------------------------------------------------    
  function Is_X (s : UR_UX01_VECTOR) return BOOLEAN is
  begin
    for i in s'range loop
      case s(i) is
        when 'U' | 'X' => return true;
        when others                      => null;
      end case;
    end loop;
    return false;
  end function Is_X;
  --------------------------------------------------------------------

end package body mti_UX01v_logic;
