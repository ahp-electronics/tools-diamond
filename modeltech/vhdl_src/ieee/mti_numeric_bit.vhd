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
--   Title     :  Standard VHDL Synthesis Packages
--             :  (NUMERIC_BIT package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  IEEE DASC Synthesis Working Group,
--             :  Accellera VHDL-TC, and IEEE P1076 Working Group
--             :
--   Purpose   :  This package defines numeric types and arithmetic functions
--             :  for use with synthesis tools. Two numeric types are defined:
--             :  -- > UNSIGNED: represents an UNSIGNED number in vector form
--             :  -- > SIGNED: represents a SIGNED number in vector form
--             :  The base element type is type BIT.
--             :  The leftmost bit is treated as the most significant bit.
--             :  Signed vectors are represented in two's complement form.
--             :  This package contains overloaded arithmetic operators on
--             :  the SIGNED and UNSIGNED types. The package also contains
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
-- $Revision: #1 $
-- $Date: 2020/10/14 $
-- --------------------------------------------------------------------

use STD.TEXTIO.all;

package NUMERIC_BIT is
  constant CopyRightNotice : STRING
    := "Copyright © 2008 IEEE. All rights reserved.";

  attribute builtin_subprogram: string;

  --============================================================================
  -- Numeric Array Type Definitions
  --============================================================================

  type UNSIGNED is array (NATURAL range <>) of BIT;
  type SIGNED is array (NATURAL range <>) of BIT;

  --============================================================================
  -- Arithmetic Operators:
  --============================================================================

  -- Id: A.1
  function "abs" (ARG : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "ABS"[SIGNED return SIGNED]: function is "numstd_abs_ss";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Returns the absolute value of a SIGNED vector ARG.

  -- Id: A.2
  function "-" (ARG : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[SIGNED return SIGNED]: function is "numstd_unary_minus_ss";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Returns the value of the unary minus operation on a
  --         SIGNED vector ARG.

  --============================================================================

  -- Id: A.3
  function "+" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "numstd_plus_uuu";
  -- Result subtype: UNSIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0)
  -- Result: Adds two UNSIGNED vectors that may be of different lengths.

  -- Id: A.3R
  function "+"(L : UNSIGNED; R : BIT) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[UNSIGNED, BIT return UNSIGNED]: function is "numstd_plus_uxu";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Similar to A.3 where R is a one bit UNSIGNED

  -- Id: A.3L
  function "+"(L : BIT; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[BIT, UNSIGNED  return UNSIGNED]: function is "numstd_plus_xuu";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Similar to A.3 where L is a one bit UNSIGNED

  -- Id: A.4
  function "+" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "+"[SIGNED, SIGNED return SIGNED]: function is "numstd_plus_sss";
  -- Result subtype: SIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0)
  -- Result: Adds two SIGNED vectors that may be of different lengths.

  -- Id: A.4R
  function "+"(L : SIGNED; R : BIT) return SIGNED;
    attribute builtin_subprogram of
        "+"[SIGNED, BIT return SIGNED]: function is "numstd_plus_sxs";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Similar to A.4 where R is bit 0 of a non-negative.

  -- Id: A.4L
  function "+"(L : BIT; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "+"[BIT, SIGNED return SIGNED]: function is "numstd_plus_xss";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Similar to A.4 where L is bit 0 of a non-negative.

  -- Id: A.5
  function "+" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[UNSIGNED, NATURAL return UNSIGNED]: function is "numstd_plus_unu";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Adds an UNSIGNED vector, L, with a nonnegative INTEGER, R.

  -- Id: A.6
  function "+" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "+"[NATURAL, UNSIGNED return UNSIGNED]: function is "numstd_plus_nuu";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Adds a nonnegative INTEGER, L, with an UNSIGNED vector, R.

  -- Id: A.7
  function "+" (L : INTEGER; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "+"[INTEGER, SIGNED return SIGNED]: function is "numstd_plus_iss";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Adds an INTEGER, L(may be positive or negative), to a SIGNED
  -- vector, R.

  -- Id: A.8
  function "+" (L : SIGNED; R : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "+"[SIGNED, INTEGER return SIGNED]: function is "numstd_plus_sis";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Adds a SIGNED vector, L, to an INTEGER, R.

  --============================================================================

  -- Id: A.9
  function "-" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "numstd_minus_uuu";
  -- Result subtype: UNSIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0)
  -- Result: Subtracts two UNSIGNED vectors that may be of different lengths.

  -- Id: A.9R
  function "-"(L : UNSIGNED; R : BIT) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[UNSIGNED, BIT return UNSIGNED]: function is "numstd_minus_uxu";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Similar to A.9 where R is a one bit UNSIGNED

  -- Id: A.9L
  function "-"(L : BIT; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[BIT, UNSIGNED return UNSIGNED]: function is "numstd_minus_xuu";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Similar to A.9 where L is a one bit UNSIGNED

  -- Id: A.10
  function "-" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[SIGNED, SIGNED return SIGNED]: function is "numstd_minus_sss";
  -- Result subtype: SIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0)
  -- Result: Subtracts a SIGNED vector, R, from another SIGNED vector, L,
  --         that may possibly be of different lengths.

  -- Id: A.10R
  function "-"(L : SIGNED; R : BIT) return SIGNED;
    attribute builtin_subprogram of
        "-"[SIGNED, BIT return SIGNED]: function is "numstd_minus_sxs";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Similar to A.10 where R is bit 0 of a non-negative.

  -- Id: A.10L
  function "-"(L : BIT; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[BIT, SIGNED return SIGNED]: function is "numstd_minus_xss";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Similar to A.10 where R is bit 0 of a non-negative.

  -- Id: A.11
  function "-" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[UNSIGNED, NATURAL return UNSIGNED]: function is "numstd_minus_unu";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Subtracts a nonnegative INTEGER, R, from an UNSIGNED vector, L.

  -- Id: A.12
  function "-" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "-"[NATURAL, UNSIGNED return UNSIGNED]: function is "numstd_minus_nuu";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Subtracts an UNSIGNED vector, R, from a nonnegative INTEGER, L.

  -- Id: A.13
  function "-" (L : SIGNED; R : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "-"[SIGNED, INTEGER return SIGNED]: function is "numstd_minus_sis";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Subtracts an INTEGER, R, from a SIGNED vector, L.

  -- Id: A.14
  function "-" (L : INTEGER; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "-"[INTEGER, SIGNED return SIGNED]: function is "numstd_minus_iss";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Subtracts a SIGNED vector, R, from an INTEGER, L.

  --============================================================================

  -- Id: A.15
  function "*" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "*"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "numstd_mult_uuu";
  -- Result subtype: UNSIGNED((L'LENGTH+R'LENGTH-1) downto 0)
  -- Result: Performs the multiplication operation on two UNSIGNED vectors
  --         that may possibly be of different lengths.

  -- Id: A.16
  function "*" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "*"[SIGNED, SIGNED return SIGNED]: function is "numstd_mult_sss";
  -- Result subtype: SIGNED((L'LENGTH+R'LENGTH-1) downto 0)
  -- Result: Multiplies two SIGNED vectors that may possibly be of
  --         different lengths.

  -- Id: A.17
  function "*" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        "*"[UNSIGNED, NATURAL return UNSIGNED]: function is "numstd_mult_unu";
  -- Result subtype: UNSIGNED((L'LENGTH+L'LENGTH-1) downto 0)
  -- Result: Multiplies an UNSIGNED vector, L, with a nonnegative
  --         INTEGER, R. R is converted to an UNSIGNED vector of
  --         size L'LENGTH before multiplication.

  -- Id: A.18
  function "*" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "*"[NATURAL, UNSIGNED return UNSIGNED]: function is "numstd_mult_nuu";
  -- Result subtype: UNSIGNED((R'LENGTH+R'LENGTH-1) downto 0)
  -- Result: Multiplies an UNSIGNED vector, R, with a nonnegative
  --         INTEGER, L. L is converted to an UNSIGNED vector of
  --         size R'LENGTH before multiplication.

  -- Id: A.19
  function "*" (L : SIGNED; R : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "*"[SIGNED, INTEGER return SIGNED]: function is "numstd_mult_sis";
  -- Result subtype: SIGNED((L'LENGTH+L'LENGTH-1) downto 0)
  -- Result: Multiplies a SIGNED vector, L, with an INTEGER, R. R is
  --         converted to a SIGNED vector of size L'LENGTH before
  --         multiplication.

  -- Id: A.20
  function "*" (L : INTEGER; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "*"[INTEGER, SIGNED return SIGNED]: function is "numstd_mult_iss";
  -- Result subtype: SIGNED((R'LENGTH+R'LENGTH-1) downto 0)
  -- Result: Multiplies a SIGNED vector, R, with an INTEGER, L. L is
  --         converted to a SIGNED vector of size R'LENGTH before
  --         multiplication.

  --============================================================================
  --
  -- NOTE: If second argument is zero for "/" operator, a severity level
  --       of ERROR is issued.

  -- Id: A.21
  function "/" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "/"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "numstd_div_uuu";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Divides an UNSIGNED vector, L, by another UNSIGNED vector, R.

  -- Id: A.22
  function "/" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "/"[SIGNED, SIGNED return SIGNED]: function is "numstd_div_sss";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Divides an SIGNED vector, L, by another SIGNED vector, R.

  -- Id: A.23
  function "/" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        "/"[UNSIGNED, NATURAL return UNSIGNED]: function is "numstd_div_unu";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Divides an UNSIGNED vector, L, by a nonnegative INTEGER, R.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.24
  function "/" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "/"[NATURAL, UNSIGNED return UNSIGNED]: function is "numstd_div_nuu";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Divides a nonnegative INTEGER, L, by an UNSIGNED vector, R.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  -- Id: A.25
  function "/" (L : SIGNED; R : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "/"[SIGNED, INTEGER return SIGNED]: function is "numstd_div_sis";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Divides a SIGNED vector, L, by an INTEGER, R.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.26
  function "/" (L : INTEGER; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "/"[INTEGER, SIGNED return SIGNED]: function is "numstd_div_iss";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Divides an INTEGER, L, by a SIGNED vector, R.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  --============================================================================
  --
  -- NOTE: If second argument is zero for "rem" operator, a severity level
  --       of ERROR is issued.

  -- Id: A.27
  function "rem" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "REM"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "numstd_rem_uuu";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L and R are UNSIGNED vectors.

  -- Id: A.28
  function "rem" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "REM"[SIGNED, SIGNED return SIGNED]: function is "numstd_rem_sss";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L and R are SIGNED vectors.

  -- Id: A.29
  function "rem" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        "REM"[UNSIGNED, NATURAL return UNSIGNED]: function is "numstd_rem_unu";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L is an UNSIGNED vector and R is a
  --         nonnegative INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.30
  function "rem" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "REM"[NATURAL, UNSIGNED return UNSIGNED]: function is "numstd_rem_nuu";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where R is an UNSIGNED vector and L is a
  --         nonnegative INTEGER.
  -- If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  -- Id: A.31
  function "rem" (L : SIGNED; R : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "REM"[SIGNED, INTEGER return SIGNED]: function is "numstd_rem_sis";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L is SIGNED vector and R is an INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.32
  function "rem" (L : INTEGER; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "REM"[INTEGER, SIGNED return SIGNED]: function is "numstd_rem_iss";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where R is SIGNED vector and L is an INTEGER.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  --============================================================================
  --
  -- NOTE: If second argument is zero for "mod" operator, a severity level
  --       of ERROR is issued.

  -- Id: A.33
  function "mod" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "MOD"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "numstd_mod_uuu";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L and R are UNSIGNED vectors.

  -- Id: A.34
  function "mod" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "MOD"[SIGNED, SIGNED return SIGNED]: function is "numstd_mod_sss";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L and R are SIGNED vectors.

  -- Id: A.35
  function "mod" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        "MOD"[UNSIGNED, NATURAL return UNSIGNED]: function is "numstd_mod_unu";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L is an UNSIGNED vector and R
  --         is a nonnegative INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.36
  function "mod" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "MOD"[NATURAL, UNSIGNED return UNSIGNED]: function is "numstd_mod_nuu";
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where R is an UNSIGNED vector and L
  --         is a nonnegative INTEGER.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  -- Id: A.37
  function "mod" (L : SIGNED; R : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "MOD"[SIGNED, INTEGER return SIGNED]: function is "numstd_mod_sis";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L is a SIGNED vector and
  --         R is an INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.38
  function "mod" (L : INTEGER; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "MOD"[INTEGER, SIGNED return SIGNED]: function is "numstd_mod_iss";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L is an INTEGER and
  --         R is a SIGNED vector.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  --============================================================================
  -- Id: A.39
  function find_leftmost (ARG : UNSIGNED; Y : BIT) return INTEGER;
    attribute builtin_subprogram of
        FIND_LEFTMOST[UNSIGNED, BIT return INTEGER]: function is "numbit_findleftmost_ubi";
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  -- Id: A.40
  function find_leftmost (ARG : SIGNED; Y : BIT) return INTEGER;
    attribute builtin_subprogram of
        FIND_LEFTMOST[SIGNED, BIT return INTEGER]: function is "numbit_findleftmost_sbi";
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  -- Id: A.41
  function find_rightmost (ARG : UNSIGNED; Y : BIT) return INTEGER;
    attribute builtin_subprogram of
        FIND_RIGHTMOST[UNSIGNED, BIT return INTEGER]: function is "numbit_findrightmost_ubi";
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  -- Id: A.42
  function find_rightmost (ARG : SIGNED; Y : BIT) return INTEGER;
    attribute builtin_subprogram of
        FIND_RIGHTMOST[SIGNED, BIT return INTEGER]: function is "numbit_findrightmost_sbi";
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  --============================================================================
  -- Comparison Operators
  --============================================================================

  -- Id: C.1
  function ">" (L, R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[UNSIGNED, UNSIGNED return BOOLEAN]: function is "numstd_gt_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.2
  function ">" (L, R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[SIGNED, SIGNED return BOOLEAN]: function is "numstd_gt_ss";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.3
  function ">" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[NATURAL, UNSIGNED return BOOLEAN]: function is "numstd_gt_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.4
  function ">" (L : INTEGER; R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[INTEGER, SIGNED return BOOLEAN]: function is "numstd_gt_is";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is a INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.5
  function ">" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[UNSIGNED, NATURAL return BOOLEAN]: function is "numstd_gt_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.6
  function ">" (L : SIGNED; R : INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">"[SIGNED, INTEGER return BOOLEAN]: function is "numstd_gt_si";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is a SIGNED vector and
  --         R is a INTEGER.

  --============================================================================

  -- Id: C.7
  function "<" (L, R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[UNSIGNED, UNSIGNED return BOOLEAN]: function is "numstd_lt_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.8
  function "<" (L, R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[SIGNED, SIGNED return BOOLEAN]: function is "numstd_lt_ss";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.9
  function "<" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[NATURAL, UNSIGNED return BOOLEAN]: function is "numstd_lt_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.10
  function "<" (L : INTEGER; R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[INTEGER, SIGNED return BOOLEAN]: function is "numstd_lt_is";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.11
  function "<" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[UNSIGNED, NATURAL return BOOLEAN]: function is "numstd_lt_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.12
  function "<" (L : SIGNED; R : INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<"[SIGNED, INTEGER return BOOLEAN]: function is "numstd_lt_si";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.13
  function "<=" (L, R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[UNSIGNED, UNSIGNED return BOOLEAN]: function is "numstd_lte_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.14
  function "<=" (L, R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[SIGNED, SIGNED return BOOLEAN]: function is "numstd_lte_ss";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.15
  function "<=" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[NATURAL, UNSIGNED return BOOLEAN]: function is "numstd_lte_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.16
  function "<=" (L : INTEGER; R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[INTEGER, SIGNED return BOOLEAN]: function is "numstd_lte_is";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.17
  function "<=" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[UNSIGNED, NATURAL return BOOLEAN]: function is "numstd_lte_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.18
  function "<=" (L : SIGNED; R : INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "<="[SIGNED, INTEGER return BOOLEAN]: function is "numstd_lte_si";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.19
  function ">=" (L, R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[UNSIGNED, UNSIGNED return BOOLEAN]: function is "numstd_gte_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.20
  function ">=" (L, R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[SIGNED, SIGNED return BOOLEAN]: function is "numstd_gte_ss";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.21
  function ">=" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[NATURAL, UNSIGNED return BOOLEAN]: function is "numstd_gte_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.22
  function ">=" (L : INTEGER; R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[INTEGER, SIGNED return BOOLEAN]: function is "numstd_gte_is";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.23
  function ">=" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[UNSIGNED, NATURAL return BOOLEAN]: function is "numstd_gte_un";
-- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.24
  function ">=" (L : SIGNED; R : INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        ">="[SIGNED, INTEGER return BOOLEAN]: function is "numstd_gte_si";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.25
  function "=" (L, R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[UNSIGNED, UNSIGNED return BOOLEAN]: function is "numstd_eq_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.26
  function "=" (L, R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[SIGNED, SIGNED return BOOLEAN]: function is "numstd_eq_ss";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.27
  function "=" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[NATURAL, UNSIGNED return BOOLEAN]: function is "numstd_eq_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.28
  function "=" (L : INTEGER; R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "="[INTEGER, SIGNED return BOOLEAN]: function is "numstd_eq_is";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.29
  function "=" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        "="[UNSIGNED, NATURAL return BOOLEAN]: function is "numstd_eq_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.30
  function "=" (L : SIGNED; R : INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "="[SIGNED, INTEGER return BOOLEAN]: function is "numstd_eq_si";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.31
  function "/=" (L, R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[UNSIGNED, UNSIGNED return BOOLEAN]: function is "numstd_neq_uu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.32
  function "/=" (L, R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[SIGNED, SIGNED return BOOLEAN]: function is "numstd_neq_ss";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.33
  function "/=" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[NATURAL, UNSIGNED return BOOLEAN]: function is "numstd_neq_nu";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.34
  function "/=" (L : INTEGER; R : SIGNED) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[INTEGER, SIGNED return BOOLEAN]: function is "numstd_neq_is";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.35
  function "/=" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[UNSIGNED, NATURAL return BOOLEAN]: function is "numstd_neq_un";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.36
  function "/=" (L : SIGNED; R : INTEGER) return BOOLEAN;
    attribute builtin_subprogram of
        "/="[SIGNED, INTEGER return BOOLEAN]: function is "numstd_neq_si";
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.37
  function MINIMUM (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        MINIMUM[UNSIGNED, UNSIGNED return UNSIGNED]: function is "numbit_minimum_uuu";
  -- Result subtype: UNSIGNED
  -- Result: Returns the lesser of two UNSIGNED vectors that may be
  --         of different lengths.

  -- Id: C.38
  function MINIMUM (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        MINIMUM[SIGNED, SIGNED return SIGNED]: function is "numbit_minimum_sss";
  -- Result subtype: SIGNED
  -- Result: Returns the lesser of two SIGNED vectors that may be
  --         of different lengths.

  -- Id: C.39
  function MINIMUM (L : NATURAL; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        MINIMUM[NATURAL, UNSIGNED return UNSIGNED]: function is "numbit_minimum_nuu";
  -- Result subtype: UNSIGNED
  -- Result: Returns the lesser of a nonnegative INTEGER, L, and
  --         an UNSIGNED vector, R.

  -- Id: C.40
  function MINIMUM (L : INTEGER; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        MINIMUM[INTEGER, SIGNED return SIGNED]: function is "numbit_minimum_iss";
  -- Result subtype: SIGNED
  -- Result: Returns the lesser of an INTEGER, L, and a SIGNED
  --         vector, R.

  -- Id: C.41
  function MINIMUM (L : UNSIGNED; R : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        MINIMUM[UNSIGNED, NATURAL return UNSIGNED]: function is "numbit_minimum_unu";
  -- Result subtype: UNSIGNED
  -- Result: Returns the lesser of an UNSIGNED vector, L, and
  --         a nonnegative INTEGER, R.

  -- Id: C.42
  function MINIMUM (L : SIGNED; R : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        MINIMUM[SIGNED, INTEGER return SIGNED]: function is "numbit_minimum_sis";
  -- Result subtype: SIGNED
  -- Result: Returns the lesser of a SIGNED vector, L, and
  --         an INTEGER, R.

  --============================================================================

  -- Id: C.43
  function MAXIMUM (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        MAXIMUM[UNSIGNED, UNSIGNED return UNSIGNED]: function is "numbit_maximum_uuu";
  -- Result subtype: UNSIGNED
  -- Result subtype: UNSIGNED
  -- Result: Returns the greater of two UNSIGNED vectors that may be
  --         of different lengths.

  -- Id: C.44
  function MAXIMUM (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        MAXIMUM[SIGNED, SIGNED return SIGNED]: function is "numbit_maximum_sss";
  -- Result subtype: SIGNED
  -- Result: Returns the greater of two SIGNED vectors that may be
  --         of different lengths.

  -- Id: C.45
  function MAXIMUM (L : NATURAL; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        MAXIMUM[NATURAL, UNSIGNED return UNSIGNED]: function is "numbit_maximum_nuu";
  -- Result subtype: UNSIGNED
  -- Result: Returns the greater of a nonnegative INTEGER, L, and
  --         an UNSIGNED vector, R.

  -- Id: C.46
  function MAXIMUM (L : INTEGER; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        MAXIMUM[INTEGER, SIGNED return SIGNED]: function is "numbit_maximum_iss";
  -- Result subtype: SIGNED
  -- Result: Returns the greater of an INTEGER, L, and a SIGNED
  --         vector, R.

  -- Id: C.47
  function MAXIMUM (L : UNSIGNED; R : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        MAXIMUM[UNSIGNED, NATURAL return UNSIGNED]: function is "numbit_maximum_unu";
  -- Result subtype: UNSIGNED
  -- Result: Returns the greater of an UNSIGNED vector, L, and
  --         a nonnegative INTEGER, R.

  -- Id: C.48
  function MAXIMUM (L : SIGNED; R : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        MAXIMUM[SIGNED, INTEGER return SIGNED]: function is "numbit_maximum_sis";
  -- Result subtype: SIGNED
  -- Result: Returns the greater of a SIGNED vector, L, and
  --         an INTEGER, R.

  --============================================================================

  -- Id: C.49
  function "?>" (L, R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?>"[UNSIGNED, UNSIGNED return BIT]: function is "numstd_gt_uu";
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.50
  function "?>" (L, R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?>"[SIGNED, SIGNED return BIT]: function is "numstd_gt_ss";
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.51
  function "?>" (L : NATURAL; R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?>"[NATURAL, UNSIGNED return BIT]: function is "numstd_gt_nu";
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.52
  function "?>" (L : INTEGER; R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?>"[INTEGER, SIGNED return BIT]: function is "numstd_gt_is";
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is a INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.53
  function "?>" (L : UNSIGNED; R : NATURAL) return BIT;
    attribute builtin_subprogram of
        "?>"[UNSIGNED, NATURAL return BIT]: function is "numstd_gt_un";
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.54
  function "?>" (L : SIGNED; R : INTEGER) return BIT;
    attribute builtin_subprogram of
        "?>"[SIGNED, INTEGER return BIT]: function is "numstd_gt_si";
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is a SIGNED vector and
  --         R is a INTEGER.

  --============================================================================

  -- Id: C.55
  function "?<" (L, R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?<"[UNSIGNED, UNSIGNED return BIT]: function is "numstd_lt_uu";
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.56
  function "?<" (L, R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?<"[SIGNED, SIGNED return BIT]: function is "numstd_lt_ss";
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.57
  function "?<" (L : NATURAL; R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?<"[NATURAL, UNSIGNED return BIT]: function is "numstd_lt_nu";
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.58
  function "?<" (L : INTEGER; R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?<"[INTEGER, SIGNED return BIT]: function is "numstd_lt_is";
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.59
  function "?<" (L : UNSIGNED; R : NATURAL) return BIT;
    attribute builtin_subprogram of
        "?<"[UNSIGNED, NATURAL return BIT]: function is "numstd_lt_un";
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.60
  function "?<" (L : SIGNED; R : INTEGER) return BIT;
    attribute builtin_subprogram of
        "?<"[SIGNED, INTEGER return BIT]: function is "numstd_lt_si";
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.61
  function "?<=" (L, R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?<="[UNSIGNED, UNSIGNED return BIT]: function is "numstd_lte_uu";
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.62
  function "?<=" (L, R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?<="[SIGNED, SIGNED return BIT]: function is "numstd_lte_ss";
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.63
  function "?<=" (L : NATURAL; R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?<="[NATURAL, UNSIGNED return BIT]: function is "numstd_lte_nu";
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.64
  function "?<=" (L : INTEGER; R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?<="[INTEGER, SIGNED return BIT]: function is "numstd_lte_is";
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.65
  function "?<=" (L : UNSIGNED; R : NATURAL) return BIT;
    attribute builtin_subprogram of
        "?<="[UNSIGNED, NATURAL return BIT]: function is "numstd_lte_un";
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.66
  function "?<=" (L : SIGNED; R : INTEGER) return BIT;
    attribute builtin_subprogram of
        "?<="[SIGNED, INTEGER return BIT]: function is "numstd_lte_si";
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.67
  function "?>=" (L, R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?>="[UNSIGNED, UNSIGNED return BIT]: function is "numstd_gte_uu";
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.68
  function "?>=" (L, R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?>="[SIGNED, SIGNED return BIT]: function is "numstd_gte_ss";
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.69
  function "?>=" (L : NATURAL; R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?>="[NATURAL, UNSIGNED return BIT]: function is "numstd_gte_nu";
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.70
  function "?>=" (L : INTEGER; R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?>="[INTEGER, SIGNED return BIT]: function is "numstd_gte_is";
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.71
  function "?>=" (L : UNSIGNED; R : NATURAL) return BIT;
    attribute builtin_subprogram of
        "?>="[UNSIGNED, NATURAL return BIT]: function is "numstd_gte_un";
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.72
  function "?>=" (L : SIGNED; R : INTEGER) return BIT;
    attribute builtin_subprogram of
        "?>="[SIGNED, INTEGER return BIT]: function is "numstd_gte_si";
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.73
  function "?=" (L, R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?="[UNSIGNED, UNSIGNED return BIT]: function is "numstd_eq_uu";
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.74
  function "?=" (L, R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?="[SIGNED, SIGNED return BIT]: function is "numstd_eq_ss";
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.75
  function "?=" (L : NATURAL; R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?="[NATURAL, UNSIGNED return BIT]: function is "numstd_eq_nu";
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.76
  function "?=" (L : INTEGER; R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?="[INTEGER, SIGNED return BIT]: function is "numstd_eq_is";
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is an INTEGER and
  --         R is an SIGNED vector.

  -- Id: C.77
  function "?=" (L : UNSIGNED; R : NATURAL) return BIT;
    attribute builtin_subprogram of
        "?="[UNSIGNED, NATURAL return BIT]: function is "numstd_eq_un";
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.78
  function "?=" (L : SIGNED; R : INTEGER) return BIT;
    attribute builtin_subprogram of
        "?="[SIGNED, INTEGER return BIT]: function is "numstd_eq_si";
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is an SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.79
  function "?/=" (L, R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?/="[UNSIGNED, UNSIGNED return BIT]: function is "numstd_neq_uu";
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.80
  function "?/=" (L, R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?/="[SIGNED, SIGNED return BIT]: function is "numstd_neq_ss";
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.81
  function "?/=" (L : NATURAL; R : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "?/="[NATURAL, UNSIGNED return BIT]: function is "numstd_neq_nu";
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.82
  function "?/=" (L : INTEGER; R : SIGNED) return BIT;
    attribute builtin_subprogram of
        "?/="[INTEGER, SIGNED return BIT]: function is "numstd_neq_is";
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is an INTEGER and
  --         R is an SIGNED vector.

  -- Id: C.83
  function "?/=" (L : UNSIGNED; R : NATURAL) return BIT;
    attribute builtin_subprogram of
        "?/="[UNSIGNED, NATURAL return BIT]: function is "numstd_neq_un";
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.84
  function "?/=" (L : SIGNED; R : INTEGER) return BIT;
    attribute builtin_subprogram of
        "?/="[SIGNED, INTEGER return BIT]: function is "numstd_neq_si";
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is an SIGNED vector and
  --         R is an INTEGER.

  --============================================================================
  -- Shift and Rotate Functions
  --============================================================================

  -- Id: S.1
  function SHIFT_LEFT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        SHIFT_LEFT[UNSIGNED, NATURAL return UNSIGNED]: function is "array_sll";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-left on an UNSIGNED vector COUNT times.
  --         The vacated positions are filled with Bit '0'.
  --         The COUNT leftmost bits are lost.

  -- Id: S.2
  function SHIFT_RIGHT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        SHIFT_RIGHT[UNSIGNED, NATURAL return UNSIGNED]: function is "array_srl";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-right on an UNSIGNED vector COUNT times.
  --         The vacated positions are filled with Bit '0'.
  --         The COUNT rightmost bits are lost.

  -- Id: S.3
  function SHIFT_LEFT (ARG : SIGNED; COUNT : NATURAL) return SIGNED;
    attribute builtin_subprogram of
        SHIFT_LEFT[SIGNED, NATURAL return SIGNED]: function is "array_sll";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-left on a SIGNED vector COUNT times.
  --         The vacated positions are filled with Bit '0'.
  --         The COUNT leftmost bits are lost.

  -- Id: S.4
  function SHIFT_RIGHT (ARG : SIGNED; COUNT : NATURAL) return SIGNED;
    attribute builtin_subprogram of
        SHIFT_RIGHT[SIGNED, NATURAL return SIGNED]: function is "array_sra";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-right on a SIGNED vector COUNT times.
  --         The vacated positions are filled with the leftmost bit, ARG'LEFT.
  --         The COUNT rightmost bits are lost.

  --============================================================================

  -- Id: S.5
  function ROTATE_LEFT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        ROTATE_LEFT[UNSIGNED, NATURAL return UNSIGNED]: function is "array_rol";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a rotate-left of an UNSIGNED vector COUNT times.

  -- Id: S.6
  function ROTATE_RIGHT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        ROTATE_RIGHT[UNSIGNED, NATURAL return UNSIGNED]: function is "array_ror";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a rotate-right of an UNSIGNED vector COUNT times.

  -- Id: S.7
  function ROTATE_LEFT (ARG : SIGNED; COUNT : NATURAL) return SIGNED;
    attribute builtin_subprogram of
        ROTATE_LEFT[SIGNED, NATURAL return SIGNED]: function is "array_rol";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a logical rotate-left of a SIGNED vector COUNT times.

  -- Id: S.8
  function ROTATE_RIGHT (ARG : SIGNED; COUNT : NATURAL) return SIGNED;
    attribute builtin_subprogram of
        ROTATE_RIGHT[SIGNED, NATURAL return SIGNED]: function is "array_ror";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a logical rotate-right of a SIGNED vector COUNT times.

  --============================================================================

  ------------------------------------------------------------------------------
  -- Note: Function S.9 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.9
  function "sll" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        "SLL"[SIGNED, INTEGER return SIGNED]: function is "array_sll";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.10 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.10
  function "sll" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "SLL"[SIGNED, INTEGER return SIGNED]: function is "array_sll";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.11 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.11
  function "srl" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        "SRL"[UNSIGNED, INTEGER return UNSIGNED]: function is "array_srl";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_RIGHT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.12 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.12
  function "srl" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "SRL"[SIGNED, INTEGER return SIGNED]: function is "array_srl";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SIGNED(SHIFT_RIGHT(UNSIGNED(ARG), COUNT))

  ------------------------------------------------------------------------------
  -- Note: Function S.13 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.13
  function "rol" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        "ROL"[UNSIGNED, INTEGER return UNSIGNED]: function is "array_rol";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.14 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.14
  function "rol" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "ROL"[SIGNED, INTEGER return SIGNED]: function is "array_rol";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.15 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.15
  function "ror" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        "ROR"[UNSIGNED, INTEGER return UNSIGNED]: function is "array_ror";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_RIGHT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.16 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.16
  function "ror" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "ROR"[SIGNED, INTEGER return SIGNED]: function is "array_ror";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_RIGHT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.17 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.17
  function "sla" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        "SLA"[UNSIGNED, INTEGER return UNSIGNED]: function is "numeric_bit_sla";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.18 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.18
  function "sla" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "SLA"[SIGNED, INTEGER return SIGNED]: function is "numeric_bit_sla_signed";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.19 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.19
  function "sra" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
    attribute builtin_subprogram of
        "SRA"[UNSIGNED, INTEGER return UNSIGNED]: function is "numeric_bit_sra";
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_RIGHT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.20 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.20
  function "sra" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
    attribute builtin_subprogram of
        "SRA"[SIGNED, INTEGER return SIGNED]: function is "numeric_bit_sra_signed";
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_RIGHT(ARG, COUNT)

  --============================================================================
  -- RESIZE Functions
  --============================================================================

  -- Id: R.1
  function RESIZE (ARG : SIGNED; NEW_SIZE : NATURAL) return SIGNED;
    attribute builtin_subprogram of
        RESIZE[SIGNED, NATURAL return SIGNED]: function is "numstd_resize_sns";
  -- Result subtype: SIGNED(NEW_SIZE-1 downto 0)
  -- Result: Resizes the SIGNED vector ARG to the specified size.
  --         To create a larger vector, the new [leftmost] bit positions
  --         are filled with the sign bit (ARG'LEFT). When truncating,
  --         the sign bit is retained along with the rightmost part.

  -- Id: R.2
  function RESIZE (ARG : UNSIGNED; NEW_SIZE : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        RESIZE[UNSIGNED, NATURAL return UNSIGNED]: function is "numstd_resize_unu";
  -- Result subtype: UNSIGNED(NEW_SIZE-1 downto 0)
  -- Result: Resizes the UNSIGNED vector ARG to the specified size.
  --         To create a larger vector, the new [leftmost] bit positions
  --         are filled with '0'. When truncating, the leftmost bits
  --         are dropped.

  function RESIZE (ARG, SIZE_RES : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        RESIZE[UNSIGNED, UNSIGNED return UNSIGNED]: function is "numstd_resize_uuu";
  -- Result subtype: UNSIGNED (SIZE_RES'length-1 downto 0)

  function RESIZE (ARG, SIZE_RES : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        RESIZE[SIGNED, SIGNED return SIGNED]: function is "numstd_resize_sss";
  -- Result subtype: SIGNED (SIZE_RES'length-1 downto 0)

  --============================================================================
  -- Conversion Functions
  --============================================================================

  -- Id: D.1
  function TO_INTEGER (ARG : UNSIGNED) return NATURAL;
    attribute builtin_subprogram of
        TO_INTEGER[UNSIGNED return NATURAL]: function is "numstd_conv_integer_un"; 
  -- Result subtype: NATURAL. Value cannot be negative since parameter is an
  --         UNSIGNED vector.
  -- Result: Converts the UNSIGNED vector to an INTEGER.

  -- Id: D.2
  function TO_INTEGER (ARG : SIGNED) return INTEGER;
    attribute builtin_subprogram of
        TO_INTEGER[SIGNED return INTEGER]: function is "numstd_conv_integer_si"; 
  -- Result subtype: INTEGER
  -- Result: Converts a SIGNED vector to an INTEGER.

  -- Id: D.3
  function TO_UNSIGNED (ARG, SIZE : NATURAL) return UNSIGNED;
    attribute builtin_subprogram of
        TO_UNSIGNED [NATURAL, NATURAL return UNSIGNED]: function is "numbit_conv_unsigned_nu";
  -- Result subtype: UNSIGNED(SIZE-1 downto 0)
  -- Result: Converts a nonnegative INTEGER to an UNSIGNED vector with
  --         the specified size.

  -- Id: D.4
  function TO_SIGNED (ARG : INTEGER; SIZE : NATURAL) return SIGNED;
    attribute builtin_subprogram of
        TO_SIGNED [INTEGER, NATURAL return SIGNED]: function is "numbit_conv_signed_is";
  -- Result subtype: SIGNED(SIZE-1 downto 0)
  -- Result: Converts an INTEGER to a SIGNED vector of the specified size.

  function TO_UNSIGNED (ARG : NATURAL; SIZE_RES : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        TO_UNSIGNED [NATURAL, UNSIGNED return UNSIGNED]: function is "numbit_conv_unsigned_nuu";
  -- Result subtype: UNSIGNED(SIZE_RES'length-1 downto 0)

  function TO_SIGNED (ARG : INTEGER; SIZE_RES : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        TO_SIGNED [INTEGER, SIGNED return SIGNED]: function is "numbit_conv_signed_iss";
  -- Result subtype: SIGNED(SIZE_RES'length-1 downto 0)

  --============================================================================
  -- Logical Operators
  --============================================================================

  -- Id: L.1
  function "not" (L : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "NOT"[UNSIGNED return UNSIGNED]: function is "array_not";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Termwise inversion

  -- Id: L.2
  function "and" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "AND"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "array_and";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector AND operation

  -- Id: L.3
  function "or" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "OR"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "array_or";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector OR operation

  -- Id: L.4
  function "nand" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "NAND"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "array_nand";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector NAND operation

  -- Id: L.5
  function "nor" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "NOR"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "array_nor";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector NOR operation

  -- Id: L.6
  function "xor" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "XOR"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "array_xor";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector XOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.7 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.7
  function "xnor" (L, R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "XNOR"[UNSIGNED, UNSIGNED return UNSIGNED]: function is "array_xnor";
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector XNOR operation

  -- Id: L.8
  function "not" (L : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "NOT"[SIGNED return SIGNED]: function is "array_not";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Termwise inversion

  -- Id: L.9
  function "and" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "AND"[SIGNED, SIGNED return SIGNED]: function is "array_and";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector AND operation

  -- Id: L.10
  function "or" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "OR"[SIGNED, SIGNED return SIGNED]: function is "array_or";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector OR operation

  -- Id: L.11
  function "nand" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "NAND"[SIGNED, SIGNED return SIGNED]: function is "array_nand";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector NAND operation

  -- Id: L.12
  function "nor" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "NOR"[SIGNED, SIGNED return SIGNED]: function is "array_nor";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector NOR operation

  -- Id: L.13
  function "xor" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "XOR"[SIGNED, SIGNED return SIGNED]: function is "array_xor";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector XOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.14 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.14
  function "xnor" (L, R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "XNOR"[SIGNED, SIGNED return SIGNED]: function is "array_xnor";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector XNOR operation

  -- Id: L.15 
  function "and" (L : BIT; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "AND"[BIT, UNSIGNED return UNSIGNED]: function is "scalar_array_and";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector AND operation

  -- Id: L.16 
  function "and" (L : UNSIGNED; R : BIT) return UNSIGNED;
    attribute builtin_subprogram of
        "AND"[UNSIGNED, BIT return UNSIGNED]: function is "array_scalar_and";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar AND operation

  -- Id: L.17 
  function "or" (L : BIT; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "OR"[BIT, UNSIGNED return UNSIGNED]: function is "scalar_array_or";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector OR operation

  -- Id: L.18 
  function "or" (L : UNSIGNED; R : BIT) return UNSIGNED;
    attribute builtin_subprogram of
        "OR"[UNSIGNED, BIT return UNSIGNED]: function is "array_scalar_or";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar OR operation

  -- Id: L.19 
  function "nand" (L : BIT; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "NAND"[BIT, UNSIGNED  return UNSIGNED]: function is "scalar_array_nand";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector NAND operation

  -- Id: L.20 
  function "nand" (L : UNSIGNED; R : BIT) return UNSIGNED;
    attribute builtin_subprogram of
        "NAND"[UNSIGNED, BIT  return UNSIGNED]: function is "array_scalar_nand";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar NAND operation

  -- Id: L.21 
  function "nor" (L : BIT; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "NOR"[BIT, UNSIGNED return UNSIGNED]: function is "scalar_array_nor";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector NOR operation

  -- Id: L.22 
  function "nor" (L : UNSIGNED; R : BIT) return UNSIGNED;
    attribute builtin_subprogram of
        "NOR"[UNSIGNED, BIT return UNSIGNED]: function is "array_scalar_nor";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar NOR operation

  -- Id: L.23 
  function "xor" (L : BIT; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "XOR"[BIT, UNSIGNED return UNSIGNED]: function is "scalar_array_xor";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector XOR operation

  -- Id: L.24 
  function "xor" (L : UNSIGNED; R : BIT) return UNSIGNED;
    attribute builtin_subprogram of
        "XOR"[UNSIGNED, BIT return UNSIGNED]: function is "array_scalar_xor";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar XOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.25 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.25 
  function "xnor" (L : BIT; R : UNSIGNED) return UNSIGNED;
    attribute builtin_subprogram of
        "XNOR"[BIT, UNSIGNED return UNSIGNED]: function is "scalar_array_xnor";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector XNOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.26 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.26 
  function "xnor" (L : UNSIGNED; R : BIT) return UNSIGNED;
    attribute builtin_subprogram of
        "XNOR"[UNSIGNED, BIT return UNSIGNED]: function is "array_scalar_xnor";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar XNOR operation

  -- Id: L.27 
  function "and" (L : BIT; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "AND"[BIT, SIGNED return SIGNED]: function is "scalar_array_and";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector AND operation

  -- Id: L.28 
  function "and" (L : SIGNED; R : BIT) return SIGNED;
    attribute builtin_subprogram of
        "AND"[SIGNED, BIT return SIGNED]: function is "array_scalar_and";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar AND operation

  -- Id: L.29 
  function "or" (L : BIT; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "OR"[BIT, SIGNED return SIGNED]: function is "scalar_array_or";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector OR operation

  -- Id: L.30 
  function "or" (L : SIGNED; R : BIT) return SIGNED;
    attribute builtin_subprogram of
        "OR"[SIGNED, BIT return SIGNED]: function is "array_scalar_or";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar OR operation

  -- Id: L.31 
  function "nand" (L : BIT; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "NAND"[BIT, SIGNED  return SIGNED]: function is "scalar_array_nand";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector NAND operation

  -- Id: L.32 
  function "nand" (L : SIGNED; R : BIT) return SIGNED;
    attribute builtin_subprogram of
        "NAND"[SIGNED, BIT  return SIGNED]: function is "array_scalar_nand";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar NAND operation

  -- Id: L.33 
  function "nor" (L : BIT; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "NOR"[BIT, SIGNED return SIGNED]: function is "scalar_array_nor";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector NOR operation

  -- Id: L.34 
  function "nor" (L : SIGNED; R : BIT) return SIGNED;
    attribute builtin_subprogram of
        "NOR"[SIGNED, BIT return SIGNED]: function is "array_scalar_nor";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar NOR operation

  -- Id: L.35 
  function "xor" (L : BIT; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "XOR"[BIT, SIGNED return SIGNED]: function is "scalar_array_xor";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector XOR operation

  -- Id: L.36 
  function "xor" (L : SIGNED; R : BIT) return SIGNED;
    attribute builtin_subprogram of
        "XOR"[SIGNED, BIT return SIGNED]: function is "array_scalar_xor";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar XOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.37 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.37 
  function "xnor" (L : BIT; R : SIGNED) return SIGNED;
    attribute builtin_subprogram of
        "XNOR"[BIT, SIGNED return SIGNED]: function is "scalar_array_xnor";
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector XNOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.38 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.38 
  function "xnor" (L : SIGNED; R : BIT) return SIGNED;
    attribute builtin_subprogram of
        "XNOR"[SIGNED, BIT return SIGNED]: function is "array_scalar_xnor";
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar XNOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.39 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.39
  function "and" (L : SIGNED) return BIT;
    attribute builtin_subprogram of
        "AND"[SIGNED return BIT]: function is "and_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of and'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.40 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.40
  function "nand" (L : SIGNED) return BIT;
    attribute builtin_subprogram of
        "NAND"[SIGNED return BIT]: function is "nand_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of nand'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.41 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.41
  function "or" (L : SIGNED) return BIT;
    attribute builtin_subprogram of
        "OR"[SIGNED return BIT]: function is "or_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of or'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.42 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.42
  function "nor" (L : SIGNED) return BIT;
    attribute builtin_subprogram of
        "NOR"[ SIGNED return BIT]: function is "nor_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of nor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.43 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.43
  function "xor" (L : SIGNED) return BIT;
    attribute builtin_subprogram of
        "XOR"[ SIGNED return BIT]: function is "xor_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of xor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.44 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.44
  function "xnor" (L : SIGNED) return BIT;
    attribute builtin_subprogram of
        "XNOR"[ SIGNED return BIT]: function is "xnor_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of xnor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.45 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.45
  function "and" (L : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "AND"[ UNSIGNED return BIT]: function is "and_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of and'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.46 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.46
  function "nand" (L : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "NAND"[ UNSIGNED return BIT]: function is "nand_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of nand'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.47 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.47
  function "or" (L : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "OR"[ UNSIGNED return BIT]: function is "or_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of or'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.48 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.48
  function "nor" (L : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "NOR"[ UNSIGNED return BIT]: function is "nor_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of nor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.49 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.49
  function "xor" (L : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "XOR"[ UNSIGNED return BIT]: function is "xor_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of xor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.50 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.50
  function "xnor" (L : UNSIGNED) return BIT;
    attribute builtin_subprogram of
        "XNOR"[ UNSIGNED return BIT]: function is "xnor_reduce";
  -- Result subtype: BIT. 
  -- Result: Result of xnor'ing all of the bits of the vector.

  --============================================================================
  -- Edge Detection Functions
  --============================================================================

  -- Id: E.1
  alias RISING_EDGE is STD.STANDARD.RISING_EDGE
    [STD.STANDARD.BIT return STD.STANDARD.BOOLEAN];
  -- Result subtype: BOOLEAN
  -- Result: Returns TRUE if an event is detected on signal S and the
  --         value changed from a '0' to a '1'.

  -- Id: E.2
  alias FALLING_EDGE is STD.STANDARD.FALLING_EDGE
    [STD.STANDARD.BIT return STD.STANDARD.BOOLEAN];
  -- Result subtype: BOOLEAN
  -- Result: Returns TRUE if an event is detected on signal S and the
  --         value changed from a '1' to a '0'.

  --============================================================================
  -- string conversion and write operations
  --============================================================================
  -- the following operations are predefined

  -- FUNCTION to_string ( value : UNSIGNED ) RETURN string;
  -- FUNCTION to_string ( value : SIGNED   ) RETURN string;

  -- explicitly defined operations

  alias to_bstring is to_string [UNSIGNED return STRING];
  alias to_bstring is to_string [SIGNED return STRING];
  alias to_binary_string is to_string [UNSIGNED return STRING];
  alias to_binary_string is to_string [SIGNED return STRING];

  function to_ostring (value : UNSIGNED) return STRING;
  function to_ostring (value : SIGNED) return STRING;
  -- TODO
  alias to_octal_string is to_ostring [UNSIGNED return STRING];
  alias to_octal_string is to_ostring [SIGNED return STRING];

  function to_hstring (value : UNSIGNED) return STRING;
  function to_hstring (value : SIGNED) return STRING;
  -- TODO
  alias to_hex_string is to_hstring [UNSIGNED return STRING];
  alias to_hex_string is to_hstring [SIGNED return STRING];

  procedure READ(L : inout LINE; VALUE : out UNSIGNED; GOOD : out BOOLEAN);

  procedure READ(L : inout LINE; VALUE : out UNSIGNED);

  procedure READ(L : inout LINE; VALUE : out SIGNED; GOOD : out BOOLEAN);

  procedure READ(L : inout LINE; VALUE : out SIGNED);

  procedure WRITE (L         : inout LINE; VALUE : in UNSIGNED;
                   JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);

  procedure WRITE (L         : inout LINE; VALUE : in SIGNED;
                   JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);

  alias BREAD is READ [LINE, UNSIGNED, BOOLEAN];
  alias BREAD is READ [LINE, SIGNED, BOOLEAN];

  alias BREAD is READ [LINE, UNSIGNED];
  alias BREAD is READ [LINE, SIGNED];

  alias BINARY_READ is READ [LINE, UNSIGNED, BOOLEAN];
  alias BINARY_READ is READ [LINE, SIGNED, BOOLEAN];

  alias BINARY_READ is READ [LINE, UNSIGNED];
  alias BINARY_READ is READ [LINE, SIGNED];

  procedure OREAD (L : inout LINE; VALUE : out UNSIGNED; GOOD : out BOOLEAN);
  procedure OREAD (L : inout LINE; VALUE : out SIGNED; GOOD : out BOOLEAN);

  procedure OREAD (L : inout LINE; VALUE : out UNSIGNED);
  procedure OREAD (L : inout LINE; VALUE : out SIGNED);

  alias OCTAL_READ is OREAD [LINE, UNSIGNED, BOOLEAN];
  alias OCTAL_READ is OREAD [LINE, SIGNED, BOOLEAN];

  alias OCTAL_READ is OREAD [LINE, UNSIGNED];
  alias OCTAL_READ is OREAD [LINE, SIGNED];

  procedure HREAD (L : inout LINE; VALUE : out UNSIGNED; GOOD : out BOOLEAN);
  procedure HREAD (L : inout LINE; VALUE : out SIGNED; GOOD : out BOOLEAN);

  procedure HREAD (L : inout LINE; VALUE : out UNSIGNED);
  procedure HREAD (L : inout LINE; VALUE : out SIGNED);

  alias HEX_READ is HREAD [LINE, UNSIGNED, BOOLEAN];
  alias HEX_READ is HREAD [LINE, SIGNED, BOOLEAN];

  alias HEX_READ is HREAD [LINE, UNSIGNED];
  alias HEX_READ is HREAD [LINE, SIGNED];

  alias BWRITE is WRITE [LINE, UNSIGNED, SIDE, WIDTH];
  alias BWRITE is WRITE [LINE, SIGNED, SIDE, WIDTH];

  alias BINARY_WRITE is WRITE [LINE, UNSIGNED, SIDE, WIDTH];
  alias BINARY_WRITE is WRITE [LINE, SIGNED, SIDE, WIDTH];

  procedure OWRITE (L         : inout LINE; VALUE : in UNSIGNED;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);

  procedure OWRITE (L         : inout LINE; VALUE : in SIGNED;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);

  alias OCTAL_WRITE is OWRITE [LINE, UNSIGNED, SIDE, WIDTH];
  alias OCTAL_WRITE is OWRITE [LINE, SIGNED, SIDE, WIDTH];

  procedure HWRITE (L         : inout LINE; VALUE : in UNSIGNED;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);

  procedure HWRITE (L         : inout LINE; VALUE : in SIGNED;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0);

  alias HEX_WRITE is HWRITE [LINE, UNSIGNED, SIDE, WIDTH];
  alias HEX_WRITE is HWRITE [LINE, SIGNED, SIDE, WIDTH];

end package NUMERIC_BIT;
-- --------------------------------------------------------------------
--
-- Copyright © 2008 by IEEE.
--
-- This source file is an essential part of IEEE Std 1076-2008,
-- IEEE Standard VHDL Language Reference Manual. This source file may not be
-- copied, sold, or included with software that is sold without written 
-- permission from the IEEE Standards Department. This source file may be 
-- copied for individual use between licensed users. This source file is
-- provided on an AS IS basis. The IEEE disclaims ANY WARRANTY EXPRESS OR
-- IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY AND FITNESS FOR USE
-- FOR A PARTICULAR PURPOSE. The user of the source file shall indemnify
-- and hold IEEE harmless from any damages or liability arising out of the
-- use thereof.
--
--   Title     :  Standard VHDL Synthesis Packages
--             :  (NUMERIC_BIT package body)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  IEEE DASC Synthesis Working Group,
--             :  Accellera VHDL-TC, and IEEE P1076 Working Group
--             :
--   Purpose   :  This package defines numeric types and arithmetic functions
--             :  for use with synthesis tools. Two numeric types are defined:
--             :  -- > UNSIGNED: represents an UNSIGNED number in vector form
--             :  -- > SIGNED: represents a SIGNED number in vector form
--             :  The base element type is type BIT.
--             :  The leftmost bit is treated as the most significant bit.
--             :  Signed vectors are represented in two's complement form.
--             :  This package contains overloaded arithmetic operators on
--             :  the SIGNED and UNSIGNED types. The package also contains
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
-- $Revision: #1 $
-- $Date: 2020/10/14 $
-- --------------------------------------------------------------------

package body NUMERIC_BIT is

  -- null range array constants

  constant NAU : UNSIGNED(0 downto 1) := (others => '0');
  constant NAS : SIGNED(0 downto 1)   := (others => '0');

  -- implementation controls

  constant NO_WARNING : BOOLEAN := false;  -- default to emit warnings

  -- =========================Local Subprograms =================================

  function SIGNED_NUM_BITS (ARG : INTEGER) return NATURAL is
    variable NBITS : NATURAL;
    variable N     : NATURAL;
  begin
    if ARG >= 0 then
      N := ARG;
    else
      N := -(ARG+1);
    end if;
    NBITS := 1;
    while N > 0 loop
      NBITS := NBITS+1;
      N := N / 2;
    end loop;
    return NBITS;
  end function SIGNED_NUM_BITS;

  function UNSIGNED_NUM_BITS (ARG : NATURAL) return NATURAL is
    variable NBITS : NATURAL;
    variable N     : NATURAL;
  begin
    N := ARG;
    NBITS := 1;
    while N > 1 loop
      NBITS := NBITS+1;
      N := N / 2;
    end loop;
    return NBITS;
  end function UNSIGNED_NUM_BITS;

  ------------------------------------------------------------------------------
  -- this internal function computes the addition of two UNSIGNED
  -- with input carry
  -- * the two arguments are of the same length

  function ADD_UNSIGNED (L, R : UNSIGNED; C : BIT) return UNSIGNED is
    constant L_LEFT : INTEGER := L'length-1;
    alias XL        : UNSIGNED(L_LEFT downto 0) is L;
    alias XR        : UNSIGNED(L_LEFT downto 0) is R;
    variable RESULT : UNSIGNED(L_LEFT downto 0);
    variable CBIT   : BIT     := C;
  begin
    for I in 0 to L_LEFT loop
      RESULT(I) := CBIT xor XL(I) xor XR(I);
      CBIT      := (CBIT and XL(I)) or (CBIT and XR(I)) or (XL(I) and XR(I));
    end loop;
    return RESULT;
  end function ADD_UNSIGNED;

  -- this internal function computes the addition of two SIGNED
  -- with input carry
  -- * the two arguments are of the same length

  function ADD_SIGNED (L, R : SIGNED; C : BIT) return SIGNED is
    constant L_LEFT : INTEGER := L'length-1;
    alias XL        : SIGNED(L_LEFT downto 0) is L;
    alias XR        : SIGNED(L_LEFT downto 0) is R;
    variable RESULT : SIGNED(L_LEFT downto 0);
    variable CBIT   : BIT     := C;
  begin
    for I in 0 to L_LEFT loop
      RESULT(I) := CBIT xor XL(I) xor XR(I);
      CBIT      := (CBIT and XL(I)) or (CBIT and XR(I)) or (XL(I) and XR(I));
    end loop;
    return RESULT;
  end function ADD_SIGNED;

  ------------------------------------------------------------------------------

  -- this internal procedure computes UNSIGNED division
  -- giving the quotient and remainder.
  procedure DIVMOD (NUM, XDENOM : UNSIGNED; XQUOT, XREMAIN : out UNSIGNED) is
    variable TEMP   : UNSIGNED(NUM'length downto 0);
    variable QUOT   : UNSIGNED(MAXIMUM(NUM'length, XDENOM'length)-1 downto 0);
    alias DENOM     : UNSIGNED(XDENOM'length-1 downto 0) is XDENOM;
    variable TOPBIT : INTEGER;
  begin
    TEMP   := "0"&NUM;
    QUOT   := (others => '0');
    TOPBIT := -1;
    for J in DENOM'range loop
      if DENOM(J) = '1' then
        TOPBIT := J;
        exit;
      end if;
    end loop;
    assert TOPBIT >= 0 report "NUMERIC_BIT.DIVMOD: DIV, MOD, or REM by zero"
      severity error;

    for J in NUM'length-(TOPBIT+1) downto 0 loop
      if TEMP(TOPBIT+J+1 downto J) >= "0"&DENOM(TOPBIT downto 0) then
        TEMP(TOPBIT+J+1 downto J) := (TEMP(TOPBIT+J+1 downto J))
                                     -("0"&DENOM(TOPBIT downto 0));
        QUOT(J) := '1';
      end if;
      assert TEMP(TOPBIT+J+1) = '0'
        report "NUMERIC_BIT.DIVMOD: internal error in the division algorithm"
        severity error;
    end loop;
    XQUOT   := RESIZE(QUOT, XQUOT'length);
    XREMAIN := RESIZE(TEMP, XREMAIN'length);
  end procedure DIVMOD;

  -----------------Local Subprograms - shift/rotate ops-------------------------

  function XSLL (ARG : BIT_VECTOR; COUNT : NATURAL) return BIT_VECTOR is
    constant ARG_L  : INTEGER                    := ARG'length-1;
    alias XARG      : BIT_VECTOR(ARG_L downto 0) is ARG;
    variable RESULT : BIT_VECTOR(ARG_L downto 0) := (others => '0');
  begin
    if COUNT <= ARG_L then
      RESULT(ARG_L downto COUNT) := XARG(ARG_L-COUNT downto 0);
    end if;
    return RESULT;
  end function XSLL;

  function XSRL (ARG : BIT_VECTOR; COUNT : NATURAL) return BIT_VECTOR is
    constant ARG_L  : INTEGER                    := ARG'length-1;
    alias XARG      : BIT_VECTOR(ARG_L downto 0) is ARG;
    variable RESULT : BIT_VECTOR(ARG_L downto 0) := (others => '0');
  begin
    if COUNT <= ARG_L then
      RESULT(ARG_L-COUNT downto 0) := XARG(ARG_L downto COUNT);
    end if;
    return RESULT;
  end function XSRL;

  function XSRA (ARG : BIT_VECTOR; COUNT : NATURAL) return BIT_VECTOR is
    constant ARG_L  : INTEGER := ARG'length-1;
    alias XARG      : BIT_VECTOR(ARG_L downto 0) is ARG;
    variable RESULT : BIT_VECTOR(ARG_L downto 0);
    variable XCOUNT : NATURAL := COUNT;
  begin
    if ((ARG'length <= 1) or (XCOUNT = 0)) then return ARG;
    else
      if (XCOUNT > ARG_L) then XCOUNT           := ARG_L;
      end if;
      RESULT(ARG_L-XCOUNT downto 0)             := XARG(ARG_L downto XCOUNT);
      RESULT(ARG_L downto (ARG_L - XCOUNT + 1)) := (others => XARG(ARG_L));
    end if;
    return RESULT;
  end function XSRA;

  function XROL (ARG : BIT_VECTOR; COUNT : NATURAL) return BIT_VECTOR is
    constant ARG_L  : INTEGER                    := ARG'length-1;
    alias XARG      : BIT_VECTOR(ARG_L downto 0) is ARG;
    variable RESULT : BIT_VECTOR(ARG_L downto 0) := XARG;
    variable COUNTM : INTEGER;
  begin
    COUNTM := COUNT mod (ARG_L + 1);
    if COUNTM /= 0 then
      RESULT(ARG_L downto COUNTM) := XARG(ARG_L-COUNTM downto 0);
      RESULT(COUNTM-1 downto 0)   := XARG(ARG_L downto ARG_L-COUNTM+1);
    end if;
    return RESULT;
  end function XROL;

  function XROR (ARG : BIT_VECTOR; COUNT : NATURAL) return BIT_VECTOR is
    constant ARG_L  : INTEGER                    := ARG'length-1;
    alias XARG      : BIT_VECTOR(ARG_L downto 0) is ARG;
    variable RESULT : BIT_VECTOR(ARG_L downto 0) := XARG;
    variable COUNTM : INTEGER;
  begin
    COUNTM := COUNT mod (ARG_L + 1);
    if COUNTM /= 0 then
      RESULT(ARG_L-COUNTM downto 0)       := XARG(ARG_L downto COUNTM);
      RESULT(ARG_L downto ARG_L-COUNTM+1) := XARG(COUNTM-1 downto 0);
    end if;
    return RESULT;
  end function XROR;

  ---------------- Local Subprograms - Relational Operators --------------------

  --
  -- General "=" for UNSIGNED vectors, same length
  --
  function UNSIGNED_EQUAL (L, R : UNSIGNED) return BOOLEAN is
  begin
    return BIT_VECTOR(L) = BIT_VECTOR(R);
  end function UNSIGNED_EQUAL;

  --
  -- General "=" for SIGNED vectors, same length
  --
  function SIGNED_EQUAL (L, R : SIGNED) return BOOLEAN is
  begin
    return BIT_VECTOR(L) = BIT_VECTOR(R);
  end function SIGNED_EQUAL;

  --
  -- General "<" for UNSIGNED vectors, same length
  --
  function UNSIGNED_LESS (L, R : UNSIGNED) return BOOLEAN is
  begin
    return BIT_VECTOR(L) < BIT_VECTOR(R);
  end function UNSIGNED_LESS;

  --
  -- General "<" function for SIGNED vectors, same length
  --
  function SIGNED_LESS (L, R : SIGNED) return BOOLEAN is
    -- Need aliases to assure index direction
    variable INTERN_L : SIGNED(0 to L'length-1);
    variable INTERN_R : SIGNED(0 to R'length-1);
  begin
    INTERN_L    := L;
    INTERN_R    := R;
    INTERN_L(0) := not INTERN_L(0);
    INTERN_R(0) := not INTERN_R(0);
    return BIT_VECTOR(INTERN_L) < BIT_VECTOR(INTERN_R);
  end function SIGNED_LESS;

  --
  -- General "<=" function for UNSIGNED vectors, same length
  --
  function UNSIGNED_LESS_OR_EQUAL (L, R : UNSIGNED) return BOOLEAN is
  begin
    return BIT_VECTOR(L) <= BIT_VECTOR(R);
  end function UNSIGNED_LESS_OR_EQUAL;

  --
  -- General "<=" function for SIGNED vectors, same length
  --
  function SIGNED_LESS_OR_EQUAL (L, R : SIGNED) return BOOLEAN is
    -- Need aliases to assure index direction
    variable INTERN_L : SIGNED(0 to L'length-1);
    variable INTERN_R : SIGNED(0 to R'length-1);
  begin
    INTERN_L                    := L;
    INTERN_R                    := R;
    INTERN_L(0)                 := not INTERN_L(0);
    INTERN_R(0)                 := not INTERN_R(0);
    return BIT_VECTOR(INTERN_L) <= BIT_VECTOR(INTERN_R);
  end function SIGNED_LESS_OR_EQUAL;

  -- ====================== Exported Functions ==================================

  -- Id: A.1
  function "abs" (ARG : SIGNED) return SIGNED is
    constant ARG_LEFT : INTEGER := ARG'length-1;
    variable RESULT   : SIGNED(ARG_LEFT downto 0);
  begin
    if ARG'length < 1 then return NAS;
    end if;
    RESULT := ARG;
    if RESULT(RESULT'left) = '1' then
      RESULT := -RESULT;
    end if;
    return RESULT;
  end function "abs";

  -- Id: A.2
  function "-" (ARG : SIGNED) return SIGNED is
    constant ARG_LEFT : INTEGER := ARG'length-1;
    alias XARG        : SIGNED(ARG_LEFT downto 0) is ARG;
    variable RESULT   : SIGNED(ARG_LEFT downto 0);
    variable CBIT     : BIT     := '1';
  begin
    if ARG'length < 1 then return NAS;
    end if;
    for I in 0 to RESULT'left loop
      RESULT(I) := not(XARG(I)) xor CBIT;
      CBIT      := CBIT and not(XARG(I));
    end loop;
    return RESULT;
  end function "-";

  -- ============================================================================

  -- Id: A.3
  function "+" (L, R : UNSIGNED) return UNSIGNED is
    constant L_LEFT : INTEGER := L'length-1;
    constant R_LEFT : INTEGER := R'length-1;
    constant SIZE   : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAU;
    end if;
    return ADD_UNSIGNED(RESIZE(L, SIZE), RESIZE(R, SIZE), '0');
  end function "+";

  -- Id: A.3R
  function "+" (L : UNSIGNED; R : BIT) return UNSIGNED is
    variable XR : UNSIGNED(L'length-1 downto 0) := (others => '0');
  begin
    XR(0) := R;
    return (L + XR);
  end function "+";

  -- Id: A.3L
  function "+" (L : BIT; R : UNSIGNED) return UNSIGNED is
    variable XL : UNSIGNED(R'length-1 downto 0) := (others => '0');
  begin
    XL(0) := L;
    return (XL + R);
  end function "+";

  -- Id: A.4
  function "+" (L, R : SIGNED) return SIGNED is
    constant L_LEFT : INTEGER := L'length-1;
    constant R_LEFT : INTEGER := R'length-1;
    constant SIZE   : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAS;
    end if;
    return ADD_SIGNED(RESIZE(L, SIZE), RESIZE(R, SIZE), '0');
  end function "+";

  -- Id: A.4R
  function "+" (L : SIGNED; R : BIT) return SIGNED is
    variable XR : SIGNED(L'length-1 downto 0) := (others => '0');
  begin
    XR(0) := R;
    return (L + XR);
  end function "+";

  -- Id: A.4L
  function "+" (L : BIT; R : SIGNED) return SIGNED is
    variable XL : SIGNED(R'length-1 downto 0) := (others => '0');
  begin
    XL(0) := L;
    return (XL + R);
  end function "+";

  -- Id: A.5
  function "+" (L : UNSIGNED; R : NATURAL) return UNSIGNED is
  begin
    return L + TO_UNSIGNED(R, L'length);
  end function "+";

  -- Id: A.6
  function "+" (L : NATURAL; R : UNSIGNED) return UNSIGNED is
  begin
    return TO_UNSIGNED(L, R'length) + R;
  end function "+";

  -- Id: A.7
  function "+" (L : SIGNED; R : INTEGER) return SIGNED is
  begin
    return L + TO_SIGNED(R, L'length);
  end function "+";

  -- Id: A.8
  function "+" (L : INTEGER; R : SIGNED) return SIGNED is
  begin
    return TO_SIGNED(L, R'length) + R;
  end function "+";

  -- ============================================================================

  -- Id: A.9
  function "-" (L, R : UNSIGNED) return UNSIGNED is
    constant L_LEFT : INTEGER := L'length-1;
    constant R_LEFT : INTEGER := R'length-1;
    constant SIZE   : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAU;
    end if;
    return ADD_UNSIGNED(RESIZE(L, SIZE),
                        not(RESIZE(R, SIZE)),
                        '1');
  end function "-";

  -- Id: A.9R
  function "-" (L : UNSIGNED; R : BIT) return UNSIGNED is
    variable XR : UNSIGNED(L'length-1 downto 0) := (others => '0');
  begin
    XR(0) := R;
    return (L - XR);
  end function "-";

  -- Id: A.9L
  function "-" (L : BIT; R : UNSIGNED) return UNSIGNED is
    variable XL : UNSIGNED(R'length-1 downto 0) := (others => '0');
  begin
    XL(0) := L;
    return (XL - R);
  end function "-";

  -- Id: A.10
  function "-" (L, R : SIGNED) return SIGNED is
    constant L_LEFT : INTEGER := L'length-1;
    constant R_LEFT : INTEGER := R'length-1;
    constant SIZE   : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAS;
    end if;
    return ADD_SIGNED(RESIZE(L, SIZE),
                      not(RESIZE(R, SIZE)),
                      '1');
  end function "-";

  -- Id: A.10R
  function "-" (L : SIGNED; R : BIT) return SIGNED is
    variable XR : SIGNED(L'length-1 downto 0) := (others => '0');
  begin
    XR(0) := R;
    return (L - XR);
  end function "-";

  -- Id: A.10L
  function "-" (L : BIT; R : SIGNED) return SIGNED is
    variable XL : SIGNED(R'length-1 downto 0) := (others => '0');
  begin
    XL(0) := L;
    return (XL - R);
  end function "-";

  -- Id: A.11
  function "-" (L : UNSIGNED; R : NATURAL) return UNSIGNED is
  begin
    return L - TO_UNSIGNED(R, L'length);
  end function "-";

  -- Id: A.12
  function "-" (L : NATURAL; R : UNSIGNED) return UNSIGNED is
  begin
    return TO_UNSIGNED(L, R'length) - R;
  end function "-";

  -- Id: A.13
  function "-" (L : SIGNED; R : INTEGER) return SIGNED is
  begin
    return L - TO_SIGNED(R, L'length);
  end function "-";

  -- Id: A.14
  function "-" (L : INTEGER; R : SIGNED) return SIGNED is
  begin
    return TO_SIGNED(L, R'length) - R;
  end function "-";

  -- ============================================================================

  -- Id: A.15
  function "*" (L, R : UNSIGNED) return UNSIGNED is
    constant L_LEFT : INTEGER                                  := L'length-1;
    constant R_LEFT : INTEGER                                  := R'length-1;
    alias XL        : UNSIGNED(L_LEFT downto 0) is L;
    alias XR        : UNSIGNED(R_LEFT downto 0) is R;
    variable RESULT : UNSIGNED((L'length+R'length-1) downto 0) := (others => '0');
    variable ADVAL  : UNSIGNED((L'length+R'length-1) downto 0);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAU;
    end if;
    ADVAL := RESIZE(XR, RESULT'length);
    for I in 0 to L_LEFT loop
      if XL(I) = '1' then RESULT := RESULT + ADVAL;
      end if;
      ADVAL                      := SHIFT_LEFT(ADVAL, 1);
    end loop;
    return RESULT;
  end function "*";

  -- Id: A.16
  function "*" (L, R : SIGNED) return SIGNED is
    constant L_LEFT : INTEGER                            := L'length-1;
    constant R_LEFT : INTEGER                            := R'length-1;
    variable XL     : SIGNED(L_LEFT downto 0);
    variable XR     : SIGNED(R_LEFT downto 0);
    variable RESULT : SIGNED((L_LEFT+R_LEFT+1) downto 0) := (others => '0');
    variable ADVAL  : SIGNED((L_LEFT+R_LEFT+1) downto 0);
  begin
    if ((L_LEFT < 0) or (R_LEFT < 0)) then return NAS;
    end if;
    XL    := L;
    XR    := R;
    ADVAL := RESIZE(XR, RESULT'length);
    for I in 0 to L_LEFT-1 loop
      if XL(I) = '1' then RESULT := RESULT + ADVAL;
      end if;
      ADVAL                      := SHIFT_LEFT(ADVAL, 1);
    end loop;
    if XL(L_LEFT) = '1' then
      RESULT := RESULT - ADVAL;
    end if;
    return RESULT;
  end function "*";

  -- Id: A.17
  function "*" (L : UNSIGNED; R : NATURAL) return UNSIGNED is
  begin
    return L * TO_UNSIGNED(R, L'length);
  end function "*";

  -- Id: A.18
  function "*" (L : NATURAL; R : UNSIGNED) return UNSIGNED is
  begin
    return TO_UNSIGNED(L, R'length) * R;
  end function "*";

  -- Id: A.19
  function "*" (L : SIGNED; R : INTEGER) return SIGNED is
  begin
    return L * TO_SIGNED(R, L'length);
  end function "*";

  -- Id: A.20
  function "*" (L : INTEGER; R : SIGNED) return SIGNED is
  begin
    return TO_SIGNED(L, R'length) * R;
  end function "*";

  -- ============================================================================

  -- Id: A.21
  function "/" (L, R : UNSIGNED) return UNSIGNED is
    variable FQUOT   : UNSIGNED(L'length-1 downto 0);
    variable FREMAIN : UNSIGNED(R'length-1 downto 0);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAU;
    end if;
    DIVMOD(L, R, FQUOT, FREMAIN);
    return FQUOT;
  end function "/";

  -- Id: A.22
  function "/" (L, R : SIGNED) return SIGNED is
    variable FQUOT   : UNSIGNED(L'length-1 downto 0);
    variable FREMAIN : UNSIGNED(R'length-1 downto 0);
    variable XNUM    : UNSIGNED(L'length-1 downto 0);
    variable XDENOM  : UNSIGNED(R'length-1 downto 0);
    variable QNEG    : BOOLEAN := false;
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAS;
    end if;
    if L(L'left) = '1' then
      XNUM := UNSIGNED(-L);
      QNEG := true;
    else
      XNUM := UNSIGNED(L);
    end if;
    if R(R'left) = '1' then
      XDENOM := UNSIGNED(-R);
      QNEG   := not QNEG;
    else
      XDENOM := UNSIGNED(R);
    end if;
    DIVMOD(XNUM, XDENOM, FQUOT, FREMAIN);
    if QNEG then FQUOT := "0"-FQUOT;
    end if;
    return SIGNED(FQUOT);
  end function "/";

  -- Id: A.23
  function "/" (L : UNSIGNED; R : NATURAL) return UNSIGNED is
    constant R_LENGTH : NATURAL := MAXIMUM(L'length, UNSIGNED_NUM_BITS(R));
    variable XR, QUOT : UNSIGNED(R_LENGTH-1 downto 0);
  begin
    if (L'length < 1) then return NAU;
    end if;
    if (R_LENGTH > L'length) then
      QUOT := (others => '0');
      return RESIZE(QUOT, L'length);
    end if;
    XR   := TO_UNSIGNED(R, R_LENGTH);
    QUOT := RESIZE((L / XR), QUOT'length);
    return RESIZE(QUOT, L'length);
  end function "/";

  -- Id: A.24
  function "/" (L : NATURAL; R : UNSIGNED) return UNSIGNED is
    constant L_LENGTH : NATURAL := MAXIMUM(UNSIGNED_NUM_BITS(L), R'length);
    variable XL, QUOT : UNSIGNED(L_LENGTH-1 downto 0);
  begin
    if (R'length < 1) then return NAU;
    end if;
    XL   := TO_UNSIGNED(L, L_LENGTH);
    QUOT := RESIZE((XL / R), QUOT'length);
    if L_LENGTH > R'length
      and QUOT(L_LENGTH-1 downto R'length)
      /= (L_LENGTH-1 downto R'length => '0')
    then
      assert NO_WARNING report "NUMERIC_BIT.""/"": Quotient Truncated"
        severity warning;
    end if;
    return RESIZE(QUOT, R'length);
  end function "/";

  -- Id: A.25
  function "/" (L : SIGNED; R : INTEGER) return SIGNED is
    constant R_LENGTH : NATURAL := MAXIMUM(L'length, SIGNED_NUM_BITS(R));
    variable XR, QUOT : SIGNED(R_LENGTH-1 downto 0);
  begin
    if (L'length < 1) then return NAS;
    end if;
    if (R_LENGTH > L'length) then
      QUOT := (others => '0');
      return RESIZE(QUOT, L'length);
    end if;
    XR   := TO_SIGNED(R, R_LENGTH);
    QUOT := RESIZE((L / XR), QUOT'length);
    return RESIZE(QUOT, L'length);
  end function "/";

  -- Id: A.26
  function "/" (L : INTEGER; R : SIGNED) return SIGNED is
    constant L_LENGTH : NATURAL := MAXIMUM(SIGNED_NUM_BITS(L), R'length);
    variable XL, QUOT : SIGNED(L_LENGTH-1 downto 0);
  begin
    if (R'length < 1) then return NAS;
    end if;
    XL   := TO_SIGNED(L, L_LENGTH);
    QUOT := RESIZE((XL / R), QUOT'length);
    if L_LENGTH > R'length and QUOT(L_LENGTH-1 downto R'length)
      /= (L_LENGTH-1 downto R'length => QUOT(R'length-1))
    then
      assert NO_WARNING report "NUMERIC_BIT.""/"": Quotient Truncated"
        severity warning;
    end if;
    return RESIZE(QUOT, R'length);
  end function "/";

  -- ============================================================================

  -- Id: A.27
  function "rem" (L, R : UNSIGNED) return UNSIGNED is
    variable FQUOT   : UNSIGNED(L'length-1 downto 0);
    variable FREMAIN : UNSIGNED(R'length-1 downto 0);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAU;
    end if;
    DIVMOD(L, R, FQUOT, FREMAIN);
    return FREMAIN;
  end function "rem";

  -- Id: A.28
  function "rem" (L, R : SIGNED) return SIGNED is
    variable FQUOT   : UNSIGNED(L'length-1 downto 0);
    variable FREMAIN : UNSIGNED(R'length-1 downto 0);
    variable XNUM    : UNSIGNED(L'length-1 downto 0);
    variable XDENOM  : UNSIGNED(R'length-1 downto 0);
    variable RNEG    : BOOLEAN := false;
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAS;
    end if;
    if L(L'left) = '1' then
      XNUM := UNSIGNED(-L);
      RNEG := true;
    else
      XNUM := UNSIGNED(L);
    end if;
    if R(R'left) = '1' then
      XDENOM := UNSIGNED(-R);
    else
      XDENOM := UNSIGNED(R);
    end if;
    DIVMOD(XNUM, XDENOM, FQUOT, FREMAIN);
    if RNEG then
      FREMAIN := "0"-FREMAIN;
    end if;
    return SIGNED(FREMAIN);
  end function "rem";

  -- Id: A.29
  function "rem" (L : UNSIGNED; R : NATURAL) return UNSIGNED is
    constant R_LENGTH : NATURAL := MAXIMUM(L'length, UNSIGNED_NUM_BITS(R));
    variable XR, XREM : UNSIGNED(R_LENGTH-1 downto 0);
  begin
    if (L'length < 1) then return NAU;
    end if;
    XR   := TO_UNSIGNED(R, R_LENGTH);
    XREM := RESIZE((L rem XR), XREM'length);
    if R_LENGTH > L'length and XREM(R_LENGTH-1 downto L'length)
      /= (R_LENGTH-1 downto L'length => '0')
    then
      assert NO_WARNING report "NUMERIC_BIT.""rem"": Remainder Truncated"
        severity warning;
    end if;
    return RESIZE(XREM, L'length);
  end function "rem";

  -- Id: A.30
  function "rem" (L : NATURAL; R : UNSIGNED) return UNSIGNED is
    constant L_LENGTH : NATURAL := MAXIMUM(UNSIGNED_NUM_BITS(L), R'length);
    variable XL, XREM : UNSIGNED(L_LENGTH-1 downto 0);
  begin
    if (R'length < 1) then return NAU;
    end if;
    XL   := TO_UNSIGNED(L, L_LENGTH);
    XREM := RESIZE((XL rem R), XREM'length);
    if L_LENGTH > R'length and XREM(L_LENGTH-1 downto R'length)
      /= (L_LENGTH-1 downto R'length => '0')
    then
      assert NO_WARNING report "NUMERIC_BIT.""rem"": Remainder Truncated"
        severity warning;
    end if;
    return RESIZE(XREM, R'length);
  end function "rem";

  -- Id: A.31
  function "rem" (L : SIGNED; R : INTEGER) return SIGNED is
    constant R_LENGTH : NATURAL := MAXIMUM(L'length, SIGNED_NUM_BITS(R));
    variable XR, XREM : SIGNED(R_LENGTH-1 downto 0);
  begin
    if (L'length < 1) then return NAS;
    end if;
    XR   := TO_SIGNED(R, R_LENGTH);
    XREM := RESIZE((L rem XR), XREM'length);
    if R_LENGTH > L'length and XREM(R_LENGTH-1 downto L'length)
      /= (R_LENGTH-1 downto L'length => XREM(L'length-1))
    then
      assert NO_WARNING report "NUMERIC_BIT.""rem"": Remainder Truncated"
        severity warning;
    end if;
    return RESIZE(XREM, L'length);
  end function "rem";

  -- Id: A.32
  function "rem" (L : INTEGER; R : SIGNED) return SIGNED is
    constant L_LENGTH : NATURAL := MAXIMUM(SIGNED_NUM_BITS(L), R'length);
    variable XL, XREM : SIGNED(L_LENGTH-1 downto 0);
  begin
    if (R'length < 1) then return NAS;
    end if;
    XL   := TO_SIGNED(L, L_LENGTH);
    XREM := RESIZE((XL rem R), XREM'length);
    if L_LENGTH > R'length and XREM(L_LENGTH-1 downto R'length)
      /= (L_LENGTH-1 downto R'length => XREM(R'length-1))
    then
      assert NO_WARNING report "NUMERIC_BIT.""rem"": Remainder Truncated"
        severity warning;
    end if;
    return RESIZE(XREM, R'length);
  end function "rem";

  -- ============================================================================

  -- Id: A.33
  function "mod" (L, R : UNSIGNED) return UNSIGNED is
    variable FQUOT   : UNSIGNED(L'length-1 downto 0);
    variable FREMAIN : UNSIGNED(R'length-1 downto 0);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAU;
    end if;
    DIVMOD(L, R, FQUOT, FREMAIN);
    return FREMAIN;
  end function "mod";

  -- Id: A.34
  function "mod" (L, R : SIGNED) return SIGNED is
    variable FQUOT   : UNSIGNED(L'length-1 downto 0);
    variable FREMAIN : UNSIGNED(R'length-1 downto 0);
    variable XNUM    : UNSIGNED(L'length-1 downto 0);
    variable XDENOM  : UNSIGNED(R'length-1 downto 0);
    variable RNEG    : BOOLEAN := false;
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAS;
    end if;
    if L(L'left) = '1' then
      XNUM := UNSIGNED(-L);
    else
      XNUM := UNSIGNED(L);
    end if;
    if R(R'left) = '1' then
      XDENOM := UNSIGNED(-R);
      RNEG   := true;
    else
      XDENOM := UNSIGNED(R);
    end if;
    DIVMOD(XNUM, XDENOM, FQUOT, FREMAIN);
    if RNEG and L(L'left) = '1' then
      FREMAIN := "0"-FREMAIN;
    elsif RNEG and FREMAIN /= "0" then
      FREMAIN := FREMAIN-XDENOM;
    elsif L(L'left) = '1' and FREMAIN /= "0" then
      FREMAIN := XDENOM-FREMAIN;
    end if;
    return SIGNED(FREMAIN);
  end function "mod";

  -- Id: A.35
  function "mod" (L : UNSIGNED; R : NATURAL) return UNSIGNED is
    constant R_LENGTH : NATURAL := MAXIMUM(L'length, UNSIGNED_NUM_BITS(R));
    variable XR, XREM : UNSIGNED(R_LENGTH-1 downto 0);
  begin
    if (L'length < 1) then return NAU;
    end if;
    XR   := TO_UNSIGNED(R, R_LENGTH);
    XREM := RESIZE((L mod XR), XREM'length);
    if R_LENGTH > L'length and XREM(R_LENGTH-1 downto L'length)
      /= (R_LENGTH-1 downto L'length => '0')
    then
      assert NO_WARNING report "NUMERIC_BIT.""mod"": Modulus Truncated"
        severity warning;
    end if;
    return RESIZE(XREM, L'length);
  end function "mod";

  -- Id: A.36
  function "mod" (L : NATURAL; R : UNSIGNED) return UNSIGNED is
    constant L_LENGTH : NATURAL := MAXIMUM(UNSIGNED_NUM_BITS(L), R'length);
    variable XL, XREM : UNSIGNED(L_LENGTH-1 downto 0);
  begin
    if (R'length < 1) then return NAU;
    end if;
    XL   := TO_UNSIGNED(L, L_LENGTH);
    XREM := RESIZE((XL mod R), XREM'length);
    if L_LENGTH > R'length and XREM(L_LENGTH-1 downto R'length)
      /= (L_LENGTH-1 downto R'length => '0')
    then
      assert NO_WARNING report "NUMERIC_BIT.""mod"": Modulus Truncated"
        severity warning;
    end if;
    return RESIZE(XREM, R'length);
  end function "mod";

  -- Id: A.37
  function "mod" (L : SIGNED; R : INTEGER) return SIGNED is
    constant R_LENGTH : NATURAL := MAXIMUM(L'length, SIGNED_NUM_BITS(R));
    variable XR, XREM : SIGNED(R_LENGTH-1 downto 0);
  begin
    if (L'length < 1) then return NAS;
    end if;
    XR   := TO_SIGNED(R, R_LENGTH);
    XREM := RESIZE((L mod XR), XREM'length);
    if R_LENGTH > L'length and XREM(R_LENGTH-1 downto L'length)
      /= (R_LENGTH-1 downto L'length => XREM(L'length-1))
    then
      assert NO_WARNING report "NUMERIC_BIT.""mod"": Modulus Truncated"
        severity warning;
    end if;
    return RESIZE(XREM, L'length);
  end function "mod";

  -- Id: A.38
  function "mod" (L : INTEGER; R : SIGNED) return SIGNED is
    constant L_LENGTH : NATURAL := MAXIMUM(SIGNED_NUM_BITS(L), R'length);
    variable XL, XREM : SIGNED(L_LENGTH-1 downto 0);
  begin
    if (R'length < 1) then return NAS;
    end if;
    XL   := TO_SIGNED(L, L_LENGTH);
    XREM := RESIZE((XL mod R), XREM'length);
    if L_LENGTH > R'length and XREM(L_LENGTH-1 downto R'length)
      /= (L_LENGTH-1 downto R'length => XREM(R'length-1))
    then
      assert NO_WARNING report "NUMERIC_BIT.""mod"": Modulus Truncated"
        severity warning;
    end if;
    return RESIZE(XREM, R'length);
  end function "mod";

  -- ============================================================================
  -- Id: A.39
  function find_leftmost (ARG : UNSIGNED; Y : BIT) return INTEGER is
  begin
    for INDEX in ARG'range loop
      if ARG(INDEX) = Y then
        return INDEX;
      end if;
    end loop;
    return -1;
  end function find_leftmost;

  -- Id: A.40
  function find_leftmost (ARG : SIGNED; Y : BIT) return INTEGER is
  begin
    for INDEX in ARG'range loop
      if ARG(INDEX) = Y then
        return INDEX;
      end if;
    end loop;
    return -1;
  end function find_leftmost;

  -- Id: A.41
  function find_rightmost (ARG : UNSIGNED; Y : BIT) return INTEGER is
  begin
    for INDEX in ARG'reverse_range loop
      if ARG(INDEX) = Y then
        return INDEX;
      end if;
    end loop;
    return -1;
  end function find_rightmost;

  -- Id: A.42
  function find_rightmost (ARG : SIGNED; Y : BIT) return INTEGER is
  begin
    for INDEX in ARG'reverse_range loop
      if ARG(INDEX) = Y then
        return INDEX;
      end if;
    end loop;
    return -1;
  end function find_rightmost;

  -- ============================================================================

  -- Id: C.1
  function ">" (L, R : UNSIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT."">"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return not UNSIGNED_LESS_OR_EQUAL(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function ">";

  -- Id: C.2
  function ">" (L, R : SIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT."">"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return not SIGNED_LESS_OR_EQUAL(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function ">";

  -- Id: C.3
  function ">" (L : NATURAL; R : UNSIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT."">"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(L) > R'length then return true;
    end if;
    return not UNSIGNED_LESS_OR_EQUAL(TO_UNSIGNED(L, R'length), R);
  end function ">";

  -- Id: C.4
  function ">" (L : INTEGER; R : SIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT."">"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(L) > R'length then return L > 0;
    end if;
    return not SIGNED_LESS_OR_EQUAL(TO_SIGNED(L, R'length), R);
  end function ">";

  -- Id: C.5
  function ">" (L : UNSIGNED; R : NATURAL) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT."">"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(R) > L'length then return false;
    end if;
    return not UNSIGNED_LESS_OR_EQUAL(L, TO_UNSIGNED(R, L'length));
  end function ">";

  -- Id: C.6
  function ">" (L : SIGNED; R : INTEGER) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT."">"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(R) > L'length then return 0 > R;
    end if;
    return not SIGNED_LESS_OR_EQUAL(L, TO_SIGNED(R, L'length));
  end function ">";

  -- ============================================================================

  -- Id: C.7
  function "<" (L, R : UNSIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return UNSIGNED_LESS(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function "<";

  -- Id: C.8
  function "<" (L, R : SIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return SIGNED_LESS(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function "<";

  -- Id: C.9
  function "<" (L : NATURAL; R : UNSIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(L) > R'length then return L < 0;
    end if;
    return UNSIGNED_LESS(TO_UNSIGNED(L, R'length), R);
  end function "<";

  -- Id: C.10
  function "<" (L : INTEGER; R : SIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(L) > R'length then return L < 0;
    end if;
    return SIGNED_LESS(TO_SIGNED(L, R'length), R);
  end function "<";

  -- Id: C.11
  function "<" (L : UNSIGNED; R : NATURAL) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(R) > L'length then return 0 < R;
    end if;
    return UNSIGNED_LESS(L, TO_UNSIGNED(R, L'length));
  end function "<";

  -- Id: C.12
  function "<" (L : SIGNED; R : INTEGER) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<"": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(R) > L'length then return 0 < R;
    end if;
    return SIGNED_LESS(L, TO_SIGNED(R, L'length));
  end function "<";

  -- ============================================================================

  -- Id: C.13
  function "<=" (L, R : UNSIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return UNSIGNED_LESS_OR_EQUAL(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function "<=";

  -- Id: C.14
  function "<=" (L, R : SIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return SIGNED_LESS_OR_EQUAL(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function "<=";

  -- Id: C.15
  function "<=" (L : NATURAL; R : UNSIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(L) > R'length then return L < 0;
    end if;
    return UNSIGNED_LESS_OR_EQUAL(TO_UNSIGNED(L, R'length), R);
  end function "<=";

  -- Id: C.16
  function "<=" (L : INTEGER; R : SIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(L) > R'length then return L < 0;
    end if;
    return SIGNED_LESS_OR_EQUAL(TO_SIGNED(L, R'length), R);
  end function "<=";

  -- Id: C.17
  function "<=" (L : UNSIGNED; R : NATURAL) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(R) > L'length then return 0 < R;
    end if;
    return UNSIGNED_LESS_OR_EQUAL(L, TO_UNSIGNED(R, L'length));
  end function "<=";

  -- Id: C.18
  function "<=" (L : SIGNED; R : INTEGER) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""<="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(R) > L'length then return 0 < R;
    end if;
    return SIGNED_LESS_OR_EQUAL(L, TO_SIGNED(R, L'length));
  end function "<=";

  -- ============================================================================

  -- Id: C.19
  function ">=" (L, R : UNSIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT."">="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return not UNSIGNED_LESS(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function ">=";

  -- Id: C.20
  function ">=" (L, R : SIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT."">="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return not SIGNED_LESS(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function ">=";

  -- Id: C.21
  function ">=" (L : NATURAL; R : UNSIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT."">="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(L) > R'length then return L > 0;
    end if;
    return not UNSIGNED_LESS(TO_UNSIGNED(L, R'length), R);
  end function ">=";

  -- Id: C.22
  function ">=" (L : INTEGER; R : SIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT."">="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(L) > R'length then return L > 0;
    end if;
    return not SIGNED_LESS(TO_SIGNED(L, R'length), R);
  end function ">=";

  -- Id: C.23
  function ">=" (L : UNSIGNED; R : NATURAL) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT."">="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(R) > L'length then return 0 > R;
    end if;
    return not UNSIGNED_LESS(L, TO_UNSIGNED(R, L'length));
  end function ">=";

  -- Id: C.24
  function ">=" (L : SIGNED; R : INTEGER) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT."">="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(R) > L'length then return 0 > R;
    end if;
    return not SIGNED_LESS(L, TO_SIGNED(R, L'length));
  end function ">=";

  -- ============================================================================

  -- Id: C.25
  function "=" (L, R : UNSIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT.""="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return UNSIGNED_EQUAL(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function "=";

  -- Id: C.26
  function "=" (L, R : SIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT.""="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    return SIGNED_EQUAL(RESIZE(L, SIZE), RESIZE(R, SIZE));
  end function "=";

  -- Id: C.27
  function "=" (L : NATURAL; R : UNSIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(L) > R'length then return false;
    end if;
    return UNSIGNED_EQUAL(TO_UNSIGNED(L, R'length), R);
  end function "=";

  -- Id: C.28
  function "=" (L : INTEGER; R : SIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(L) > R'length then return false;
    end if;
    return SIGNED_EQUAL(TO_SIGNED(L, R'length), R);
  end function "=";

  -- Id: C.29
  function "=" (L : UNSIGNED; R : NATURAL) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if UNSIGNED_NUM_BITS(R) > L'length then return false;
    end if;
    return UNSIGNED_EQUAL(L, TO_UNSIGNED(R, L'length));
  end function "=";

  -- Id: C.30
  function "=" (L : SIGNED; R : INTEGER) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""="": null argument detected, returning FALSE"
        severity warning;
      return false;
    end if;
    if SIGNED_NUM_BITS(R) > L'length then return false;
    end if;
    return SIGNED_EQUAL(L, TO_SIGNED(R, L'length));
  end function "=";

  -- ============================================================================

  -- Id: C.31
  function "/=" (L, R : UNSIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT.""/="": null argument detected, returning TRUE"
        severity warning;
      return true;
    end if;
    return not(UNSIGNED_EQUAL(RESIZE(L, SIZE), RESIZE(R, SIZE)));
  end function "/=";

  -- Id: C.32
  function "/=" (L, R : SIGNED) return BOOLEAN is
    variable SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then
      assert NO_WARNING
        report "NUMERIC_BIT.""/="": null argument detected, returning TRUE"
        severity warning;
      return true;
    end if;
    return not(SIGNED_EQUAL(RESIZE(L, SIZE), RESIZE(R, SIZE)));
  end function "/=";

  -- Id: C.33
  function "/=" (L : NATURAL; R : UNSIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""/="": null argument detected, returning TRUE"
        severity warning;
      return true;
    end if;
    if UNSIGNED_NUM_BITS(L) > R'length then return true;
    end if;
    return not(UNSIGNED_EQUAL(TO_UNSIGNED(L, R'length), R));
  end function "/=";

  -- Id: C.34
  function "/=" (L : INTEGER; R : SIGNED) return BOOLEAN is
  begin
    if (R'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""/="": null argument detected, returning TRUE"
        severity warning;
      return true;
    end if;
    if SIGNED_NUM_BITS(L) > R'length then return true;
    end if;
    return not(SIGNED_EQUAL(TO_SIGNED(L, R'length), R));
  end function "/=";

  -- Id: C.35
  function "/=" (L : UNSIGNED; R : NATURAL) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""/="": null argument detected, returning TRUE"
        severity warning;
      return true;
    end if;
    if UNSIGNED_NUM_BITS(R) > L'length then return true;
    end if;
    return not(UNSIGNED_EQUAL(L, TO_UNSIGNED(R, L'length)));
  end function "/=";

  -- Id: C.36
  function "/=" (L : SIGNED; R : INTEGER) return BOOLEAN is
  begin
    if (L'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.""/="": null argument detected, returning TRUE"
        severity warning;
      return true;
    end if;
    if SIGNED_NUM_BITS(R) > L'length then return true;
    end if;
    return not(SIGNED_EQUAL(L, TO_SIGNED(R, L'length)));
  end function "/=";

  -- ============================================================================

  -- Id: C.37
  function MINIMUM (L, R : UNSIGNED) return UNSIGNED is
    constant SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAU;
    end if;
    if UNSIGNED_LESS(RESIZE(L, SIZE), RESIZE(R, SIZE)) then
      return RESIZE(L, SIZE);
    else
      return RESIZE(R, SIZE);
    end if;
  end function MINIMUM;

  -- Id: C.38
  function MINIMUM (L, R : SIGNED) return SIGNED is
    constant SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAS;
    end if;
    if SIGNED_LESS(RESIZE(L, SIZE), RESIZE(R, SIZE)) then
      return RESIZE(L, SIZE);
    else
      return RESIZE(R, SIZE);
    end if;
  end function MINIMUM;

  -- Id: C.39
  function MINIMUM (L : NATURAL; R : UNSIGNED) return UNSIGNED is
  begin
    return MINIMUM(TO_UNSIGNED(L, R'length), R);
  end function MINIMUM;

  -- Id: C.40
  function MINIMUM (L : INTEGER; R : SIGNED) return SIGNED is
  begin
    return MINIMUM(TO_SIGNED(L, R'length), R);
  end function MINIMUM;

  -- Id: C.41
  function MINIMUM (L : UNSIGNED; R : NATURAL) return UNSIGNED is
  begin
    return MINIMUM(L, TO_UNSIGNED(R, L'length));
  end function MINIMUM;

  -- Id: C.42
  function MINIMUM (L : SIGNED; R : INTEGER) return SIGNED is
  begin
    return MINIMUM(L, TO_SIGNED(R, L'length));
  end function MINIMUM;

  -- ============================================================================

  -- Id: C.43
  function MAXIMUM (L, R : UNSIGNED) return UNSIGNED is
    constant SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAU;
    end if;
    if UNSIGNED_LESS(RESIZE(L, SIZE), RESIZE(R, SIZE)) then
      return RESIZE(R, SIZE);
    else
      return RESIZE(L, SIZE);
    end if;
  end function MAXIMUM;

  -- Id: C.44
  function MAXIMUM (L, R : SIGNED) return SIGNED is
    constant SIZE : NATURAL := MAXIMUM(L'length, R'length);
  begin
    if ((L'length < 1) or (R'length < 1)) then return NAS;
    end if;
    if SIGNED_LESS(RESIZE(L, SIZE), RESIZE(R, SIZE)) then
      return RESIZE(R, SIZE);
    else
      return RESIZE(L, SIZE);
    end if;
  end function MAXIMUM;

  -- Id: C.45
  function MAXIMUM (L : NATURAL; R : UNSIGNED) return UNSIGNED is
  begin
    return MAXIMUM(TO_UNSIGNED(L, R'length), R);
  end function MAXIMUM;

  -- Id: C.46
  function MAXIMUM (L : INTEGER; R : SIGNED) return SIGNED is
  begin
    return MAXIMUM(TO_SIGNED(L, R'length), R);
  end function MAXIMUM;

  -- Id: C.47
  function MAXIMUM (L : UNSIGNED; R : NATURAL) return UNSIGNED is
  begin
    return MAXIMUM(L, TO_UNSIGNED(R, L'length));
  end function MAXIMUM;

  -- Id: C.48
  function MAXIMUM (L : SIGNED; R : INTEGER) return SIGNED is
  begin
    return MAXIMUM(L, TO_SIGNED(R, L'length));
  end function MAXIMUM;

  -- ============================================================================

  -- Id: C.49
  function "?>" (L, R : UNSIGNED) return BIT is
  begin
    if L > R then
      return '1';
    else
      return '0';
    end if;
  end function "?>";

  -- Id: C.50
  function "?>" (L, R : SIGNED) return BIT is
  begin
    if L > R then
      return '1';
    else
      return '0';
    end if;
  end function "?>";

  -- Id: C.51
  function "?>" (L : NATURAL; R : UNSIGNED) return BIT is
  begin
    if L > R then
      return '1';
    else
      return '0';
    end if;
  end function "?>";

  -- Id: C.52
  function "?>" (L : INTEGER; R : SIGNED) return BIT is
  begin
    if L > R then
      return '1';
    else
      return '0';
    end if;
  end function "?>";

  -- Id: C.53
  function "?>" (L : UNSIGNED; R : NATURAL) return BIT is
  begin
    if L > R then
      return '1';
    else
      return '0';
    end if;
  end function "?>";

  -- Id: C.54
  function "?>" (L : SIGNED; R : INTEGER) return BIT is
  begin
    if L > R then
      return '1';
    else
      return '0';
    end if;
  end function "?>";

  -- ============================================================================

  -- Id: C.55
  function "?<" (L, R : UNSIGNED) return BIT is
  begin
    if L < R then
      return '1';
    else
      return '0';
    end if;
  end function "?<";

  -- Id: C.56
  function "?<" (L, R : SIGNED) return BIT is
  begin
    if L < R then
      return '1';
    else
      return '0';
    end if;
  end function "?<";

  -- Id: C.57
  function "?<" (L : NATURAL; R : UNSIGNED) return BIT is
  begin
    if L < R then
      return '1';
    else
      return '0';
    end if;
  end function "?<";

  -- Id: C.58
  function "?<" (L : INTEGER; R : SIGNED) return BIT is
  begin
    if L < R then
      return '1';
    else
      return '0';
    end if;
  end function "?<";

  -- Id: C.59
  function "?<" (L : UNSIGNED; R : NATURAL) return BIT is
  begin
    if L < R then
      return '1';
    else
      return '0';
    end if;
  end function "?<";

  -- Id: C.60
  function "?<" (L : SIGNED; R : INTEGER) return BIT is
  begin
    if L < R then
      return '1';
    else
      return '0';
    end if;
  end function "?<";

  -- ============================================================================

  -- Id: C.61
  function "?<=" (L, R : UNSIGNED) return BIT is
  begin
    if L <= R then
      return '1';
    else
      return '0';
    end if;
  end function "?<=";

  -- Id: C.62
  function "?<=" (L, R : SIGNED) return BIT is
  begin
    if L <= R then
      return '1';
    else
      return '0';
    end if;
  end function "?<=";

  -- Id: C.63
  function "?<=" (L : NATURAL; R : UNSIGNED) return BIT is
  begin
    if L <= R then
      return '1';
    else
      return '0';
    end if;
  end function "?<=";

  -- Id: C.64
  function "?<=" (L : INTEGER; R : SIGNED) return BIT is
  begin
    if L <= R then
      return '1';
    else
      return '0';
    end if;
  end function "?<=";

  -- Id: C.65
  function "?<=" (L : UNSIGNED; R : NATURAL) return BIT is
  begin
    if L <= R then
      return '1';
    else
      return '0';
    end if;
  end function "?<=";

  -- Id: C.66
  function "?<=" (L : SIGNED; R : INTEGER) return BIT is
  begin
    if L <= R then
      return '1';
    else
      return '0';
    end if;
  end function "?<=";

  -- ============================================================================

  -- Id: C.67
  function "?>=" (L, R : UNSIGNED) return BIT is
  begin
    if L >= R then
      return '1';
    else
      return '0';
    end if;
  end function "?>=";

  -- Id: C.68
  function "?>=" (L, R : SIGNED) return BIT is
  begin
    if L >= R then
      return '1';
    else
      return '0';
    end if;
  end function "?>=";

  -- Id: C.69
  function "?>=" (L : NATURAL; R : UNSIGNED) return BIT is
  begin
    if L >= R then
      return '1';
    else
      return '0';
    end if;
  end function "?>=";

  -- Id: C.70
  function "?>=" (L : INTEGER; R : SIGNED) return BIT is
  begin
    if L >= R then
      return '1';
    else
      return '0';
    end if;
  end function "?>=";

  -- Id: C.71
  function "?>=" (L : UNSIGNED; R : NATURAL) return BIT is
  begin
    if L >= R then
      return '1';
    else
      return '0';
    end if;
  end function "?>=";

  -- Id: C.72
  function "?>=" (L : SIGNED; R : INTEGER) return BIT is
  begin
    if L >= R then
      return '1';
    else
      return '0';
    end if;
  end function "?>=";

  -- ============================================================================

  -- Id: C.73
  function "?=" (L, R : UNSIGNED) return BIT is
  begin
    if L = R then
      return '1';
    else
      return '0';
    end if;
  end function "?=";

  -- Id: C.74
  function "?=" (L, R : SIGNED) return BIT is
  begin
    if L = R then
      return '1';
    else
      return '0';
    end if;
  end function "?=";

  -- Id: C.75
  function "?=" (L : NATURAL; R : UNSIGNED) return BIT is
  begin
    if L = R then
      return '1';
    else
      return '0';
    end if;
  end function "?=";

  -- Id: C.76
  function "?=" (L : INTEGER; R : SIGNED) return BIT is
  begin
    if L = R then
      return '1';
    else
      return '0';
    end if;
  end function "?=";

  -- Id: C.77
  function "?=" (L : UNSIGNED; R : NATURAL) return BIT is
  begin
    if L = R then
      return '1';
    else
      return '0';
    end if;
  end function "?=";

  -- Id: C.78
  function "?=" (L : SIGNED; R : INTEGER) return BIT is
  begin
    if L = R then
      return '1';
    else
      return '0';
    end if;
  end function "?=";

  -- ============================================================================

  -- Id: C.79
  function "?/=" (L, R : UNSIGNED) return BIT is
  begin
    if L /= R then
      return '1';
    else
      return '0';
    end if;
  end function "?/=";

  -- Id: C.80
  function "?/=" (L, R : SIGNED) return BIT is
  begin
    if L /= R then
      return '1';
    else
      return '0';
    end if;
  end function "?/=";

  -- Id: C.81
  function "?/=" (L : NATURAL; R : UNSIGNED) return BIT is
  begin
    if L /= R then
      return '1';
    else
      return '0';
    end if;
  end function "?/=";

  -- Id: C.82
  function "?/=" (L : INTEGER; R : SIGNED) return BIT is
  begin
    if L /= R then
      return '1';
    else
      return '0';
    end if;
  end function "?/=";

  -- Id: C.83
  function "?/=" (L : UNSIGNED; R : NATURAL) return BIT is
  begin
    if L /= R then
      return '1';
    else
      return '0';
    end if;
  end function "?/=";

  -- Id: C.84
  function "?/=" (L : SIGNED; R : INTEGER) return BIT is
  begin
    if L /= R then
      return '1';
    else
      return '0';
    end if;
  end function "?/=";

  -- ============================================================================

  -- Id: S.1
  function SHIFT_LEFT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED is
  begin
    if (ARG'length < 1) then return NAU;
    end if;
    return UNSIGNED(XSLL(BIT_VECTOR(ARG), COUNT));
  end function SHIFT_LEFT;

  -- Id: S.2
  function SHIFT_RIGHT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED is
  begin
    if (ARG'length < 1) then return NAU;
    end if;
    return UNSIGNED(XSRL(BIT_VECTOR(ARG), COUNT));
  end function SHIFT_RIGHT;

  -- Id: S.3
  function SHIFT_LEFT (ARG : SIGNED; COUNT : NATURAL) return SIGNED is
  begin
    if (ARG'length < 1) then return NAS;
    end if;
    return SIGNED(XSLL(BIT_VECTOR(ARG), COUNT));
  end function SHIFT_LEFT;

  -- Id: S.4
  function SHIFT_RIGHT (ARG : SIGNED; COUNT : NATURAL) return SIGNED is
  begin
    if (ARG'length < 1) then return NAS;
    end if;
    return SIGNED(XSRA(BIT_VECTOR(ARG), COUNT));
  end function SHIFT_RIGHT;

  -- ============================================================================

  -- Id: S.5
  function ROTATE_LEFT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED is
  begin
    if (ARG'length < 1) then return NAU;
    end if;
    return UNSIGNED(XROL(BIT_VECTOR(ARG), COUNT));
  end function ROTATE_LEFT;

  -- Id: S.6
  function ROTATE_RIGHT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED is
  begin
    if (ARG'length < 1) then return NAU;
    end if;
    return UNSIGNED(XROR(BIT_VECTOR(ARG), COUNT));
  end function ROTATE_RIGHT;

  -- Id: S.7
  function ROTATE_LEFT (ARG : SIGNED; COUNT : NATURAL) return SIGNED is
  begin
    if (ARG'length < 1) then return NAS;
    end if;
    return SIGNED(XROL(BIT_VECTOR(ARG), COUNT));
  end function ROTATE_LEFT;

  -- Id: S.8
  function ROTATE_RIGHT (ARG : SIGNED; COUNT : NATURAL) return SIGNED is
  begin
    if (ARG'length < 1) then return NAS;
    end if;
    return SIGNED(XROR(BIT_VECTOR(ARG), COUNT));
  end function ROTATE_RIGHT;

  -- ============================================================================

  ------------------------------------------------------------------------------
  -- Note: Function S.9 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.9
  function "sll" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED is
  begin
    if (COUNT >= 0) then
      return SHIFT_LEFT(ARG, COUNT);
    else
      return SHIFT_RIGHT(ARG, -COUNT);
    end if;
  end function "sll";

  ------------------------------------------------------------------------------
  -- Note: Function S.10 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.10
  function "sll" (ARG : SIGNED; COUNT : INTEGER) return SIGNED is
  begin
    if (COUNT >= 0) then
      return SHIFT_LEFT(ARG, COUNT);
    else
      return SIGNED(SHIFT_RIGHT(UNSIGNED(ARG), -COUNT));
    end if;
  end function "sll";

  ------------------------------------------------------------------------------
  -- Note: Function S.11 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.11
  function "srl" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED is
  begin
    if (COUNT >= 0) then
      return SHIFT_RIGHT(ARG, COUNT);
    else
      return SHIFT_LEFT(ARG, -COUNT);
    end if;
  end function "srl";

  ------------------------------------------------------------------------------
  -- Note: Function S.12 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.12
  function "srl" (ARG : SIGNED; COUNT : INTEGER) return SIGNED is
  begin
    if (COUNT >= 0) then
      return SIGNED(SHIFT_RIGHT(UNSIGNED(ARG), COUNT));
    else
      return SHIFT_LEFT(ARG, -COUNT);
    end if;
  end function "srl";

  ------------------------------------------------------------------------------
  -- Note: Function S.13 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.13
  function "rol" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED is
  begin
    if (COUNT >= 0) then
      return ROTATE_LEFT(ARG, COUNT);
    else
      return ROTATE_RIGHT(ARG, -COUNT);
    end if;
  end function "rol";

  ------------------------------------------------------------------------------
  -- Note: Function S.14 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.14
  function "rol" (ARG : SIGNED; COUNT : INTEGER) return SIGNED is
  begin
    if (COUNT >= 0) then
      return ROTATE_LEFT(ARG, COUNT);
    else
      return ROTATE_RIGHT(ARG, -COUNT);
    end if;
  end function "rol";

  ------------------------------------------------------------------------------
  -- Note: Function S.15 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.15
  function "ror" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED is
  begin
    if (COUNT >= 0) then
      return ROTATE_RIGHT(ARG, COUNT);
    else
      return ROTATE_LEFT(ARG, -COUNT);
    end if;
  end function "ror";

  ------------------------------------------------------------------------------
  -- Note: Function S.16 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.16
  function "ror" (ARG : SIGNED; COUNT : INTEGER) return SIGNED is
  begin
    if (COUNT >= 0) then
      return ROTATE_RIGHT(ARG, COUNT);
    else
      return ROTATE_LEFT(ARG, -COUNT);
    end if;
  end function "ror";

  ------------------------------------------------------------------------------
  -- Note: Function S.17 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.17
  function "sla" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED is
  begin
    if (COUNT >= 0) then
      return SHIFT_LEFT(ARG, COUNT);
    else
      return SHIFT_RIGHT(ARG, -COUNT);
    end if;
  end function "sla";

  ------------------------------------------------------------------------------
  -- Note: Function S.18 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.18
  function "sla" (ARG : SIGNED; COUNT : INTEGER) return SIGNED is
  begin
    if (COUNT >= 0) then
      return SHIFT_LEFT(ARG, COUNT);
    else
      return SHIFT_RIGHT(ARG, -COUNT);
    end if;
  end function "sla";

  ------------------------------------------------------------------------------
  -- Note: Function S.19 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.19
  function "sra" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED is
  begin
    if (COUNT >= 0) then
      return SHIFT_RIGHT(ARG, COUNT);
    else
      return SHIFT_LEFT(ARG, -COUNT);
    end if;
  end function "sra";

  ------------------------------------------------------------------------------
  -- Note: Function S.20 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.20
  function "sra" (ARG : SIGNED; COUNT : INTEGER) return SIGNED is
  begin
    if (COUNT >= 0) then
      return SHIFT_RIGHT(ARG, COUNT);
    else
      return SHIFT_LEFT(ARG, -COUNT);
    end if;
  end function "sra";

  -- ============================================================================

  -- Id: D.1
  function TO_INTEGER (ARG : UNSIGNED) return NATURAL is
    constant ARG_LEFT : INTEGER := ARG'length-1;
    alias XARG        : UNSIGNED(ARG_LEFT downto 0) is ARG;
    variable RESULT   : NATURAL := 0;
  begin
    if (ARG'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.TO_INTEGER: null detected, returning 0"
        severity warning;
      return 0;
    end if;
    for I in XARG'range loop
      RESULT := RESULT+RESULT;
      if XARG(I) = '1' then
        RESULT := RESULT + 1;
      end if;
    end loop;
    return RESULT;
  end function TO_INTEGER;

  -- Id: D.2
  function TO_INTEGER (ARG : SIGNED) return INTEGER is
  begin
    if (ARG'length < 1) then
      assert NO_WARNING
        report "NUMERIC_BIT.TO_INTEGER: null detected, returning 0"
        severity warning;
      return 0;
    end if;
    if ARG(ARG'left) = '0' then
      return TO_INTEGER(UNSIGNED(ARG));
    else
      return (- (TO_INTEGER(UNSIGNED(- (ARG + 1)))) -1);
    end if;
  end function TO_INTEGER;

  -- Id: D.3
  function TO_UNSIGNED (ARG, SIZE : NATURAL) return UNSIGNED is
    variable RESULT : UNSIGNED(SIZE-1 downto 0);
    variable I_VAL  : NATURAL := ARG;
  begin
    if (SIZE < 1) then return NAU;
    end if;
    for I in 0 to RESULT'left loop
      if (I_VAL mod 2) = 0 then
        RESULT(I) := '0';
      else RESULT(I) := '1';
      end if;
      I_VAL          := I_VAL/2;
    end loop;
    if not(I_VAL = 0) then
      assert NO_WARNING
        report "NUMERIC_BIT.TO_UNSIGNED: vector truncated"
        severity warning;
    end if;
    return RESULT;
  end function TO_UNSIGNED;

  -- Id: D.4
  function TO_SIGNED (ARG  : INTEGER;
                      SIZE : NATURAL) return SIGNED is
    variable RESULT : SIGNED(SIZE-1 downto 0);
    variable B_VAL  : BIT     := '0';
    variable I_VAL  : INTEGER := ARG;
  begin
    if (SIZE < 1) then return NAS;
    end if;
    if (ARG < 0) then
      B_VAL := '1';
      I_VAL := -(ARG+1);
    end if;
    for I in 0 to RESULT'left loop
      if (I_VAL mod 2) = 0 then
        RESULT(I) := B_VAL;
      else
        RESULT(I) := not B_VAL;
      end if;
      I_VAL := I_VAL/2;
    end loop;
    if ((I_VAL /= 0) or (B_VAL /= RESULT(RESULT'left))) then
      assert NO_WARNING
        report "NUMERIC_BIT.TO_SIGNED: vector truncated"
        severity warning;
    end if;
    return RESULT;
  end function TO_SIGNED;

  function TO_UNSIGNED (ARG : NATURAL; SIZE_RES : UNSIGNED)
    return UNSIGNED is
  begin
    return TO_UNSIGNED (ARG  => ARG,
                        SIZE => SIZE_RES'length);
  end function TO_UNSIGNED;

  function TO_SIGNED (ARG : INTEGER; SIZE_RES : SIGNED)
    return SIGNED is
  begin
    return TO_SIGNED (ARG  => ARG,
                      SIZE => SIZE_RES'length);
  end function TO_SIGNED;

  -- ============================================================================

  -- Id: R.1
  function RESIZE (ARG : SIGNED; NEW_SIZE : NATURAL) return SIGNED is
    alias INVEC     : SIGNED(ARG'length-1 downto 0) is ARG;
    variable RESULT : SIGNED(NEW_SIZE-1 downto 0) := (others => '0');
    constant BOUND  : INTEGER                     := MINIMUM(ARG'length, RESULT'length)-2;
  begin
    if (NEW_SIZE < 1) then return NAS;
    end if;
    if (ARG'length = 0) then return RESULT;
    end if;
    RESULT := (others => ARG(ARG'left));
    if BOUND >= 0 then
      RESULT(BOUND downto 0) := INVEC(BOUND downto 0);
    end if;
    return RESULT;
  end function RESIZE;

  -- Id: R.2
  function RESIZE (ARG : UNSIGNED; NEW_SIZE : NATURAL) return UNSIGNED is
    constant ARG_LEFT : INTEGER                       := ARG'length-1;
    alias XARG        : UNSIGNED(ARG_LEFT downto 0) is ARG;
    variable RESULT   : UNSIGNED(NEW_SIZE-1 downto 0) := (others => '0');
  begin
    if (NEW_SIZE < 1) then return NAU;
    end if;
    if XARG'length = 0 then return RESULT;
    end if;
    if (RESULT'length < ARG'length) then
      RESULT(RESULT'left downto 0) := XARG(RESULT'left downto 0);
    else
      RESULT(RESULT'left downto XARG'left+1) := (others => '0');
      RESULT(XARG'left downto 0)             := XARG;
    end if;
    return RESULT;
  end function RESIZE;

  function RESIZE (ARG, SIZE_RES : UNSIGNED)
    return UNSIGNED is
  begin
    return RESIZE (ARG      => ARG,
                   NEW_SIZE => SIZE_RES'length);
  end function RESIZE;

  function RESIZE (ARG, SIZE_RES : SIGNED)
    return SIGNED is
  begin
    return RESIZE (ARG      => ARG,
                   NEW_SIZE => SIZE_RES'length);
  end function RESIZE;

  -- ============================================================================

  -- Id: L.1
  function "not" (L : UNSIGNED) return UNSIGNED is
    variable RESULT : UNSIGNED(L'length-1 downto 0);
  begin
    RESULT := UNSIGNED(not(BIT_VECTOR(L)));
    return RESULT;
  end function "not";

  -- Id: L.2
  function "and" (L, R : UNSIGNED) return UNSIGNED is
    variable RESULT : UNSIGNED(L'length-1 downto 0);
  begin
    RESULT := UNSIGNED(BIT_VECTOR(L) and BIT_VECTOR(R));
    return RESULT;
  end function "and";

  -- Id: L.3
  function "or" (L, R : UNSIGNED) return UNSIGNED is
    variable RESULT : UNSIGNED(L'length-1 downto 0);
  begin
    RESULT := UNSIGNED(BIT_VECTOR(L) or BIT_VECTOR(R));
    return RESULT;
  end function "or";

  -- Id: L.4
  function "nand" (L, R : UNSIGNED) return UNSIGNED is
    variable RESULT : UNSIGNED(L'length-1 downto 0);
  begin
    RESULT := UNSIGNED(BIT_VECTOR(L) nand BIT_VECTOR(R));
    return RESULT;
  end function "nand";

  -- Id: L.5
  function "nor" (L, R : UNSIGNED) return UNSIGNED is
    variable RESULT : UNSIGNED(L'length-1 downto 0);
  begin
    RESULT := UNSIGNED(BIT_VECTOR(L) nor BIT_VECTOR(R));
    return RESULT;
  end function "nor";

  -- Id: L.6
  function "xor" (L, R : UNSIGNED) return UNSIGNED is
    variable RESULT : UNSIGNED(L'length-1 downto 0);
  begin
    RESULT := UNSIGNED(BIT_VECTOR(L) xor BIT_VECTOR(R));
    return RESULT;
  end function "xor";

  ------------------------------------------------------------------------------
  -- Note: Function L.7 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.7
  function "xnor" (L, R : UNSIGNED) return UNSIGNED is
    variable RESULT : UNSIGNED(L'length-1 downto 0);
  begin
    RESULT := UNSIGNED(BIT_VECTOR(L) xnor BIT_VECTOR(R));
    return RESULT;
  end function "xnor";

  -- Id: L.8
  function "not" (L : SIGNED) return SIGNED is
    variable RESULT : SIGNED(L'length-1 downto 0);
  begin
    RESULT := SIGNED(not(BIT_VECTOR(L)));
    return RESULT;
  end function "not";

  -- Id: L.9
  function "and" (L, R : SIGNED) return SIGNED is
    variable RESULT : SIGNED(L'length-1 downto 0);
  begin
    RESULT := SIGNED(BIT_VECTOR(L) and BIT_VECTOR(R));
    return RESULT;
  end function "and";

  -- Id: L.10
  function "or" (L, R : SIGNED) return SIGNED is
    variable RESULT : SIGNED(L'length-1 downto 0);
  begin
    RESULT := SIGNED(BIT_VECTOR(L) or BIT_VECTOR(R));
    return RESULT;
  end function "or";

  -- Id: L.11
  function "nand" (L, R : SIGNED) return SIGNED is
    variable RESULT : SIGNED(L'length-1 downto 0);
  begin
    RESULT := SIGNED(BIT_VECTOR(L) nand BIT_VECTOR(R));
    return RESULT;
  end function "nand";

  -- Id: L.12
  function "nor" (L, R : SIGNED) return SIGNED is
    variable RESULT : SIGNED(L'length-1 downto 0);
  begin
    RESULT := SIGNED(BIT_VECTOR(L) nor BIT_VECTOR(R));
    return RESULT;
  end function "nor";

  -- Id: L.13
  function "xor" (L, R : SIGNED) return SIGNED is
    variable RESULT : SIGNED(L'length-1 downto 0);
  begin
    RESULT := SIGNED(BIT_VECTOR(L) xor BIT_VECTOR(R));
    return RESULT;
  end function "xor";

  ------------------------------------------------------------------------------
  -- Note: Function L.14 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.14
  function "xnor" (L, R : SIGNED) return SIGNED is
    variable RESULT : SIGNED(L'length-1 downto 0);
  begin
    RESULT := SIGNED(BIT_VECTOR(L) xnor BIT_VECTOR(R));
    return RESULT;
  end function "xnor";

  -- Id: L.15 
  function "and" (L : BIT; R : UNSIGNED) return UNSIGNED is
  begin
    return UNSIGNED (L and BIT_VECTOR(R));
  end function "and";

  -- Id: L.16 
  function "and" (L : UNSIGNED; R : BIT) return UNSIGNED is
  begin
    return UNSIGNED (BIT_VECTOR(L) and R);
  end function "and";

  -- Id: L.17 
  function "or" (L : BIT; R : UNSIGNED) return UNSIGNED is
  begin
    return UNSIGNED (L or BIT_VECTOR(R));
  end function "or";

  -- Id: L.18 
  function "or" (L : UNSIGNED; R : BIT) return UNSIGNED is
  begin
    return UNSIGNED (BIT_VECTOR(L) or R);
  end function "or";

  -- Id: L.19 
  function "nand" (L : BIT; R : UNSIGNED) return UNSIGNED is
  begin
    return UNSIGNED (L nand BIT_VECTOR(R));
  end function "nand";

  -- Id: L.20 
  function "nand" (L : UNSIGNED; R : BIT) return UNSIGNED is
  begin
    return UNSIGNED (BIT_VECTOR(L) nand R);
  end function "nand";

  -- Id: L.21 
  function "nor" (L : BIT; R : UNSIGNED) return UNSIGNED is
  begin
    return UNSIGNED (L nor BIT_VECTOR(R));
  end function "nor";

  -- Id: L.22 
  function "nor" (L : UNSIGNED; R : BIT) return UNSIGNED is
  begin
    return UNSIGNED (BIT_VECTOR(L) nor R);
  end function "nor";

  -- Id: L.23 
  function "xor" (L : BIT; R : UNSIGNED) return UNSIGNED is
  begin
    return UNSIGNED (L xor BIT_VECTOR(R));
  end function "xor";

  -- Id: L.24 
  function "xor" (L : UNSIGNED; R : BIT) return UNSIGNED is
  begin
    return UNSIGNED (BIT_VECTOR(L) xor R);
  end function "xor";

  ------------------------------------------------------------------------------
  -- Note: Function L.25 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.25 
  function "xnor" (L : BIT; R : UNSIGNED) return UNSIGNED is
  begin
    return UNSIGNED (L xnor BIT_VECTOR(R));
  end function "xnor";

  ------------------------------------------------------------------------------
  -- Note: Function L.26 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.26 
  function "xnor" (L : UNSIGNED; R : BIT) return UNSIGNED is
  begin
    return UNSIGNED (BIT_VECTOR(L) xnor R);
  end function "xnor";

  -- Id: L.27 
  function "and" (L : BIT; R : SIGNED) return SIGNED is
  begin
    return SIGNED (L and BIT_VECTOR(R));
  end function "and";

  -- Id: L.28 
  function "and" (L : SIGNED; R : BIT) return SIGNED is
  begin
    return SIGNED (BIT_VECTOR(L) and R);
  end function "and";

  -- Id: L.29 
  function "or" (L : BIT; R : SIGNED) return SIGNED is
  begin
    return SIGNED (L or BIT_VECTOR(R));
  end function "or";

  -- Id: L.30 
  function "or" (L : SIGNED; R : BIT) return SIGNED is
  begin
    return SIGNED (BIT_VECTOR(L) or R);
  end function "or";

  -- Id: L.31 
  function "nand" (L : BIT; R : SIGNED) return SIGNED is
  begin
    return SIGNED (L nand BIT_VECTOR(R));
  end function "nand";

  -- Id: L.32 
  function "nand" (L : SIGNED; R : BIT) return SIGNED is
  begin
    return SIGNED (BIT_VECTOR(L) nand R);
  end function "nand";

  -- Id: L.33 
  function "nor" (L : BIT; R : SIGNED) return SIGNED is
  begin
    return SIGNED (L nor BIT_VECTOR(R));
  end function "nor";

  -- Id: L.34 
  function "nor" (L : SIGNED; R : BIT) return SIGNED is
  begin
    return SIGNED (BIT_VECTOR(L) nor R);
  end function "nor";

  -- Id: L.35 
  function "xor" (L : BIT; R : SIGNED) return SIGNED is
  begin
    return SIGNED (L xor BIT_VECTOR(R));
  end function "xor";

  -- Id: L.36 
  function "xor" (L : SIGNED; R : BIT) return SIGNED is
  begin
    return SIGNED (BIT_VECTOR(L) xor R);
  end function "xor";

  ------------------------------------------------------------------------------
  -- Note: Function L.37 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.37 
  function "xnor" (L : BIT; R : SIGNED) return SIGNED is
  begin
    return SIGNED (L xnor BIT_VECTOR(R));
  end function "xnor";

  ------------------------------------------------------------------------------
  -- Note: Function L.38 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.38 
  function "xnor" (L : SIGNED; R : BIT) return SIGNED is
  begin
    return SIGNED (BIT_VECTOR(L) xnor R);
  end function "xnor";

  ------------------------------------------------------------------------------
  -- Note: Function L.39 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.39
  function "and" (L : SIGNED) return BIT is
  begin
    return and (BIT_VECTOR (L));
  end function "and";

  ------------------------------------------------------------------------------
  -- Note: Function L.40 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.40
  function "and" (L : UNSIGNED) return BIT is
  begin
    return and (BIT_VECTOR (L));
  end function "and";

  ------------------------------------------------------------------------------
  -- Note: Function L.41 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.41
  function "nand" (L : SIGNED) return BIT is
  begin
    return nand (BIT_VECTOR (L));
  end function "nand";

  ------------------------------------------------------------------------------
  -- Note: Function L.42 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.42
  function "nand" (L : UNSIGNED) return BIT is
  begin
    return nand (BIT_VECTOR (L));
  end function "nand";

  ------------------------------------------------------------------------------
  -- Note: Function L.43 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.43
  function "or" (L : SIGNED) return BIT is
  begin
    return or (BIT_VECTOR (L));
  end function "or";

  ------------------------------------------------------------------------------
  -- Note: Function L.44 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.44
  function "or" (L : UNSIGNED) return BIT is
  begin
    return or (BIT_VECTOR (L));
  end function "or";

  ------------------------------------------------------------------------------
  -- Note: Function L.45 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.45
  function "nor" (L : SIGNED) return BIT is
  begin
    return nor (BIT_VECTOR (L));
  end function "nor";

  ------------------------------------------------------------------------------
  -- Note: Function L.46 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.46
  function "nor" (L : UNSIGNED) return BIT is
  begin
    return nor (BIT_VECTOR (L));
  end function "nor";

  ------------------------------------------------------------------------------
  -- Note: Function L.47 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.47
  function "xor" (L : SIGNED) return BIT is
  begin
    return xor (BIT_VECTOR (L));
  end function "xor";

  ------------------------------------------------------------------------------
  -- Note: Function L.48 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.48
  function "xor" (L : UNSIGNED) return BIT is
  begin
    return xor (BIT_VECTOR (L));
  end function "xor";

  ------------------------------------------------------------------------------
  -- Note: Function L.49 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.49
  function "xnor" (L : SIGNED) return BIT is
  begin
    return xnor (BIT_VECTOR (L));
  end function "xnor";

  ------------------------------------------------------------------------------
  -- Note: Function L.50 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.50
  function "xnor" (L : UNSIGNED) return BIT is
  begin
    return xnor (BIT_VECTOR (L));
  end function "xnor";

  -- ============================================================================
  -- string conversion and write operations
  -- ============================================================================
  function to_ostring (value : UNSIGNED) return STRING is
  begin
    return to_ostring(BIT_VECTOR (value));
  end function to_ostring;

  function to_ostring (value : SIGNED) return STRING is
    constant result_length : INTEGER := (value'length+2)/3;
    constant pad           : BIT_VECTOR(1 to (result_length*3 - value'length))
      := (others => value (value'left));  -- Extend sign bit
  begin
    return to_ostring(pad & BIT_VECTOR (value));
  end function to_ostring;

  function to_hstring (value : UNSIGNED) return STRING is
  begin
    return to_hstring(BIT_VECTOR (value));
  end function to_hstring;

  function to_hstring (value : SIGNED) return STRING is
    constant result_length : INTEGER := (value'length+3)/4;
    constant pad           : BIT_VECTOR(1 to (result_length*4 - value'length))
      := (others => value (value'left));  -- Extend sign bit
  begin
    return to_hstring(pad & BIT_VECTOR (value));
  end function to_hstring;

  procedure READ(L : inout LINE; VALUE : out UNSIGNED; GOOD : out BOOLEAN) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    READ (L     => L,
          VALUE => ivalue,
          GOOD  => GOOD);
    VALUE := UNSIGNED(ivalue);
  end procedure READ;

  procedure READ(L : inout LINE; VALUE : out UNSIGNED) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    READ (L      => L,
           VALUE => ivalue);
    VALUE := UNSIGNED (ivalue);
  end procedure READ;

  procedure READ(L : inout LINE; VALUE : out SIGNED; GOOD : out BOOLEAN) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    READ (L     => L,
          VALUE => ivalue,
          GOOD  => GOOD);
    VALUE := SIGNED(ivalue);
  end procedure READ;

  procedure READ(L : inout LINE; VALUE : out SIGNED) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    READ (L      => L,
           VALUE => ivalue);
    VALUE := SIGNED (ivalue);
  end procedure READ;

  procedure WRITE (L         : inout LINE; VALUE : in UNSIGNED;
                   JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    ivalue := BIT_VECTOR (VALUE);
    WRITE (L          => L,
            VALUE     => ivalue,
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure WRITE;

  procedure WRITE (L         : inout LINE; VALUE : in SIGNED;
                   JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    ivalue := BIT_VECTOR (VALUE);
    WRITE (L          => L,
            VALUE     => ivalue,
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure WRITE;

  procedure OREAD (L : inout LINE; VALUE : out UNSIGNED; GOOD : out BOOLEAN) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    OREAD (L     => L,
           VALUE => ivalue,
           GOOD  => GOOD);
    VALUE := UNSIGNED(ivalue);
  end procedure OREAD;

  procedure OREAD (L : inout LINE; VALUE : out SIGNED; GOOD : out BOOLEAN) is
    constant ne     : INTEGER := (value'length+2)/3;
    constant pad    : INTEGER := ne*3 - value'length;
    variable ivalue : BIT_VECTOR(0 to ne*3-1);
    variable ok     : BOOLEAN;
  begin
    OREAD (L      => L,
            VALUE => ivalue,            -- Read padded STRING
            good  => ok);
    -- Bail out if there was a bad read
    if not ok then
      good := false;
      return;
    end if;
    if (pad > 0) then
      if (ivalue(0) = '0') then         -- positive
        if ivalue(0) = or (ivalue(0 to pad)) then
          VALUE := SIGNED (ivalue (pad to ivalue'high));
          good  := true;
        else
          good := false;
        end if;
      else                              -- negative
        if ivalue(0) = and (ivalue(0 to pad)) then
          VALUE := SIGNED (ivalue (pad to ivalue'high));
          good  := true;
        else
          good := false;
        end if;
      end if;
    else
      good  := true;
      VALUE := SIGNED (ivalue);
    end if;
  end procedure OREAD;

  procedure OREAD (L : inout LINE; VALUE : out UNSIGNED) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    OREAD (L     => L,
           VALUE => ivalue);
    VALUE := UNSIGNED (ivalue);
  end procedure OREAD;

  procedure OREAD (L : inout LINE; VALUE : out SIGNED) is
    constant ne     : INTEGER := (value'length+2)/3;
    constant pad    : INTEGER := ne*3 - value'length;
    variable ivalue : BIT_VECTOR(0 to ne*3-1);
  begin
    OREAD (L      => L,
            VALUE => ivalue);           -- Read padded string
    if (pad > 0) then
      if (ivalue(0) = '0') then         -- positive
        if ivalue(0) = or (ivalue(0 to pad)) then
          VALUE := SIGNED (ivalue (pad to ivalue'high));
        else
          assert false
            report "NUMERIC_BIT.OREAD Error: Signed vector truncated"
            severity error;
        end if;
      else                              -- negative
        if ivalue(0) = and (ivalue(0 to pad)) then
          VALUE := SIGNED (ivalue (pad to ivalue'high));
        else
          assert false
            report "NUMERIC_BIT.OREAD Error: Signed vector truncated"
            severity error;
        end if;
      end if;
    else
      VALUE := SIGNED (ivalue);
    end if;
  end procedure OREAD;

  procedure HREAD (L : inout LINE; VALUE : out UNSIGNED; GOOD : out BOOLEAN) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    HREAD (L     => L,
           VALUE => ivalue,
           GOOD  => GOOD);
    VALUE := UNSIGNED(ivalue);
  end procedure HREAD;

  procedure HREAD (L : inout LINE; VALUE : out SIGNED; GOOD : out BOOLEAN) is
    constant ne     : INTEGER := (value'length+3)/4;
    constant pad    : INTEGER := ne*4 - value'length;
    variable ivalue : BIT_VECTOR(0 to ne*4-1);
    variable ok     : BOOLEAN;
  begin
    HREAD (L      => L,
            VALUE => ivalue,            -- Read padded STRING
            good  => ok);
    if not ok then
      good := false;
      return;
    end if;
    if (pad > 0) then
      if (ivalue(0) = '0') then         -- positive
        if ivalue(0) = or (ivalue(0 to pad)) then
          GOOD  := true;
          VALUE := SIGNED (ivalue (pad to ivalue'high));
        else
          GOOD := false;
        end if;
      else                              -- negative
        if ivalue(0) = and (ivalue(0 to pad)) then
          GOOD  := true;
          VALUE := SIGNED (ivalue (pad to ivalue'high));
        else
          GOOD := false;
        end if;
      end if;
    else
      GOOD  := true;
      VALUE := SIGNED (ivalue);
    end if;
  end procedure HREAD;

  procedure HREAD (L : inout LINE; VALUE : out UNSIGNED) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    HREAD (L     => L,
           VALUE => ivalue);
    VALUE := UNSIGNED (ivalue);
  end procedure HREAD;

  procedure HREAD (L : inout LINE; VALUE : out SIGNED) is
    constant ne     : INTEGER := (value'length+3)/4;
    constant pad    : INTEGER := ne*4 - value'length;
    variable ivalue : BIT_VECTOR(0 to ne*4-1);
  begin
    HREAD (L      => L,
            VALUE => ivalue);           -- Read padded string
    if (pad > 0) then
      if (ivalue(0) = '0') then         -- positive
        if ivalue(0) = or (ivalue(0 to pad)) then
          VALUE := SIGNED (ivalue (pad to ivalue'high));
        else
          assert false
            report "NUMERIC_BIT.HREAD Error: Signed vector truncated"
            severity error;
        end if;
      else                              -- negative
        if ivalue(0) = and (ivalue(0 to pad)) then
          VALUE := SIGNED (ivalue (pad to ivalue'high));
        else
          assert false
            report "NUMERIC_BIT.HREAD Error: Signed vector truncated"
            severity error;
        end if;
      end if;
    else
      VALUE := SIGNED (ivalue);
    end if;
  end procedure HREAD;

  procedure OWRITE (L         : inout LINE; VALUE : in UNSIGNED;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    ivalue := BIT_VECTOR (VALUE);
    OWRITE (L         => L,
            VALUE     => ivalue,
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure OWRITE;

  procedure OWRITE (L         : inout LINE; VALUE : in SIGNED;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0) is
    constant ne  : INTEGER := (VALUE'length+2)/3;
    constant pad : BIT_VECTOR(0 to (ne*3 - VALUE'length) - 1)
      := (others => VALUE (VALUE'left));
    variable ivalue : BIT_VECTOR(value'range);
  begin
    ivalue := BIT_VECTOR (VALUE);
    OWRITE (L         => L,
            VALUE     => pad & ivalue,
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure OWRITE;

  procedure HWRITE (L         : inout LINE; VALUE : in UNSIGNED;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0) is
    variable ivalue : BIT_VECTOR(value'range);
  begin
    ivalue := BIT_VECTOR (VALUE);
    HWRITE (L         => L,
            VALUE     => ivalue,
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure HWRITE;

  procedure HWRITE (L         : inout LINE; VALUE : in SIGNED;
                    JUSTIFIED : in    SIDE := right; FIELD : in WIDTH := 0) is
    variable ivalue : BIT_VECTOR(value'range);
    constant ne     : INTEGER := (value'length+3)/4;
    constant pad    : BIT_VECTOR(0 to (ne*4 - value'length) - 1)
      := (others => VALUE(VALUE'left));
  begin
    ivalue := BIT_VECTOR (VALUE);
    HWRITE (L         => L,
            VALUE     => pad & ivalue,
            JUSTIFIED => JUSTIFIED,
            FIELD     => FIELD);
  end procedure HWRITE;

end package body NUMERIC_BIT;
