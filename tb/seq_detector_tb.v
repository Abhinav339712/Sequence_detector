module seq_detector_tb();
reg clk,rst,seq_in;
wire seq_out;

parameter CYCLE = 10;

seq_detector SED(.clk(clk),.rst(rst),.seq_in(seq_in),.seq_out(seq_out));

always
begin
	#(CYCLE/2)
	clk = 1'b0;
	#(CYCLE/2)
	clk = ~clk;
end

task initialize();
	begin
		seq_in = 1'b0;
	end
endtask

task reset();
	begin
		@(negedge clk)
		rst = 1'b1;
		@(negedge clk)
		rst = 1'b0;
	end
endtask

task stimulus(input i);
	begin
	   @(negedge clk)
		seq_in = i;
	end
endtask

initial
begin
	reset();
	stimulus(1);
	stimulus(0);
	stimulus(1);
	stimulus(1);
	stimulus(0);
	reset();
	stimulus(0);
	stimulus(1);
	stimulus(0);
	stimulus(1);
	stimulus(1);
	stimulus(0);
	#10;
end

initial $monitor("seq_in = %b,seq_out = %b",seq_in,seq_out);

initial #400 $finish;


endmodule


































