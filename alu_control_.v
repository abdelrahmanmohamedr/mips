module alu_control_ (input [2:0]AluOp , input [5:0]func , output reg [3:0]alu_control);

always @(*) begin
    case (AluOp)
        
        3'b000:alu_control = 4'b0010;                                 //add                                   

        3'b001:alu_control = 4'b0110;                                 //subtract 

        3'b010:                                                       //R-instructions
        case (func)

            6'b100000:alu_control = 4'b0010;                                 //add
            
            6'b100100:alu_control = 4'b0000;                                 //and

            6'b100111:alu_control = 4'b1100;                                 //nor

            6'b100101:alu_control = 4'b0001;                                 //or

            6'b101010:alu_control = 4'b0111;                                 //slt

            6'b100010:alu_control = 4'b0110;                                 //subtract

            6'b100110:alu_control = 4'b0100;                                 //xor

            6'b000000:alu_control = 4'b1101;                                 //sll

            6'b000011:alu_control = 4'b1110;                                 //sra

            6'b000010:alu_control = 4'b0101;                                 //srl

            6'b011010:alu_control = 4'b1010;                                 //div

            6'b011000:alu_control = 4'b1001;                                 //mult

            6'b001000:alu_control = 4'b0000;                                 //jr

            6'b001001:alu_control = 4'b0000;                                 //jalr

            default:alu_control = 4'b0000;                                   //else
        endcase 

        3'b011:alu_control = 4'b0000;                                 //and

        3'b100:alu_control = 4'b0001;                                 //or

        3'b101:alu_control = 4'b0100;                                 //xor 

        3'b110:alu_control = 4'b1111;                                 //lui 
        
        3'b111:alu_control = 4'b0111;                                 //slt 
        
        default:alu_control = 4'b0000;                                //else

    endcase
end
    
endmodule