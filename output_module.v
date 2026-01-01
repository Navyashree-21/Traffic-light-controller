module output_module (
    input  [2:0] state,
    output reg A_red,
    output reg A_yellow,
    output reg A_green,
    output reg B_red,
    output reg B_yellow,
    output reg B_green
);

localparam S0 = 3'd0,
           S1 = 3'd1,
           S2 = 3'd2,
           S3 = 3'd3;

always @(*) begin
    /* Default OFF */
    A_red    = 0;
    A_yellow = 0;
    A_green  = 0;
    B_red    = 0;
    B_yellow = 0;
    B_green  = 0;

    case (state)
        S0: begin
            A_green = 1;
            B_red   = 1;
        end

        S1: begin
            A_yellow = 1;
            B_red    = 1;
        end

        S2: begin
            A_red   = 1;
            B_green = 1;
        end

        S3: begin
            A_red    = 1;
            B_yellow = 1;
        end

        default: begin
            A_red = 1;
            B_red = 1;
        end
    endcase
end

endmodule

