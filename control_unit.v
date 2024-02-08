module control_unit (input [5:0]op , output reg Jump, Memeread, MemWrite, AluSrc, RegWrite , output reg [1:0]RegDst, MemToReg ,output reg[2:0]AluOp ,Branch);

always @(*) begin

   case (op) 

    6'b000000:begin 
               RegDst = 2'b01;        //R-instructions
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 1;
               AluOp = 3'b010;
end

    6'b000001:begin RegDst = 2'b10;        //BGEZ         
               Jump = 0;
               Branch = 3'b011;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 0;
               AluOp = 3'b001; 
end

    6'b010010:begin RegDst = 2'b10;        //BLTZ          
               Jump = 0;
               Branch = 3'b111;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 0;
               AluOp = 3'b001; 
end

    6'b010001:begin RegDst = 2'b10;        //BGEZAL            
               Jump = 0;
               Branch = 3'b011;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 1;
               AluOp = 3'b001; 
end

    6'b010011:begin RegDst = 2'b10;        //BLTZAL            
               Jump = 0;
               Branch = 3'b111;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 1;
               AluOp = 3'b001; 
end

    6'b000010:begin RegDst = 2'b00;        //J
               Jump = 1;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 0;
               AluOp = 3'b000; 
end

    6'b000011:begin RegDst = 2'b10;        //JAL
               Jump = 1;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b10;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 1;
               AluOp = 3'b000; 
end

    6'b000100:begin RegDst = 2'b00;        //BEQ
               Jump = 0;
               Branch = 3'b001;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 0;
               AluOp = 3'b001; 
end

    6'b000101:begin RegDst = 2'b00;        //BNE
               Jump = 0;
               Branch = 3'b010;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 0;
               AluOp = 3'b000; 
end

    6'b000110:begin RegDst = 2'b00;        //BLEZ
               Jump = 0;
               Branch = 3'b100;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 0;
               AluOp = 3'b001; 
end

    6'b000111:begin RegDst = 2'b00;        //BGTZ
               Jump = 0;
               Branch = 3'b101;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 1;
               AluOp = 3'b001; 
end

    6'b001000:begin RegDst = 2'b00;        //addi
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 1;
               RegWrite = 1;
               AluOp = 3'b000; 
end

    6'b001010:begin RegDst = 2'b00;        //slti
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 1;
               RegWrite = 1;
               AluOp = 3'b111; 
end

    6'b001100:begin RegDst = 2'b00;        //andi
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 1;
               RegWrite = 1;
               AluOp = 3'b011; 
end

    6'b001101:begin RegDst = 2'b00;        //ori
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 1;
               RegWrite = 1;
               AluOp = 3'b100; 
end

    6'b001110:begin RegDst = 2'b00;        //xori
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 1;
               RegWrite = 1;
               AluOp = 3'b101; 
end

    6'b001111:begin RegDst = 2'b00;        //lui
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 1;
               RegWrite = 1;
               AluOp = 3'b110; 
end

    6'b100000:begin RegDst = 2'b00;        //lb
               Jump = 0;
               Branch = 3'b000;
               Memeread = 1;
               MemToReg = 2'b01;
               MemWrite = 0;
               AluSrc = 1;
               RegWrite = 1;
               AluOp = 3'b000; 
end

    6'b100001:begin RegDst = 2'b00;        //lh
               Jump = 0;
               Branch = 3'b000;
               Memeread = 1;
               MemToReg = 2'b01;
               MemWrite = 0;
               AluSrc = 1;
               RegWrite = 1;
               AluOp = 3'b000;
end

    6'b100011:begin RegDst = 2'b00;        //lw
               Jump = 0;
               Branch = 3'b000;
               Memeread = 1;
               MemToReg = 2'b01;
               MemWrite = 0;
               AluSrc = 1;
               RegWrite = 1;
               AluOp = 3'b000;
end

    6'b101000:begin RegDst = 2'b00;        //sb
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b01;
               MemWrite = 1;
               AluSrc = 1;
               RegWrite = 0;
               AluOp = 3'b000;
end

    6'b101001:begin RegDst = 2'b00;        //sh
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b01;
               MemWrite = 1;
               AluSrc = 1;
               RegWrite = 0;
               AluOp = 3'b000;
end

    6'b101011:begin RegDst = 2'b00;        //sw
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b01;
               MemWrite = 1;
               AluSrc = 1;
               RegWrite = 0;
               AluOp = 3'b000;
end

    default:begin   RegDst = 2'b00;        
               Jump = 0;
               Branch = 3'b000;
               Memeread = 0;
               MemToReg = 2'b00;
               MemWrite = 0;
               AluSrc = 0;
               RegWrite = 0;
               AluOp = 3'b000;
end
endcase
end

endmodule

module contro_unit_tb();

reg [5:0]op ;
wire Jump, Memeread, MemWrite, AluSrc, RegWrite ;
wire[1:0]RegDst,MemToReg ;
wire[2:0]Branch,AluOp;

control_unit control_unit (op ,Jump, Memeread, MemWrite, AluSrc,RegWrite ,RegDst ,MemToReg ,AluOp ,Branch);

always begin
    op = op + 1;
    #20;
end

initial begin
    op = 6'b000000;
end

endmodule