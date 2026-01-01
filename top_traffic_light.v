module traffic_light (
    input clk_50mhz,
    input  rst,
    input emergency_A,emergency_B,
    output A_red,
    output A_yellow,
    output A_green,
    output B_red,
    output B_yellow,
    output B_green
    
);

    /* Internal signals */
    wire [2:0] state,next_state;
    wire time1;
    wire time2;
    clk_div_1hz u_div (
    .clk_50mhz (clk_50mhz),
    .rst       (rst),
    .clk_1hz   (clk_1hz)
);

    /* FSM instance */
    fsm_module f1 (
        .clk_1hz   (clk_1hz),
        .rst   (rst),
        .time1 (time1),
        .time2 (time2),
        .state (state),
        .emergency_A(emergency_A),
        .emergency_B(emergency_B)
    );

    /* Timer instance */
    timer_module t1 (
        .clk_1hz  (clk_1hz),
        .rst   (rst),
        .state (state),
        .time1 (time1),
        .time2 (time2)
    );

    /* Output decoder instance */
    output_module o1 (
        .state    (state),
        .A_red    (A_red),
        .A_yellow (A_yellow),
        .A_green  (A_green),
        .B_red    (B_red),
        .B_yellow (B_yellow),
        .B_green  (B_green)
    );

endmodule
