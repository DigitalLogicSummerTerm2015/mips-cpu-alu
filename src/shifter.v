module shifter(
    output reg [31:0] dout,
    input [31:0] A,
    input [31:0] B,
    input [1:0] ctrl
);



endmodule


module fix_shifter(
    output reg [31:0] dout,
    input [31:0] B,
    input [1:0] ctrl,
    input enable
);

parameter SHIFT_AMOUNT = 1;

always @(*)
    if (enable)
        case (ctrl)
            2'b00:  // SLL: S = B << A[4:0].
                dout = B << SHIFT_AMOUNT;
            2'b01:  // SRL: S = B >> A[4:0].
                dout = B >> SHIFT_AMOUNT;
            default:  // SRA: S = B >> A[4:0] 算数移位.
                dout = B >>> SHIFT_AMOUNT;
        endcase
    else
        dout = B;
end

endmodule
