module mips (input clk);

wire [31:0] branch_offset;
reg [31:0] branch_mult;
wire [31:0] jump_address;
wire [31:0]address;
reg [31:0]nins;
wire [31:0]ntocins;
wire [31:0]instruction;
wire signed [31:0]write_data;
wire signed [31:0]data_out_one;
wire signed [31:0]data_out_two;
reg signed [31:0]second;
wire signed [31:0]immediate_;
wire signed [31:0]out;
wire signed [31:0]data_mem_out;

wire signed [15:0]immediate;

wire [5:0]func;
wire [5:0]op;

wire [4:0]read_one;
wire [4:0]read_two;
reg [4:0]write_one;
wire [4:0]shamt;

wire [3:0]alu_control;

wire [2:0]AluOp;
wire [2:0]Branch;

wire [1:0]RegDst;
wire [1:0]MemToReg;

wire PCsrc;
wire zero;
wire overflow;
wire negative;
wire cout;
wire Memeread;
wire MemWrite;
wire RegWrite;
wire AluSrc;
wire Jump;


pc pc (nins , clk , address);

instruction_mem instruction_mem ( address , instruction);

register_file register_file (write_data, read_one , read_two ,write_one, RegWrite , clk , data_out_one , data_out_two);

alu alu (data_out_one , second , shamt , alu_control , out ,zero , overflow , negative , cout);

alu_control_ alu_control_ (AluOp , func ,alu_control);

data_mem data_mem (data_out_two, out,  MemWrite , clk , Memeread, data_mem_out);

control_unit control_unit (op , Jump, Memeread, MemWrite, AluSrc, RegWrite ,RegDst, MemToReg ,AluOp ,Branch);

write_data_reg write_data_reg (MemToReg , out ,data_mem_out ,ntocins , write_data);

pcsc_value pcsc_value ( zero , overflow , negative ,Branch ,PCsrc);

sign_zero_extinsion sign_zero_extinsion ( immediate , op , immediate_);

assign ntocins = address + 4;

assign op = instruction[31:26];

assign read_one = instruction[25:21];

assign read_two = instruction[20:16];

always @(*) begin
case (RegDst)
    2'b01: write_one = instruction[15:11];
    2'b10: write_one = 5'd31;
    default: write_one = instruction[20:16];
endcase
end

assign shamt = instruction[10:6];

assign func = instruction[5:0];

assign immediate = instruction[15:0];

always @(*) begin
case (AluSrc)
    1'b0: second = data_out_two;
    1'b1: second = immediate_;
    default: second = 32'h00000000;
endcase
end

assign branch_offset = ntocins + (immediate_ * 4);
    
always @(*) begin
if (PCsrc) begin
    branch_mult = branch_offset;
end else begin
    branch_mult = ntocins;
end
end

assign jump_address = {ntocins[31:28] , (instruction[25:0] * 4)};

always @(*) begin
if (Jump) begin
    nins = jump_address;
end else begin
    nins = branch_mult;
end
end

initial begin
    nins = 32'h00000000;
end


    
endmodule

module mips_tb ();

reg clk;

mips mips(clk);

always begin
    clk =~ clk;
    #20;
end
    
initial begin
    clk = 1'b1;
end

endmodule