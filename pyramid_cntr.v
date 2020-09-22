module pyramid_cntr (up, out, reset, pulse1, pulse2, enable);

input up, reset, enable;
output reg [3:0] out;
output reg pulse1, pulse2;

reg [3:0] temp = 4'b1111;
reg [3:0] flag = 4'b1111;

always @(negedge up)
	begin
		case(enable)
			1'b1:
			begin
				case(reset)
					1'b0:
					begin
					
						out<= out + 1'b1;
						
							case(out)
								flag:
								begin
								
									pulse1 <= pulse1 + 1;
									flag= flag-1;
									out <= 4'b0000;
									
										case(flag)
											4'b0000:
												pulse2 <= pulse2 + 1;
												
											default:
												begin
													pulse1 <= pulse1 + 1;
													pulse2 <= 0;
												end
										endcase
							end
								
					default:
					begin
					
						pulse1 = 1'b0;
						pulse2 = 1'b0;
					end
					endcase
					end
					1'b1:
						out <= 4'b0000;
				endcase
			end
					1'b0:
					begin
						pulse1 = 1'b0;
						pulse2 = 1'b0;
						out <= 4'b0000;
					end
				endcase
			end
	endmodule
			
					
					
										
								