`timescale 1ns / 1ns
`include "single_port_ram.v"

module single_port_ram_tb;

reg[7:0] data;
reg[5:0] adr;
reg en,clk;
wire[7:0] out;

single_port_ram spr(
    .data(data),.adr(adr),.en(en),.clk(clk),.out(out)
);

initial
 begin
  $dumpfile("data.vcd");
  $dumpvars(1,single_port_ram_tb);

  clk=1'b1;
  forever #5 clk=~clk;    
 end

 initial
  begin
   data=8'h01;
   adr=6'b000000;
   en=1'b1;
   #12;

   data=8'h02;
   adr=6'b000001;
   en=1'b1;
   #10;

   data=8'h03;
   adr=6'b000010;
   en=1'b1;
   #10;

  data=8'h04;
   adr=6'b000011;
   en=1'b1;
   #10;

   adr=6'b000010;
   en=1'b0;
   #10;

   adr=6'b000001;
   en=1'b0;
   #10;

  adr=6'b000011;
   en=1'b0;
   #10;

  adr=6'b000000;
   en=1'b0;
   #10;

   $display("test done");
   #10 $finish; 
  end

endmodule