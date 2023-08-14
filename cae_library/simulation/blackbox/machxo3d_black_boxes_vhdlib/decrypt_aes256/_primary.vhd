library verilog;
use verilog.vl_types.all;
entity decrypt_aes256 is
    generic(
        KEY128B         : integer := 0;
        KEY256B         : integer := 1
      --INIT_VECTOR     : integer type with unrepresentable value!
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        cr_en           : in     vl_logic;
        cr_seed         : in     vl_logic_vector(40 downto 0);
        dec_enabled     : in     vl_logic;
        ri_ctl4_b0      : in     vl_logic;
        isc_rst_sync    : in     vl_logic;
        decrypt_en      : in     vl_logic;
        decrypt_re      : in     vl_logic;
        ecbn_cbc_mode   : in     vl_logic;
        i_cipher_key_vld: in     vl_logic;
        i_cipher_key    : in     vl_logic_vector(255 downto 0);
        o_cipher_key_expand_ready: out    vl_logic;
        decrypt_rcv_en  : in     vl_logic;
        decrypt_din_byte: in     vl_logic_vector(7 downto 0);
        decrypt_rcv_full: out    vl_logic;
        decrypt_burst   : out    vl_logic;
        decrypt_out     : out    vl_logic_vector(7 downto 0)
    );
end decrypt_aes256;
