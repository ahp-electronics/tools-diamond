-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c)  2008 by Lattice Semiconductor Corporation
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
-- web: http:--www.latticesemi.com/
-- email: techsupport@latticesemi.com
--
-- --------------------------------------------------------------------
-- Code Revision History :
-- --------------------------------------------------------------------
-- Ver: | Author |Mod. Date |Changes Made:
-- V1.0 | S.R.   |18/12/08  | initial version
--
-- --------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity UART_Vhdlwrapper is
port(
CLK          : in std_logic;
RESET        : in std_logic; 
UART_ADR_I   : in std_logic_vector( 7 downto 0); 
UART_DAT_I   : in std_logic_vector(15 downto 0); 
UART_STB_I   : in std_logic; 
UART_CYC_I   : in std_logic; 
UART_WE_I    : in std_logic; 
UART_SEL_I   : in std_logic_vector(3 downto 0); 
UART_CTI_I   : in std_logic_vector(2 downto 0);
UART_BTE_I   : in std_logic_vector(1 downto 0); 
SIN          : in std_logic; 
DCD_N        : in std_logic; 
DSR_N        : in std_logic; 
CTS_N        : in std_logic; 
RI_N         : in std_logic;
                    
UART_DAT_O   : out std_logic_vector(15 downto 0);
UART_ACK_O   : out std_logic;
INTR		 : out std_logic;
RXRDY_N      : out std_logic;
TXRDY_N      : out std_logic;
SOUT         : out std_logic;
DTR_N        : out std_logic;
RTS_N        : out std_logic 

);
end UART_Vhdlwrapper;

architecture UART_Vhdlwrapper_arch of UART_Vhdlwrapper is

component uart_core
   port(
CLK          : in std_logic;
RESET        : in std_logic; 
UART_ADR_I   : in std_logic_vector( 7 downto 0); 
UART_DAT_I   : in std_logic_vector(15 downto 0); 
UART_STB_I   : in std_logic; 
UART_CYC_I   : in std_logic; 
UART_WE_I    : in std_logic; 
UART_SEL_I   : in std_logic_vector(3 downto 0); 
UART_CTI_I   : in std_logic_vector(2 downto 0);
UART_BTE_I   : in std_logic_vector(1 downto 0); 
SIN          : in std_logic; 
DCD_N        : in std_logic; 
DSR_N        : in std_logic; 
CTS_N        : in std_logic; 
RI_N         : in std_logic;
                    
UART_DAT_O   : out std_logic_vector(15 downto 0);
UART_ACK_O   : out std_logic;
INTR		 : out std_logic;
RXRDY_N      : out std_logic;
TXRDY_N      : out std_logic;
SOUT         : out std_logic;
DTR_N        : out std_logic;
RTS_N        : out std_logic 
      );
   end component;

begin

vhdl_inst : uart_core
port map (
CLK           =>   CLK,       
RESET         =>   RESET,     
UART_ADR_I    =>   UART_ADR_I,
UART_DAT_I    =>   UART_DAT_I,
UART_STB_I    =>   UART_STB_I,
UART_CYC_I    =>   UART_CYC_I,
UART_WE_I     =>   UART_WE_I, 
UART_SEL_I    =>   UART_SEL_I,
UART_CTI_I    =>   UART_CTI_I,
UART_BTE_I    =>   UART_BTE_I,
SIN           =>   SIN,       
DCD_N         =>   DCD_N,     
DSR_N         =>   DSR_N,     
CTS_N         =>   CTS_N,     
RI_N         =>   RI_N,     
                             
UART_DAT_O    =>   UART_DAT_O,
UART_ACK_O    =>   UART_ACK_O,
INTR					=>   INTR,			 
RXRDY_N       =>   RXRDY_N, 
TXRDY_N       =>   TXRDY_N,   
SOUT          =>   SOUT,      
DTR_N         =>   DTR_N,     
RTS_N         =>   RTS_N
);
  
end UART_Vhdlwrapper_arch;   
              
