`timescale 1ns / 1ps

module fifo18Kb(
    input aclk,
    input bclk,
    input rst,
    input [31:0] din,
    output [31:0] dou,
    input rden,
    input wren,
    output [11:0] wrcount,
    output [11:0] rdcount
    );

  wire [3:0] dip;
  wire [3:0] dop;
  wire parity_out0;
  wire parity_out1;
  wire parity_out2;
  wire parity_out3;
  wire sd_clk;

assign parity_out0 = din[0] ^ din[1] ^ din[2] ^ din[3] ^ din[4] ^ din[5] ^ din[6] ^ din[7];
assign parity_out1 = din[8] ^ din[9] ^ din[10] ^ din[11] ^ din[12] ^ din[13] ^ din[14] ^ din[15];
assign parity_out2 = din[16] ^ din[17] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^ din[23];
assign parity_out3 = din[24] ^ din[25] ^ din[26] ^ din[27] ^ din[28] ^ din[29] ^ din[30] ^ din[31];

assign dip = {parity_out0,parity_out1,parity_out2,parity_out3};
  
  clock_div clock_div_inst(
  .axi_clk(aclk),
//  .reset(rst),
  .div_clk(sd_clk)
  );
  
  
  FIFO18E1 #(
  .ALMOST_EMPTY_OFFSET(13'h000A),    // Sets the almost empty threshold
  .ALMOST_FULL_OFFSET(13'h0080),     // Sets almost full threshold
  .DATA_WIDTH(36),                   // Sets data width to 4-36
  .DO_REG(1),                       // Enable output register (1-0) Must be 1 if EN_SYN = FALSE
  .EN_SYN("FALSE"),                 // Specifies FIFO as dual-clock (FALSE) or Synchronous (TRUE)
  .FIFO_MODE("FIFO18_36"),               // Sets mode to FIFO18 or FIFO18_36
  .FIRST_WORD_FALL_THROUGH("FALSE"), // Sets the FIFO FWFT to FALSE, TRUE
  .INIT(36'h000000000),               // Initial values on output port
  .SIM_DEVICE("7SERIES"),             // Must be set to "7SERIES" for simulation behavior
  .SRVAL(36'h000000000)               // Set/Reset value for output port
  )
  FIFO18E1_inst (
  // Read Data: 32-bit (each) output: Read output data
  .DO(dou),                               // 32-bit output: Data output
  .DOP(dop),                              // 4-bit output: Parity data output
  // Status: 1-bit (each) output: Flags and other FIFO status outputs
  .ALMOSTEMPTY(ALMOSTEMPTY),              // 1-bit output: Almost empty flag
  .ALMOSTFULL(ALMOSTFULL),                // 1-bit output: Almost full flag
  .EMPTY(EMPTY),                          // 1-bit output: Empty flag
  .FULL(FULL),                            // 1-bit output: Full flag
  .RDCOUNT(rdcount),                      // 12-bit output: Read count
  .RDERR(RDERR),                          // 1-bit output: Read error
  .WRCOUNT(wrcount),                      // 12-bit output: Write count
  .WRERR(WRERR),                          // 1-bit output: Write error
  // Read Control Signals: 1-bit (each) input: Read clock, enable and reset input signals
  .RDCLK(sd_clk),                         // 1-bit input: Read clock
  .RDEN(rden),                            // 1-bit input: Read enable
  .REGCE(1),                              // 1-bit input: Clock enable
  .RST(!rst),                             // 1-bit input: Asynchronous Reset
  .RSTREG(!rst),                          // 1-bit input: Output register set/reset
  // Write Control Signals: 1-bit (each) input: Write clock and enable input signals
  .WRCLK(aclk),                            // 1-bit input: Write clock
  .WREN(wren),                            // 1-bit input: Write enable
  // Write Data: 32-bit (each) input: Write input data
  .DI(din),                               // 32-bit input: Data input
  .DIP(dip)                               // 4-bit input: Parity input
  );
  
  // End of FIFO18E1_inst instantiation
    
endmodule
