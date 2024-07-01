module single_port_ram(
input [7:0] data,//input data 8bits
input [5:0] adr,//address location total 2^6=64
input en,
input clk,//enable write and clock
output [7:0] out//output data
);

reg[7:0] ram[63:0]; // 8*64 bit ram
reg[5:0] addres;//address register

always @(posedge clk)
 begin
   if(en)
    ram[adr]<=data;
   else
    addres<=adr;
 end

 assign out=ram[addres];

endmodule