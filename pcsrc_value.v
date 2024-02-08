module pcsrc_value (input zero , overflow , negative ,input [2:0] Branch , output reg PCsrc);
    
always @(*) begin
    if (Branch == 3'b001 && zero == 1'b1 && overflow == 1'b0) begin
        PCsrc = 1'b1;
    end else begin
    if (Branch == 3'b010 && zero == 1'b0) begin
        PCsrc = 1'b1;
        end else begin
    if (Branch == 3'b011 && (zero == 1'b1 || negative == 1'b0)) begin
        PCsrc = 1'b1;
    end else begin
    if (Branch == 3'b011 && negative == 1'b1) begin
        PCsrc = 1'b1;
    end else begin
    if (Branch == 3'b100 && (zero == 1'b1 || negative == 1'b1)) begin
        PCsrc = 1'b1;
    end else begin
    if (Branch == 3'b101 && negative == 1'b0) begin
        PCsrc = 1'b1;
    end else begin
        PCsrc = 1'b0;
    end
    end
    end
    end     
        end
    end
end

endmodule
