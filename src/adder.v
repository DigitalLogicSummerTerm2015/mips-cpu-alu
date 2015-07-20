module adder(
    output Z,  // Zero.
    output V,  // Overflow.
    output N,  // Negative.
    output [31:0] dout,
    input [31:0] A,
    input [31:0] B,
    input ctrl,  // 0 to add, 1 to sub.
    input Sign
);



endmodule
