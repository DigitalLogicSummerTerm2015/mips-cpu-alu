module comparer(
    output reg [31:0] dout,
    input Z,  // Zero.
    input V,  // Overflow, useless here...
    input N,  // Negative.
    input [3:1] ctrl
);

always @(*) begin
    dout[31:1] = 31'b0;  // dout can be only 0 or 1.
    case (ctrl)
        3'b001:  // EQ: if (A == B) S = 1 else S = 0.
            dout[0] = Z;
        3'b000:  // NEQ: if (A != B) S = 1 else S = 0.
            dout[0] = ~Z;
        3'b010:  // LT: if (A < B) S = 1 else S = 0.
            dout[0] = N;
        3'b110:  // LEZ: if (A <= 0) S = 1 else S = 0.
            dout[0] = N | Z;
        3'b100:  // GEZ: if (A >= 0) S = 1 else S = 0.
            dout[0] = ~N;
        3'b111:  // GTZ: if (A > 0) S = 1 else S = 0.
            dout[0] = ~(N | Z);
        default:  // What the hell?
            dout[0] = 1'b0;
    endcase
end

endmodule
