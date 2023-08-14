library verilog;
use verilog.vl_types.all;
entity e3bis_video_jj is
    port(
        clk             : in     vl_logic;
        vt_en           : in     vl_logic;
        pt_sel          : in     vl_logic_vector(2 downto 0);
        start           : in     vl_logic;
        random_d        : in     vl_logic_vector(9 downto 0);
        vt_data         : out    vl_logic_vector(9 downto 0)
    );
end e3bis_video_jj;
