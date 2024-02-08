module sign_zero_extinsion(input signed [15:0] immediate , input [5:0] op , output reg signed [31:0] immediate_);
    
always @(*) begin

    case (op)
    
    6'b001100: immediate_ = {16'h0000 , immediate};
    
    6'b001101: immediate_ = {16'h0000 , immediate};
   
    6'b001110:immediate_ = {16'h0000 , immediate};

    default: immediate_ = {{16{immediate[15]}} , immediate};
endcase
    
end





endmodule