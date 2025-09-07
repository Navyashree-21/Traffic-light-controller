module top_traffic(
    input clk,       // FPGA 50 MHz clock
    input rst,
    output [1:0] ns, ew
);

wire slow_clk;

// Instantiate Clock Divider
clock_divider #(.DIVISOR(50000000)) u1 (
    .clk(clk),
    .rst(rst),
    .clk_out(slow_clk)
);

// Instantiate Traffic Light Controller
traffic_light u2 (
    .clk(slow_clk),
    .rst(rst),
    .ns(ns),
    .ew(ew)
);

endmodule
