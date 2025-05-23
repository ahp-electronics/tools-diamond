-- --------------------------------------------------------------------
--
-- Copyright � 2008 by IEEE. All rights reserved.
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
-- The code from IEEE 1076(tm) is copyrighted by IEEE.  However, in allowing the
-- reproduction of its Work, the IEEE is not responsible for the use of the
-- derivative works/products, nor does it represent in any way an endorsement or
-- recommendation by the IEEE. Any copying of and/or redistribution of this code
-- shall contain this copyright notice.
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
-- $Revision: 1.1 $
-- $Date: 2013/01/26 01:42:17 $
-- --------------------------------------------------------------------

use STD.TEXTIO.all;

package NUMERIC_BIT is
  constant CopyRightNotice : STRING
    := "Copyright � 2008 IEEE. All rights reserved.";

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
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Returns the absolute value of a SIGNED vector ARG.

  -- Id: A.2
  function "-" (ARG : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Returns the value of the unary minus operation on a
  --         SIGNED vector ARG.

  --============================================================================

  -- Id: A.3
  function "+" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0)
  -- Result: Adds two UNSIGNED vectors that may be of different lengths.

  -- Id: A.3R
  function "+"(L : UNSIGNED; R : BIT) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Similar to A.3 where R is a one bit UNSIGNED

  -- Id: A.3L
  function "+"(L : BIT; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Similar to A.3 where L is a one bit UNSIGNED

  -- Id: A.4
  function "+" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0)
  -- Result: Adds two SIGNED vectors that may be of different lengths.

  -- Id: A.4R
  function "+"(L : SIGNED; R : BIT) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Similar to A.4 where R is bit 0 of a non-negative.

  -- Id: A.4L
  function "+"(L : BIT; R : SIGNED) return SIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Similar to A.4 where L is bit 0 of a non-negative.

  -- Id: A.5
  function "+" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Adds an UNSIGNED vector, L, with a nonnegative INTEGER, R.

  -- Id: A.6
  function "+" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Adds a nonnegative INTEGER, L, with an UNSIGNED vector, R.

  -- Id: A.7
  function "+" (L : INTEGER; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Adds an INTEGER, L(may be positive or negative), to a SIGNED
  -- vector, R.

  -- Id: A.8
  function "+" (L : SIGNED; R : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Adds a SIGNED vector, L, to an INTEGER, R.

  --============================================================================

  -- Id: A.9
  function "-" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0)
  -- Result: Subtracts two UNSIGNED vectors that may be of different lengths.

  -- Id: A.9R
  function "-"(L : UNSIGNED; R : BIT) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Similar to A.9 where R is a one bit UNSIGNED

  -- Id: A.9L
  function "-"(L : BIT; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Similar to A.9 where L is a one bit UNSIGNED

  -- Id: A.10
  function "-" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0)
  -- Result: Subtracts a SIGNED vector, R, from another SIGNED vector, L,
  --         that may possibly be of different lengths.

  -- Id: A.10R
  function "-"(L : SIGNED; R : BIT) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Similar to A.10 where R is bit 0 of a non-negative.

  -- Id: A.10L
  function "-"(L : BIT; R : SIGNED) return SIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Similar to A.10 where R is bit 0 of a non-negative.

  -- Id: A.11
  function "-" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Subtracts a nonnegative INTEGER, R, from an UNSIGNED vector, L.

  -- Id: A.12
  function "-" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Subtracts an UNSIGNED vector, R, from a nonnegative INTEGER, L.

  -- Id: A.13
  function "-" (L : SIGNED; R : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Subtracts an INTEGER, R, from a SIGNED vector, L.

  -- Id: A.14
  function "-" (L : INTEGER; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Subtracts a SIGNED vector, R, from an INTEGER, L.

  --============================================================================

  -- Id: A.15
  function "*" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED((L'LENGTH+R'LENGTH-1) downto 0)
  -- Result: Performs the multiplication operation on two UNSIGNED vectors
  --         that may possibly be of different lengths.

  -- Id: A.16
  function "*" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED((L'LENGTH+R'LENGTH-1) downto 0)
  -- Result: Multiplies two SIGNED vectors that may possibly be of
  --         different lengths.

  -- Id: A.17
  function "*" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED((L'LENGTH+L'LENGTH-1) downto 0)
  -- Result: Multiplies an UNSIGNED vector, L, with a nonnegative
  --         INTEGER, R. R is converted to an UNSIGNED vector of
  --         size L'LENGTH before multiplication.

  -- Id: A.18
  function "*" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED((R'LENGTH+R'LENGTH-1) downto 0)
  -- Result: Multiplies an UNSIGNED vector, R, with a nonnegative
  --         INTEGER, L. L is converted to an UNSIGNED vector of
  --         size R'LENGTH before multiplication.

  -- Id: A.19
  function "*" (L : SIGNED; R : INTEGER) return SIGNED;
  -- Result subtype: SIGNED((L'LENGTH+L'LENGTH-1) downto 0)
  -- Result: Multiplies a SIGNED vector, L, with an INTEGER, R. R is
  --         converted to a SIGNED vector of size L'LENGTH before
  --         multiplication.

  -- Id: A.20
  function "*" (L : INTEGER; R : SIGNED) return SIGNED;
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
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Divides an UNSIGNED vector, L, by another UNSIGNED vector, R.

  -- Id: A.22
  function "/" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Divides an SIGNED vector, L, by another SIGNED vector, R.

  -- Id: A.23
  function "/" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Divides an UNSIGNED vector, L, by a nonnegative INTEGER, R.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.24
  function "/" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Divides a nonnegative INTEGER, L, by an UNSIGNED vector, R.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  -- Id: A.25
  function "/" (L : SIGNED; R : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Divides a SIGNED vector, L, by an INTEGER, R.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.26
  function "/" (L : INTEGER; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Divides an INTEGER, L, by a SIGNED vector, R.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  --============================================================================
  --
  -- NOTE: If second argument is zero for "rem" operator, a severity level
  --       of ERROR is issued.

  -- Id: A.27
  function "rem" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L and R are UNSIGNED vectors.

  -- Id: A.28
  function "rem" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L and R are SIGNED vectors.

  -- Id: A.29
  function "rem" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L is an UNSIGNED vector and R is a
  --         nonnegative INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.30
  function "rem" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where R is an UNSIGNED vector and L is a
  --         nonnegative INTEGER.
  -- If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  -- Id: A.31
  function "rem" (L : SIGNED; R : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L is SIGNED vector and R is an INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.32
  function "rem" (L : INTEGER; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where R is SIGNED vector and L is an INTEGER.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  --============================================================================
  --
  -- NOTE: If second argument is zero for "mod" operator, a severity level
  --       of ERROR is issued.

  -- Id: A.33
  function "mod" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L and R are UNSIGNED vectors.

  -- Id: A.34
  function "mod" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L and R are SIGNED vectors.

  -- Id: A.35
  function "mod" (L : UNSIGNED; R : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L is an UNSIGNED vector and R
  --         is a nonnegative INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.36
  function "mod" (L : NATURAL; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where R is an UNSIGNED vector and L
  --         is a nonnegative INTEGER.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  -- Id: A.37
  function "mod" (L : SIGNED; R : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L is a SIGNED vector and
  --         R is an INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.

  -- Id: A.38
  function "mod" (L : INTEGER; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L is an INTEGER and
  --         R is a SIGNED vector.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.

  --============================================================================
  -- Id: A.39
  function find_leftmost (ARG : UNSIGNED; Y : BIT) return INTEGER;
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  -- Id: A.40
  function find_leftmost (ARG : SIGNED; Y : BIT) return INTEGER;
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  -- Id: A.41
  function find_rightmost (ARG : UNSIGNED; Y : BIT) return INTEGER;
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  -- Id: A.42
  function find_rightmost (ARG : SIGNED; Y : BIT) return INTEGER;
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.

  --============================================================================
  -- Comparison Operators
  --============================================================================

  -- Id: C.1
  function ">" (L, R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.2
  function ">" (L, R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.3
  function ">" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.4
  function ">" (L : INTEGER; R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is a INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.5
  function ">" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.6
  function ">" (L : SIGNED; R : INTEGER) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is a SIGNED vector and
  --         R is a INTEGER.

  --============================================================================

  -- Id: C.7
  function "<" (L, R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.8
  function "<" (L, R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.9
  function "<" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.10
  function "<" (L : INTEGER; R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.11
  function "<" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.12
  function "<" (L : SIGNED; R : INTEGER) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.13
  function "<=" (L, R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.14
  function "<=" (L, R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.15
  function "<=" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.16
  function "<=" (L : INTEGER; R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.17
  function "<=" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.18
  function "<=" (L : SIGNED; R : INTEGER) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.19
  function ">=" (L, R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.20
  function ">=" (L, R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.21
  function ">=" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.22
  function ">=" (L : INTEGER; R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.23
  function ">=" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.24
  function ">=" (L : SIGNED; R : INTEGER) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.25
  function "=" (L, R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.26
  function "=" (L, R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.27
  function "=" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.28
  function "=" (L : INTEGER; R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.29
  function "=" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.30
  function "=" (L : SIGNED; R : INTEGER) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.31
  function "/=" (L, R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.32
  function "/=" (L, R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.33
  function "/=" (L : NATURAL; R : UNSIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.34
  function "/=" (L : INTEGER; R : SIGNED) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.35
  function "/=" (L : UNSIGNED; R : NATURAL) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.36
  function "/=" (L : SIGNED; R : INTEGER) return BOOLEAN;
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.37
  function MINIMUM (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED
  -- Result: Returns the lesser of two UNSIGNED vectors that may be
  --         of different lengths.

  -- Id: C.38
  function MINIMUM (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED
  -- Result: Returns the lesser of two SIGNED vectors that may be
  --         of different lengths.

  -- Id: C.39
  function MINIMUM (L : NATURAL; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED
  -- Result: Returns the lesser of a nonnegative INTEGER, L, and
  --         an UNSIGNED vector, R.

  -- Id: C.40
  function MINIMUM (L : INTEGER; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED
  -- Result: Returns the lesser of an INTEGER, L, and a SIGNED
  --         vector, R.

  -- Id: C.41
  function MINIMUM (L : UNSIGNED; R : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED
  -- Result: Returns the lesser of an UNSIGNED vector, L, and
  --         a nonnegative INTEGER, R.

  -- Id: C.42
  function MINIMUM (L : SIGNED; R : INTEGER) return SIGNED;
  -- Result subtype: SIGNED
  -- Result: Returns the lesser of a SIGNED vector, L, and
  --         an INTEGER, R.

  --============================================================================

  -- Id: C.43
  function MAXIMUM (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED
  -- Result: Returns the greater of two UNSIGNED vectors that may be
  --         of different lengths.

  -- Id: C.44
  function MAXIMUM (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED
  -- Result: Returns the greater of two SIGNED vectors that may be
  --         of different lengths.

  -- Id: C.45
  function MAXIMUM (L : NATURAL; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED
  -- Result: Returns the greater of a nonnegative INTEGER, L, and
  --         an UNSIGNED vector, R.

  -- Id: C.46
  function MAXIMUM (L : INTEGER; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED
  -- Result: Returns the greater of an INTEGER, L, and a SIGNED
  --         vector, R.

  -- Id: C.47
  function MAXIMUM (L : UNSIGNED; R : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED
  -- Result: Returns the greater of an UNSIGNED vector, L, and
  --         a nonnegative INTEGER, R.

  -- Id: C.48
  function MAXIMUM (L : SIGNED; R : INTEGER) return SIGNED;
  -- Result subtype: SIGNED
  -- Result: Returns the greater of a SIGNED vector, L, and
  --         an INTEGER, R.

  --============================================================================

  -- Id: C.49
  function "?>" (L, R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.50
  function "?>" (L, R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.51
  function "?>" (L : NATURAL; R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.52
  function "?>" (L : INTEGER; R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is a INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.53
  function "?>" (L : UNSIGNED; R : NATURAL) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.54
  function "?>" (L : SIGNED; R : INTEGER) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is a SIGNED vector and
  --         R is a INTEGER.

  --============================================================================

  -- Id: C.55
  function "?<" (L, R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.56
  function "?<" (L, R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.57
  function "?<" (L : NATURAL; R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.58
  function "?<" (L : INTEGER; R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.59
  function "?<" (L : UNSIGNED; R : NATURAL) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.60
  function "?<" (L : SIGNED; R : INTEGER) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.61
  function "?<=" (L, R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.62
  function "?<=" (L, R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.63
  function "?<=" (L : NATURAL; R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.64
  function "?<=" (L : INTEGER; R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.65
  function "?<=" (L : UNSIGNED; R : NATURAL) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.66
  function "?<=" (L : SIGNED; R : INTEGER) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.67
  function "?>=" (L, R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.68
  function "?>=" (L, R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.69
  function "?>=" (L : NATURAL; R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.70
  function "?>=" (L : INTEGER; R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is an INTEGER and
  --         R is a SIGNED vector.

  -- Id: C.71
  function "?>=" (L : UNSIGNED; R : NATURAL) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.72
  function "?>=" (L : SIGNED; R : INTEGER) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is a SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.73
  function "?=" (L, R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.74
  function "?=" (L, R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.75
  function "?=" (L : NATURAL; R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.76
  function "?=" (L : INTEGER; R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is an INTEGER and
  --         R is an SIGNED vector.

  -- Id: C.77
  function "?=" (L : UNSIGNED; R : NATURAL) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.78
  function "?=" (L : SIGNED; R : INTEGER) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is an SIGNED vector and
  --         R is an INTEGER.

  --============================================================================

  -- Id: C.79
  function "?/=" (L, R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.

  -- Id: C.80
  function "?/=" (L, R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L and R are SIGNED vectors possibly
  --         of different lengths.

  -- Id: C.81
  function "?/=" (L : NATURAL; R : UNSIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.

  -- Id: C.82
  function "?/=" (L : INTEGER; R : SIGNED) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is an INTEGER and
  --         R is an SIGNED vector.

  -- Id: C.83
  function "?/=" (L : UNSIGNED; R : NATURAL) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.

  -- Id: C.84
  function "?/=" (L : SIGNED; R : INTEGER) return BIT;
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is an SIGNED vector and
  --         R is an INTEGER.

  --============================================================================
  -- Shift and Rotate Functions
  --============================================================================

  -- Id: S.1
  function SHIFT_LEFT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-left on an UNSIGNED vector COUNT times.
  --         The vacated positions are filled with Bit '0'.
  --         The COUNT leftmost bits are lost.

  -- Id: S.2
  function SHIFT_RIGHT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-right on an UNSIGNED vector COUNT times.
  --         The vacated positions are filled with Bit '0'.
  --         The COUNT rightmost bits are lost.

  -- Id: S.3
  function SHIFT_LEFT (ARG : SIGNED; COUNT : NATURAL) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-left on a SIGNED vector COUNT times.
  --         The vacated positions are filled with Bit '0'.
  --         The COUNT leftmost bits are lost.

  -- Id: S.4
  function SHIFT_RIGHT (ARG : SIGNED; COUNT : NATURAL) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-right on a SIGNED vector COUNT times.
  --         The vacated positions are filled with the leftmost bit, ARG'LEFT.
  --         The COUNT rightmost bits are lost.

  --============================================================================

  -- Id: S.5
  function ROTATE_LEFT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a rotate-left of an UNSIGNED vector COUNT times.

  -- Id: S.6
  function ROTATE_RIGHT (ARG : UNSIGNED; COUNT : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a rotate-right of an UNSIGNED vector COUNT times.

  -- Id: S.7
  function ROTATE_LEFT (ARG : SIGNED; COUNT : NATURAL) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a logical rotate-left of a SIGNED vector COUNT times.

  -- Id: S.8
  function ROTATE_RIGHT (ARG : SIGNED; COUNT : NATURAL) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a logical rotate-right of a SIGNED vector COUNT times.

  --============================================================================

  ------------------------------------------------------------------------------
  -- Note: Function S.9 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.9
  function "sll" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.10 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.10
  function "sll" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.11 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.11
  function "srl" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_RIGHT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.12 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.12
  function "srl" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SIGNED(SHIFT_RIGHT(UNSIGNED(ARG), COUNT))

  ------------------------------------------------------------------------------
  -- Note: Function S.13 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.13
  function "rol" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.14 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.14
  function "rol" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.15 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.15
  function "ror" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_RIGHT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.16 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.16
  function "ror" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_RIGHT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.17 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.17
  function "sla" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.18 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.18
  function "sla" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.19 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.19
  function "sra" (ARG : UNSIGNED; COUNT : INTEGER) return UNSIGNED;
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_RIGHT(ARG, COUNT)

  ------------------------------------------------------------------------------
  -- Note: Function S.20 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.20
  function "sra" (ARG : SIGNED; COUNT : INTEGER) return SIGNED;
  -- Result subtype: SIGNED(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_RIGHT(ARG, COUNT)

  --============================================================================
  -- RESIZE Functions
  --============================================================================

  -- Id: R.1
  function RESIZE (ARG : SIGNED; NEW_SIZE : NATURAL) return SIGNED;
  -- Result subtype: SIGNED(NEW_SIZE-1 downto 0)
  -- Result: Resizes the SIGNED vector ARG to the specified size.
  --         To create a larger vector, the new [leftmost] bit positions
  --         are filled with the sign bit (ARG'LEFT). When truncating,
  --         the sign bit is retained along with the rightmost part.

  -- Id: R.2
  function RESIZE (ARG : UNSIGNED; NEW_SIZE : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(NEW_SIZE-1 downto 0)
  -- Result: Resizes the UNSIGNED vector ARG to the specified size.
  --         To create a larger vector, the new [leftmost] bit positions
  --         are filled with '0'. When truncating, the leftmost bits
  --         are dropped.

  function RESIZE (ARG, SIZE_RES : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNRESOLVED_UNSIGNED (SIZE_RES'length-1 downto 0)

  function RESIZE (ARG, SIZE_RES : SIGNED) return SIGNED;
  -- Result subtype: UNRESOLVED_SIGNED (SIZE_RES'length-1 downto 0)

  --============================================================================
  -- Conversion Functions
  --============================================================================

  -- Id: D.1
  function TO_INTEGER (ARG : UNSIGNED) return NATURAL;
  -- Result subtype: NATURAL. Value cannot be negative since parameter is an
  --         UNSIGNED vector.
  -- Result: Converts the UNSIGNED vector to an INTEGER.

  -- Id: D.2
  function TO_INTEGER (ARG : SIGNED) return INTEGER;
  -- Result subtype: INTEGER
  -- Result: Converts a SIGNED vector to an INTEGER.

  -- Id: D.3
  function TO_UNSIGNED (ARG, SIZE : NATURAL) return UNSIGNED;
  -- Result subtype: UNSIGNED(SIZE-1 downto 0)
  -- Result: Converts a nonnegative INTEGER to an UNSIGNED vector with
  --         the specified size.

  -- Id: D.4
  function TO_SIGNED (ARG : INTEGER; SIZE : NATURAL) return SIGNED;
  -- Result subtype: SIGNED(SIZE-1 downto 0)
  -- Result: Converts an INTEGER to a SIGNED vector of the specified size.

  function TO_UNSIGNED (ARG : NATURAL; SIZE_RES : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNRESOLVED_UNSIGNED(SIZE_RES'length-1 downto 0)

  function TO_SIGNED (ARG : INTEGER; SIZE_RES : SIGNED) return SIGNED;
  -- Result subtype: UNRESOLVED_SIGNED(SIZE_RES'length-1 downto 0)

  --============================================================================
  -- Logical Operators
  --============================================================================

  -- Id: L.1
  function "not" (L : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Termwise inversion

  -- Id: L.2
  function "and" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector AND operation

  -- Id: L.3
  function "or" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector OR operation

  -- Id: L.4
  function "nand" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector NAND operation

  -- Id: L.5
  function "nor" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector NOR operation

  -- Id: L.6
  function "xor" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector XOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.7 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.7
  function "xnor" (L, R : UNSIGNED) return UNSIGNED;
  -- Result subtype: UNSIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector XNOR operation

  -- Id: L.8
  function "not" (L : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Termwise inversion

  -- Id: L.9
  function "and" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector AND operation

  -- Id: L.10
  function "or" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector OR operation

  -- Id: L.11
  function "nand" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector NAND operation

  -- Id: L.12
  function "nor" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector NOR operation

  -- Id: L.13
  function "xor" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector XOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.14 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.14
  function "xnor" (L, R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector XNOR operation

  -- Id: L.15 
  function "and" (L : BIT; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector AND operation

  -- Id: L.16 
  function "and" (L : UNSIGNED; R : BIT) return UNSIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar AND operation

  -- Id: L.17 
  function "or" (L : BIT; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector OR operation

  -- Id: L.18 
  function "or" (L : UNSIGNED; R : BIT) return UNSIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar OR operation

  -- Id: L.19 
  function "nand" (L : BIT; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector NAND operation

  -- Id: L.20 
  function "nand" (L : UNSIGNED; R : BIT) return UNSIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar NAND operation

  -- Id: L.21 
  function "nor" (L : BIT; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector NOR operation

  -- Id: L.22 
  function "nor" (L : UNSIGNED; R : BIT) return UNSIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar NOR operation

  -- Id: L.23 
  function "xor" (L : BIT; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector XOR operation

  -- Id: L.24 
  function "xor" (L : UNSIGNED; R : BIT) return UNSIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar XOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.25 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.25 
  function "xnor" (L : BIT; R : UNSIGNED) return UNSIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector XNOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.26 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.26 
  function "xnor" (L : UNSIGNED; R : BIT) return UNSIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar XNOR operation

  -- Id: L.27 
  function "and" (L : BIT; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector AND operation

  -- Id: L.28 
  function "and" (L : SIGNED; R : BIT) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar AND operation

  -- Id: L.29 
  function "or" (L : BIT; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector OR operation

  -- Id: L.30 
  function "or" (L : SIGNED; R : BIT) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar OR operation

  -- Id: L.31 
  function "nand" (L : BIT; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector NAND operation

  -- Id: L.32 
  function "nand" (L : SIGNED; R : BIT) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar NAND operation

  -- Id: L.33 
  function "nor" (L : BIT; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector NOR operation

  -- Id: L.34 
  function "nor" (L : SIGNED; R : BIT) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar NOR operation

  -- Id: L.35 
  function "xor" (L : BIT; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector XOR operation

  -- Id: L.36 
  function "xor" (L : SIGNED; R : BIT) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar XOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.37 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.37 
  function "xnor" (L : BIT; R : SIGNED) return SIGNED;
  -- Result subtype: SIGNED(R'LENGTH-1 downto 0)
  -- Result: Scalar/Vector XNOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.38 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.38 
  function "xnor" (L : SIGNED; R : BIT) return SIGNED;
  -- Result subtype: SIGNED(L'LENGTH-1 downto 0)
  -- Result: Vector/Scalar XNOR operation

  ------------------------------------------------------------------------------
  -- Note: Function L.39 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.39
  function "and" (L : SIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of and'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.40 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.40
  function "nand" (L : SIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of nand'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.41 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.41
  function "or" (L : SIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of or'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.42 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.42
  function "nor" (L : SIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of nor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.43 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.43
  function "xor" (L : SIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of xor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.44 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.44
  function "xnor" (L : SIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of xnor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.45 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.45
  function "and" (L : UNSIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of and'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.46 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.46
  function "nand" (L : UNSIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of nand'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.47 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.47
  function "or" (L : UNSIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of or'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.48 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.48
  function "nor" (L : UNSIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of nor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.49 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.49
  function "xor" (L : UNSIGNED) return BIT;
  -- Result subtype: BIT. 
  -- Result: Result of xor'ing all of the bits of the vector. 

  ------------------------------------------------------------------------------
  -- Note: Function L.50 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.50
  function "xnor" (L : UNSIGNED) return BIT;
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
  alias to_octal_string is to_ostring [UNSIGNED return STRING];
  alias to_octal_string is to_ostring [SIGNED return STRING];

  function to_hstring (value : UNSIGNED) return STRING;
  function to_hstring (value : SIGNED) return STRING;
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
