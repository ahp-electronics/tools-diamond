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
--NOR4
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity NOR4 is
  port(
    A0 : IN std_logic;
    A1 : IN std_logic;
    A2 : IN std_logic;
    A3 : IN std_logic;
    ZN0: OUT std_logic
  );
end NOR4;

architecture LATTICE_BEHAV of NOR4 is
begin
  ZN0 <= NOT ( A0 OR A1 OR A2 OR A3);
end LATTICE_BEHAV;
