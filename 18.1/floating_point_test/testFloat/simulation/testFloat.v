// testFloat.v

// Generated using ACDS version 18.0 614

`timescale 1 ps / 1 ps
module testFloat (
		input  wire        clk,       // s1.clk
		input  wire        clk_en,    //   .clk_en
		input  wire [31:0] dataa,     //   .dataa
		input  wire [31:0] datab,     //   .datab
		input  wire [2:0]  n,         //   .n
		input  wire        reset,     //   .reset
		input  wire        reset_req, //   .reset_req
		input  wire        start,     //   .start
		output wire        done,      //   .done
		output wire [31:0] result     //   .result
	);

	fpoint2_multi #(
		.arithmetic_present (1),
		.root_present       (1),
		.conversion_present (1)
	) nios_custom_instr_floating_point_2_multi_0 (
		.clk       (clk),       // s1.clk
		.clk_en    (clk_en),    //   .clk_en
		.dataa     (dataa),     //   .dataa
		.datab     (datab),     //   .datab
		.n         (n),         //   .n
		.reset     (reset),     //   .reset
		.reset_req (reset_req), //   .reset_req
		.start     (start),     //   .start
		.done      (done),      //   .done
		.result    (result)     //   .result
	);

endmodule
