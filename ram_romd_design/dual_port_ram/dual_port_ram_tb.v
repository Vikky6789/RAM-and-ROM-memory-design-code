`timescale 1ns/1ns
`include "dual_port_ram.v"

module dual_port_ram_tb;

reg[7:0] data1,data2;
reg[5:0] adr1,adr2;
reg en1,en2,clk;
wire [7:0] out1,out2;

dual_port_ram dpr(
    .data1(data1),.data2(data2),
    .out1(out1),.out2(out2),
    .adr1(adr1),.adr2(adr2),
    .en1(en1),.en2(en2),
    .clk(clk)
);

initial
 begin
 $dumpfile("data_dpr.vcd");
 $dumpvars(1,dual_port_ram_tb);

 clk=1'b1;
 forever #5 clk=~clk;    
 end

initial
 begin
 data1=8'd12;
 adr1=6'b000000;

 data2=8'd14;
 adr2=6'b000001;
 
 en1=1'b1;
 en2=1'b1;
 #12;

 data1=8'd22;
 adr1=6'b000010;

 data2=8'd24;
 adr2=6'b000011;
 
 en1=1'b1;
 en2=1'b1;
 #10; 

 adr1=6'b000010;
 adr2=6'b000011;
 
 en1=1'b0;
 en2=1'b0;
 #10;

 adr1=6'b000000;
 adr2=6'b000001;
 
 en1=1'b0;
 en2=1'b0;
 #10;

$display("test complete");
#20 $finish;

 end

endmodule
 

