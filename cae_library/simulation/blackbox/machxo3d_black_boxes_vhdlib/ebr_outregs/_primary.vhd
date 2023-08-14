library verilog;
use verilog.vl_types.all;
entity ebr_outregs is
    port(
        async           : in     vl_logic;
        f_doublewideb   : in     vl_logic;
        f_oregsela      : in     vl_logic;
        f_oregselb      : in     vl_logic;
        poprclka        : in     vl_logic;
        pcea            : in     vl_logic;
        prsta           : in     vl_logic;
        poprclkb        : in     vl_logic;
        pceb            : in     vl_logic;
        prstb           : in     vl_logic;
        douta           : in     vl_logic_vector(8 downto 0);
        doutb           : in     vl_logic_vector(8 downto 0);
        doa             : out    vl_logic_vector(8 downto 0);
        doa_mp          : out    vl_logic_vector(8 downto 0);
        dob             : out    vl_logic_vector(8 downto 0);
        dob_es          : out    vl_logic_vector(8 downto 0)
    );
end ebr_outregs;
