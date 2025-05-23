library verilog;
use verilog.vl_types.all;
entity flash_dnld is
    port(
        flash_block_num : in     vl_logic_vector(1 downto 0);
        lsc_ppt         : out    vl_logic;
        lsc_cdm         : out    vl_logic;
        lsc_sdm         : out    vl_logic;
        fl_finish_ppt   : out    vl_logic;
        fl_finish_cdm   : out    vl_logic;
        fl_finish_sdm   : out    vl_logic;
        fl_busy_ppt     : out    vl_logic;
        fl_busy_cdm     : out    vl_logic;
        fl_busy_sdm     : out    vl_logic;
        fail_sdm        : out    vl_logic;
        sdm_start_bse   : out    vl_logic;
        sdm_bse_eof     : out    vl_logic;
        preamble_std_sdm: out    vl_logic;
        preamble_enc_sdm: out    vl_logic;
        preamble_err_sdm: out    vl_logic;
        dnld_row_addr   : out    vl_logic_vector(14 downto 0);
        ppt_read_rom_exec: out    vl_logic;
        ppt_read128_exec: out    vl_logic;
        sdm_set_addr    : out    vl_logic;
        sdm_read128_incr_exec: out    vl_logic;
        cdm_read_udss_exec: out    vl_logic;
        cdm_read_ufs_exec: out    vl_logic;
        cdm_read_trim_exec: out    vl_logic_vector(5 downto 0);
        cdm_read_feat_exec: out    vl_logic_vector(5 downto 0);
        cdm_read_64_exec: out    vl_logic;
        sdm_init_sram_asr_exec: out    vl_logic;
        ppt_init_tsf_asr_exec: out    vl_logic;
        ppt_write_incr_exec: out    vl_logic;
        ppt_load_trim   : out    vl_logic;
        dnld_dat        : out    vl_logic_vector(7 downto 0);
        dnld_dat_en     : out    vl_logic;
        ppt_dat         : out    vl_logic_vector(7 downto 0);
        ppt_dsr_shf8_en : out    vl_logic;
        ppt_dsr_shf     : out    vl_logic;
        ppt_en          : out    vl_logic;
        ppt_rowsel      : out    vl_logic;
        ppt_pset        : out    vl_logic;
        ppt_state       : out    vl_logic_vector(3 downto 0);
        ppt_fail        : out    vl_logic;
        smclk           : in     vl_logic;
        isc_rst_async   : in     vl_logic;
        isc_rst_sync    : in     vl_logic;
        isc_exec_d      : in     vl_logic;
        fsafe           : in     vl_logic;
        mfg_ppt_abort   : in     vl_logic;
        ppt_row_nowait  : in     vl_logic;
        cdm_busy0       : in     vl_logic;
        cdm_busy1       : in     vl_logic;
        busy_flash      : in     vl_logic;
        eof_cfg         : in     vl_logic;
        eof_ufm         : in     vl_logic;
        fl_exec_buf     : in     vl_logic_vector(127 downto 0);
        fl_start_ppt    : in     vl_logic;
        fl_start_cdm    : in     vl_logic;
        fl_start_sdm    : in     vl_logic;
        dev_sdm_exec    : in     vl_logic;
        busy_sram       : in     vl_logic;
        finish_bse      : in     vl_logic;
        fail_bse        : in     vl_logic;
        njbse_preamble  : in     vl_logic;
        sdm_run         : in     vl_logic;
        mc1_ppt_bits    : in     vl_logic_vector(7 downto 0);
        ppt_timer_en    : in     vl_logic;
        fl_ready_syn    : in     vl_logic
    );
end flash_dnld;
