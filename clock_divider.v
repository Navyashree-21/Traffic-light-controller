
module clock_divider #(
    parameter DIVISOR = 50000000   // for 50 MHz input → 1 Hz output
)(
    input clk,
    input rst,
    output reg clk_out
);
    reg [31:0] counter = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == (DIVISOR/2 - 1)) begin
                clk_out <= ~clk_out;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
