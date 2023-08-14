library verilog;
use verilog.vl_types.all;
entity arbiter is
    port(
        HCLK            : in     vl_logic;
        HRESET_N        : in     vl_logic;
        HREADY          : in     vl_logic;
        HRESP           : in     vl_logic_vector(1 downto 0);
        HBUSREQ_CFG     : in     vl_logic;
        HBUSREQ_MPI     : in     vl_logic;
        HBUSREQ_FPGA    : in     vl_logic;
        HBUSREQ_FPSC    : in     vl_logic;
        HLOCK_CFG       : in     vl_logic;
        HLOCK_MPI       : in     vl_logic;
        HLOCK_FPGA      : in     vl_logic;
        HLOCK_FPSC      : in     vl_logic;
        LOCK_MPI        : in     vl_logic;
        LOCK_USER       : in     vl_logic;
        LOCK_FPSC       : in     vl_logic;
        PRIORITY_MPI    : in     vl_logic_vector(1 downto 0);
        PRIORITY_FPGA   : in     vl_logic_vector(1 downto 0);
        PRIORITY_FPSC   : in     vl_logic_vector(1 downto 0);
        Timeout_Index   : in     vl_logic_vector(3 downto 0);
        HGRANT_CFG      : out    vl_logic;
        HGRANT_MPI      : out    vl_logic;
        HGRANT_FPGA     : out    vl_logic;
        HGRANT_FPSC     : out    vl_logic;
        HMASTER         : out    vl_logic_vector(3 downto 0);
        HMASTLOCK       : out    vl_logic
    );
end arbiter;
