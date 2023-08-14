library verilog;
use verilog.vl_types.all;
entity e3bis_ch_ptn_gen is
    generic(
        MA1             : integer := 502;
        MA2             : integer := 296;
        \K28_5_\        : integer := 380;
        K28_5           : integer := 643;
        MAX             : integer := 682;
        A1              : integer := 246;
        A2              : integer := 40;
        MK28_5          : integer := 188;
        \MK28_5_\       : integer := 67;
        RESET           : integer := 0;
        HEAD            : integer := 1;
        START           : integer := 2;
        DATA            : integer := 3
    );
    port(
        clk             : in     vl_logic;
        bist_en         : in     vl_logic;
        bist_ptn_sel    : in     vl_logic_vector(2 downto 0);
        bist_head_sel   : in     vl_logic_vector(1 downto 0);
        bist_head_found : in     vl_logic;
        bus8bit_sel     : in     vl_logic;
        bypass_tx_gate  : in     vl_logic;
        usr_def_head    : in     vl_logic_vector(19 downto 0);
        bist_ptn_out    : out    vl_logic_vector(9 downto 0)
    );
end e3bis_ch_ptn_gen;
