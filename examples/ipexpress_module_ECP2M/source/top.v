`timescale 1 ns / 100 ps
module top ( DataA, DataB, Result);

input   [7:0]  DataA;
input   [7:0]  DataB;
output  [7:0]  Result;

add8 u0 (.DataA(DataA), .DataB(DataB), .Result(Result));

endmodule
