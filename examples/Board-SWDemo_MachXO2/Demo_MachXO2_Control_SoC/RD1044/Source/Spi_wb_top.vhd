-- --------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------
-- Copyright (c) 2009 by Lattice Semiconductor Corporation
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
-- V1.0 | J.D.   |01/28/09  |Initial ver
--
-- --------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity spi_wb_wr is
	generic (SLAVE_NUMBER : integer := 1);
	port(
			CLK_I      : in std_logic;
			RST_I      : in std_logic;
            SPI_ADR_I  : in std_logic_vector (7 downto 0);
			SPI_DAT_I  : in std_logic_vector (7 downto 0);
			SPI_WE_I   : in std_logic;
			SPI_STB_I  : in std_logic;
			SPI_CYC_I  : in std_logic;
			SPI_SEL_I  : in std_logic_vector (3 downto 0);
			SPI_CTI_I  : in std_logic_vector (2 downto 0);
			SPI_BTE_I  : in std_logic_vector (1 downto 0);
			SPI_LOCK_I : in std_logic;
            SPI_DAT_O  : out std_logic_vector (7 downto 0);
            SPI_ACK_O  : out std_logic;
            SPI_INT_O  : out std_logic;
            SPI_ERR_O  : out std_logic;
            SPI_RTY_O  : out std_logic;

			MISO_MASTER : in std_logic;
            MOSI_MASTER : out std_logic;
            SS_N_MASTER : out std_logic_vector (SLAVE_NUMBER-1 downto 0);
            SCLK_MASTER : out std_logic;
            MISO_SLAVE  : out std_logic;
            MOSI_SLAVE  : in std_logic;
            SS_N_SLAVE  : in std_logic;
            SCLK_SLAVE  : in std_logic
     );
end;


architecture imp_spi_wb of spi_wb_wr is

	component spi

		generic ( SLAVE_NUMBER  : positive := 1 );

	   port ( CLK_I    : in std_logic;
			RST_I      : in std_logic;
            SPI_ADR_I  : in std_logic_vector (7 downto 0);
			SPI_DAT_I  : in std_logic_vector (7 downto 0);
			SPI_WE_I   : in std_logic;
			SPI_STB_I  : in std_logic;
			SPI_CYC_I  : in std_logic;
			SPI_SEL_I  : in std_logic_vector (3 downto 0);
			SPI_CTI_I  : in std_logic_vector (2 downto 0);
			SPI_BTE_I  : in std_logic_vector (1 downto 0);
			SPI_LOCK_I : in std_logic;
            SPI_DAT_O  : out std_logic_vector (7 downto 0);
            SPI_ACK_O  : out std_logic;
            SPI_INT_O  : out std_logic;
            SPI_ERR_O  : out std_logic;
            SPI_RTY_O  : out std_logic;

			MISO_MASTER : in std_logic;
            MOSI_MASTER : out std_logic;
            SS_N_MASTER : out std_logic_vector (SLAVE_NUMBER-1 downto 0);
            SCLK_MASTER : out std_logic;
            MISO_SLAVE  : out std_logic;
            MOSI_SLAVE  : in std_logic;
            SS_N_SLAVE  : in std_logic;
            SCLK_SLAVE  : in std_logic);
	end component;


begin  -- imp_spi_wb
	------------------------------------
	-- Instantiate lower level module
	------------------------------------

	spi_1 : spi 

         	generic map (SLAVE_NUMBER => 1)

			port map(
					CLK_I       =>  CLK_I,
					RST_I       =>  RST_I,
					SPI_ADR_I   =>  SPI_ADR_I,
					SPI_DAT_I   =>  SPI_DAT_I,
					SPI_WE_I    =>  SPI_WE_I,
					SPI_STB_I   =>  SPI_STB_I,
					SPI_CYC_I   =>  SPI_CYC_I,
					SPI_SEL_I   =>  SPI_SEL_I,
					SPI_CTI_I   =>  SPI_CTI_I,
					SPI_BTE_I   =>  SPI_BTE_I,
					SPI_LOCK_I  =>  SPI_LOCK_I,
					SPI_DAT_O   =>  SPI_DAT_O,
					SPI_ACK_O   =>  SPI_ACK_O,
					SPI_INT_O   =>  SPI_INT_O,
					SPI_ERR_O   =>  SPI_ERR_O,
					SPI_RTY_O   =>  SPI_RTY_O,

					MISO_MASTER  => MISO_MASTER,
					MOSI_MASTER  => MOSI_MASTER,
					SS_N_MASTER  => SS_N_MASTER,
					SCLK_MASTER  => SCLK_MASTER,
					MISO_SLAVE   => MISO_SLAVE,
					MOSI_SLAVE   => MOSI_SLAVE,
					SS_N_SLAVE   => SS_N_SLAVE,
					SCLK_SLAVE   => SCLK_SLAVE	);


end imp_spi_wb;



