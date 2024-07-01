`timescale 1ns/1ns
`include "rom.v"

module rom_tb;

reg [4:0] adr;
reg clk,en;
wire [4:0] data;

rom r(
    .adr(adr),.clk(clk),.en(en),.data(data)
);

initial 
begin
  $dumpfile("rom_data.vcd");
  $dumpvars(1,rom_tb);

  clk=1'b1;
  forever #5 clk=~clk;
end

initial
 begin
    en=1'b0;
    #12;

    en=1'b1;
    adr=5'b01011;
    #10;

    en=1'b1;
    adr=5'b01000;
    #10;

    en=1'b1;
    adr=5'b01111;
    #10;

    en=1'b1;
    adr=5'b10111;
    #10;

    en=1'b1;
    adr=5'b11011;
    #10;

    en=1'b1;
    adr=5'b00001;
    #10;

    $display("test done");
    #10 $finish;
 end  

endmodule