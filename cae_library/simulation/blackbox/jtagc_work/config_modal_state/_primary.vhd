library verilog;
use verilog.vl_types.all;
entity config_modal_state is
    generic(
        st_poweroff     : integer := 0;
        st_unprogram    : integer := 1;
        st_functional   : integer := 2;
        st_program      : integer := 4;
        st_test         : integer := 5;
        st_post_edit    : integer := 6;
        st_xread        : integer := 7
    );
    port(
        wakeup_adv      : in     vl_logic;
        done_reg        : in     vl_logic;
        tck             : in     vl_logic;
        progen_o        : in     vl_logic;
        x_progen_o      : in     vl_logic;
        progdis_o       : in     vl_logic;
        tlreset         : in     vl_logic;
        xread_en_o      : in     vl_logic;
        xread_dis_o     : in     vl_logic;
        test_inst       : in     vl_logic;
        por             : in     vl_logic;
        jtag_active     : out    vl_logic;
        unprogram       : out    vl_logic;
        functional      : out    vl_logic;
        edit_mod        : out    vl_logic;
        post_edit       : out    vl_logic;
        xread_mod       : out    vl_logic;
        not_edit        : out    vl_logic;
        jtag_unprogram  : out    vl_logic;
        jtag_functional : out    vl_logic;
        exit_start_dly  : out    vl_logic;
        progen_o_r      : out    vl_logic;
        block_bank8     : out    vl_logic
    );
end config_modal_state;
