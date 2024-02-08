module write_data_reg (input [1:0]MemToReg , input signed [31:0]out ,data_mem_out ,ntocins , output reg signed [31:0]write_data);
    
always @(*) begin
case (MemToReg)
    2'b00: write_data = out;
    2'b01: write_data = data_mem_out;
    2'b10: write_data = ntocins;
    2'b11: write_data = 32'h00000000;
endcase
end

endmodule