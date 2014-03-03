module speed_select(clk,rst_n,
		    bps_start,clk_bps);

   input  clk;
   input  rst_n;
   input  bps_start;
   output clk_bps;

   /*
    bps9600 	= 5207
    bps19200 	= 2603
    bps38400 	= 1301
    bps57600 	= 867
    bps115200	= 433

    bps9600_2 	= 2603,
    bps19200_2	= 1301,
    bps38400_2	= 650,
    bps57600_2	= 433,
    bps115200_2 = 216;
    */

`define BPS_PARA   433
`define BPS_PARA_2 216

   reg [12:0] cnt;
   reg 	      clk_bps_r;

   reg [2:0]  uart_ctrl;

   always @ (posedge clk or negedge rst_n)
     if(!rst_n) cnt <= 13'd0;
     else if((cnt == `BPS_PARA) || !bps_start) cnt <= 13'd0;
     else cnt <= cnt+1'b1;

   always @ (posedge clk or negedge rst_n)
     if(!rst_n) clk_bps_r <= 1'b0;
     else if(cnt == `BPS_PARA_2 && bps_start) clk_bps_r <= 1'b1;
     else clk_bps_r <= 1'b0;

   assign clk_bps = clk_bps_r;

endmodule // speed_select
