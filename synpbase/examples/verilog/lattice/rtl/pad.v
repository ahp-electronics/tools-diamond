// This example shows one how to force the
//  use of a particular pad type for lucent.

module adder(cout, sum, a, b, cin);
parameter size = 1;  /* declare a parameter. default required */
output cout ;
output [size-1:0] sum; 	 // sum uses the size parameter
input cin /* synthesis orca_padtype="IBT"*/;
input [size-1:0] a, b;  // 'a' and 'b' use the size parameter

assign {cout, sum} = a + b + cin;

endmodule









