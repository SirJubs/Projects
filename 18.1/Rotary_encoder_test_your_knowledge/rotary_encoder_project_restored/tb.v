`timescale 1ns/1ps

module tb;

reg MAX10_CLK1_50; 
reg [1:0] ARDUINO_IO;
reg [1:0] KEY;


DE10_LITE_Golden_Top i_DE10_LITE_Golden_Top (.MAX10_CLK1_50(MAX10_CLK1_50), .ARDUINO_IO(ARDUINO_IO), .KEY(KEY));

initial begin
MAX10_CLK1_50 = 0;
ARDUINO_IO[0] = 0;
#70 ARDUINO_IO[0] = 1;
#240 ARDUINO_IO[0] = 0;
#210 ARDUINO_IO[0] = 1;
#100 ARDUINO_IO[0] = 0;
end

initial begin
ARDUINO_IO[1] = 0;
#130 ARDUINO_IO[1] = 1;
#230 ARDUINO_IO[1] = 0;
#130 ARDUINO_IO[1] = 1;
#100 ARDUINO_IO[1] = 0;
#1000;
$stop;
end

initial begin
KEY[0] = 0;
#25 KEY[0] = 1;
end

always #10 MAX10_CLK1_50 = ~MAX10_CLK1_50;

endmodule
