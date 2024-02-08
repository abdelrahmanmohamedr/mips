module alu (input signed [31:0] first , second , input [4:0]shamt , input [3:0]alu_control , output reg signed [31:0] out , output reg zero , overflow , negative , cout);

always @(*) begin
    case(alu_control)
        4'b0010: {cout, out} <= first + second;          // add

        4'b0110: {cout, out} <= first - second;          // subtract

        4'b0000: {cout, out} <= first & second;          // and

        4'b0001: {cout, out} <= first | second;          // or

        4'b0111: begin                                   // slt
                    if (negative)
                        out = 32'h00000001;
                        else 
                        out = 32'h00000000;
                 end

        4'b1100: {cout, out} <= first |~ second;        // nor

        4'b1111: out = {second[15:0], 16'h0000};        // lui

        4'b0100: {cout, out} <= first ^ second;         // xor

        4'b1101: out = second << shamt;                 // sll

        4'b1110: out = second >>> shamt;                // sra

        4'b0101: out = second >> shamt;                 // srl

        4'b1001: out = first * second;                 // mul

        4'b1010: out = first / second;                 // div

        default:begin
            out <=32'h00000000;   // else
            cout <= 1'b0;
        end
    endcase
end


always @(*) begin
    if (out == 1'b0) begin
        zero = 1'b1;
    end else begin
        zero = 1'b0;
    end
end

always @(*) begin
    if (cout ^ out[31] == 1) begin
        overflow = 1'b1;
    end else begin
        overflow = 1'b0;
    end
end

always @(*) begin
    if (first - second < 0 && overflow == 1'b0) begin
        negative = 1'b1;
    end else begin
        negative = 1'b0;
    end
end
    
endmodule

module alu_ts ();

reg signed [31:0]first , second ;
reg [4:0]shamt ;
reg [3:0]alu_control ;
wire signed [31:0] out ;
wire zero;
wire overflow;
wire negative;
wire cout;

alu alu (first , second , shamt , alu_control , out , zero , overflow , negative , cout);

always begin
    first = $random;
    second = $random;
    shamt = $random;
    alu_control = $random;
    #20;
end

initial begin
    $monitor("first=%d first=%b second=%d second=%b alu_control=%d out=%d out=%b zero=%d overflow=%d cout=%d ",first,first,second,second,alu_control,out,out,zero,overflow,cout);
end


    
endmodule