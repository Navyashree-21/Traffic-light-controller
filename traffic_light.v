`define g2ydelay 10
`define y2rdelay 3

`define green  2'b00
`define yellow 2'b01
`define red    2'b10

`define s0 3'b000
`define s1 3'b001
`define s2 3'b010
`define s3 3'b011

module traffic_light(
    input clk,    // slow clock (1 Hz)
    input rst,
    output reg [1:0] ns, ew
);

reg [2:0] state, next_state;
reg [3:0] timer;

// STATE REGISTER + TIMER
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= `s0;
        timer <= `g2ydelay;
    end else begin
        if (timer == 0) begin
            state <= next_state;
            case(next_state)
                `s0, `s2: timer <= `g2ydelay; // Green duration
                `s1, `s3: timer <= `y2rdelay; // Yellow duration
            endcase
        end else begin
            timer <= timer - 1;
        end
    end
end

// NEXT STATE LOGIC
always @(*) begin
    case(state)
        `s0: next_state = `s1;
        `s1: next_state = `s2;
        `s2: next_state = `s3;
        `s3: next_state = `s0;
        default: next_state = `s0;
    endcase
end

// OUTPUT LOGIC
always @(*) begin
    case(state)
        `s0: begin ns = `green;  ew = `red;    end
        `s1: begin ns = `yellow; ew = `red;    end
        `s2: begin ns = `red;    ew = `green;  end
        `s3: begin ns = `red;    ew = `yellow; end
        default: begin ns = `red; ew = `red; end
    endcase
end

endmodule
