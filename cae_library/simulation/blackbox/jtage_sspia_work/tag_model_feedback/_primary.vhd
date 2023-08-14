library verilog;
use verilog.vl_types.all;
entity tag_model_feedback is
    generic(
        ERS_DELAY       : integer := 1000000000;
        PRG_DELAY       : integer := 5000000;
        READ_DELAY      : integer := 5000;
        DSR_LENGTH      : integer := 2184
    );
    port(
        clk             : in     vl_logic;
        erase_tag_o     : in     vl_logic;
        prog_tag_o      : in     vl_logic;
        progdis_o       : in     vl_logic;
        read_tag_o      : in     vl_logic;
        sspi_rdstatus   : in     vl_logic;
        progstatus_ee_o : in     vl_logic;
        xprogen_ee_o    : in     vl_logic;
        sspi_vfy_cap    : in     vl_logic;
        sspi_data       : in     vl_logic;
        sspi_dsrce      : in     vl_logic;
        flash_status    : out    vl_logic;
        sso             : out    vl_logic
    );
end tag_model_feedback;
