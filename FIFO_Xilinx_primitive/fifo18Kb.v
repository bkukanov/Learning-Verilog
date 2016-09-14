`timescale 1ns / 1ps

module fifo18Kb(
    input aclk,
    input rst,
    input [31:0] din0,
    input [31:0] din1,
    output [31:0] dou0,
    output [31:0] dou1,
    input rden0,
    input rden1,
    input wren0,
    input wren1

    );

  wire [3:0] dip0;
  wire [3:0] dip1;
  wire parity_out0;
  wire parity_out1;
  wire parity_out2;
  wire parity_out3;
  wire parity_out4;
  wire parity_out5;
  wire parity_out6;
  wire parity_out7;

  wire sd_clk;

assign parity_out0 = din0[0] ^ din0[1] ^ din0[2] ^ din0[3] ^ din0[4] ^ din0[5] ^ din0[6] ^ din0[7];
assign parity_out1 = din0[8] ^ din0[9] ^ din0[10] ^ din0[11] ^ din0[12] ^ din0[13] ^ din0[14] ^ din0[15];
assign parity_out2 = din0[16] ^ din0[17] ^ din0[18] ^ din0[19] ^ din0[20] ^ din0[21] ^ din0[22] ^ din0[23];
assign parity_out3 = din0[24] ^ din0[25] ^ din0[26] ^ din0[27] ^ din0[28] ^ din0[29] ^ din0[30] ^ din0[31];

assign parity_out4 = din1[0] ^ din1[1] ^ din1[2] ^ din1[3] ^ din1[4] ^ din1[5] ^ din1[6] ^ din1[7];
assign parity_out5 = din1[8] ^ din1[9] ^ din1[10] ^ din1[11] ^ din1[12] ^ din1[13] ^ din1[14] ^ din1[15];
assign parity_out6 = din1[16] ^ din1[17] ^ din1[18] ^ din1[19] ^ din1[20] ^ din1[21] ^ din1[22] ^ din1[23];
assign parity_out7 = din1[24] ^ din1[25] ^ din1[26] ^ din1[27] ^ din1[28] ^ din1[29] ^ din1[30] ^ din1[31];


assign dip0 = {parity_out0,parity_out1,parity_out2,parity_out3};
assign dip1 = {parity_out4,parity_out5,parity_out6,parity_out7};
  
  
  
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
  FIFO18E1_inst0 (
  // Read Data: 32-bit (each) output: Read output data
  .DO(dou0),                               // 32-bit output: Data output
  .DOP(),                              // 4-bit output: Parity data output
  // Status: 1-bit (each) output: Flags and other FIFO status outputs
  .ALMOSTEMPTY(),              // 1-bit output: Almost empty flag
  .ALMOSTFULL(),                // 1-bit output: Almost full flag
  .EMPTY(),                          // 1-bit output: Empty flag
  .FULL(),                            // 1-bit output: Full flag
  .RDCOUNT(),                      // 12-bit output: Read count
  .RDERR(),                          // 1-bit output: Read error
  .WRCOUNT(),                      // 12-bit output: Write count
  .WRERR(),                          // 1-bit output: Write error
  // Read Control Signals: 1-bit (each) input: Read clock, enable and reset input signals
  .RDCLK(sd_clk),                         // 1-bit input: Read clock
  .RDEN(rden0),                            // 1-bit input: Read enable
  .REGCE(1),                              // 1-bit input: Clock enable
  .RST(!rst),                             // 1-bit input: Asynchronous Reset
  .RSTREG(!rst),                          // 1-bit input: Output register set/reset
  // Write Control Signals: 1-bit (each) input: Write clock and enable input signals
  .WRCLK(aclk),                            // 1-bit input: Write clock
  .WREN(wren0),                            // 1-bit input: Write enable
  // Write Data: 32-bit (each) input: Write input data
  .DI(din0),                               // 32-bit input: Data input
  .DIP(dip0)                               // 4-bit input: Parity input
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
  FIFO18E1_inst1 (
  // Read Data: 32-bit (each) output: Read output data
  .DO(dou1),                               // 32-bit output: Data output
  .DOP(),                              // 4-bit output: Parity data output
  // Status: 1-bit (each) output: Flags and other FIFO status outputs
  .ALMOSTEMPTY(),              // 1-bit output: Almost empty flag
  .ALMOSTFULL(),                // 1-bit output: Almost full flag
  .EMPTY(),                          // 1-bit output: Empty flag
  .FULL(),                            // 1-bit output: Full flag
  .RDCOUNT(),                      // 12-bit output: Read count
  .RDERR(),                          // 1-bit output: Read error
  .WRCOUNT(),                      // 12-bit output: Write count
  .WRERR(),                          // 1-bit output: Write error
  // Read Control Signals: 1-bit (each) input: Read clock, enable and reset input signals
  .RDCLK(aclk),                         // 1-bit input: Read clock
  .RDEN(rden1),                            // 1-bit input: Read enable
  .REGCE(1),                              // 1-bit input: Clock enable
  .RST(!rst),                             // 1-bit input: Asynchronous Reset
  .RSTREG(!rst),                          // 1-bit input: Output register set/reset
  // Write Control Signals: 1-bit (each) input: Write clock and enable input signals
  .WRCLK(sd_clk),                           // 1-bit input: Write clock
  .WREN(wren1),                            // 1-bit input: Write enable
  // Write Data: 32-bit (each) input: Write input data
  .DI(din1),                               // 32-bit input: Data input
  .DIP(dip1)                               // 4-bit input: Parity input
  );


  // End of FIFO18E1_inst instantiation
    
endmodule
