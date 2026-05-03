//Author:mahesh
//here is elevator another version with the multiple request of floors availability 
module elevator_design(
    input clk, rst,
    input [2:0] req_in,
    output reg [1:0] floor,
    output reg door,
    output reg dir
);

parameter IDLE=2'b00, UP=2'b01, DOWN=2'b10, DOOR=2'b11;

reg [1:0] ps, ns;
reg [3:0] count;
reg [2:0] req;

//---------------- STATE REGISTER ----------------//
always @(posedge clk or posedge rst) begin
    if (rst)
        ps <= IDLE;
    else
        ps <= ns;
end

//---------------- REQUEST MEMORY ----------------//
always @(posedge clk or posedge rst) begin
    if (rst)
        req <= 3'b000;
    else
        req <= req | req_in;
end

//---------------- NEXT STATE LOGIC ----------------//
always @(*) begin
    case(ps)

        IDLE: begin
            if (req != 0) begin
                // decide direction
                if ((floor == 0 && (req[1] || req[2])) ||
                    (floor == 1 && req[2]))
                    ns = UP;

                else if ((floor == 2 && (req[1] || req[0])) ||
                         (floor == 1 && req[0]))
                    ns = DOWN;

                else
                    ns = DOOR; // request at same floor
            end
            else ns = IDLE;
        end

        // FIXED: only check current floor
        UP: begin
            if (req[floor])
                ns = DOOR;
            else
                ns = UP;
        end

        DOWN: begin
            if (req[floor])
                ns = DOOR;
            else
                ns = DOWN;
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

//---------------- OUTPUT + DATA ----------------//
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

            UP: begin
                dir <= 1;
                door <= 0;
                if (count == 5) begin
                    floor <= floor + 1;
                    count <= 0;
                end else count <= count + 1;
            end

            DOWN: begin
                dir <= 0;
                door <= 0;
                if (count == 5) begin
                    floor <= floor - 1;
                    count <= 0;
                end else count <= count + 1;
            end

            DOOR: begin
                door <= 1;
                if (count == 5) begin
                    count <= 0;

                    // clear current floor request
                    req[floor] <= 0;

                end else count <= count + 1;
            end

        endcase
    end
end

endmodule
