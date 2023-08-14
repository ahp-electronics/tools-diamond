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
-- G_4AND1
library ieee;
use ieee.std_logic_1164.all;
entity G_4AND1 is
  Port (
    B : In    std_logic;
    C : In    std_logic;
    D : In    std_logic;
    AN : In    std_logic;
    Y : Out   std_logic
  );
end G_4AND1;

architecture behavioral of G_4AND1 is
begin
  Y <= not(AN) and B and C and D;
end behavioral;
