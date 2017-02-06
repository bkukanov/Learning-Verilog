`timescale 1 ps / 1 ps
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
  ACLK = 1'b1;
  ACLK_div = 1'b1;
  end
//  forever begin
//    #5 ACLK = ~ACLK;
//    #40 ACLK_div = ~ACLK_div;
//  end
//end
always #500 ACLK = ~ACLK;
always #4000 ACLK_div = ~ACLK_div;

//initial begin
//    ACLK_div = 1'b0;
//    forever begin
      
//    end
//end

initial begin
  ARESETN = 1'b1;
  oce = 1'b0;
  d = 8'h00;
    
  repeat (100) @(posedge ACLK);
  #1;
  ARESETN = 1'b0;
  repeat (30) @(posedge ACLK);

  oce = 1'b1;
  repeat (30) begin @(posedge ACLK_div)
  d = 8'h0E;
    end
  repeat (1) begin @(posedge ACLK_div);
  d = 8'h00;
 end
   repeat (2) begin @(posedge ACLK_div);
 d = 8'hFF;
end
  repeat (1) begin @(posedge ACLK_div);
d = 8'h00;
end
  repeat (1) @(posedge ACLK_div);
  d = 8'h06;

  repeat (1) @(posedge ACLK_div);
  d = 8'h0f;
  
  repeat (1) @(posedge ACLK_div);
  d = 8'h00;
  repeat (1) @(posedge ACLK_div);
  d = 8'h11;
  repeat (1) @(posedge ACLK_div);
  d = 8'hAA;
  repeat (1) @(posedge ACLK_div);
  d = 8'hBB;
  repeat (1) @(posedge ACLK_div);
  d = 8'h00;        
  repeat (4) @(posedge ACLK_div);
  
  repeat (200) @(posedge ACLK);
  $finish;
end

test test_i(
  .clk    (ACLK),
  .clkdiv (ACLK_div),
  .rst  (ARESETN),
  .oce  (oce),
  .d   (d)
);

endmodule