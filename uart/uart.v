module UART(clk, rst_n, rs232_rx, rs232_tx);
   input  clk;
   input  rst_n;
   input  rs232_rx;
   output rs232_tx;
   wire   bps_start1, bps_start2;
   wire   clk_bps1, clk_bps2;
   wire   [7:0] rx_data;
   wire   rx_int;

   speed_select	speed_rx(.clk(clk),
			 .rst_n(rst_n),
			 .bps_start(bps_start1),
			 .clk_bps(clk_bps1));

   uart_rx      uart_rx(.clk(clk),
			.rst_n(rst_n),
			.rs232_rx(rs232_rx),
			.rx_data(rx_data),
			.rx_int(rx_int),
			.clk_bps(clk_bps1),
			.bps_start(bps_start1));

   speed_select speed_tx(.clk(clk),
			 .rst_n(rst_n),
			 .bps_start(bps_start2),
			 .clk_bps(clk_bps2));

   uart_tx      uart_tx(.clk(clk),
			.rst_n(rst_n),
			.rx_data(rx_data),
			.rx_int(rx_int),
			.rs232_tx(rs232_tx),
			.clk_bps(clk_bps2),
			.bps_start(bps_start2));

endmodule
