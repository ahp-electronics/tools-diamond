-- ---------------------------------------------------------------------------
--
-- Name : SPIPROG.vhd
--
-- Description:
--
--    This module contains the ER2 regsiters of SPI Serial FLASH programmer IP
--    core.  There are only three ER2 registers, one control register and two
--    data registers, in this IP core.  The control register is a 8-bit wide
--    register for selecting which data register will be accessed when the
--    Control/Data# bit in ER1 register is low.  Data register 0 is a readonly
--    ID register.  It is composed of three register fields -- an 8-bit
--    "implementer", a 16-bit "IP_functionality", and a 12-bit "revision".
--    Data register 1 is a variable length register for sending commands to or
--    receiving readback data from the SPI Serial FLASH device.
--
-- $Log: spiprog.vhd,v $
-- Revision 1.3  2004-10-08 16:19:46-07  jhsin
-- Added 1-bit DR2 register for tri-stating outputs after SPI programming completed.
--
-- Revision 1.2  2004-09-09 11:43:26-07  jhsin
-- 1. Reduced the the ID register (DR0) length from 36 bits to 8 bits.
-- 2. Same as TYPEA and TYPEB modules, use falling edge clock
--    for all TCK Flip-Flops.
--
-- Revision 1.1  2004-08-12 13:22:05-07  jhsin
-- Added 7 delay Flip-Flops so that the DR1 readback data from SPI Serial FLASH is in the byte boundary.
--
-- Revision 1.0  2004-08-03 18:35:56-07  jhsin
-- Initial revision
--
--
-- $Header: \\\\hqfs2\\ip\040cores\\rcs\\hqfs2\\ip\040cores\\rcswork\\isptracy\\VHDL\\Implementation\\spiprog.vhd,v 1.3 2004-10-08 16:19:46-07 jhsin Exp $
--
-- Copyright (C) 2004 Lattice Semiconductor Corp.  All rights reserved.
--
-- ---------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity SPIPROG is
   port (
      JTCK           : in  std_logic;
      JTDI           : in  std_logic;
      JTDO2          : out std_logic;
      JSHIFT         : in  std_logic;
      JUPDATE        : in  std_logic;
      JRSTN          : in  std_logic;
      JCE2           : in  std_logic;
      SPIPROG_ENABLE : in  std_logic;
      CONTROL_DATAN  : in  std_logic;
      SPI_C          : out std_logic;
      SPI_D          : out std_logic;
      SPI_SN         : out std_logic;
      SPI_Q          : in  std_logic
   );
end SPIPROG;

architecture SPIPROG_a of SPIPROG is

   component TYPEA
      port (
         CLK        : in  std_logic;
         RESET_N    : in  std_logic;
         CLKEN      : in  std_logic;
         TDI        : in  std_logic;
         TDO        : out std_logic;
         DATA_OUT   : out std_logic;
         DATA_IN    : in  std_logic;
         CAPTURE_DR : in  std_logic;
         UPDATE_DR  : in  std_logic
      );
   end component;

   component TYPEB
      port (
         CLK        : in  std_logic;
         RESET_N    : in  std_logic;
         CLKEN      : in  std_logic;
         TDI        : in  std_logic;
         TDO        : out std_logic;
         DATA_IN    : in  std_logic;
         CAPTURE_DR : in  std_logic
      );
   end component;

   signal er2Cr_enable  : std_logic;
   signal er2Dr0_enable : std_logic;
   signal er2Dr1_enable : std_logic;
   signal er2Dr2_enable : std_logic;

   signal tdo_er2Cr  : std_logic;
   signal tdo_er2Dr0 : std_logic;
   signal tdo_er2Dr1 : std_logic;
   signal tdo_er2Dr2 : std_logic;

   signal encodedDrSelBits : std_logic_vector(7 downto 0);
   signal er2CrTdiBit      : std_logic_vector(8 downto 0);
   signal er2Dr0TdiBit     : std_logic_vector(8 downto 0);

   signal captureDrER2 : std_logic;
   signal spi_s        : std_logic;
   signal spi_q_dly    : std_logic_vector(6 downto 0);

   signal spi_c_i  : std_logic;
   signal spi_d_i  : std_logic;
   signal spi_sn_i : std_logic;

   signal triStateOutput : std_logic;

   signal ip_functionality_id : std_logic_vector(7 downto 0);

