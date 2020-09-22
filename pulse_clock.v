module pulse_clock (clk, out_clk1, out_clk2, out_clk3, out_clk4, en, clear, p1, p2, p3, p4, p23);

input clk;
input en;
input clear;

output reg out_clk1;
output reg out_clk2;
output reg out_clk3;
output reg out_clk4;


output reg p1, p2, p3, p4, p23;

wire [1:0] clock;

parameter limit1=1;

reg [25:0] count1 = 0;
reg [25:0] count2 = 0;


	
	always@(negedge clk)
	begin
		count1 = count1 + 1; 
		if(count1 == limit1)
		begin
				count1 <= 0;
				out_clk1 <= ~out_clk1;
		end
	end
	
	always@(posedge out_clk1)
	begin
		count2 = count2 + 1; 
		if(count2 == limit1) begin
				count2 <= 0 	;
				out_clk2 <= ~out_clk2;
		end
	end
	
	assign clock={out_clk1, clk};
	
	
	always@(clk)
		begin
		
		out_clk3 <= out_clk1;
		out_clk4 <= out_clk2;
		
		case (en)
	
		1'b0:
		begin
			out_clk3 <= 1'b0;
			out_clk4 <= 1'b0;
			
		end
				
				1'b1:
				
				case (clear)
				1'b1:
				begin
					
					p1 	<= 1'b0;
					p2 	<= 1'b0;
					p3 	<= 1'b0;
					p4 	<= 1'b0;
					p23 	<= 1'b0;
				end
		
		
				1'b0:
			
				case(clock)
				2'b00:
				begin
					p1 	<= 1'b0;
					p2 	<= 1'b0;
					p3 	<= 1'b1;
					p4 	<= 1'b0;
					p23 	<= 1'b1;
				end
			
				2'b01:
				begin
					p1 	<= 1'b0;
					p2 	<= 1'b0;
					p3 	<= 1'b0;
					p4 	<= 1'b1;
					p23 	<= 1'b0;
				end
				
				2'b10:
				begin
					p1 	<= 1'b1;
					p2 	<= 1'b0;
					p3 	<= 1'b0;
					p4 	<= 1'b0;
					p23 	<= 1'b0;
				end
				
				2'b11:
				begin
					p1 	<= 1'b0;
					p2 	<= 1'b1;
					p3 	<= 1'b0;
					p4 	<= 1'b0;
					p23 	<= 1'b1;
				end
				endcase
				
		endcase
		
	endcase
	end
	
endmodule
		
		
		
