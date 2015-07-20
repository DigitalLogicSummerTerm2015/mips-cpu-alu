module alu(
    output reg [31:0] Z,
    input [31:0] A,
    input [31:0] B,
    input [5:0] ALUFun,
    input Sign
);

wire zero, overflow, negative;
wire [31:0] adder_out, comparer_out, logicer_out, shifter_out;

adder adder1(.Z   (zero),
             .V   (overflow),
             .N   (negative),
             .dout(adder_out),
             .A   (A),
             .B   (B),
             .ctrl(ALUFun[0]),
             .Sign(Sign));

comparer comparer1(.dout(comparer_out),
                   .Z   (zero),
                   .V   (overflow),
                   .N   (negative),
                   .ctrl(ALUFun[3:1]));

logicer logicer1(.dout(logicer_out),
                 .A   (A),
                 .B   (B),
                 .ctrl(ALUFun[3:0]));

shifter shifter1(.dout(shifter_out),
                 .A   (A),
                 .B   (B),
                 .ctrl(ALUFun[1:0]));

always @(*) begin
    case (ALUFun[5:4])
        2'b00: Z = adder_out;
        2'b11: Z = comparer_out;
        2'b01: Z = logicer_out;
        2'b10: Z = shifter_out;
        default: Z = 0;
    endcase
end

endmodule
