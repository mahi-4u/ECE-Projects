//Author:mahesh
//here is my first simple elevator code for a basic version i tried without any multiple request availability
module elevator_design(
    input clk, rst,
    input start,
    input [1:0] target,
    output reg [1:0] floor,
    output reg door,
    output reg dir
);

parameter IDLE=2'b00, MOVE=2'b01, DOOR=2'b10;

reg [1:0] ps, ns;
reg [3:0] count;

// State register
always @(posedge clk or posedge rst) begin
    if (rst)
        ps <= IDLE;
    else
        ps <= ns;
end

// Next state logic
always @(*) begin
    case(ps)

        IDLE: begin
            if (start && floor != target)
                ns = MOVE;
            else if (start && floor == target)
                ns = DOOR;
            else
                ns = IDLE;
        end

        MOVE: begin
            if (floor == target)
                ns = DOOR;
            else
                ns = MOVE;
        end

        DOOR: begin
            if (count == 5)
                ns = IDLE;
            else
                ns = DOOR;
        end

        default: ns = IDLE;
    endcase
end

// Output + floor logic
always @(posedge clk or posedge rst) begin
    if (rst) begin
        floor <= 0;
        door  <= 0;
        dir   <= 0;
        count <= 0;
    end else begin

        case(ps)

            IDLE: begin
                door <= 0;
                count <= 0;
            end

            MOVE: begin
                door <= 0;

                if (floor < target) begin
                    dir <= 1;
                    if (count == 5) begin
                        floor <= floor + 1;
                        count <= 0;
                    end else count <= count + 1;
                end
                else if (floor > target) begin
                    dir <= 0;
                    if (count == 5) begin
                        floor <= floor - 1;
                        count <= 0;
                    end else count <= count + 1;
                end
            end

            DOOR: begin
                door <= 1;
                if (count == 5)
                    count <= 0;
                else
                    count <= count + 1;
            end

        endcase
    end
end

endmodule
