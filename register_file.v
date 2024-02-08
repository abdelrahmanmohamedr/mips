module register_file (input signed [31:0]data_in, input [4:0] rs , rt ,rd, input write_enable , clk , output reg signed [31:0] data_out_one , data_out_two);

reg [31:0] ram_block[0:31];

always @(posedge clk) begin

if(write_enable)
        begin
            ram_block[rd] = data_in;
        end
        else
        begin
            ram_block[rd] <= ram_block[rd];
        end
end 

always @(*) begin
    
        data_out_one <= ram_block[rs];

        data_out_two <= ram_block[rt];

end

initial begin
    $readmemh("register.mem" , ram_block);
end
      

endmodule

module register_file_ts ();

reg [15:0] address; 
reg clk; 
wire signed [31:0] data_out;
reg signed [31:0]data_in;
reg write_enable;

register_file register_file(data_in, address, write_enable , clk, data_out);

always begin
    address = address + 1;
    write_enable = $random;
    data_in = $random;
    #20;
end

initial begin
    address = 1'b0;
    clk = 1'b0;
end

always begin
    clk =~ clk;
    #5;
end

endmodule