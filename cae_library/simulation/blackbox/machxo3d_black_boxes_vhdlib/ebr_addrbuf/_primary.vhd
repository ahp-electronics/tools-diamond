library verilog;
use verilog.vl_types.all;
entity ebr_addrbuf is
    port(
        f_addra_p       : in     vl_logic_vector(1 downto 0);
        addra           : in     vl_logic_vector(12 downto 0);
        f_addra         : in     vl_logic_vector(1 downto 0);
        f_addrb_p_0     : in     vl_logic;
        addrb           : in     vl_logic_vector(12 downto 0);
        f_addrb_0       : in     vl_logic;
        dataa           : in     vl_logic_vector(8 downto 0);
        datab           : in     vl_logic_vector(8 downto 0);
        addra_buf       : out    vl_logic_vector(12 downto 0);
        addrb_buf       : out    vl_logic_vector(12 downto 0);
        dataa_buf       : out    vl_logic_vector(8 downto 0);
        datab_buf       : out    vl_logic_vector(8 downto 0)
    );
end ebr_addrbuf;
