module clk_div_1hz (
    input  clk_50mhz,
    input  rst,
    output reg clk_1hz
);

    reg [24:0] count;   // 25-bit counter

    always @(posedge clk_50mhz or posedge rst) begin
        if (rst) begin
            count  <= 0;
            clk_1hz <= 0;
        end
        else begin
            if (count == 25_000_000 - 1) begin
                count  <= 0;
                clk_1hz <= ~clk_1hz;  // toggle every 0.5s
            end
            else begin
                count <= count + 1;
            end
        end
    end

endmodule

