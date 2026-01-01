module fsm_module(
    input        clk_1hz,
    input        rst,
    input        time1,
    input        time2,
    input emergency_A,emergency_B,
    output reg [2:0] state
);

localparam S0 = 3'd0,
           S1 = 3'd1,
           S2 = 3'd2,
           S3 = 3'd3;

reg [2:0] next_state;

/* State register */
always @(posedge clk_1hz or posedge rst) begin
    if (rst)
        state <= S0;
    else
        state <= next_state;
end

/* Next-state logic */
always @(*) begin
    if (emergency_A) begin
        next_state = S0;   // Road A priority
    end
    else if (emergency_B) begin
        next_state = S2;   // Road B priority
    end
    else begin
        case (state)
            S0: next_state = time1 ? S1 : S0;
            S1: next_state = time2 ? S2 : S1;
            S2: next_state = time1 ? S3 : S2;
            S3: next_state = time2 ? S0 : S3;
            default: next_state = S0;
        endcase
    end
end


endmodule
