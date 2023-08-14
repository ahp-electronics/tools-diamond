library verilog;
use verilog.vl_types.all;
entity fifo is
    generic(
        FIFO_DATW       : integer := 8;
        FIFO_DEPTH      : integer := 32;
        FIFO_CNTW       : integer := 5
    );
    port(
        dout            : out    vl_logic_vector;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        aempty          : out    vl_logic;
        afull           : out    vl_logic;
        overf           : out    vl_logic;
        underf          : out    vl_logic;
        rst_async       : in     vl_logic;
        rst_sync        : in     vl_logic;
        wclk            : in     vl_logic;
        we              : in     vl_logic;
        rclk            : in     vl_logic;
        re              : in     vl_logic;
        din             : in     vl_logic_vector;
        aempty_val      : in     vl_logic_vector;
        afull_val       : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of FIFO_DATW : constant is 1;
    attribute mti_svvh_generic_type of FIFO_DEPTH : constant is 1;
    attribute mti_svvh_generic_type of FIFO_CNTW : constant is 1;
end fifo;
