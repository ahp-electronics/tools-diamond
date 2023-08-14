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
--NAND11
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity NAND11 is
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
    ZN0: OUT std_logic
  );
end NAND11;

architecture LATTICE_BEHAV of NAND11 is
begin
  ZN0 <= NOT (A0 AND A1 AND A2 AND A3 AND A4 AND A5 AND A6 AND A7 AND A8 AND A9 AND A10);
end LATTICE_BEHAV;
