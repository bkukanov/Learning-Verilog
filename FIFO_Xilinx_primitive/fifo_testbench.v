`timescale 1ns / 1ps

module fifo_testbench();

reg ACLK;
reg BCLK;
reg ARESETN;
reg [31:0] DOU;
reg fifo_dat_wr_ready;
reg fifo_dat_rd_ready;
wire [31:0] DIN;
wire [11:0] WRCOUNT;
wire [11:0] RDCOUNT;

initial begin
  ACLK = 1'b1;
  BCLK = 1'b1;
  ARESETN = 1'b0;
end
  
always begin 
  #2.5 ACLK = ~ACLK;
  #2.5 BCLK = ~BCLK;
end

initial begin

//reset module
  ARESETN = 1'b0;
  DOU = 32'h00000000;
  fifo_dat_wr_ready = 1'b0;
  fifo_dat_rd_ready = 1'b0;
  repeat (12) @(posedge ACLK);

  #1;
  ARESETN = 1'b1;
  repeat (12) @(posedge ACLK);

//write data
  DOU = 32'h2345678A;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'hABBDEF6C;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h8876543E;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h10FEDCB1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);
  
  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h12345678;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h23456789;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h3456789A;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h456789AB;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  fifo_dat_rd_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h56789ABC;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h6789ABCD;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h789ABCDE;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);
  
  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h89ABCDEF;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h9ABCDEF1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'hABCDEF12;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b0;
  DOU = 32'hBCDEF123;
  repeat (1) @(posedge ACLK);

  fifo_dat_wr_ready = 1'b1;
  repeat (1) @(posedge ACLK);
//end write
  fifo_dat_wr_ready = 1'b0;
  DOU = 32'h00000000;
  repeat (5) @(posedge ACLK);

//end read data
  repeat (10) @(posedge ACLK);
  fifo_dat_rd_ready = 1'b0;
  repeat (10) @(posedge ACLK);
  
  $finish;
end

fifo18Kb fifo18Kb_inst
       (.aclk(ACLK),
        .bclk(BCLK),
        .rst(ARESETN),
        .din(DOU),
        .dou(DIN),
        .rden(fifo_dat_rd_ready),
        .wren(fifo_dat_wr_ready),
        .wrcount(WRCOUNT),
        .rdcount(RDCOUNT)
        );


endmodule
