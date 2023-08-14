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
--XOR9
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity XOR9 is
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
    Z0 : OUT std_logic);
end XOR9;

architecture LATTICE_BEHAV of XOR9 is
begin
  Z0 <= A0 XOR A1 XOR A2 XOR A3 XOR A4 XOR A5 XOR A6 XOR A7 XOR A8;
end LATTICE_BEHAV;
