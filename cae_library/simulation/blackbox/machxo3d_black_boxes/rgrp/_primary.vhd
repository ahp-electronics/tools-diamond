library verilog;
use verilog.vl_types.all;
entity rgrp is
    generic(
        use_3port_mem   : integer := 1
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mul_b_adr       : in     vl_logic_vector(8 downto 0);
        mul_s_adr       : in     vl_logic_vector(8 downto 0);
        alu_a_adr       : in     vl_logic_vector(8 downto 0);
        alu_b_adr       : in     vl_logic_vector(8 downto 0);
        alu_s_adr       : in     vl_logic_vector(8 downto 0);
        glb_w_adr       : in     vl_logic_vector(8 downto 0);
        glb_w_data      : in     vl_logic_vector(31 downto 0);
        glb_r_adr2      : in     vl_logic_vector(8 downto 0);
        mul_c_din       : out    vl_logic_vector(31 downto 0);
        alu_a_din       : out    vl_logic_vector(31 downto 0);
        mul_b_din       : out    vl_logic_vector(31 downto 0);
        glb_r_data2     : out    vl_logic_vector(31 downto 0);
        alu_b_din       : out    vl_logic_vector(31 downto 0);
        mul_s_dout      : in     vl_logic_vector(31 downto 0);
        alu_s_dout      : in     vl_logic_vector(31 downto 0);
        mul_s_wr        : in     vl_logic;
        alu_s_wr        : in     vl_logic;
        glb_w_wr        : in     vl_logic
    );
end rgrp;
