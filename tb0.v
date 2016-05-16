
`timescale 1ns / 1ps

module testbench;

reg clk500;
initial clk500 = 1'b0;
always
    #1 clk500 = ~clk500;
	
wire nclk;
reg  nreset;

divider div(
	.clk(clk500),
	.nreset(nreset),
	.in_factor(3),
	.nclk(nclk)
);

initial
begin
    $dumpfile("out.vcd");
    $dumpvars(0,testbench);
	nreset = 0;
	#10;
	nreset = 1;
	#1000;
	$finish;
end

endmodule
