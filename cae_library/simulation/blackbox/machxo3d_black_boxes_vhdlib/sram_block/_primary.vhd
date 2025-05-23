library verilog;
use verilog.vl_types.all;
entity sram_block is
    port(
        sram_sec_prog   : out    vl_logic;
        sram_sec_read   : out    vl_logic;
        sram_done       : out    vl_logic;
        sram_ues        : out    vl_logic_vector(31 downto 0);
        sf_exec_buf     : out    vl_logic_vector(127 downto 0);
        sf_dsr_rst      : out    vl_logic;
        sf_dsr_cap      : out    vl_logic;
        sf_dsr_upd_lat  : out    vl_logic;
        sf_asr_in       : out    vl_logic;
        sf_asr_rst      : out    vl_logic;
        sf_asr_en_incr  : out    vl_logic;
        sf_asr_shift_1st: out    vl_logic;
        sf_asr_shift_2nd: out    vl_logic;
        sf_asr_shift_3rd: out    vl_logic;
        sf_ppt_addr     : out    vl_logic_vector(3 downto 0);
        sf_wl_str       : out    vl_logic;
        sf_data_wr      : out    vl_logic;
        sf_es_o         : out    vl_logic_vector(35 downto 0);
        sf_pcs_o        : out    vl_logic_vector(27 downto 0);
        sed_dsr_loop_en : out    vl_logic;
        sed_dsr_1byte   : out    vl_logic;
        busy_sram       : out    vl_logic;
        fail_sram       : out    vl_logic;
        sf_finish_bke   : out    vl_logic;
        sed_start_bse   : out    vl_logic;
        sed_boot        : out    vl_logic;
        sed_en          : out    vl_logic;
        sed_en_adv      : out    vl_logic;
        sed_active      : out    vl_logic;
        sed_err         : out    vl_logic;
        sed_clk         : out    vl_logic;
        sed_auto_done   : out    vl_logic;
        sed_done        : out    vl_logic;
        sed_busy        : out    vl_logic;
        cfg_addr_slew   : out    vl_logic;
        cfg_data_cap    : out    vl_logic;
        cfg_data_flt    : out    vl_logic;
        cfg_data_pre    : out    vl_logic;
        UCODE_DEFAULT   : in     vl_logic_vector(31 downto 0);
        CRC32_DEFAULT   : in     vl_logic_vector(31 downto 0);
        DSR_LENGTH      : in     vl_logic_vector(15 downto 0);
        ASR_LENGTH      : in     vl_logic_vector(13 downto 0);
        por             : in     vl_logic;
        smclk           : in     vl_logic;
        mx_smclk        : in     vl_logic;
        scanen          : in     vl_logic;
        sf_rst_async    : in     vl_logic;
        sf_rst_sync     : in     vl_logic;
        sed_rst_async   : in     vl_logic;
        sed_rst_sync    : in     vl_logic;
        sed_rst_flag    : in     vl_logic;
        jtag_active_smsync: in     vl_logic;
        lsc_done        : in     vl_logic;
        done_gwe        : in     vl_logic;
        lsc_done_ebr    : in     vl_logic;
        lsc_done_ip     : in     vl_logic;
        ctrl_ebr_init_en: in     vl_logic;
        dev_sed_exec    : in     vl_logic;
        sleep_mode      : in     vl_logic;
        sram_asr_out    : in     vl_logic;
        nj_frame_end    : in     vl_logic;
        mfg_crc_sel     : in     vl_logic;
        start_bke       : in     vl_logic;
        ebr_init_en     : in     vl_logic;
        isc_exec_a      : in     vl_logic;
        isc_exec_b      : in     vl_logic;
        isc_exec_c      : in     vl_logic;
        isc_exec_d      : in     vl_logic;
        isc_exec_e      : in     vl_logic;
        isc_exec_f      : in     vl_logic;
        buf128_dat      : in     vl_logic_vector(127 downto 0);
        njpcs_addr_dat  : in     vl_logic_vector(14 downto 0);
        cfg_sed_en      : in     vl_logic;
        exit_accessed   : in     vl_logic;
        sf_prog_sec_eqv : in     vl_logic;
        finish_bse      : in     vl_logic;
        fail_bse        : in     vl_logic;
        busy_bse        : in     vl_logic;
        sdm_start_bse   : in     vl_logic;
        sdm_done_sec_read: in     vl_logic;
        sed_adv_shf     : in     vl_logic;
        sed_adv_mask    : in     vl_logic_vector(7 downto 0);
        dsr_out         : in     vl_logic_vector(7 downto 0);
        cib_sed_en      : in     vl_logic;
        cib_sed_frcerr  : in     vl_logic;
        cib_sed_mode    : in     vl_logic;
        cib_sed_start   : in     vl_logic;
        cib_auto_reboot : in     vl_logic;
        mc1_sed_enable  : in     vl_logic_vector(1 downto 0);
        mc1_sed_auto_rboot: in     vl_logic;
        mc1_sed_always  : in     vl_logic;
        mc1_sed_sleep   : in     vl_logic;
        mc1_sed_once    : in     vl_logic;
        mc1_bl_float    : in     vl_logic;
        mc1_wl_slew     : in     vl_logic;
        mc1_dsr_fctrl   : in     vl_logic_vector(1 downto 0);
        es_i            : in     vl_logic_vector(8 downto 0);
        pcs_i           : in     vl_logic_vector(7 downto 0);
        pcs_stat        : in     vl_logic_vector(2 downto 0);
        sdm_init_sram_asr_exec: in     vl_logic;
        ppt_init_tsf_asr_exec: in     vl_logic;
        ppt_write_incr_exec: in     vl_logic;
        sed_init_addr_qual: in     vl_logic;
        sed_write_addr_qual: in     vl_logic;
        sed_read_incr_qual: in     vl_logic;
        sed_prog_sed_crc_qual: in     vl_logic;
        sf_prog_ucode_qual: in     vl_logic;
        sf_program_qual : in     vl_logic;
        sf_read_qual    : in     vl_logic;
        sf_erase_qual   : in     vl_logic;
        sf_prog_done_qual: in     vl_logic;
        sf_erase_done_qual: in     vl_logic;
        sf_prog_sec_qual: in     vl_logic;
        sf_address_shift_qual: in     vl_logic;
        sf_init_addr_qual: in     vl_logic;
        sf_write_addr_qual: in     vl_logic;
        sf_prog_incr_rti_qual: in     vl_logic;
        sf_prog_incr_enc_qual: in     vl_logic;
        sf_prog_incr_cmp_qual: in     vl_logic;
        sf_prog_incr_cne_qual: in     vl_logic;
        sf_vfy_incr_rti_qual: in     vl_logic;
        sf_prog_sed_crc_qual: in     vl_logic;
        sf_read_sed_crc_qual: in     vl_logic;
        sf_write_bus_addr_qual: in     vl_logic;
        sf_pcs_write_qual: in     vl_logic;
        sf_pcs_read_qual: in     vl_logic;
        sf_ebr_write_qual: in     vl_logic;
        sf_ebr_read_qual: in     vl_logic;
        cmd_altsec_sram : in     vl_logic;
        sec_read_alt_sram: in     vl_logic;
        sec_prog_alt_sram: in     vl_logic
    );
end sram_block;
