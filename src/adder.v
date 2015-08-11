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

wire [32:0] num1 = {1'b0, A};
wire [32:0] num2 = ctrl ? (~{1'b0, B} + 1'b1) : {1'b0, B};
wire [32:0] sum = num1 + num2;

assign dout = sum[31:0],
       Z = (sum == 0),
                                                        // Signed:
       V = Sign & ( A[31] &  num2[31] & ~dout[31] |     // neg + neg = pos.
                   ~A[31] & ~num2[31] &  dout[31]) |    // pos + pos = neg.
           ~Sign & sum[32],  // Unsigned: out of range.
       N = Sign & (dout[31] ^ V) |  // Signed:   neg ^ overflow.
           ~Sign & ctrl & V;        // Unsigned: sub & overflow.

endmodule
