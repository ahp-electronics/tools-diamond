library verilog;
use verilog.vl_types.all;
entity stm_rdil_check is
    port(
        rdi_state_out   : out    vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        fast_frame_mode : in     vl_logic;
        k2_byte_val     : in     vl_logic;
        data_in         : in     vl_logic_vector(2 downto 0)
    );
end stm_rdil_check;
