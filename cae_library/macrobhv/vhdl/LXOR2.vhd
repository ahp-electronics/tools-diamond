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
-- LXOR2
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LXOR2 is
	port (
    A0 : IN STD_LOGIC;
		A1 : IN STD_LOGIC;
		Z0 : OUt STD_LOGIC
  );
end LXOR2;

architecture LATTICE_BEHAV of LXOR2 is 
begin
			Z0 <= A0 XOR A1;
end LATTICE_BEHAV; 
