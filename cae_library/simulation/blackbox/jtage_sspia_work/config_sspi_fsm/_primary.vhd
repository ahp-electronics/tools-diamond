library verilog;
use verilog.vl_types.all;
entity config_sspi_fsm is
    generic(
        st_rst          : integer := 0;
        st_dec          : integer := 1;
        st_inf          : integer := 2;
        st_shf          : integer := 3
    );
    port(
        sspi_async_rst  : in     vl_logic;
        clk             : in     vl_logic;
        csspi           : in     vl_logic;
        byte_cnt        : in     vl_logic_vector(1 downto 0);
        byte_bndy       : in     vl_logic;
        jtag_active     : in     vl_logic;
        rst_exe_r       : out    vl_logic;
        cmd_dec_r       : out    vl_logic;
        cmd_inf_r       : out    vl_logic;
        dat_shf_r       : out    vl_logic;
        cmd_dec         : out    vl_logic;
        dat_shf         : out    vl_logic
    );
end config_sspi_fsm;
