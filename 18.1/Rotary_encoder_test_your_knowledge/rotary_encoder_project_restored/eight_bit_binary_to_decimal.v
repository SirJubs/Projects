module add3(in,out);
input [3:0] in;
output [3:0] out;
reg [3:0] out;

always @ (in)
    case (in)
    4'b0000: out <= 4'b0000;  // 0 -> 0
    4'b0001: out <= 4'b0001;
    4'b0010: out <= 4'b0010;
    4'b0011: out <= 4'b0011; 
    4'b0100: out <= 4'b0100;  // 4 -> 4
    4'b0101: out <= 4'b1000;  // 5 -> 8
    4'b0110: out <= 4'b1001;  
    4'b0111: out <= 4'b1010;
    4'b1000: out <= 4'b1011;
    4'b1001: out <= 4'b1100;  // 9 -> 12
    default: out <= 4'b0000;
    endcase
endmodule

module eight_bit_binary_to_decimal (binary, decimal_ones, decimal_tens, decimal_hundreds);

input [7:0] binary;
output [3:0] decimal_ones;
output [3:0] decimal_tens;
output [3:0] decimal_hundreds;
wire [3:0] c1out, c2out, c3out, c4out, c5out, c6out, c7out;


add3 c1 (.in({1'b0,binary[7:5]}), .out(c1out[3:0]));
add3 c2 (.in({c1out[2:0],binary[4]}), .out(c2out[3:0]));
add3 c3 (.in({c2out[2:0],binary[3]}), .out(c3out[3:0]));
add3 c4 (.in({c3out[2:0],binary[2]}), .out(c4out[3:0]));
add3 c5 (.in({c4out[2:0],binary[1]}), .out(c5out[3:0]));
add3 c6 (.in({1'b0,c1out[3],c2out[3],c3out[3]}), .out(c6out[3:0]));
add3 c7 (.in({c6out[2:0],c4out[3]}), .out(c7out[3:0]));

assign decimal_ones = ({c5out[2:0],binary[0]});
assign decimal_tens = ({c7out[2:0],c5out[3]});
assign decimal_hundreds = ({3'b0,c7out[3]});

endmodule

