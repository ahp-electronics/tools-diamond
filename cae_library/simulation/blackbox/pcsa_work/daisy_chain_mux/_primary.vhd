library verilog;
use verilog.vl_types.all;
entity daisy_chain_mux is
    port(
        cascade_en      : in     vl_logic;
        gclksel         : in     vl_logic_vector(1 downto 0);
        ch_id           : in     vl_logic_vector(1 downto 0);
        quad_wrst_n     : in     vl_logic;
        quad_rrst_n     : in     vl_logic;
        is_slave_in     : in     vl_logic;
        wrst_in_n       : in     vl_logic;
        rrst_in_n       : in     vl_logic;
        is_slave_out    : out    vl_logic;
        wrst_out_n      : out    vl_logic;
        rrst_out_n      : out    vl_logic
    );
end daisy_chain_mux;
