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
--XNOR2
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity CPLD_XNOR2 is
  port(
    A0 : IN std_logic;
    A1 : IN std_logic;
    ZN0: OUT std_logic);
end CPLD_XNOR2;

architecture LATTICE_BEHAV of CPLD_XNOR2 is
begin
  ZN0 <= NOT (A0 XOR A1);
end LATTICE_BEHAV;
