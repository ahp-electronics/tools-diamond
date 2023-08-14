library verilog;
use verilog.vl_types.all;
entity config_modal_state is
    generic(
        st_unprogram    : integer := 0;
        st_functional   : integer := 1;
        st_program_ee   : integer := 2;
        st_program_sram : integer := 3;
        st_xsram        : integer := 4;
        st_xee          : integer := 5;
        st_post_edit    : integer := 6
    );
    port(
        wakeup_adv      : in     vl_logic;
        done_reg        : in     vl_logic;
        tck             : in     vl_logic;
        progen_ee_o     : in     vl_logic;
        progen_sram_o   : in     vl_logic;
        progdis_o       : in     vl_logic;
        tlreset         : in     vl_logic;
        xprogen_ee_o    : in     vl_logic;
        xreaden_sram_o  : in     vl_logic;
        async_rst       : in     vl_logic;
        por             : in     vl_logic;
        leave_postedit  : in     vl_logic;
        seldsr          : in     vl_logic;
        selasr          : in     vl_logic;
        muxclk_en       : in     vl_logic;
        jtag_active     : out    vl_logic;
        unprogram       : out    vl_logic;
        edit_mod        : out    vl_logic;
        edee            : out    vl_logic;
        edsram          : out    vl_logic;
        xsram           : out    vl_logic;
        xee             : out    vl_logic;
        not_edit        : out    vl_logic;
        post_edit       : out    vl_logic;
        jtag_unprogram  : out    vl_logic;
        jtag_functional : out    vl_logic;
        ee_mod          : out    vl_logic;
        edsram_tran     : out    vl_logic;
        edit_tran       : out    vl_logic;
        edit_tran_cdu   : out    vl_logic
    );
end config_modal_state;
