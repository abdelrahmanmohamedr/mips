module data_mem (input signed [31:0]data_in, input [31:0] address, input write_enable , clk , input read_enable, output reg signed [31:0] data_out);

reg [7:0] ram_block[0:1023];

always @(posedge clk) begin

if(write_enable)
        begin
            {ram_block[address] , ram_block[address+1] , ram_block[address+2] , ram_block[address+3]} = data_in;
        end
        else
        begin
            ram_block[address] <= ram_block[address];
        end
end 

always @(*) begin
    if(read_enable)
        begin
            data_out <=  {ram_block[address] , ram_block[address+1] , ram_block[address+2] , ram_block[address+3]};
        end
        else
        begin
            data_out <= 32'h00000000;
end
end


endmodule

module data_mem_ts ();

reg [15:0] address; 
wire signed [31:0] data_out;
reg signed [31:0]data_in;
reg write_enable;
reg read_enable;

data_mem data_mem(data_in, address, write_enable , read_enable , data_out);

always begin
    address = address + 4;
    write_enable = $random;
    read_enable = $random;
    data_in = $random;
    #20;
end

initial begin
    address = 1'd0;
end

endmodule