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
-- INV8
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity INV8 is
      Port (      A0 : In    std_logic;
                  A1 : In    std_logic;
                  A2 : In    std_logic;
                  A3 : In    std_logic;
                  A4 : In    std_logic;
                  A5 : In    std_logic;
                  A6 : In    std_logic;
                  A7 : In    std_logic;
                  Y0 : Out   std_logic;
                  Y1 : Out   std_logic;
                  Y2 : Out   std_logic;
                  Y3 : Out   std_logic;
                  Y4 : Out   std_logic;
                  Y5 : Out   std_logic;
                  Y6 : Out   std_logic;
                  Y7 : Out   std_logic );
end INV8;

architecture LATTICE_BEHAV of INV8 is 
begin
  Y0 <= NOT A0;
  Y1 <= NOT A1;
  Y2 <= NOT A2;
  Y3 <= NOT A3;
  Y4 <= NOT A4;
  Y5 <= NOT A5;
  Y6 <= NOT A6;
  Y7 <= NOT A7;
end LATTICE_BEHAV;
