
module divider(
	input wire clk,
	input wire nreset,
	input wire [15:0]in_factor,
	output wire nclk
);

reg r0, r1, r2, r3, r4;

reg [15:0]factor=0;
reg [15:0]fcnt;
reg short;
reg short_f;

always @(posedge clk or negedge nreset)
begin
	if(~nreset)
		begin
			r0 <= 0;
			r1 <= 0;
			r2 <= 0;
			r3 <= 0;
			r4 <= 1;
		end
	else
		begin
			r0 <= r1;
			r1 <= r2;
			r2 <= r3;
			if(short)
				r3 <= r0;
			else
				r3 <= r4;
			if(~short)
				r4 <= r0;
		end
end

assign nclk = r0;

always @(posedge clk or negedge nreset)
	if(~nreset)
	begin
		fcnt <= 0;
		short <= 0;
		short_f <= 0;
	end
	else
	begin
		if(r0)
			fcnt <= short ? 0 : fcnt +1;
		if(r2)
			short <= (fcnt == factor);
			
		if(r0)
			short_f <= short;
		
		if(r0 & short_f)
			factor <= in_factor;
	end

endmodule
