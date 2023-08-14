-- -------------------------------------------------------------------- 
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<< 
-- -------------------------------------------------------------------- 
-- Copyright (c) 2006 by Lattice Semiconductor Corporation 
-- -------------------------------------------------------------------- 
-- 
-- 
--                     Lattice Semiconductor Corporation 
--                     5555 NE Moore Court 
--                     Hillsboro, OR 97214 
--                     U.S.A 
-- 
--                     TEL: 1-800-Lattice (USA and Canada) 
--                          408-826-6000 (other locations) 
-- 
--                     web: http://www.latticesemi.com/ 
--                     email: techsupport@latticesemi.com 
-- 
-- -------------------------------------------------------------------- 
-- VHDL behavior model for macros used by schematic capture
-- Build by XiaoQiu ZHOU according to VHDL RTL model
-- -------------------------------------------------------------------- 
--OR16
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity OR16 is
  port(
    A0 : IN std_logic;
    A1 : IN std_logic;
    A2 : IN std_logic;
    A3 : IN std_logic;
    A4 : IN std_logic;
    A5 : IN std_logic;
    A6 : IN std_logic;
    A7 : IN std_logic;
    A8 : IN std_logic;
    A9 : IN std_logic;
    A10: IN std_logic;
    A11: IN std_logic;
    A12: IN std_logic;
    A13: IN std_logic;
    A14: IN std_logic;
    A15: IN std_logic;
    Z0 : OUT std_logic
  );
end OR16;

architecture LATTICE_BEHAV of OR16 is
begin
  Z0 <= A0 OR A1 OR A2 OR A3 OR A4 OR A5 OR A6 OR A7 OR A8 OR A9
  OR A10 OR A11 OR A12 OR A13 OR A14 OR A15;
end LATTICE_BEHAV;
