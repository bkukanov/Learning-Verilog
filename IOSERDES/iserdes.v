`timescale 1ps / 1ps

module iserdes (
//    parameter DATA_RATE = "SDR",
//    parameter INTERFACE_TYPE = "MEMORY"
//    parameter integer DATA_WIDTH = 4 
//)
//(
 output wire [7:0] q,
 input  wire d,
 input  wire ofb,
 input  wire ce1,
 input  wire ce2,
 input  wire clk,
 input  wire clkdiv,
 input  wire rst
);
reg bitslip;
reg [3:0] count;
reg flag;
always @(posedge clkdiv )
    begin
        if (rst) begin
            bitslip <= 0;
            count <= 0;
            flag <= 1;
        end
        else if ((q != 0) && (q != 8'h0E) && flag) begin
            count <= count + 1;
            case ( count )
                    4'h0: begin 
                            bitslip = 1'b1;
                          end
                    4'h1: begin
                            bitslip = 1'b0;
                          end  
                    4'h2: begin
                            bitslip = 1'b1;
                          end           
                    4'h3: begin
                            bitslip = 1'b0;
                          end  
                    4'h4: begin
                              bitslip = 1'b1;
                            end           
                    4'h5: begin
                          bitslip = 1'b0;
                        end      
                    4'h6: begin
                                  bitslip = 1'b1;
                                end           
                        4'h7: begin
                              bitslip = 1'b0;
                              count <= 0;
                            end                                                 
                    default: begin
                            bitslip = 0;
                            end
            endcase 
        end
        else if (q != 0) begin
            bitslip = 0;
            flag <= 0;
            end
    end

ISERDESE2 #(
    .DATA_RATE("SDR"),              // DDR, SDR
    .DATA_WIDTH(8),                 // Parallel data width (2-8,10,14)
    .DYN_CLKDIV_INV_EN("FALSE"),    // Enable DYNCLKDIVINVSEL inversion (FALSE, TRUE)
    .DYN_CLK_INV_EN("FALSE"),       // Enable DYNCLKINVSEL inversion (FALSE, TRUE)
    // INIT_Q1 - INIT_Q4: Initial value on the Q outputs (0/1)
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .INIT_Q3(1'b0),
    .INIT_Q4(1'b0),
    .INIT_Q5(1'b0),
    .INIT_Q6(1'b0),
    .INIT_Q7(1'b0),
    .INIT_Q8(1'b0),
    .INTERFACE_TYPE("NETWORKING"),      // MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
    .IOBDELAY("NONE"),              // NONE, BOTH, IBUF, IFD
    .NUM_CE(1),                     // Number of clock enables (1,2)
    .OFB_USED("FALSE"),             // Select OFB path (FALSE, TRUE)
    .SERDES_MODE("MASTER"),         // MASTER, SLAVE
    // SRVAL_Q1 - SRVAL_Q4: Q output values when SR is used (0/1)
    .SRVAL_Q1(1'b0),
    .SRVAL_Q2(1'b0),
    .SRVAL_Q3(1'b0),
    .SRVAL_Q4(1'b0),
    .SRVAL_Q5(1'b0),
    .SRVAL_Q6(1'b0),
    .SRVAL_Q7(1'b0),
    .SRVAL_Q8(1'b0)
)
ISERDESE2_inst(
    .O(outp),                          // 1-bit output: Combinatorial output
    // Q1 - Q8: 1-bit (each) output: Registered data outputs
    .Q1(q[7]),
    .Q2(q[6]),
    .Q3(q[5]),
    .Q4(q[4]),
    .Q5(q[3]),
    .Q6(q[2]),
    .Q7(q[1]),
    .Q8(q[0]),
    // SHIFTOUT1, SHIFTOUT2: 1-bit (each) output: Data width expansion output ports
    .SHIFTOUT1(SHIFTOUT1),
    .SHIFTOUT2(SHIFTOUT2),
    .BITSLIP(bitslip),
                        // 1-bit input: The BITSLIP pin performs a Bitslip operation synchronous to
                        // CLKDIV when asserted (active High). Subsequently, the data seen on the Q1
                        // to Q8 output ports will shift, as in a barrel-shifter operation, one
                        // position every time Bitslip is invoked (DDR operation is different from
                        // SDR).
    // CE1, CE2: 1-bit (each) input: Data register clock enable inputs
    .CE1(ce1),
    .CE2(ce2),
    .CLKDIVP(CLKDIVP),  // 1-bit input: TBD
    // Clocks: 1-bit (each) input: ISERDESE2 clock input ports
    .CLK(clk),          // 1-bit input: High-speed clock
    .CLKB(~clk),        // 1-bit input: High-speed secondary clock
    .CLKDIV(clkdiv),    // 1-bit input: Divided clock
    .OCLK(0),        // 1-bit input: High speed output clock used when INTERFACE_TYPE="MEMORY"
    // Dynamic Clock Inversions: 1-bit (each) input: Dynamic clock inversion pins to switch clock polarity
    .DYNCLKDIVSEL(DYNCLKDIVSEL),    // 1-bit input: Dynamic CLKDIV inversion
    .DYNCLKSEL(DYNCLKSEL),          // 1-bit input: Dynamic CLK/CLKB inversion
    // Input Data: 1-bit (each) input: ISERDESE2 data input ports
    .D(d),              // 1-bit input: Data input
    .DDLY(DDLY),        // 1-bit input: Serial data from IDELAYE2
    .OFB(ofb),          // 1-bit input: Data feedback from OSERDESE2
    .OCLKB(0),      // 1-bit input: High speed negative edge output clock
    .RST(rst),          // 1-bit input: Active high asynchronous reset
    // SHIFTIN1, SHIFTIN2: 1-bit (each) input: Data width expansion input ports
    .SHIFTIN1(SHIFTIN1),
    .SHIFTIN2(SHIFTIN2)
);

endmodule