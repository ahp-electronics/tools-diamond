library verilog;
use verilog.vl_types.all;
entity flash_cdm is
    generic(
        st_idle         : integer := 0;
        st_cdm_seq      : integer := 1;
        st_tfu_set      : integer := 2;
        st_tfu_rd       : integer := 3
    );
    port(
        lsc_cdm         : out    vl_logic;
        fl_finish_cdm   : out    vl_logic;
        fl_busy_cdm     : out    vl_logic;
        cdm_read_udss_exec: out    vl_logic;
        cdm_read_ufs_exec: out    vl_logic;
        cdm_read_trim_exec: out    vl_logic_vector(5 downto 0);
        cdm_read_feat_exec: out    vl_logic_vector(5 downto 0);
        cdm_read_64_exec: out    vl_logic;
        flash_block_num : in     vl_logic_vector(1 downto 0);
        isc_rst_async   : in     vl_logic;
        smclk           : in     vl_logic;
        fl_start_cdm    : in     vl_logic;
        cdm_busy0       : in     vl_logic;
        cdm_busy1       : in     vl_logic;
        busy_flash      : in     vl_logic
    );
end flash_cdm;
