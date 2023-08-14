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
-- INV
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity CPLD_INV is
	port (
    A0 : IN STD_LOGIC;
		ZN0 : OUT STD_LOGIC
  );
end CPLD_INV;

architecture LATTICE_BEHAV of CPLD_INV is 
begin
			ZN0 <= NOT A0;
end LATTICE_BEHAV;
