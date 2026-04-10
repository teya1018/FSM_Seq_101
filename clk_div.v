/*============================================
	            CLOCK DIVIDER
==============================================
Description:
 This module takes a high-frequency input clock 
(clk_in) and divides it down to a lower frequency.
By default, it divides a 50MHz input clock down to 
1s clock period toggling the outputs every 25,000,000 
ticks.
 
Design Engineer:
Cordova, Althea Jane E.

Date:
 7 April 2026
-----------------------------------------------*/
module  clk_div(clk_out,clk_led,clk_in);
 //ports
 input clk_in;
 output reg clk_out = 0;
 output reg clk_led = 0;
 
 // division factor 
 parameter   integer FREQ_IN    = 50_000_000;
 parameter   integer PERIOD_OUT = 1;
 localparam  integer TICKS      = (FREQ_IN*PERIOD_OUT)/2;
 
 //clock generator
 integer tick_cnt = 0;
 
 
 always @(posedge clk_in) begin
    if(tick_cnt == TICKS-1) begin 
       clk_out <= ~clk_out;
       clk_led <= ~clk_led;
       tick_cnt <= 28'b0;
    end
    
    else tick_cnt <= tick_cnt + 28'b1;
 
 end


endmodule 