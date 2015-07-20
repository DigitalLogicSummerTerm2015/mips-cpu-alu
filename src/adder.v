module adder(
    output Z,  // Zero.
    output V,  // Overflow.
    output N,  // Negative.
    output [31:0] dout,
    input [31:0] A,
    input [31:0] B,
    input ctrl,  // 0 to add, 1 to sub.
    input Sign   // Useless here, because we don't have overflow exception.
);

wire [31:0] num2 = ctrl ? (~B + 1'b1) : B;

assign dout = A + num2,
       Z = (dout == 0),
       V = ( A[31] &  num2[31] & ~dout[31] |  // neg + neg = pos.
            ~A[31] & ~num2[31] &  dout[31]),  // pos + pos = neg.
       N = dout[31] ^ V;

endmodule
