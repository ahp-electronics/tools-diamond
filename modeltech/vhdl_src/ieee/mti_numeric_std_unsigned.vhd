-- --------------------------------------------------------------------
--
-- Copyright � 2008 by IEEE.
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
--   Title     :  Standard VHDL Synthesis Packages
--             :  (NUMERIC_STD_UNSIGNED package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  Accellera VHDL-TC, and IEEE P1076 Working Group
--             :
--   Purpose   :  This package defines numeric types and arithmetic functions
--             :  for use with synthesis tools. Values of type STD_ULOGIC_VECTOR
--             :  are interpreted as unsigned numbers in vector form.
--             :  The leftmost bit is treated as the most significant bit.
--             :  This package contains overloaded arithmetic operators on
--             :  the STD_ULOGIC_VECTOR type. The package also contains
--             :  useful type conversions functions, clock detection
--             :  functions, and other utility functions.
--             :
--             :  If any argument to a function is a null array, a null array
--             :  is returned (exceptions, if any, are noted individually).
--
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

library IEEE;
use IEEE.STD_LOGIC_1164.all;
package NUMERIC_STD_UNSIGNED is
  constant CopyRightNotice : STRING :=
    "Copyright 2008 IEEE. All rights reserved.";

  attribute builtin_subprogram: string;

  -- Id: A.3
  function "+" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_plus_uuu";
  -- Result subtype: STD_ULOGIC_VECTOR(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0).
  -- Result: Adds two UNSIGNED vectors that may be of different lengths.

  -- Id: A.3R
  function "+"(L : STD_ULOGIC_VECTOR; R : STD_ULOGIC) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_ULOGIC_VECTOR, STD_ULOGIC return STD_ULOGIC_VECTOR]: function is "numstd_plus_uxu";
  -- Result subtype: STD_ULOGIC_VECTOR(L'LENGTH-1 downto 0)
  -- Result: Similar to A.3 where R is a one bit STD_ULOGIC_VECTOR

  -- Id: A.3L
  function "+"(L : STD_ULOGIC; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_ULOGIC, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_plus_xuu";
  -- Result subtype: STD_ULOGIC_VECTOR(R'LENGTH-1 downto 0)
  -- Result: Similar to A.3 where L is a one bit UNSIGNED

  -- Id: A.5
  function "+" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "numstd_plus_unu";
  -- Result subtype: STD_ULOGIC_VECTOR(L'LENGTH-1 downto 0).
  -- Result: Adds an UNSIGNED vector, L, with a non-negative INTEGER, R.

  -- Id: A.6
  function "+" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "+"[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_plus_nuu";
  -- Result subtype: STD_ULOGIC_VECTOR(R'LENGTH-1 downto 0).
  -- Result: Adds a non-negative INTEGER, L, with an UNSIGNED vector, R.

  --============================================================================

  -- Id: A.9
  function "-" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_minus_uuu";
  -- Result subtype: UNSIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0).
  -- Result: Subtracts two UNSIGNED vectors that may be of different lengths.

  -- Id: A.9R
  function "-"(L : STD_ULOGIC_VECTOR; R : STD_ULOGIC) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_ULOGIC_VECTOR, STD_ULOGIC return STD_ULOGIC_VECTOR]: function is "numstd_minus_uxu";
  -- Result subtype: STD_ULOGIC_VECTOR(L'LENGTH-1 downto 0)
  -- Result: Similar to A.9 where R is a one bit UNSIGNED

  -- Id: A.9L
  function "-"(L : STD_ULOGIC; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_ULOGIC, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_minus_xuu";
  -- Result subtype: STD_ULOGIC_VECTOR(R'LENGTH-1 downto 0)
  -- Result: Similar to A.9 where L is a one bit UNSIGNED

  -- Id: A.11
  function "-" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "numstd_minus_unu";
  -- Result subtype: STD_ULOGIC_VECTOR(L'LENGTH-1 downto 0).
  -- Result: Subtracts a non-negative INTEGER, R, from an UNSIGNED vector, L.

  -- Id: A.12
  function "-" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "-"[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_minus_nuu";
  -- Result subtype: STD_ULOGIC_VECTOR(R'LENGTH-1 downto 0).
  -- Result: Subtracts an UNSIGNED vector, R, from a non-negative INTEGER, L.

  --============================================================================

  -- Id: A.15
  function "*" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "*"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_mult_uuu";
  -- Result subtype: STD_ULOGIC_VECTOR((L'LENGTH+R'LENGTH-1) downto 0).
  -- Result: Performs the multiplication operation on two UNSIGNED vectors
  --         that may possibly be of different lengths.

  -- Id: A.17
  function "*" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "*"[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "numstd_mult_unu";
  -- Result subtype: STD_ULOGIC_VECTOR((L'LENGTH+L'LENGTH-1) downto 0).
  -- Result: Multiplies an UNSIGNED vector, L, with a non-negative
  --         INTEGER, R. R is converted to an UNSIGNED vector of
  --         SIZE L'LENGTH before multiplication.

  -- Id: A.18
  function "*" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "*"[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_mult_nuu";
  -- Result subtype: STD_ULOGIC_VECTOR((R'LENGTH+R'LENGTH-1) downto 0).
  -- Result: Multiplies an UNSIGNED vector, R, with a non-negative
  --         INTEGER, L. L is converted to an UNSIGNED vector of
  --         SIZE R'LENGTH before multiplication.

  --============================================================================
  --
  -- NOTE: If second argument is zero for "/" operator, a severity level
  --       of ERROR is issued.

  -- Id: A.21
  function "/" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "/"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_div_uuu";
  -- Result subtype: STD_ULOGIC_VECTOR(L'LENGTH-1 downto 0)
  -- Result: Divides an UNSIGNED vector, L, by another UNSIGNED vector, R.

  -- Id: A.23
  function "/" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "/"[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "numstd_div_unu";
  -- Result subtype: STD_ULOGIC_VECTOR(L'LENGTH-1 downto 0)
  -- Result: Divides an UNSIGNED vector, L, by a non-negative INTEGER, R.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.24
  function "/" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "/"[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_div_nuu";
  -- Result subtype: STD_ULOGIC_VECTOR(R'LENGTH-1 downto 0)
  -- Result: Divides a non-negative INTEGER, L, by an UNSIGNED vector, R.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  --============================================================================
  --
  -- NOTE: If second argument is zero for "rem" operator, a severity level
  --       of ERROR is issued.

  -- Id: A.27
  function "rem" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "REM"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_rem_uuu";
  -- Result subtype: STD_ULOGIC_VECTOR(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L and R are UNSIGNED vectors.

  -- Id: A.29
  function "rem" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "REM"[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "numstd_rem_unu";
  -- Result subtype: STD_ULOGIC_VECTOR(L'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L is an UNSIGNED vector and R is a
  --         non-negative INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.30
  function "rem" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "REM"[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_rem_nuu";
  -- Result subtype: STD_ULOGIC_VECTOR(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where R is an UNSIGNED vector and L is a
  --         non-negative INTEGER.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  --============================================================================
  --
  -- NOTE: If second argument is zero for "mod" operator, a severity level
  --       of ERROR is issued.

  -- Id: A.33
  function "mod" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "MOD"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_mod_uuu";
  -- Result subtype: STD_ULOGIC_VECTOR(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L and R are UNSIGNED vectors.

  -- Id: A.35
  function "mod" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "MOD"[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "numstd_mod_unu";
  -- Result subtype: STD_ULOGIC_VECTOR(L'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L is an UNSIGNED vector and R
  --         is a non-negative INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.36
  function "mod" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "MOD"[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_mod_nuu";
  -- Result subtype: STD_ULOGIC_VECTOR(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where R is an UNSIGNED vector and L
  --         is a non-negative INTEGER.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  --============================================================================
  -- Id: A.39
  function find_leftmost (ARG : STD_ULOGIC_VECTOR; Y : STD_ULOGIC) return INTEGER;
    attribute builtin_subprogram of
        FIND_LEFTMOST[STD_ULOGIC_VECTOR, STD_ULOGIC return INTEGER]: function is "numstd_findleftmost_uxi";
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  -- Id: A.41
  function find_rightmost (ARG : STD_ULOGIC_VECTOR; Y : STD_ULOGIC) return INTEGER;
    attribute builtin_subprogram of
        FIND_RIGHTMOST[STD_ULOGIC_VECTOR, STD_ULOGIC return INTEGER]: function is "numstd_findrightmost_uxi";
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  --============================================================================
  -- Comparison Operators
  --============================================================================

  -- Id: C.1
  function ">" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_gt_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.3
  function ">" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[NATURAL, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_gt_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.5
  function ">" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[STD_ULOGIC_VECTOR, NATURAL return BOOLEAN]: function is "numstd_gt_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.

  --============================================================================

  -- Id: C.7
  function "<" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_lt_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.9
  function "<" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[NATURAL, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_lt_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.11
  function "<" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[STD_ULOGIC_VECTOR, NATURAL return BOOLEAN]: function is "numstd_lt_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.

  --============================================================================

  -- Id: C.13
  function "<=" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_lte_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.15
  function "<=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[NATURAL, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_lte_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.17
  function "<=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[STD_ULOGIC_VECTOR, NATURAL return BOOLEAN]: function is "numstd_lte_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.

  --============================================================================

  -- Id: C.19
  function ">=" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_gte_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.21
  function ">=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[NATURAL, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_gte_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.23
  function ">=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[STD_ULOGIC_VECTOR, NATURAL return BOOLEAN]: function is "numstd_gte_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.

  --============================================================================

  -- Id: C.25
  function "=" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "="[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_eq_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.27
  function "=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "="[NATURAL, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_eq_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.29
  function "=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        "="[STD_ULOGIC_VECTOR, NATURAL return BOOLEAN]: function is "numstd_eq_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.

  --============================================================================

  -- Id: C.31
  function "/=" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_neq_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.33
  function "/=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[NATURAL, STD_ULOGIC_VECTOR return BOOLEAN]: function is "numstd_neq_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.35
  function "/=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[STD_ULOGIC_VECTOR, NATURAL return BOOLEAN]: function is "numstd_neq_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.

  --============================================================================

  -- Id: C.37
  function MINIMUM (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        MINIMUM[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_minimum_uuu";
  -- Result subtype: STD_ULOGIC_VECTOR
  -- Result: Returns the lesser of two UNSIGNED vectors that may be
  --         of different lengths.

  -- Id: C.39
  function MINIMUM (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        MINIMUM[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_minimum_nuu";
  -- Result subtype: STD_ULOGIC_VECTOR
  -- Result: Returns the lesser of a nonnegative INTEGER, L, and
  --         an UNSIGNED vector, R.

  -- Id: C.41
  function MINIMUM (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        MINIMUM[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "numstd_minimum_unu";
  -- Result subtype: STD_ULOGIC_VECTOR
  -- Result: Returns the lesser of an UNSIGNED vector, L, and
  --         a nonnegative INTEGER, R.

  --============================================================================

  -- Id: C.43
  function MAXIMUM (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        MAXIMUM[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_maximum_uuu";
  -- Result subtype: STD_ULOGIC_VECTOR
  -- Result: Returns the greater of two UNSIGNED vectors that may be
  --         of different lengths.

  -- Id: C.45
  function MAXIMUM (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        MAXIMUM[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_maximum_nuu";
  -- Result subtype: STD_ULOGIC_VECTOR
  -- Result: Returns the greater of a nonnegative INTEGER, L, and
  --         an UNSIGNED vector, R.

  -- Id: C.47
  function MAXIMUM (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        MAXIMUM[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "numstd_maximum_unu";
  -- Result subtype: STD_ULOGIC_VECTOR
  -- Result: Returns the greater of an UNSIGNED vector, L, and
  --         a nonnegative INTEGER, R.

  --============================================================================
  -- Id: C.49
  function "?>" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?>"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_gtq_uu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L > R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.51
  function "?>" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?>"[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_gtq_nu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L > R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.53
  function "?>" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?>"[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC]: function is "numstd_gtq_un";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L > R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  --============================================================================

  -- Id: C.55
  function "?<" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?<"[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_ltq_uu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L < R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.57
  function "?<" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?<"[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_ltq_nu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L < R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.59
  function "?<" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?<"[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC]: function is "numstd_ltq_un";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L < R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  --============================================================================

  -- Id: C.61
  function "?<=" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?<="[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_lteq_uu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L <= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.63
  function "?<=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?<="[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_lteq_nu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L <= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.65
  function "?<=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?<="[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC]: function is "numstd_lteq_un";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L <= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  --============================================================================

  -- Id: C.67
  function "?>=" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?>="[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_gteq_uu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L >= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.69
  function "?>=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?>="[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_gteq_nu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L >= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.71
  function "?>=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?>="[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC]: function is "numstd_gteq_un";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L >= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  --============================================================================

  -- Id: C.73
  function "?=" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?="[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_eqq_uu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L = R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.75
  function "?=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?="[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_eqq_nu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L = R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.77
  function "?=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?="[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC]: function is "numstd_eqq_un";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L = R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  --============================================================================

  -- Id: C.79
  function "?/=" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?/="[STD_ULOGIC_VECTOR, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_neqq_uu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L /= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.81
  function "?/=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?/="[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC]: function is "numstd_neqq_nu";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L /= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.83
  function "?/=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC;
    attribute builtin_subprogram of
        "?/="[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC]: function is "numstd_neqq_un";
  -- Result subtype: STD_ULOGIC
  -- Result: Computes "L /= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  --============================================================================
  -- Shift and Rotate Functions
  --============================================================================

  -- Id: S.1
  function SHIFT_LEFT (ARG : STD_ULOGIC_VECTOR; COUNT : NATURAL)
    return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        SHIFT_LEFT[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "array_sll_1164";
  -- Result subtype: STD_ULOGIC_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-left on an UNSIGNED vector COUNT times.
  --         The vacated positions are filled with '0'.
  --         The COUNT leftmost elements are lost.

  -- Id: S.2
  function SHIFT_RIGHT (ARG : STD_ULOGIC_VECTOR; COUNT : NATURAL)
    return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        SHIFT_RIGHT[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "array_srl_1164";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-right on an UNSIGNED vector COUNT times.
  --         The vacated positions are filled with '0'.
  --         The COUNT rightmost elements are lost.
  --============================================================================

  -- Id: S.5
  function ROTATE_LEFT (ARG : STD_ULOGIC_VECTOR; COUNT : NATURAL)
    return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        ROTATE_LEFT[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "array_rol";
  -- Result subtype: STD_ULOGIC_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: Performs a rotate-left of an UNSIGNED vector COUNT times.

  -- Id: S.6
  function ROTATE_RIGHT (ARG : STD_ULOGIC_VECTOR; COUNT : NATURAL)
    return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        ROTATE_RIGHT[STD_ULOGIC_VECTOR, NATURAL return STD_ULOGIC_VECTOR]: function is "array_ror";
  -- Result subtype: STD_ULOGIC_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: Performs a rotate-right of an UNSIGNED vector COUNT times.


  --============================================================================

  ------------------------------------------------------------------------------
  -- Note: Function S.17 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.17
  function "sla" (ARG : STD_ULOGIC_VECTOR; COUNT : INTEGER) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "SLA"[STD_ULOGIC_VECTOR, INTEGER return STD_ULOGIC_VECTOR]: function is "numstd_array_sla_ui";
  -- Result subtype: STD_ULOGIC_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.19 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.19
  function "sra" (ARG : STD_ULOGIC_VECTOR; COUNT : INTEGER) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        "SRA"[STD_ULOGIC_VECTOR, INTEGER return STD_ULOGIC_VECTOR]: function is "numstd_array_sra_ui";
  -- Result subtype: STD_ULOGIC_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_RIGHT(ARG, COUNT)


  --============================================================================
  --   RESIZE Functions
  --============================================================================

  -- Id: R.2
  function RESIZE (ARG : STD_ULOGIC_VECTOR; NEW_SIZE : NATURAL)
    return STD_ULOGIC_VECTOR;
  -- Result subtype: STD_ULOGIC_VECTOR(NEW_SIZE-1 downto 0)
  -- Result: Resizes the UNSIGNED vector ARG to the specified size.
  --         To create a larger vector, the new [leftmost] bit positions
  --         are filled with '0'. When truncating, the leftmost bits
  --         are dropped.

  function RESIZE (ARG, SIZE_RES : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR;
  -- TODO
  -- Result subtype: STD_ULOGIC_VECTOR (SIZE_RES'length-1 downto 0)

  --============================================================================
  -- Conversion Functions
  --============================================================================

  -- Id: D.1
  function TO_INTEGER (ARG : STD_ULOGIC_VECTOR) return NATURAL;
     attribute builtin_subprogram of
        TO_INTEGER[STD_ULOGIC_VECTOR return NATURAL]: function is "numstd_conv_integer_un"; 
  -- Result subtype: NATURAL. Value cannot be negative since parameter is an
  --             UNSIGNED vector.
  -- Result: Converts the UNSIGNED vector to an INTEGER.

  -- Id: D.3
  function To_StdLogicVector (ARG, SIZE : NATURAL) return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        To_StdLogicVector [NATURAL, NATURAL return STD_LOGIC_VECTOR]: function is "numstd_conv_unsigned_nu";
  -- Result subtype: STD_LOGIC_VECTOR(SIZE-1 downto 0)
  -- Result: Converts a non-negative INTEGER to an UNSIGNED vector with
  --         the specified SIZE.

  function To_StdLogicVector (ARG : NATURAL; SIZE_RES : STD_ULOGIC_VECTOR)
    return STD_LOGIC_VECTOR;
    attribute builtin_subprogram of
        TO_StdLogicVector [NATURAL, STD_ULOGIC_VECTOR return STD_LOGIC_VECTOR]: function is "numstd_conv_unsigned_nuu";
  -- Result subtype: STD_LOGIC_VECTOR(SIZE_RES'length-1 downto 0)

  alias To_Std_Logic_Vector is
    To_StdLogicVector[NATURAL, NATURAL return STD_LOGIC_VECTOR];
  alias To_SLV is
    To_StdLogicVector[NATURAL, NATURAL return STD_LOGIC_VECTOR];
  alias To_Std_Logic_Vector is
    To_StdLogicVector[NATURAL, STD_ULOGIC_VECTOR return STD_LOGIC_VECTOR];
  alias To_SLV is
    To_StdLogicVector[NATURAL, STD_ULOGIC_VECTOR return STD_LOGIC_VECTOR];

  -- Id: D.5
  function To_StdULogicVector (ARG, SIZE : NATURAL) return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        To_StdULogicVector [NATURAL, NATURAL return STD_ULOGIC_VECTOR]: function is "numstd_conv_unsigned_nu";
  -- Result subtype: STD_ULOGIC_VECTOR(SIZE-1 downto 0)
  -- Result: Converts a non-negative INTEGER to an UNSIGNED vector with
  --         the specified SIZE.

  function To_StdULogicVector (ARG : NATURAL; SIZE_RES : STD_ULOGIC_VECTOR)
    return STD_ULOGIC_VECTOR;
    attribute builtin_subprogram of
        To_StdULogicVector [NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR]: function is "numstd_conv_unsigned_nuu";
  -- Result subtype: STD_LOGIC_VECTOR(SIZE_RES'length-1 downto 0)

  alias To_Std_ULogic_Vector is
    To_StdULogicVector[NATURAL, NATURAL return STD_ULOGIC_VECTOR];
  alias To_SULV is
    To_StdULogicVector[NATURAL, NATURAL return STD_ULOGIC_VECTOR];
  alias To_Std_ULogic_Vector is
    To_StdULogicVector[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR];
  alias To_SULV is
    To_StdULogicVector[NATURAL, STD_ULOGIC_VECTOR return STD_ULOGIC_VECTOR];

end package NUMERIC_STD_UNSIGNED;
-- --------------------------------------------------------------------
--
-- Copyright � 2008 by IEEE.
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
--   Title     :  Standard VHDL Synthesis Packages
--             :  (NUMERIC_STD_UNSIGNED package body)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  Accellera VHDL-TC, and IEEE P1076 Working Group
--             :
--   Purpose   :  This package defines numeric types and arithmetic functions
--             :  for use with synthesis tools. Values of type STD_ULOGIC_VECTOR
--             :  are interpreted as unsigned numbers in vector form.
--             :  The leftmost bit is treated as the most significant bit.
--             :  This package contains overloaded arithmetic operators on
--             :  the STD_ULOGIC_VECTOR type. The package also contains
--             :  useful type conversions functions, clock detection
--             :  functions, and other utility functions.
--             :
--             :  If any argument to a function is a null array, a null array
--             :  is returned (exceptions, if any, are noted individually).
--
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

library ieee;
use ieee.numeric_std.all;

package body NUMERIC_STD_UNSIGNED is

  -- Id: A.3
  function "+" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) + UNSIGNED(R));
  end function "+";

  -- Id: A.3R
  function "+"(L : STD_ULOGIC_VECTOR; R : STD_ULOGIC) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) + R);
  end function "+";

  -- Id: A.3L
  function "+"(L : STD_ULOGIC; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (L + UNSIGNED(R));
  end function "+";

  -- Id: A.5
  function "+" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) + R);
  end function "+";

  -- Id: A.6
  function "+" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (L + UNSIGNED(R));
  end function "+";

  --============================================================================

  -- Id: A.9
  function "-" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) - UNSIGNED(R));
  end function "-";

  -- Id: A.9R
  function "-"(L : STD_ULOGIC_VECTOR; R : STD_ULOGIC) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) - R);
  end function "-";

  -- Id: A.9L
  function "-"(L : STD_ULOGIC; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (L - UNSIGNED(R));
  end function "-";

  -- Id: A.11
  function "-" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) - R);
  end function "-";

  -- Id: A.12
  function "-" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (L - UNSIGNED(R));
  end function "-";

  --============================================================================

  -- Id: A.15
  function "*" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) * UNSIGNED(R));
  end function "*";

  -- Id: A.17
  function "*" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) * R);
  end function "*";

  -- Id: A.18
  function "*" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (L * UNSIGNED(R));
  end function "*";

  --============================================================================

  -- Id: A.21
  function "/" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) / UNSIGNED(R));
  end function "/";

  -- Id: A.23
  function "/" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) / R);
  end function "/";

  -- Id: A.24
  function "/" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (L / UNSIGNED(R));
  end function "/";

  --============================================================================

  -- Id: A.27
  function "rem" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) rem UNSIGNED(R));
  end function "rem";

  -- Id: A.29
  function "rem" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) rem R);
  end function "rem";

  -- Id: A.30
  function "rem" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (L rem UNSIGNED(R));
  end function "rem";

  --============================================================================

  -- Id: A.33
  function "mod" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) mod UNSIGNED(R));
  end function "mod";

  -- Id: A.35
  function "mod" (L : STD_ULOGIC_VECTOR; R : NATURAL) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(L) mod R);
  end function "mod";

  -- Id: A.36
  function "mod" (L : NATURAL; R : STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (L mod UNSIGNED(R));
  end function "mod";

  --============================================================================
  -- Id: A.39
  function find_leftmost (ARG: STD_ULOGIC_VECTOR; Y: STD_ULOGIC) return INTEGER is
  begin
    return find_leftmost(UNSIGNED(ARG), Y);
  end function find_leftmost;

  -- Id: A.41
  function find_rightmost (ARG: STD_ULOGIC_VECTOR; Y: STD_ULOGIC) return INTEGER is
  begin
    return find_rightmost(UNSIGNED(ARG), Y);
  end function find_rightmost;

  --============================================================================

  -- Id: C.1
  function ">" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return UNSIGNED(L) > UNSIGNED(R);
  end function ">";

  -- Id: C.3
  function ">" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return L > UNSIGNED(R);
  end function ">";

  -- Id: C.5
  function ">" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN is
  begin
    return UNSIGNED(L) > R;
  end function ">";

  --============================================================================

  -- Id: C.7
  function "<" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return UNSIGNED(L) < UNSIGNED(R);
  end function "<";

  -- Id: C.9
  function "<" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return L < UNSIGNED(R);
  end function "<";

  -- Id: C.11
  function "<" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN is
  begin
    return UNSIGNED(L) < R;
  end function "<";

  --============================================================================

  -- Id: C.13
  function "<=" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return UNSIGNED(L) <= UNSIGNED(R);
  end function "<=";

  -- Id: C.15
  function "<=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return L <= UNSIGNED(R);
  end function "<=";

  -- Id: C.17
  function "<=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN is
  begin
    return UNSIGNED(L) <= R;
  end function "<=";

  --============================================================================

  -- Id: C.19
  function ">=" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return UNSIGNED(L) >= UNSIGNED(R);
  end function ">=";

  -- Id: C.21
  function ">=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return L >= UNSIGNED(R);
  end function ">=";

  -- Id: C.23
  function ">=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN is
  begin
    return UNSIGNED(L) >= R;
  end function ">=";

  --============================================================================

  -- Id: C.25
  function "=" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return UNSIGNED(L) = UNSIGNED(R);
  end function "=";

  -- Id: C.27
  function "=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return L = UNSIGNED(R);
  end function "=";

  -- Id: C.29
  function "=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN is
  begin
    return UNSIGNED(L) = R;
  end function "=";

  --============================================================================

  -- Id: C.31
  function "/=" (L, R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return UNSIGNED(L) /= UNSIGNED(R);
  end function "/=";

  -- Id: C.33
  function "/=" (L : NATURAL; R : STD_ULOGIC_VECTOR) return BOOLEAN is
  begin
    return L /= UNSIGNED(R);
  end function "/=";

  -- Id: C.35
  function "/=" (L : STD_ULOGIC_VECTOR; R : NATURAL) return BOOLEAN is
  begin
    return UNSIGNED(L) /= R;
  end function "/=";

  --============================================================================

  -- Id: C.37
  function MINIMUM (L, R: STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (MINIMUM(UNSIGNED(L), UNSIGNED(R)));
  end function MINIMUM;

  -- Id: C.39
  function MINIMUM (L: NATURAL; R: STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (MINIMUM(L, UNSIGNED(R)));
  end function MINIMUM;

  -- Id: C.41
  function MINIMUM (L: STD_ULOGIC_VECTOR; R: NATURAL) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (MINIMUM(UNSIGNED(L), R));
  end function MINIMUM;

  --============================================================================
  -- Id: C.43
  function MAXIMUM (L, R: STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (MAXIMUM(UNSIGNED(L), UNSIGNED(R)));
  end function MAXIMUM;

  -- Id: C.45
  function MAXIMUM (L: NATURAL; R: STD_ULOGIC_VECTOR) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (MAXIMUM(L, UNSIGNED(R)));
  end function MAXIMUM;

  -- Id: C.47
  function MAXIMUM (L: STD_ULOGIC_VECTOR; R: NATURAL) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (MAXIMUM(UNSIGNED(L), R));
  end function MAXIMUM;

  --============================================================================

  -- Id: C.49
  function "?>" (L, R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?> UNSIGNED(R);
  end function "?>";

  -- Id: C.51
  function "?>" (L: NATURAL; R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return L ?> UNSIGNED(R);
  end function "?>";

  -- Id: C.53
  function "?>" (L: STD_ULOGIC_VECTOR; R: NATURAL) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?> R;
  end function "?>";

  --============================================================================

  -- Id: C.55
  function "?<" (L, R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?< UNSIGNED(R);
  end function "?<";

  -- Id: C.57
  function "?<" (L: NATURAL; R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return L ?< UNSIGNED(R);
  end function "?<";

  -- Id: C.59
  function "?<" (L: STD_ULOGIC_VECTOR; R: NATURAL) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?< R;
  end function "?<";

  --============================================================================

  -- Id: C.61
  function "?<=" (L, R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?<= UNSIGNED(R);
  end function "?<=";

  -- Id: C.63
  function "?<=" (L: NATURAL; R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return L ?<= UNSIGNED(R);
  end function "?<=";

  -- Id: C.65
  function "?<=" (L: STD_ULOGIC_VECTOR; R: NATURAL) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?<= R;
  end function "?<=";

  --============================================================================

  -- Id: C.67
  function "?>=" (L, R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?>= UNSIGNED(R);
  end function "?>=";

  -- Id: C.69
  function "?>=" (L: NATURAL; R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return L ?>= UNSIGNED(R);
  end function "?>=";

  -- Id: C.71
  function "?>=" (L: STD_ULOGIC_VECTOR; R: NATURAL) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?>= R;
  end function "?>=";

  --============================================================================

  -- Id: C.73
  function "?=" (L, R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?= UNSIGNED(R);
  end function "?=";

  -- Id: C.75
  function "?=" (L: NATURAL; R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return L ?= UNSIGNED(R);
  end function "?=";

  -- Id: C.77
  function "?=" (L: STD_ULOGIC_VECTOR; R: NATURAL) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?= R;
  end function "?=";

  --============================================================================

  -- Id: C.79
  function "?/=" (L, R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?/= UNSIGNED(R);
  end function "?/=";

  -- Id: C.81
  function "?/=" (L: NATURAL; R: STD_ULOGIC_VECTOR) return STD_ULOGIC is
  begin
    return L ?/= UNSIGNED(R);
  end function "?/=";

  -- Id: C.83
  function "?/=" (L: STD_ULOGIC_VECTOR; R: NATURAL) return STD_ULOGIC is
  begin
    return UNSIGNED(L) ?/= R;
  end function "?/=";

  --============================================================================

  -- Id: S.1
  function SHIFT_LEFT (ARG : STD_ULOGIC_VECTOR; COUNT : NATURAL)
    return STD_ULOGIC_VECTOR is
  begin
    return std_logic_vector (SHIFT_LEFT(unsigned(ARG), COUNT));
  end function SHIFT_LEFT;

  -- Id: S.2
  function SHIFT_RIGHT (ARG : STD_ULOGIC_VECTOR; COUNT : NATURAL)
    return STD_ULOGIC_VECTOR is
  begin
    return std_logic_vector (SHIFT_RIGHT(unsigned(ARG), COUNT));
  end function SHIFT_RIGHT;

  --============================================================================

  -- Id: S.5
  function ROTATE_LEFT (ARG : STD_ULOGIC_VECTOR; COUNT : NATURAL)
    return STD_ULOGIC_VECTOR is
  begin
    return std_logic_vector (ROTATE_LEFT(unsigned(ARG), COUNT));
  end function ROTATE_LEFT;

  -- Id: S.6
  function ROTATE_RIGHT (ARG : STD_ULOGIC_VECTOR; COUNT : NATURAL)
    return STD_ULOGIC_VECTOR is
  begin
    return std_logic_vector (ROTATE_RIGHT(unsigned(ARG), COUNT));
  end function ROTATE_RIGHT;

  --============================================================================

  -- Id: S.17
  function "sla" (ARG: STD_ULOGIC_VECTOR; COUNT: INTEGER)
    return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(ARG) sla COUNT);
  end function "sla";

  -- Id: S.19
  function "sra" (ARG: STD_ULOGIC_VECTOR; COUNT: INTEGER)
    return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (UNSIGNED(ARG) sra COUNT);
  end function "sra";

  --============================================================================

  -- Id: R.2
  function RESIZE (ARG : STD_ULOGIC_VECTOR; NEW_SIZE : NATURAL)
    return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (
      RESIZE (ARG      => UNSIGNED(ARG),
              NEW_SIZE => NEW_SIZE));
  end function RESIZE;

  function RESIZE (ARG, SIZE_RES : STD_ULOGIC_VECTOR)
    return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (
      RESIZE (ARG     => UNSIGNED(ARG),
              NEW_SIZE => SIZE_RES'length));
  end function RESIZE;

  --============================================================================

  -- Id: D.1
  function TO_INTEGER (ARG : STD_ULOGIC_VECTOR) return NATURAL is
  begin
    return TO_INTEGER(UNSIGNED(ARG));
  end function TO_INTEGER;

  -- Id: D.3
  function To_StdLogicVector (ARG, SIZE : NATURAL) return STD_LOGIC_VECTOR is
  begin
    return STD_LOGIC_VECTOR (TO_UNSIGNED(ARG  => ARG,
                                         SIZE => SIZE));
  end function To_StdLogicVector;

  -- Id: D.5
  function To_StdULogicVector (ARG, SIZE : NATURAL) return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (TO_UNSIGNED(ARG  => ARG,
                                         SIZE => SIZE));
  end function To_StdULogicVector;

  function To_StdLogicVector (ARG : NATURAL; SIZE_RES : STD_ULOGIC_VECTOR)
    return STD_LOGIC_VECTOR is
  begin
    return STD_LOGIC_VECTOR (TO_UNSIGNED (ARG  => ARG,
                                          SIZE => SIZE_RES'length));
  end function To_StdLogicVector;

  function To_StdULogicVector (ARG : NATURAL; SIZE_RES : STD_ULOGIC_VECTOR)
    return STD_ULOGIC_VECTOR is
  begin
    return STD_ULOGIC_VECTOR (TO_UNSIGNED (ARG  => ARG,
                                           SIZE => SIZE_RES'length));
  end function To_StdULogicVector;

end package body NUMERIC_STD_UNSIGNED;
