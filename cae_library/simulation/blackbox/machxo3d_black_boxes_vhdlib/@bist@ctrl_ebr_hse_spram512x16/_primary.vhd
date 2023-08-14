library verilog;
use verilog.vl_types.all;
entity BistCtrl_ebr_hse_spram512x16 is
    port(
        Tclk            : in     vl_logic;
        mrst_n          : in     vl_logic;
        retention_test_en: in     vl_logic;
        mem_ctrl        : out    vl_logic_vector(1 downto 0);
        dout_i          : in     vl_logic_vector(15 downto 0);
        bist_ctrl       : out    vl_logic_vector(26 downto 0);
        BistFail        : out    vl_logic;
        ErrMap          : out    vl_logic;
        clock_gate_te   : in     vl_logic;
        Finish          : out    vl_logic;
        BistMode        : in     vl_logic
    );
end BistCtrl_ebr_hse_spram512x16;
