module timer_module (
    input        clk_1hz, rst,
    input  [2:0] state,
    output reg   time1, time2
);

localparam S0 = 3'd0,
           S1 = 3'd1,
           S2 = 3'd2,
           S3 = 3'd3;

reg [4:0] counter;   // can count up to 31
reg [2:0] prev_state;

/* Timer logic */
always @(posedge clk_1hz or posedge rst) begin
    if (rst) begin
        counter    <= 0;
        time1      <= 0;
        time2      <= 0;
        prev_state <= state;
    end
    else begin
        /* Default outputs */
        time1 <= 0;
        time2 <= 0;

        /* If state changed, reset counter */
        if (state != prev_state) begin
            counter <= 0;
        end
        else begin
            counter <= counter + 1;

            /* Green states → 30s */
            if ((state == S0 || state == S2) && counter == 5'd29) begin
                time1   <= 1'b1;   // pulse
                counter <= 0;
            end

            /* Yellow states → 3s (or change to 5) */
            else if ((state == S1 || state == S3) && counter == 5'd2) begin
                time2   <= 1'b1;   // pulse
                counter <= 0;
            end
        end

        prev_state <= state;
    end
end

endmodule
