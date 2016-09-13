`timescale 1ns / 1ps

module ODDR_wrapper_tb ();
reg ACLK;
reg ARESETN;
reg [31:0] data_out;
reg fifo_dat_wr_ready;
reg fifo_dat_rd_ready;

initial begin
  ACLK = 1'b0;
  forever begin
    ACLK = #5 ~ACLK;
  end
end

initial begin
  ARESETN = 1'b0;
  data_out = 32'h00000000;
  fifo_dat_wr_ready = 1'b0;
  fifo_dat_rd_ready = 1'b0;

  repeat (16) @(posedge ACLK);
//  #1;
  ARESETN = 1'b1;
  repeat (10) @(posedge ACLK);
  fifo_dat_wr_ready = 1'b1;
  data_out = 32'h23456789;
  repeat (1) @(posedge ACLK);
  data_out = 32'hABCDEF01;
  repeat (1) @(posedge ACLK);
  data_out = 32'h98765432;
  repeat (1) @(posedge ACLK);
  data_out = 32'h10FEDCBA;
  repeat (1) @(posedge ACLK);
  data_out = 32'h00000000;
  fifo_dat_wr_ready = 1'b0;
  repeat (50) @(posedge ACLK);
  
  $finish;
end

ODDR_top ODDR_top_inst
       (.clk(ACLK),
        .rst(ARESETN),
        .fifo_data_in(data_out),
        .fifo_dat_wr_ready(fifo_dat_wr_ready)
        );
endmodule
