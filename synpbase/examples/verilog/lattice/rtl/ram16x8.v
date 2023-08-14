module RPE16X2 (DO0, DO1, DI0, DI1, WREN, WPE, AD0, AD1, AD2, AD3) /* synthesis black_box */;
output DO0, DO1;
input DI0, DI1, WREN , WPE, AD0, AD1, AD2, AD3;
endmodule

module ram_16x8 (o, wpe, wren, d, a);
output [7:0] o;
input [7:0] d;
input [3:0] a;
input wpe, wren;

RPE16X2 U0 (o[0], o[1], d[0], d[1], wpe, wren, a[3], a[2], a[1], a[0]) /* synthesis INITVAL="00001111000011110000111100001111" */;
RPE16X2 U1 (o[2], o[3], d[2], d[3], wpe, wren, a[3], a[2], a[1], a[0]) /* synthesis INITVAL="10101010101010101010101010101010" */;
RPE16X2 U2 (o[4], o[5], d[4], d[5], wpe, wren, a[3], a[2], a[1], a[0]) /* synthesis INITVAL="11111111111111111111111111111111" */;
RPE16X2 U3 (o[6], o[7], d[6], d[7], wpe, wren, a[3], a[2], a[1], a[0]) /* synthesis INITVAL="00000000000000001111111111111111" */;

endmodule
