module shifter(
    output [31:0] dout,
    input [31:0] A,
    input [31:0] B,
    input [1:0] ctrl
);

wire [31:0] dout_16, dout_8, dout_4, dout_2;

fix_shifter #(16) shifter_16(dout_16, B, ctrl, A[4]);
fix_shifter #(8) shifter_8(dout_8, dout_16, ctrl, A[3]);
fix_shifter #(4) shifter_4(dout_4, dout_8, ctrl, A[2]);
fix_shifter #(2) shifter_2(dout_2, dout_4, ctrl, A[1]);
fix_shifter #(1) shifter_1(dout, dout_2, ctrl, A[0]);

endmodule


module fix_shifter(
    output reg [31:0] dout,
    input [31:0] B,
    input [1:0] ctrl,
    input enable
);

parameter SHIFT_AMOUNT = 1;

always @(*) begin
    if (enable)
        case (ctrl)
            2'b00:  // SLL: S = B << A[4:0].
                dout = B << SHIFT_AMOUNT;
            2'b01:  // SRL: S = B >> A[4:0].
                dout = B >> SHIFT_AMOUNT;
            2'b11:  // SRA: S = B >> A[4:0] 算数移位.
                dout = B >>> SHIFT_AMOUNT;
            default:
                dout = B;
        endcase
    else
        dout = B;
end

endmodule
