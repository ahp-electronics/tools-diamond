-- Edit to check in
library IEEE; use IEEE.std_logic_1164.all; use IEEE.numeric_std.all;

entity rvl_j2w_port is
    generic (
      BIG_ENDIAN : integer := 1;
      BUFFER_SIZE_BYTES : integer := 32;
      J2W_WB_ADR_WIDTH : integer := 32;
      J2W_WB_DAT_WIDTH : integer := 32;
      HUB_NO : integer := 0);
    PORT (
      CLK: IN std_logic;
      RESET: IN std_logic;
      J2W_CYC_O: OUT std_logic;
      J2W_STB_O: OUT std_logic;
      J2W_WE_O: OUT std_logic;
      J2W_LOCK_O: OUT std_logic;
      J2W_ADR_O: OUT std_logic_vector (J2W_WB_ADR_WIDTH-1 downto 0);
      J2W_DAT_I: IN std_logic_vector (J2W_WB_DAT_WIDTH-1 downto 0);
      J2W_DAT_O: OUT std_logic_vector (J2W_WB_DAT_WIDTH-1 downto 0);
      J2W_ACK_I: IN std_logic;
      J2W_RTY_I: IN std_logic;
      J2W_ERR_I: IN std_logic;
      J2W_SEL_O: OUT std_logic_vector ((J2W_WB_DAT_WIDTH/8)-1 downto 0);
      J2W_CTI_O: OUT std_logic_vector (2 downto 0);
      J2W_BTE_O: OUT std_logic_vector (1 downto 0));

end rvl_j2w_port;

architecture behavioral of rvl_j2w_port is
component rvl_j2w is
    generic (
      BIG_ENDIAN : integer := 1;
      BUFFER_SIZE_BYTES : integer := 32;
      J2W_WB_ADR_WIDTH : integer := 32;
      J2W_WB_DAT_WIDTH : integer := 32;
      HUB_NO : integer := 0);
    PORT (
      CLK: IN std_logic;
      RESET: IN std_logic;
      J2W_CYC_O: OUT std_logic;
      J2W_STB_O: OUT std_logic;
      J2W_WE_O: OUT std_logic;
      J2W_LOCK_O: OUT std_logic;
      J2W_ADR_O: OUT std_logic_vector (J2W_WB_ADR_WIDTH-1 downto 0);
      J2W_DAT_I: IN std_logic_vector (J2W_WB_DAT_WIDTH-1 downto 0);
      J2W_DAT_O: OUT std_logic_vector (J2W_WB_DAT_WIDTH-1 downto 0);
      J2W_ACK_I: IN std_logic;
      J2W_RTY_I: IN std_logic;
      J2W_ERR_I: IN std_logic;
      J2W_SEL_O: OUT std_logic_vector ((J2W_WB_DAT_WIDTH/8)-1 downto 0);
      J2W_CTI_O: OUT std_logic_vector (2 downto 0);
      J2W_BTE_O: OUT std_logic_vector (1 downto 0));
end component;

begin

  rvl_j2w_inst : rvl_j2w
    generic map (
      BIG_ENDIAN => BIG_ENDIAN,
      BUFFER_SIZE_BYTES => BUFFER_SIZE_BYTES,
      J2W_WB_ADR_WIDTH => J2W_WB_ADR_WIDTH,
      J2W_WB_DAT_WIDTH => J2W_WB_DAT_WIDTH,
      HUB_NO => HUB_NO)
    port map (
      CLK => CLK,
      RESET => RESET,
      J2W_CYC_O => J2W_CYC_O,
      J2W_STB_O => J2W_STB_O,
      J2W_WE_O => J2W_WE_O,
      J2W_LOCK_O => J2W_LOCK_O,
      J2W_ADR_O => J2W_ADR_O,
      J2W_DAT_I => J2W_DAT_I,
      J2W_DAT_O => J2W_DAT_O,
      J2W_ACK_I => J2W_ACK_I,
      J2W_RTY_I => J2W_RTY_I,
      J2W_ERR_I => J2W_ERR_I,
      J2W_SEL_O => J2W_SEL_O,
      J2W_CTI_O => J2W_CTI_O,
      J2W_BTE_O => J2W_BTE_O);

end behavioral;
