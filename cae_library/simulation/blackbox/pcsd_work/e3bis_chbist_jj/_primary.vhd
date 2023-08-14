library verilog;
use verilog.vl_types.all;
entity e3bis_chbist_jj is
    port(
        txclk           : in     vl_logic;
        rxclk           : in     vl_logic;
        bist_en         : in     vl_logic;
        bist_mode       : in     vl_logic;
        bist_ptn_sel    : in     vl_logic_vector(2 downto 0);
        bist_head_sel   : in     vl_logic_vector(1 downto 0);
        bist_time_sel   : in     vl_logic_vector(1 downto 0);
        bist_res_sel    : in     vl_logic_vector(1 downto 0);
        bus8bit_sel     : in     vl_logic;
        bypass_tx_gate  : in     vl_logic;
        sync_head_req   : in     vl_logic_vector(1 downto 0);
        usr_def_head    : in     vl_logic_vector(19 downto 0);
        rx_data         : in     vl_logic_vector(9 downto 0);
        bist_tx_data    : out    vl_logic_vector(9 downto 0);
        bist_report     : out    vl_logic_vector(15 downto 0)
    );
end e3bis_chbist_jj;
