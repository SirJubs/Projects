module seven_segment(led_bcd, led_out);

input [3:0] led_bcd;
output reg [6:0] led_out;


always @ (led_bcd) begin
  case(led_bcd) //Seven segment decoder
        4'b0000: led_out <= 7'b1000000; // "0"     
        4'b0001: led_out <= 7'b1111001; // "1" 
        4'b0010: led_out <= 7'b0100100; // "2" 
        4'b0011: led_out <= 7'b0110000; // "3" 
        4'b0100: led_out <= 7'b0011001; // "4" 
        4'b0101: led_out <= 7'b0010010; // "5" 
        4'b0110: led_out <= 7'b0000010; // "6" 
        4'b0111: led_out <= 7'b1111000; // "7" 
        4'b1000: led_out <= 7'b0000000; // "8"     
        4'b1001: led_out <= 7'b0010000; // "9" 
        default: led_out <= 7'b1000000; // "0"
  endcase
end

endmodule