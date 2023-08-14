library verilog;
use verilog.vl_types.all;
entity pfrdcctl is
    generic(
        IDLE            : integer := 0;
        DOSFT1          : integer := 1;
        DOMUL1          : integer := 2;
        DOSFT2          : integer := 3;
        DOMUL2          : integer := 4;
        DOMSK1          : integer := 5;
        DOMSK2          : integer := 6;
        DOSUB1          : integer := 7;
        DOMSK3          : integer := 8;
        DOCMP           : integer := 9;
        DOSUB2          : integer := 10;
        DOMOV           : integer := 11;
        DOMUL3          : integer := 12
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ck_en           : in     vl_logic;
        pfrdc_rdy       : out    vl_logic;
        pfrdc_go        : in     vl_logic;
        pfrdc_op        : in     vl_logic_vector(1 downto 0);
        aptr            : in     vl_logic_vector(8 downto 0);
        bptr            : in     vl_logic_vector(8 downto 0);
        cptr            : in     vl_logic_vector(8 downto 0);
        dptr            : in     vl_logic_vector(8 downto 0);
        eptr            : in     vl_logic_vector(8 downto 0);
        eccpptr         : in     vl_logic_vector(8 downto 0);
        eccuptr         : in     vl_logic_vector(8 downto 0);
        mpi_aptr        : out    vl_logic_vector(8 downto 0);
        mpi_bptr        : out    vl_logic_vector(8 downto 0);
        mpi_cptr        : out    vl_logic_vector(8 downto 0);
        mpimul_go       : out    vl_logic;
        mpimsk_go       : out    vl_logic;
        mpisft_go       : out    vl_logic;
        mpisft_op       : out    vl_logic_vector(3 downto 0);
        mpiasb_go       : out    vl_logic;
        mpiasb_op       : out    vl_logic_vector(1 downto 0);
        mpimul_rdy      : in     vl_logic;
        mpimsk_rdy      : in     vl_logic;
        mpisft_rdy      : in     vl_logic;
        mpiasb_rdy      : in     vl_logic;
        alu_co          : in     vl_logic
    );
end pfrdcctl;
