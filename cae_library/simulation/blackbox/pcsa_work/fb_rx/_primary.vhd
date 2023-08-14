library verilog;
use verilog.vl_types.all;
entity fb_rx is
    port(
        wclk            : in     vl_logic;
        rclk            : in     vl_logic;
        wrst_n          : in     vl_logic;
        rrst_i          : in     vl_logic;
        slave           : in     vl_logic;
        data_i          : in     vl_logic_vector(11 downto 0);
        mode            : in     vl_logic;
        scan_mode       : in     vl_logic;
        data_o          : out    vl_logic_vector(23 downto 0);
        error           : out    vl_logic;
        rrst_o          : out    vl_logic;
        sonet_fbrx_mode : in     vl_logic;
        sonet_fbrx_wrst_n: in     vl_logic;
        sonet_fbrx_rrst_n: in     vl_logic
    );
end fb_rx;
