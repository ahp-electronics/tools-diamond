library verilog;
use verilog.vl_types.all;
entity pcs_quad_buffers is
    port(
        addro           : out    vl_logic_vector(7 downto 0);
        wdatao          : out    vl_logic_vector(7 downto 0);
        rdo             : out    vl_logic;
        wstbo           : out    vl_logic;
        rdatai          : in     vl_logic_vector(7 downto 0);
        inti            : in     vl_logic;
        rdatao_l        : in     vl_logic_vector(7 downto 0);
        into_l          : in     vl_logic;
        rdatao          : out    vl_logic_vector(7 downto 0);
        rdatao_char     : out    vl_logic_vector(7 downto 0);
        into            : out    vl_logic;
        addri           : in     vl_logic_vector(7 downto 0);
        wdatai          : in     vl_logic_vector(7 downto 0);
        rdi             : in     vl_logic;
        wstbi           : in     vl_logic;
        addrb           : out    vl_logic_vector(7 downto 0);
        wdatab          : out    vl_logic_vector(7 downto 0);
        rdb             : out    vl_logic;
        wstbb           : out    vl_logic;
        cs_chif_0       : in     vl_logic;
        cs_chif_1       : in     vl_logic;
        cs_chif_2       : in     vl_logic;
        cs_chif_3       : in     vl_logic;
        cs_qif          : in     vl_logic
    );
end pcs_quad_buffers;
