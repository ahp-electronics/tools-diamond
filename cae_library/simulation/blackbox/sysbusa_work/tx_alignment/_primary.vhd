library verilog;
use verilog.vl_types.all;
entity tx_alignment is
    port(
        tx_align        : in     vl_logic;
        iqa_tx_align_l  : out    vl_logic;
        iqa_tx_align_r  : out    vl_logic
    );
end tx_alignment;
