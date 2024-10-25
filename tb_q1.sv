// `define AB 2'b01
// `define AA 2'b11
// `define AD 2'b10
// `define BA 2'b00
// `define CC 2'b00
// `define CB 2'b11
// `define CE 2'b01
// `define DC 2'b00
// `define ED 2'b11
// `define EE 2'b00

module tb_q1();
    reg clk, reset, err;
    reg [2:0] in;
    q1 DUT(clk, reset, in, out);

    initial begin
        clk = 0; //off at 0
        #10; 
        forever begin
            clk = 1; #10; //on
            clk = 0; #10; //off
        end
    end

    initial begin
        reset = 0;
        err = 0;
        in = 2'b00;
        #10;
        reset = 1;
        if(tb_q1.DUT.present_state !== 3'b000) begin
            $display("ERROR ** state is %b, expected %b", tb_q1.DUT.present_state, 3'b000);
        end
        #11;
        reset = 0; #10;
        in = 2'b11; #10 //go to A
        in = 2'b01; #10 //go to B
        in = 2'b00; #10 //go to A
        in = 2'b10; #10 //go to D
        in = 2'b00; #10 //go to C
        in = 2'b00; #10 //go to C
        in = 2'b11; #10 //go to B
        in = 2'b00; #10 //go to A
        in = 2'b10; #10 //go to D
        in = 2'b00; #10 //go to C
        in = 2'b01; #10 //go to E
        in = 2'b00; #10 //go to E
        in = 2'b11; #50 //go to D
        $stop;
    end
endmodule: tb_q1