begin

   ------ Control Register 0 ------

   er2Cr_enable <= JCE2 and SPIPROG_ENABLE and CONTROL_DATAN;

   tdo_er2Cr <= er2CrTdiBit(0);

   CR_BIT0_BIT7 : for bit_index in 0 to 7 generate
   begin
      BIT_N : component TYPEA
      port map (
         CLK        => JTCK,
         RESET_N    => JRSTN,
         CLKEN      => er2Cr_enable,
         TDI        => er2CrTdiBit(bit_index + 1),
         TDO        => er2CrTdiBit(bit_index),
         DATA_OUT   => encodedDrSelBits(bit_index),
         DATA_IN    => encodedDrSelBits(bit_index),
         CAPTURE_DR => captureDrER2,
         UPDATE_DR  => JUPDATE
      );
   end generate CR_BIT0_BIT7;

   er2CrTdiBit(8) <= JTDI;

   ------ Data Register 0 ------

   er2Dr0_enable <= '1' when (JCE2 = '1') and (SPIPROG_ENABLE = '1') and (CONTROL_DATAN = '0') and (encodedDrSelBits = "00000000") else
                    '0';

   tdo_er2Dr0 <= er2Dr0TdiBit(0);

   ip_functionality_id <= "00000001";  -- SPI Serial FLASH Programmer (0x01)

   DR0_BIT0_BIT7 : for bit_index in 0 to 7 generate
   begin
      BIT_N : TYPEB
      port map (
         CLK        => JTCK,
         RESET_N    => JRSTN,
         CLKEN      => er2Dr0_enable,
         TDI        => er2Dr0TdiBit(bit_index + 1),
         TDO        => er2Dr0TdiBit(bit_index),
         DATA_IN    => ip_functionality_id(bit_index),
         CAPTURE_DR => captureDrER2
      );
   end generate DR0_BIT0_BIT7;

   er2Dr0TdiBit(8) <= JTDI;

   ------ Data Register 1 ------

   er2Dr1_enable <= '1' when (JCE2 = '1') and (JSHIFT = '1') and (SPIPROG_ENABLE = '1') and (CONTROL_DATAN = '0') and (encodedDrSelBits = "00000001") else
                    '0';

   spi_c_i <= not (JTCK and er2Dr1_enable and spi_s);

   spi_d_i <= JTDI and er2Dr1_enable;

   SPI_S_Proc : process (JTCK, JRSTN)
   begin
      if (JRSTN='0') then
         spi_s <= '0';
      elsif falling_edge(JTCK) then
         if (JUPDATE = '1') then
            spi_s <= '0';
         else
            spi_s <= er2Dr1_enable;
         end if;
      end if;
   end process SPI_S_Proc;

   spi_sn_i <= not spi_s;

   SPI_Q_Proc : process (JTCK, JRSTN)
   begin
      if (JRSTN='0') then
         spi_q_dly <= (others => '0');
      elsif falling_edge(JTCK) then
         if (er2Dr1_enable = '1') then
            spi_q_dly  <= spi_q_dly(5 downto 0) & SPI_Q;
         end if;
      end if;
   end process SPI_Q_Proc;

   tdo_er2Dr1 <= spi_q_dly(6);

   ------ Data Register 2 ------

   er2Dr2_enable <= '1' when (JCE2 = '1') and (SPIPROG_ENABLE = '1') and (CONTROL_DATAN = '0') and (encodedDrSelBits = "00000010") else
                    '0';

   DR2_BIT0 : TYPEA
      port map (
         CLK        => JTCK,
         RESET_N    => JRSTN,
         CLKEN      => er2Dr2_enable,
         TDI        => JTDI,
         TDO        => tdo_er2Dr2,
         DATA_OUT   => triStateOutput,
         DATA_IN    => triStateOutput,
         CAPTURE_DR => captureDrER2,
         UPDATE_DR  => JUPDATE
      );

   ------ OUTPUT TRI-STATE CONTROL ------

   SPI_C  <=  spi_c_i when (triStateOutput = '0') else 'Z';
   SPI_D  <=  spi_d_i when (triStateOutput = '0') else 'Z';
   SPI_SN <= spi_sn_i when (triStateOutput = '0') else 'Z';

   ------ JTDO2 MUX ------

   JTDO2 <= tdo_er2Cr when (CONTROL_DATAN = '1') else
            tdo_er2Dr0 when (CONTROL_DATAN = '0') and (encodedDrSelBits = "00000000") else
            tdo_er2Dr1 when (CONTROL_DATAN = '0') and (encodedDrSelBits = "00000001") else
            tdo_er2Dr2 when (CONTROL_DATAN = '0') and (encodedDrSelBits = "00000010") else
            '0';

   captureDrER2  <= not JSHIFT and JCE2;

end SPIPROG_a;
