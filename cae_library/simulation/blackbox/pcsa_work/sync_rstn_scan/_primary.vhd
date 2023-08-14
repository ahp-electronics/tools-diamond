library verilog;
use verilog.vl_types.all;
entity sync_rstn_scan is
    generic(
        DLY_CYC         : integer := 3
    );
    port(
        clock           : in     vl_logic;
        rstn_in         : in     vl_logic;
        scan_mode       : in     vl_logic;
        rstn_out        : out    vl_logic
    );
end sync_rstn_scan;
