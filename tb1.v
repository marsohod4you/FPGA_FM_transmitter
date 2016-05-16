
`timescale 1ns / 1ps

module testbench;

//simulate external crystal 100Mhz
reg clk;
initial clk = 1'b0;
always
    #5 clk = ~clk;

//sound clk 22050Hz
reg [15:0]scnt=0;
always @(posedge clk)
	if(scnt==4535)
		scnt <= 0;
	else
		scnt <= scnt + 1;
wire sndclk = (scnt>2500);

//generate SAW signal on sound freq
reg [7:0]sample=0;
always @(posedge sndclk)
	sample <= sample + 2;

//high 500MHz frequency
reg clk500;
initial clk500 = 1'b0;
always
    #1 clk500 = ~clk500;

//256 entry ROM table of M-coefficients
reg [15:0] romtable [0 : 255];
initial
begin
romtable[8'h00] = 16'hFFFF;
romtable[8'h01] = 16'hFFFF;
romtable[8'h02] = 16'hC851;
romtable[8'h03] = 16'h858B;
romtable[8'h04] = 16'h6407;
romtable[8'h05] = 16'h500B;
romtable[8'h06] = 16'h42B7;
romtable[8'h07] = 16'h3926;
romtable[8'h08] = 16'h3203;
romtable[8'h09] = 16'h2C76;
romtable[8'h0A] = 16'h2800;
romtable[8'h0B] = 16'h245E;
romtable[8'h0C] = 16'h2157;
romtable[8'h0D] = 16'h1EC4;
romtable[8'h0E] = 16'h1C92;
romtable[8'h0F] = 16'h1AAB;
romtable[8'h10] = 16'h18FF;
romtable[8'h11] = 16'h1787;
romtable[8'h12] = 16'h1639;
romtable[8'h13] = 16'h150E;
romtable[8'h14] = 16'h1400;
romtable[8'h15] = 16'h130C;
romtable[8'h16] = 16'h122F;
romtable[8'h17] = 16'h1164;
romtable[8'h18] = 16'h10AA;
romtable[8'h19] = 16'h1000;
romtable[8'h1A] = 16'h0F62;
romtable[8'h1B] = 16'h0ED0;
romtable[8'h1C] = 16'h0E49;
romtable[8'h1D] = 16'h0DCA;
romtable[8'h1E] = 16'h0D55;
romtable[8'h1F] = 16'h0CE7;
romtable[8'h20] = 16'h0C7F;
romtable[8'h21] = 16'h0C1E;
romtable[8'h22] = 16'h0BC3;
romtable[8'h23] = 16'h0B6D;
romtable[8'h24] = 16'h0B1C;
romtable[8'h25] = 16'h0ACF;
romtable[8'h26] = 16'h0A86;
romtable[8'h27] = 16'h0A41;
romtable[8'h28] = 16'h09FF;
romtable[8'h29] = 16'h09C1;
romtable[8'h2A] = 16'h0985;
romtable[8'h2B] = 16'h094D;
romtable[8'h2C] = 16'h0917;
romtable[8'h2D] = 16'h08E3;
romtable[8'h2E] = 16'h08B1;
romtable[8'h2F] = 16'h0882;
romtable[8'h30] = 16'h0855;
romtable[8'h31] = 16'h0829;
romtable[8'h32] = 16'h07FF;
romtable[8'h33] = 16'h07D7;
romtable[8'h34] = 16'h07B0;
romtable[8'h35] = 16'h078B;
romtable[8'h36] = 16'h0768;
romtable[8'h37] = 16'h0745;
romtable[8'h38] = 16'h0724;
romtable[8'h39] = 16'h0704;
romtable[8'h3A] = 16'h06E5;
romtable[8'h3B] = 16'h06C7;
romtable[8'h3C] = 16'h06AA;
romtable[8'h3D] = 16'h068E;
romtable[8'h3E] = 16'h0673;
romtable[8'h3F] = 16'h0659;
romtable[8'h40] = 16'h063F;
romtable[8'h41] = 16'h0627;
romtable[8'h42] = 16'h060F;
romtable[8'h43] = 16'h05F8;
romtable[8'h44] = 16'h05E1;
romtable[8'h45] = 16'h05CB;
romtable[8'h46] = 16'h05B6;
romtable[8'h47] = 16'h05A1;
romtable[8'h48] = 16'h058D;
romtable[8'h49] = 16'h057A;
romtable[8'h4A] = 16'h0567;
romtable[8'h4B] = 16'h0555;
romtable[8'h4C] = 16'h0543;
romtable[8'h4D] = 16'h0531;
romtable[8'h4E] = 16'h0520;
romtable[8'h4F] = 16'h050F;
romtable[8'h50] = 16'h04FF;
romtable[8'h51] = 16'h04EF;
romtable[8'h52] = 16'h04E0;
romtable[8'h53] = 16'h04D1;
romtable[8'h54] = 16'h04C2;
romtable[8'h55] = 16'h04B4;
romtable[8'h56] = 16'h04A6;
romtable[8'h57] = 16'h0498;
romtable[8'h58] = 16'h048B;
romtable[8'h59] = 16'h047E;
romtable[8'h5A] = 16'h0471;
romtable[8'h5B] = 16'h0465;
romtable[8'h5C] = 16'h0458;
romtable[8'h5D] = 16'h044C;
romtable[8'h5E] = 16'h0441;
romtable[8'h5F] = 16'h0435;
romtable[8'h60] = 16'h042A;
romtable[8'h61] = 16'h041F;
romtable[8'h62] = 16'h0414;
romtable[8'h63] = 16'h040A;
romtable[8'h64] = 16'h03FF;
romtable[8'h65] = 16'h03F5;
romtable[8'h66] = 16'h03EB;
romtable[8'h67] = 16'h03E1;
romtable[8'h68] = 16'h03D8;
romtable[8'h69] = 16'h03CE;
romtable[8'h6A] = 16'h03C5;
romtable[8'h6B] = 16'h03BC;
romtable[8'h6C] = 16'h03B3;
romtable[8'h6D] = 16'h03AB;
romtable[8'h6E] = 16'h03A2;
romtable[8'h6F] = 16'h039A;
romtable[8'h70] = 16'h0391;
romtable[8'h71] = 16'h0389;
romtable[8'h72] = 16'h0381;
romtable[8'h73] = 16'h037A;
romtable[8'h74] = 16'h0372;
romtable[8'h75] = 16'h036A;
romtable[8'h76] = 16'h0363;
romtable[8'h77] = 16'h035C;
romtable[8'h78] = 16'h0355;
romtable[8'h79] = 16'h034E;
romtable[8'h7A] = 16'h0347;
romtable[8'h7B] = 16'h0340;
romtable[8'h7C] = 16'h0339;
romtable[8'h7D] = 16'h0332;
romtable[8'h7E] = 16'h032C;
romtable[8'h7F] = 16'h0326;
romtable[8'h80] = 16'h031F;
romtable[8'h81] = 16'h0319;
romtable[8'h82] = 16'h0313;
romtable[8'h83] = 16'h030D;
romtable[8'h84] = 16'h0307;
romtable[8'h85] = 16'h0301;
romtable[8'h86] = 16'h02FB;
romtable[8'h87] = 16'h02F6;
romtable[8'h88] = 16'h02F0;
romtable[8'h89] = 16'h02EB;
romtable[8'h8A] = 16'h02E5;
romtable[8'h8B] = 16'h02E0;
romtable[8'h8C] = 16'h02DB;
romtable[8'h8D] = 16'h02D5;
romtable[8'h8E] = 16'h02D0;
romtable[8'h8F] = 16'h02CB;
romtable[8'h90] = 16'h02C6;
romtable[8'h91] = 16'h02C1;
romtable[8'h92] = 16'h02BD;
romtable[8'h93] = 16'h02B8;
romtable[8'h94] = 16'h02B3;
romtable[8'h95] = 16'h02AE;
romtable[8'h96] = 16'h02AA;
romtable[8'h97] = 16'h02A5;
romtable[8'h98] = 16'h02A1;
romtable[8'h99] = 16'h029C;
romtable[8'h9A] = 16'h0298;
romtable[8'h9B] = 16'h0294;
romtable[8'h9C] = 16'h0290;
romtable[8'h9D] = 16'h028B;
romtable[8'h9E] = 16'h0287;
romtable[8'h9F] = 16'h0283;
romtable[8'hA0] = 16'h027F;
romtable[8'hA1] = 16'h027B;
romtable[8'hA2] = 16'h0277;
romtable[8'hA3] = 16'h0273;
romtable[8'hA4] = 16'h0270;
romtable[8'hA5] = 16'h026C;
romtable[8'hA6] = 16'h0268;
romtable[8'hA7] = 16'h0264;
romtable[8'hA8] = 16'h0261;
romtable[8'hA9] = 16'h025D;
romtable[8'hAA] = 16'h025A;
romtable[8'hAB] = 16'h0256;
romtable[8'hAC] = 16'h0253;
romtable[8'hAD] = 16'h024F;
romtable[8'hAE] = 16'h024C;
romtable[8'hAF] = 16'h0248;
romtable[8'hB0] = 16'h0245;
romtable[8'hB1] = 16'h0242;
romtable[8'hB2] = 16'h023E;
romtable[8'hB3] = 16'h023B;
romtable[8'hB4] = 16'h0238;
romtable[8'hB5] = 16'h0235;
romtable[8'hB6] = 16'h0232;
romtable[8'hB7] = 16'h022F;
romtable[8'hB8] = 16'h022C;
romtable[8'hB9] = 16'h0229;
romtable[8'hBA] = 16'h0226;
romtable[8'hBB] = 16'h0223;
romtable[8'hBC] = 16'h0220;
romtable[8'hBD] = 16'h021D;
romtable[8'hBE] = 16'h021A;
romtable[8'hBF] = 16'h0217;
romtable[8'hC0] = 16'h0215;
romtable[8'hC1] = 16'h0212;
romtable[8'hC2] = 16'h020F;
romtable[8'hC3] = 16'h020C;
romtable[8'hC4] = 16'h020A;
romtable[8'hC5] = 16'h0207;
romtable[8'hC6] = 16'h0204;
romtable[8'hC7] = 16'h0202;
romtable[8'hC8] = 16'h01FF;
romtable[8'hC9] = 16'h01FD;
romtable[8'hCA] = 16'h01FA;
romtable[8'hCB] = 16'h01F8;
romtable[8'hCC] = 16'h01F5;
romtable[8'hCD] = 16'h01F3;
romtable[8'hCE] = 16'h01F0;
romtable[8'hCF] = 16'h01EE;
romtable[8'hD0] = 16'h01EC;
romtable[8'hD1] = 16'h01E9;
romtable[8'hD2] = 16'h01E7;
romtable[8'hD3] = 16'h01E5;
romtable[8'hD4] = 16'h01E2;
romtable[8'hD5] = 16'h01E0;
romtable[8'hD6] = 16'h01DE;
romtable[8'hD7] = 16'h01DB;
romtable[8'hD8] = 16'h01D9;
romtable[8'hD9] = 16'h01D7;
romtable[8'hDA] = 16'h01D5;
romtable[8'hDB] = 16'h01D3;
romtable[8'hDC] = 16'h01D1;
romtable[8'hDD] = 16'h01CF;
romtable[8'hDE] = 16'h01CC;
romtable[8'hDF] = 16'h01CA;
romtable[8'hE0] = 16'h01C8;
romtable[8'hE1] = 16'h01C6;
romtable[8'hE2] = 16'h01C4;
romtable[8'hE3] = 16'h01C2;
romtable[8'hE4] = 16'h01C0;
romtable[8'hE5] = 16'h01BE;
romtable[8'hE6] = 16'h01BC;
romtable[8'hE7] = 16'h01BA;
romtable[8'hE8] = 16'h01B9;
romtable[8'hE9] = 16'h01B7;
romtable[8'hEA] = 16'h01B5;
romtable[8'hEB] = 16'h01B3;
romtable[8'hEC] = 16'h01B1;
romtable[8'hED] = 16'h01AF;
romtable[8'hEE] = 16'h01AD;
romtable[8'hEF] = 16'h01AC;
romtable[8'hF0] = 16'h01AA;
romtable[8'hF1] = 16'h01A8;
romtable[8'hF2] = 16'h01A6;
romtable[8'hF3] = 16'h01A5;
romtable[8'hF4] = 16'h01A3;
romtable[8'hF5] = 16'h01A1;
romtable[8'hF6] = 16'h019F;
romtable[8'hF7] = 16'h019E;
romtable[8'hF8] = 16'h019C;
romtable[8'hF9] = 16'h019A;
romtable[8'hFA] = 16'h0199;
romtable[8'hFB] = 16'h0197;
romtable[8'hFC] = 16'h0196;
romtable[8'hFD] = 16'h0194;
romtable[8'hFE] = 16'h0192;
romtable[8'hFF] = 16'h0191;
end

wire nclk;
reg nreset;

divider div(
	.clk(clk500),
	.nreset(nreset),
	.in_factor(romtable[sample]),
	.nclk(nclk)
);

initial
begin
    $dumpfile("out.vcd");
    $dumpvars(0,testbench);
	nreset = 0;
	#10;
	nreset = 1;
	#10000000;
	$finish;
end

endmodule
