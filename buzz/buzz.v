module buzz(clk,
	    reset,
	    out
            );
   input clk;
   input reset;
   output out;

   reg [31:0] cnt;
   always@(posedge clk or negedge reset)
     if(!reset)
       cnt<=32'd0;
     else if(cnt==32'h989680)
       cnt<=32'd0;
     else
       cnt<=cnt+1'b1;

   reg out_reg;

   always@(posedge clk or negedge reset)
     if(!reset)
       out_reg<=1'b1;
     else if(cnt==32'h989680)
       out_reg<=~out_reg;

   assign out=out_reg;

endmodule
