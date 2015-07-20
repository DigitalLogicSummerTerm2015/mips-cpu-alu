module alu_tb;

wire [31:0] Z;
reg [31:0] A = 0, B = 0;
reg [5:0] ALUFun = 0;

alu alu1(.Z     (Z),
         .A     (A),
         .B     (B),
         .ALUFun(ALUFun),
         .Sign  ());  // Sign is useless here.

initial begin
    $monitor($time, " Z: %d, A: %d, B: %d, ALUFun: %b",
             Z, A, B, ALUFun);

    #5 $display("ADD: S = A + B.");
    ALUFun = 6'b000000;
    A = 10;  // 1010
    B = 3;   // 0011
    #5 $display("SUB: S = A - B.");
    ALUFun = 6'b000001;
    #5 $display("AND: S = A & B.");
    ALUFun = 6'b011000;
    #5 $display("OR: S = A | B.");
    ALUFun = 6'b011110;
    #5 $display("XOR: S = A ^ B.");
    ALUFun = 6'b010110;
    #5 $display("NOR: S = ~(A | B).");
    ALUFun = 6'b010001;
    #5 $display("\"A\": S = A.");
    ALUFun = 6'b011010;
    #5 $display("SLL: S = B << A[4:0].");
    ALUFun = 6'b100000;
    A = 3;
    B = 10;
    #5 $display("SRL: S = B >> A[4:0].");
    ALUFun = 6'b100001;
    #5 $display("SRA: S = B >> A[4:0] 算数移位.");
    ALUFun = 6'b100011;
    #5
    B = -1;
    A = 3;
    #5 $display("EQ: if (A == B) S = 1 else S = 0.");
    ALUFun = 6'b110011;
    A = 1;
    B = 1;
    #5
    A = 1;
    B = 0;
    #5
    A = 0;
    B = 1;
    #5 $display("NEQ: if (A != B) S = 1 else S = 0.");
    ALUFun = 6'b110001;
    A = 1;
    B = 1;
    #5
    A = 1;
    B = 0;
    #5
    A = 0;
    B = 1;
    #5 $display("LT: if (A < B) S = 1 else S = 0.");
    ALUFun = 6'b110101;
    A = 1;
    B = 1;
    #5
    A = 1;
    B = 0;
    #5
    A = 0;
    B = 1;
    #5 $display("LEZ: if (A <= 0) S = 1 else S = 0.");
    ALUFun = 6'b111101;
    B = 0;
    A = -1;
    #5
    A = 1;
    #5
    A = 0;
    #5 $display("GEZ: if (A >= 0) S = 1 else S = 0.");
    ALUFun = 6'b111001;
    A = -1;
    #5
    A = 1;
    #5
    A = 0;
    #5 $display("GTZ: if (A > 0) S = 1 else S = 0.");
    ALUFun = 6'b111111;
    A = -1;
    #5
    A = 1;
    #5
    A = 0;
end

endmodule
