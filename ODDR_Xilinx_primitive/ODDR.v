`timescale 1ns / 1ps

module ODDR_top(
    input rst,
    input clk,
    input [31:0] fifo_data_in,
    input fifo_dat_wr_ready,
    output [7:0] oq,
    output sd_clk
    );

    wire [31:0] fifo_data_out;
    reg fifo_dat_rd_ready;
    
    clock_div clock_div_inst(
      .reset(rst),
      .axi_clk(clk),
      .div_clk(sd_clk)
    );
    
    sd_fifo_filler fifo_inst(
    .wb_clk(clk),
    .rst(rst),
    .read_fifo_out(fifo_data_out),
    .write_fifo_in(fifo_data_in),
    .fifo_data_read_ready(fifo_dat_rd_ready),
    .fifo_data_write_ready(fifo_dat_wr_ready)
    );
    
    
    reg [7:0] d1_reg;
    reg [7:0] d2_reg;
    wire [7:0] d1_wire;
    wire [7:0] d2_wire;
    reg [31:0] fifo_dat_out_reg;
    assign d1_wire = d1_reg;
    assign d2_wire = d2_reg;
    
    ODDR  #(.DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "SAME_EDGE" or "OPPOSITE_EDGE"
    .INIT(1'b1),                             // Initial value of    Q:1'b0 or 1'b1
    .SRTYPE("SYNC")                          // Set/Reset type: "SYNC" or "ASYNC"
    ) ODDR_inst0 (
    .Q(oq[0]),                                  // 1-bit DDR output
    .C(clk),                              // 1-bit clock input
    .CE(1'b1),                               // 1-bit clock enable input
    .D1(d1_wire[0]),                            // 1-bit data  input (positive edge)
    .D2(d2_wire[0]),                            // 1-bit data  input (negative edge)
    .R(1'b0),                                 // 1-bit reset
    .S(1'b0)                                    // 1-bit set
    );
    
    ODDR  #(.DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "SAME_EDGE" or "OPPOSITE_EDGE"
    .INIT(1'b1),                             // Initial value of    Q:1'b0 or 1'b1
    .SRTYPE("SYNC")                          // Set/Reset type: "SYNC" or "ASYNC"
    ) ODDR_inst1 (
    .Q(oq[1]),                                  // 1-bit DDR output
    .C(clk),                              // 1-bit clock input
    .CE(1'b1),                               // 1-bit clock enable input
    .D1(d1_wire[1]),                            // 1-bit data  input (positive edge)
    .D2(d2_wire[1]),                            // 1-bit data  input (negative edge)
    .R(1'b0),                                 // 1-bit reset
    .S(1'b0)                                    // 1-bit set
    );

    ODDR  #(.DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "SAME_EDGE" or "OPPOSITE_EDGE"
    .INIT(1'b1),                             // Initial value of    Q:1'b0 or 1'b1
    .SRTYPE("SYNC")                          // Set/Reset type: "SYNC" or "ASYNC"
    ) ODDR_inst2 (
    .Q(oq[2]),                                  // 1-bit DDR output
    .C(clk),                              // 1-bit clock input
    .CE(1'b1),                               // 1-bit clock enable input
    .D1(d1_wire[2]),                            // 1-bit data  input (positive edge)
    .D2(d2_wire[2]),                            // 1-bit data  input (negative edge)
    .R(1'b0),                                 // 1-bit reset
    .S(1'b0)                                    // 1-bit set
    );

    ODDR  #(.DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "SAME_EDGE" or "OPPOSITE_EDGE"
    .INIT(1'b1),                             // Initial value of    Q:1'b0 or 1'b1
    .SRTYPE("SYNC")                          // Set/Reset type: "SYNC" or "ASYNC"
    ) ODDR_inst3 (
    .Q(oq[3]),                                  // 1-bit DDR output
    .C(clk),                              // 1-bit clock input
    .CE(1'b1),                               // 1-bit clock enable input
    .D1(d1_wire[3]),                            // 1-bit data  input (positive edge)
    .D2(d2_wire[3]),                            // 1-bit data  input (negative edge)
    .R(1'b0),                                 // 1-bit reset
    .S(1'b0)                                    // 1-bit set
    );

    ODDR  #(.DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "SAME_EDGE" or "OPPOSITE_EDGE"
    .INIT(1'b1),                             // Initial value of    Q:1'b0 or 1'b1
    .SRTYPE("SYNC")                          // Set/Reset type: "SYNC" or "ASYNC"
    ) ODDR_inst4 (
    .Q(oq[4]),                                  // 1-bit DDR output
    .C(clk),                              // 1-bit clock input
    .CE(1'b1),                               // 1-bit clock enable input
    .D1(d1_wire[4]),                            // 1-bit data  input (positive edge)
    .D2(d2_wire[4]),                            // 1-bit data  input (negative edge)
    .R(1'b0),                                 // 1-bit reset
    .S(1'b0)                                    // 1-bit set
    );

    ODDR  #(.DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "SAME_EDGE" or "OPPOSITE_EDGE"
    .INIT(1'b1),                             // Initial value of    Q:1'b0 or 1'b1
    .SRTYPE("SYNC")                          // Set/Reset type: "SYNC" or "ASYNC"
    ) ODDR_inst5 (
    .Q(oq[5]),                                  // 1-bit DDR output
    .C(clk),                              // 1-bit clock input
    .CE(1'b1),                               // 1-bit clock enable input
    .D1(d1_wire[5]),                            // 1-bit data  input (positive edge)
    .D2(d2_wire[5]),                            // 1-bit data  input (negative edge)
    .R(1'b0),                                 // 1-bit reset
    .S(1'b0)                                    // 1-bit set
    );

    ODDR  #(.DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "SAME_EDGE" or "OPPOSITE_EDGE"
    .INIT(1'b1),                             // Initial value of    Q:1'b0 or 1'b1
    .SRTYPE("SYNC")                          // Set/Reset type: "SYNC" or "ASYNC"
    ) ODDR_inst6 (
    .Q(oq[6]),                                  // 1-bit DDR output
    .C(clk),                              // 1-bit clock input
    .CE(1'b1),                               // 1-bit clock enable input
    .D1(d1_wire[6]),                            // 1-bit data  input (positive edge)
    .D2(d2_wire[6]),                            // 1-bit data  input (negative edge)
    .R(1'b0),                                 // 1-bit reset
    .S(1'b0)                                    // 1-bit set
    );

    ODDR  #(.DDR_CLK_EDGE("OPPOSITE_EDGE"),  // "SAME_EDGE" or "OPPOSITE_EDGE"
    .INIT(1'b1),                             // Initial value of    Q:1'b0 or 1'b1
    .SRTYPE("SYNC")                          // Set/Reset type: "SYNC" or "ASYNC"
    ) ODDR_inst7 (
    .Q(oq[7]),                                  // 1-bit DDR output
    .C(clk),                              // 1-bit clock input
    .CE(1'b1),                               // 1-bit clock enable input
    .D1(d1_wire[7]),                            // 1-bit data  input (positive edge)
    .D2(d2_wire[7]),                            // 1-bit data  input (negative edge)
    .R(1'b0),                                 // 1-bit reset
    .S(1'b0)                                    // 1-bit set
    );

    reg byte_alignment_reg;
    
    always @(posedge clk) begin
      if(rst == 0)begin
        byte_alignment_reg <= 0;
        d1_reg <= 8'hff;
        d2_reg <= 8'hff;
      end
      else begin
      
        byte_alignment_reg <= ~byte_alignment_reg;

        d1_reg <= {fifo_dat_out_reg[31-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[30-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[29-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[28-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[27-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[26-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[25-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[24-(byte_alignment_reg << 4)]
                  };
        d2_reg <= {fifo_dat_out_reg[23-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[22-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[21-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[20-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[19-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[18-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[17-(byte_alignment_reg << 4)],
                   fifo_dat_out_reg[16-(byte_alignment_reg << 4)]
                  };
      end
    end
    
    localparam RDST = 2'b00,
               WRST = 2'b01;
               
    reg [1:0] state;
    reg Q;
    reg Qbar;
    reg trigger_reset;
   
    always @(posedge clk) begin
      if(rst==0)begin
        trigger_reset <= 1'b1;
        Qbar <= 1'b0;
        Q <= 1'b0;
      end
      else begin
        trigger_reset <= 1'b0;
        Q <= ~(fifo_dat_wr_ready | Qbar);
        Qbar <= ~(trigger_reset | Q);
      end
    end
    
    always @(posedge clk) begin
      if(rst==0)begin
        fifo_dat_rd_ready <= 1'b0;
      end
      else begin
        if (Qbar&~fifo_dat_wr_ready) begin
          fifo_dat_rd_ready <= 1'b1;
        end
      end
    end
endmodule

