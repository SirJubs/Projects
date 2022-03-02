module knight_rider(
	input wire CLOCK_50,
	input wire [7:0] counter_offset,      // This is commented out by default. Remove comment when adding the rotary encoder
	output wire [9:0] LEDR
);
	wire slow_clock;

	reg [3:0] count;
	reg count_up;

//	clock_divider u0 (.fast_clock(CLOCK_50), .slow_clock(slow_clock) );
	clock_divider u0 (.fast_clock(CLOCK_50), .slow_clock(slow_clock), .counter_offset(counter_offset)); // This is commented out by default. Remove comment when adding the rotary encode

	always @ (posedge slow_clock) 
	begin
		if (count_up)
			count <= count + 1'b1;
		else
			count <= count - 1'b1;
	end

	always @ (posedge CLOCK_50) 
	begin
		if (count == 9)
			count_up <= 1'b0;
		else if (count == 0)
			count_up <= 1'b1;
		else
			count_up <= count_up;
	end

	assign LEDR[9:0] = (1'b1 << count);

endmodule


module clock_divider(
	input fast_clock,
	input [7:0] counter_offset, // This is commented out by default. Remove comment when adding the rotary encode
	output slow_clock
);


	parameter COUNTER_SIZE = 100;
	parameter COUNTER_MAX_COUNT = (2 ** COUNTER_SIZE) - 1;

	reg [COUNTER_SIZE-1:0] count;
	
	always @(posedge fast_clock)
	begin
		if(count==COUNTER_MAX_COUNT)
			count <= 0;
		else
			count<=count + 1'b1;
	end

//	assign slow_clock = count[COUNTER_SIZE-1];
// Determine what is the appropriate function to use instead of COUNTER_SIZE-1 to have a total of 8 increments from slow to fastest from the rotary encoder 
	assign slow_clock = count[counter_offset]; // This is commented out by default. Comment out line above and remove this comment when adding the rotary encoder
	

endmodule 