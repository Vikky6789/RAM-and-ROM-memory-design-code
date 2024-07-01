module rom(
    input [4:0] adr,
    input clk,
    input en,
    output reg[4:0] data
);

reg[4:0] mem[32:0];

always @(posedge clk)
begin
  if(en)
  data<=mem[adr];
  else
    data<=5'bxxxxx;
end

initial
 begin
    
  for (integer k=0 ;k<32 ;k=k+1 ) begin
     mem[k]=k;
  end

 end
 
 endmodule