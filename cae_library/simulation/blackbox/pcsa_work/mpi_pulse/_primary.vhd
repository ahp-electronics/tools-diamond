library verilog;
use verilog.vl_types.all;
entity mpi_pulse is
    port(
        enable          : in     vl_logic;
        clk             : in     vl_logic;
        pulse           : out    vl_logic
    );
end mpi_pulse;
