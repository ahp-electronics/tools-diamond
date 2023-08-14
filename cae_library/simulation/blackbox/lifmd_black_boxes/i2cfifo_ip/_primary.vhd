library verilog;
use verilog.vl_types.all;
entity i2cfifo_ip is
    port(
        sda_out         : out    vl_logic;
        sda_oe          : out    vl_logic;
        scl_out         : out    vl_logic;
        scl_oe          : out    vl_logic;
        dat_o           : out    vl_logic_vector(9 downto 0);
        ack_o           : out    vl_logic;
        i2c_wkup        : out    vl_logic;
        irq             : out    vl_logic;
        mrdcmpl         : out    vl_logic;
        srdwr           : out    vl_logic;
        txfifo_e        : out    vl_logic;
        txfifo_ae       : out    vl_logic;
        txfifo_f        : out    vl_logic;
        rxfifo_e        : out    vl_logic;
        rxfifo_af       : out    vl_logic;
        rxfifo_f        : out    vl_logic;
        ADDR_LSB_USR    : in     vl_logic_vector(1 downto 0);
        del_clk         : in     vl_logic;
        i2c_rst_async   : in     vl_logic;
        scan_test_mode  : in     vl_logic;
        sda_in          : in     vl_logic;
        scl_in          : in     vl_logic;
        clk_i           : in     vl_logic;
        we_i            : in     vl_logic;
        stb_i           : in     vl_logic;
        cs_i            : in     vl_logic;
        adr_i           : in     vl_logic_vector(3 downto 0);
        dat_i           : in     vl_logic_vector(9 downto 0);
        fifo_rst        : in     vl_logic
    );
end i2cfifo_ip;
