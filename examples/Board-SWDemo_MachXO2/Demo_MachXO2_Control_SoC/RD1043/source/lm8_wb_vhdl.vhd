-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c) 2001 - 2008 by Lattice Semiconductor Corporation
-- --------------------------------------------------------------------
--
-- Permission:
--
-- Lattice Semiconductor grants permission to use this code for use
-- in synthesis for any Lattice programmable logic product. Other
-- use of this code, including the selling or duplication of any
-- portion is strictly prohibited.
--
-- Disclaimer:
--
-- This VHDL or Verilog source code is intended as a design reference
-- which illustrates how these types of functions can be implemented.
-- It is the user's responsibility to verify their design for
-- consistency and functionality through the use of formal
-- verification methods. Lattice Semiconductor provides no warranty
-- regarding the use or functionality of this code.
--
-- --------------------------------------------------------------------
--
-- Lattice Semiconductor Corporation
-- 5555 NE Moore Court
-- Hillsboro, OR 97214
-- U.S.A
--
-- TEL: 1-800-Lattice (USA and Canada)
-- 503-268-8001 (other locations)
--
-- web: http://www.latticesemi.com/
-- email: techsupport@latticesemi.com
--
-- --------------------------------------------------------------------
-- Code Revision History :
-- --------------------------------------------------------------------
-- Ver: | Author |Mod. Date |Changes Made:
-- V1.0 | J.O.   |12/19/08  |Initial ver
--
-- --------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lm8_wb_wrapper is
  port (
        clk_i    : in  std_logic;
        rst_i    : in  std_logic;
        wb_ack_i : in  std_logic_vector(7 downto 0);
        wb_dat_i : in  std_logic_vector(63 downto 0);
        wb_stb_o : out std_logic_vector(7 downto 0);
        wb_we_o  : out std_logic;
        wb_sel_o : out std_logic;
        wb_cyc_o : out std_logic;
        wb_dat_o : out std_logic_vector(7 downto 0);
        wb_adr_o : out std_logic_vector(12 downto 0);
        lm8_addr : in  std_logic_vector(15 downto 0);   
        lm8_ext_io_rd : in std_logic;
        lm8_ext_io_wr : in std_logic;
        lm8_ext_io_din : out std_logic_vector(7 downto 0);
        lm8_ext_io_dout : in std_logic_vector(7 downto 0);
        lm8_io_ready : out std_logic
        );
end entity;

architecture arch of lm8_wb_wrapper is
component lm8_wb
  port(
       clk_i    : in  std_logic;
       rst_i    : in  std_logic;
       wb_ack_i : in  std_logic_vector(7 downto 0);
       wb_dat_i : in  std_logic_vector(63 downto 0);
       wb_stb_o : out std_logic_vector(7 downto 0);
       wb_we_o  : out std_logic;
       wb_sel_o : out std_logic;
       wb_cyc_o : out std_logic;
       wb_dat_o : out std_logic_vector(7 downto 0);
       wb_adr_o : out std_logic_vector(12 downto 0);
       lm8_addr : in  std_logic_vector(15 downto 0);   
       lm8_ext_io_rd : in std_logic;
       lm8_ext_io_wr : in std_logic;
       lm8_ext_io_din : out std_logic_vector(7 downto 0);
       lm8_ext_io_dout : in std_logic_vector(7 downto 0);
       lm8_io_ready : out std_logic
       );
end component;
begin
lm8_wb_inst: lm8_wb 
  port map (
            clk_i    => clk_i,
            rst_i    => rst_i,
            wb_ack_i => wb_ack_i,
            wb_dat_i => wb_dat_i,
            wb_stb_o => wb_stb_o,
            wb_we_o  => wb_we_o,
            wb_sel_o => wb_sel_o,
            wb_cyc_o => wb_cyc_o,
            wb_dat_o => wb_dat_o,
            wb_adr_o => wb_adr_o,
            lm8_addr => lm8_addr,
            lm8_ext_io_rd => lm8_ext_io_rd,
            lm8_ext_io_wr => lm8_ext_io_wr,
            lm8_ext_io_din => lm8_ext_io_din,
            lm8_ext_io_dout => lm8_ext_io_dout,
            lm8_io_ready => lm8_io_ready
            );
            
end arch;