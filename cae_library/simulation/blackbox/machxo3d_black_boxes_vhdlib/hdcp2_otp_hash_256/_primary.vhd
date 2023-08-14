library verilog;
use verilog.vl_types.all;
entity hdcp2_otp_hash_256 is
    port(
        busy            : out    vl_logic;
        valid           : out    vl_logic;
        msg_digest      : out    vl_logic_vector(255 downto 0);
        init            : in     vl_logic;
        data_in         : in     vl_logic_vector(31 downto 0);
        wr              : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end hdcp2_otp_hash_256;
