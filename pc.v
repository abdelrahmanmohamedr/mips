module pc (input [31:0]nins , input clk ,output reg [31:0]cins);


    always @(posedge clk) begin

        cins <= nins;

    end

endmodule

module pcts ();
wire [31:0]cins;
reg [31:0]nins;
reg clk;

pc pc (nins , clk , cins);

always begin
    #20;
    clk =~ clk;
end

initial begin
    nins = 16'h0000;
    clk = 1'b1;
end


    
endmodule