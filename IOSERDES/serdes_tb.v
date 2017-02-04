`timescale 1 ns / 1 ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2017 09:52:56 AM
// Design Name: 
// Module Name: serdes_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module serdes_tb();

reg ACLK;
reg ACLK_div;
reg ARESETN;
reg oce;
reg [7:0]d;

initial begin
  ACLK = 1'b0;
  forever begin
    ACLK = #5 ~ACLK;
  end
end

initial begin
    ACLK_div = 1'b0;
    forever begin
      ACLK_div = #20 ~ACLK_div;
    end
end

initial begin
  ARESETN = 1'b1;
  oce = 1'b0;
  d = 8'h00;
    
  repeat (100) @(posedge ACLK);
  #1;
  ARESETN = 1'b0;
  repeat (30) @(posedge ACLK);

  oce = 1'b1;
  repeat (1) @(posedge ACLK_div);
  d = 8'h0f;

  repeat (1) @(posedge ACLK_div);
  d = 8'h05;

  repeat (1) @(posedge ACLK_div);
  d = 8'h06;

  repeat (1) @(posedge ACLK_div);
  d = 8'h0f;
  
  repeat (1) @(posedge ACLK_div);
  d = 8'h00;
  
  repeat (4) @(posedge ACLK_div);
  
  repeat (200) @(posedge ACLK);
  $finish;
end

design_1_wrapper design_1_wrapper_i(
  .clk    (ACLK),
  .clkdiv (ACLK_div),
  .rst  (ARESETN),
  .oce  (oce),
  .d1   (d[0]),
  .d2   (d[1]),
  .d3   (d[2]),
  .d4   (d[3]),
  .d5   (d[4]),
  .d6   (d[5]),
  .d7   (d[6]),
  .d8   (d[7])
);

endmodule