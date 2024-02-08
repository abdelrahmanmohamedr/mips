module instruction_mem ( input [31:0] address , output reg [31:0] data_out);

reg [7:0] ram_block[0:1023];

always @(*) begin
        data_out <= {ram_block[address] , ram_block[address+1] , ram_block[address+2] , ram_block[address+3]};
end



endmodule

module instruction_mem_ts ();

reg [31:0] address; 
wire [31:0] data_out;

instruction_mem instruction_mem(address, data_out);

always begin
    address = address + 4;
    #20;
end

initial begin
    address = 1'd0;
end


endmodule