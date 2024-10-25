`define A 3'b000
`define B 3'b001
`define C 3'b010
`define D 3'b011
`define E 3'b100

module q1 (clk, reset, in, out);
    input clk, reset;
    input [1:0] in;
    output [2:0] out;
    reg [2:0] present_state;
    always_ff @ ( posedge clk ) begin : moore_machine
        if(reset == 1'b1) begin
            present_state = `A;
        end      
        else begin
            case (present_state)
                `A :  
                    if (in == 2'b10)
                        present_state = `D;
                    else if (in == 2'b01) begin
                        present_state = `B;
                    end
                    else
                        present_state = `A;
                `B : present_state = `A;
                `C :
                    if (in == 2'b11)
                        present_state = `B;
                    else if (in == 2'b01)
                        present_state = `E;
                    else
                        present_state = `C;
                `D : present_state = `C;
                `E :
                    if (in == 2'b11)
                        present_state = `D;
                    else
                        present_state = `E;
                default: present_state = 3'bxxx;
            endcase
        end
    end
endmodule