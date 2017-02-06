`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2017 07:12:29 PM
// Design Name: 
// Module Name: test
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


module test(

    input wire clk,
    input wire clkdiv,
    input wire rst,
    input wire oce,
    input wire [7:0] d
    );
    
    wire out;
    wire outb;
    
    iserdes iserdes_i(
        .d(out),
        .ofb(outb),
        .clk(~clk),
        .clkdiv(clkdiv),
        .ce1(1'b1),
        .ce2(1'b1),
        .rst(rst)
    );
    
    oserdes oserdes_i(
        .clk    (clk),
        .clkdiv (clkdiv),
        .rst  (rst),
        .oce  (oce),
        .oq   (out),
        .d1   (d[0]),
        .d2   (d[1]),
        .d3   (d[2]),
        .d4   (d[3]),
        .d5   (d[4]),
        .d6   (d[5]),
        .d7   (d[6]),
        .d8   (d[7]),
        .ofb   (outb) 
    );
    
    
endmodule
