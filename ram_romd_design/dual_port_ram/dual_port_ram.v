module dual_port_ram(
    input [7:0] data1,data2,
    input [5:0] adr1,adr2,
    input en1,en2,
    input clk,
    output reg[7:0] out1,out2
);

reg[7:0] ram[63:0];

always @(posedge clk)
 begin
    if(en1)
    ram[adr1]<=data1;
    else
    out1<=ram[adr1];
 end

 always @(posedge clk)
  begin
    if(en2)
    ram[adr2]<=data2;
    else
    out2<=ram[adr2];
  end

endmodule