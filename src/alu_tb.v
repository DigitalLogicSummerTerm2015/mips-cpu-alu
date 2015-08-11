module alu_tb;

wire signed [31:0] Z;
reg signed [31:0] A = 0, B = 0;
wire [31:0] uA = A, uB = B;  // Unsigned A, B.
reg [5:0] ALUFun = 0;
reg sign = 1;

alu alu1(.Z     (Z),
         .A     (A),
         .B     (B),
         .ALUFun(ALUFun),
         .Sign  (sign));

initial begin
    #5 $display("ADD: S = A + B.");
    ALUFun = 6'b000000;
    A = 10;  // 1010
    B = 3;   // 0011
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("SUB: S = A - B.");
    ALUFun = 6'b000001;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("AND: S = A & B.");
    ALUFun = 6'b011000;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("OR: S = A | B.");
    ALUFun = 6'b011110;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("XOR: S = A ^ B.");
    ALUFun = 6'b010110;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("NOR: S = ~(A | B).");
    ALUFun = 6'b010001;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("\"A\": S = A.");
    ALUFun = 6'b011010;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("SLL: S = B << A[4:0].");
    ALUFun = 6'b100000;
    A = 3;
    B = 10;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("SRL: S = B >> A[4:0].");
    ALUFun = 6'b100001;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    B = -1;
    A = 3;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("SRA: S = B >> A[4:0] 算数移位.");
    ALUFun = 6'b100011;
    A = 3;
    B = 10;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    B = -1;
    A = 3;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("EQ: if (A == B) S = 1 else S = 0.");
    ALUFun = 6'b110011;
    A = 1;
    B = 1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 1;
    B = 0;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 0;
    B = 1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("NEQ: if (A != B) S = 1 else S = 0.");
    ALUFun = 6'b110001;
    A = 1;
    B = 1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 1;
    B = 0;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 0;
    B = 1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("LT: if (A < B) S = 1 else S = 0.");
    ALUFun = 6'b110101;
    A = 1;
    B = 1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 1;
    B = 0;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 0;
    B = 1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("Unsigned LT: if (A < B) S = 1 else S = 0.");
    sign = 0;
    ALUFun = 6'b110101;
    A = 1;
    B = -1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, uA, uB, ALUFun);

    A = 1;
    B = 0;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, uA, uB, ALUFun);

    A = 1;
    B = (1'b1 << 31) + (1'b1 << 30);
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, uA, uB, ALUFun);
    sign = 1;

    $display("LEZ: if (A <= 0) S = 1 else S = 0.");
    ALUFun = 6'b111101;
    B = 0;
    A = -1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 0;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("GEZ: if (A >= 0) S = 1 else S = 0.");
    ALUFun = 6'b111001;
    A = -1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 0;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    $display("GTZ: if (A > 0) S = 1 else S = 0.");
    ALUFun = 6'b111111;
    A = -1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 1;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);

    A = 0;
    #5 $display("    Z: %d, A: %d, B: %d, ALUFun: %b", Z, A, B, ALUFun);
end

endmodule
