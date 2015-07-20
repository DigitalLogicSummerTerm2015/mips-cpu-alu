module alu(
    output reg [31:0] Z,
    input [31:0] A,
    input [31:0] B,
    input [5:0] ALUFun,
    input Sign
);

always @(*) begin
    case (ALUFun)
        6'b000000: begin  // ADD: S = A + B.
        end

        6'b000001: begin  // SUB: S = A - B.
        end

        6'b011000: begin  // AND: S = A & B.
        end

        6'b011110: begin  // OR: S = A | B.
        end

        6'b010110: begin  // XOR: S = A ^ B.
        end

        6'b010001: begin  // NOR: S = ~(A | B).
        end

        6'b011010: begin  // "A": S = A.
        end

        6'b100000: begin  // SLL: S = B << A[4:0].
        end

        6'b100001: begin  // SRL: S = B >> A[4:0].
        end

        6'b100011: begin  // SRA: S = B >> A[4:0] 算数移位.
        end

        6'b110011: begin  // EQ: if (A == B) S = 1 else S = 0.
        end

        6'b110001: begin  // NEQ: if (A != B) S = 1 else S = 0.
        end

        6'b110101: begin  // LT: if (A < B) S = 1 else S = 0.
        end

        6'b111101: begin  // LEZ: if (A <= 0) S = 1 else S = 0.
        end

        6'b111001: begin  // GEZ: if (A >= 0) S = 1 else S = 0.
        end

        6'b111111: begin  // GTZ: if (A > 0) S = 1 else S = 0.
        end

        default:
    endcase
end

endmodule
