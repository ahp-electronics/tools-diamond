library verilog;
use verilog.vl_types.all;
entity config_sspi_modal_st is
    generic(
        st_idle         : integer := 0;
        st_xflash       : integer := 1;
        st_xtag         : integer := 2;
        st_xrdsram      : integer := 3
    );
    port(
        clk             : in     vl_logic;
        read_tag_o      : in     vl_logic;
        xprogen_ee_o    : in     vl_logic;
        xreaden_sram_o  : in     vl_logic;
        progdis_o       : in     vl_logic;
        sspi_hv         : out    vl_logic;
        sspi_active     : out    vl_logic;
        sspi_xflash     : out    vl_logic;
        sspi_xrdsram    : out    vl_logic;
        sspi_idle       : out    vl_logic;
        sspi_active_r   : out    vl_logic
    );
end config_sspi_modal_st;
