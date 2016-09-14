`timescale 1ns / 1ps

module fifo_testbench();

reg ACLK;
reg ARESETN;
reg [31:0] DOU0;
reg [31:0] DOU1;
reg fifo_dat_wr_ready0;
reg fifo_dat_rd_ready0;
reg fifo_dat_wr_ready1;
reg fifo_dat_rd_ready1;
wire [31:0] DIN0;
wire [31:0] DIN1;

initial
  ACLK = 1'b0;
  
always
  #5 ACLK = ~ACLK;

initial begin

//reset module
  ARESETN = 1'b0;
  DOU0 = 32'h00000000;
  fifo_dat_wr_ready0 = 1'b0;
  fifo_dat_rd_ready0 = 1'b0;
  repeat (12) @(posedge ACLK);

  ARESETN = 1'b1;
  repeat (12) @(posedge ACLK);

//write data
  DOU0 = 32'h2345678A;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'hABBDEF6C;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h8876543E;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h10FEDCB1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);
  
  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h12345678;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h23456789;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h3456789A;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h456789AB;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  fifo_dat_rd_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h56789ABC;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h6789ABCD;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h789ABCDE;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);
  
  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h89ABCDEF;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h9ABCDEF1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'hABCDEF12;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'hBCDEF123;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready0 = 1'b1;
  repeat (1) @(posedge ACLK);
//end write
  fifo_dat_wr_ready0 = 1'b0;
  DOU0 = 32'h00000000;
  repeat (5) @(posedge ACLK);

//end read data
  repeat (10) @(posedge ACLK);
  fifo_dat_rd_ready0 = 1'b0;
  repeat (10) @(posedge ACLK);
  
end

initial begin
  
  DOU1 = 32'h00000000;
  fifo_dat_wr_ready1 = 1'b0;
  fifo_dat_rd_ready1 = 1'b0;
  repeat (24) @(posedge ACLK);
  
//write data
  DOU1 = 32'h01234567;
  repeat (2) @(posedge ACLK);

  fifo_dat_wr_ready1 = 1'b1;
  repeat (2) @(posedge ACLK);

  DOU1 = 32'h12345678;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'h23456789;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'h3456789A;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'h456789AB;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'h56789ABC;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'h6789ABCD;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'h789ABCDE;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'h89ABCDEF;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'hFEDCBA98;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'hEDCBA987;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'hDCBA9876;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'hCBA98765;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'hBA987654;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'hA9876543;
  repeat (2) @(posedge ACLK);
  DOU1 = 32'h98765432;
  repeat (2) @(posedge ACLK);
  
  DOU1 = 32'h00000000;
  fifo_dat_wr_ready1 = 1'b0;
  fifo_dat_rd_ready1 = 1'b1;
  repeat (16) @(posedge ACLK);
  fifo_dat_rd_ready1 = 1'b0;

  repeat (5) @(posedge ACLK);
  
  $finish;
end

fifo18Kb fifo18Kb_inst
       (.aclk(ACLK),
        .rst(ARESETN),
        .din0(DOU0),
        .dou0(DIN0),
        .rden0(fifo_dat_rd_ready0),
        .wren0(fifo_dat_wr_ready0),
        .din1(DOU1),
        .dou1(DIN1),
        .rden1(fifo_dat_rd_ready1),
        .wren1(fifo_dat_wr_ready1)
        );


endmodule
