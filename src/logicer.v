module logicer(
    output reg [31:0] dout,
    input [31:0] A,
    input [31:0] B,
    input [3:0] ctrl
);

always @(*) begin
    case (ctrl)
        4'b1000:  // AND: S = A & B.
            dout = A & B;
        4'b1110:  // OR: S = A | B.
            dout = A | B;
        4'b0110:  // XOR: S = A ^ B.
            dout = A ^ B;
        4'b0001:  // NOR: S = ~(A | B).
            dout = ~(A | B);
        4'b1010:  // "A": S = A.
            dout = A;
        default:
            dout = 0;
    endcase
end

endmodule
