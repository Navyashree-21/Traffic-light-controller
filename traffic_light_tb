module traffic_light_tb();

    /* Testbench signals */
    reg clk_50mhz;
    reg rst;
    reg emergency_A;
    reg emergency_B;
    wire A_red;
    wire A_yellow;
    wire A_green;
    wire B_red;
    wire B_yellow;
    wire B_green;

    /* DUT instantiation */
    traffic_light dut (
        .clk_50mhz   (clk_50mhz),
        .rst         (rst),
        .emergency_A (emergency_A),
        .emergency_B (emergency_B),
        .A_red       (A_red),
        .A_yellow    (A_yellow),
        .A_green     (A_green),
        .B_red       (B_red),
        .B_yellow    (B_yellow),
        .B_green     (B_green)
    );

   //clock geneartin
    initial begin
        clk_50mhz = 0;
        forever #5clk_50mhz = ~clk_50mhz;  
    end

   
    initial begin
        rst = 1;
        emergency_A = 0;
        emergency_B = 0;

        #20;        // hold reset for 2 clock cycles
        rst = 0;
    end

    //EMERGENCY TEST SCENARIO
    initial begin
        /* Let normal traffic run */
        #200;

        /* Emergency on Road B */
        $display(">>> Emergency on Road B");
        emergency_B = 1;
        #150;
        emergency_B = 0;

        /* Resume normal traffic */
        #200;

        /* Emergency on Road A */
        $display(">>> Emergency on Road A");
        emergency_A = 1;
        #150;
        emergency_A = 0;

        /* Resume normal traffic */
        #300;

        $display(">>> Simulation finished");
        $stop;
    end

endmodule
