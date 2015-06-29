


`default_nettype none

module gci_std_kmc_synchronizer
	#(
		parameter P_N = 1
	)(
		input wire iCLOCK,
		input wire inRESET,
		input wire iRESET_SYNC,
		input wire [P_N-1:0] iDATA,
		output wire [P_N-1:0] oDATA
	);


	reg [P_N-1:0] b_buff0;
	reg [P_N-1:0] b_buff1;

	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_buff0 <= {P_N{1'b0}};
			b_buff1 <= {P_N{1'b0}};
		end
		else if(iRESET_SYNC)begin
			b_buff0 <= {P_N{1'b0}};
			b_buff1 <= {P_N{1'b0}};
		end
		else begin
			b_buff0 <= iDATA;
			b_buff1 <= b_buff0;
		end
	end


	assign oDATA = b_buff1;


endmodule // gci_std_kmc_synchronizer

`default_nettype wire 

