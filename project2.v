`timescale 1ns / 1ps
///////////////////////////////////////////////////////
// NAME         : Ankit Sarraf
// CREATE DATE  : 09:45:29 June 26, 2014
// PROJECT NAME : Guessing Game / Electronic Lock
// MODULE NAME  : project2
///////////////////////////////////////////////////////

module project2(clock, switches, buttons, leds, cathods, anodes);
	input  clock;
	input [6:0] switches;
	input [3:0] buttons;

	output reg [7:0] leds = 8'b00000000;
	output reg [7:0] cathods;
	output reg [3:0] anodes;

	// Variables to Maintain the clock count
	integer count = 0;
	integer myCount = 0;
	
	// Player 1 => 0
	// Player 2 => 1
	integer player = 1'b0;
	
	// Find if default message has tl be shown to the players
	integer defaultMessage = 1'b1;
	
	// tempn represents the 'nth' Anode in 7-Segement display
	integer temp3 = 8'b11111111;
	integer temp2 = 8'b11111111;
	integer temp1 = 8'b11111111;
	integer temp0 = 8'b11111111;
	// Initialized all the 7-Segment displays to show no value
	
	// To keep the backup of the numbers Player 1 entered
	integer backupValue0 = 0;
	integer backupValue1 = 0;
	integer backupValue2 = 0;
	integer backupValue3 = 0;
	
	// To keep record of the numbers existing player entered
	integer finalValue0 = 0;
	integer finalValue1 = 0;
	integer finalValue2 = 0;
	integer finalValue3 = 0;
	
	integer pressed = 1'b0;
	
	integer checking = 0;
	integer flag = 0;
	integer attempts = 0;
	integer flag_attempts = 1'b1;
	
	always @(posedge clock)
	begin
		if(checking != 0)
		begin
			flag = 1;
		end
		else
		begin
			flag = 0;
		end
		
		if(switches[6] == 1)
		begin
			if(flag_attempts == switches[6])
			begin
				attempts = attempts + switches[6];
				flag_attempts = 1'b0;
			end
		end
		
		if(flag == 1)
		begin
			if(checking == 1)
			begin
				// Winning Code - Led Blink
				if(myCount < 10000000)
				begin
					leds = 8'b11111111;
				end
				else if(myCount < 20000000)
				begin
					leds = 8'b00000000;
				end
				else
				begin
					myCount = 0;
				end
				myCount = myCount + 1;
				
				// Display Number of Attempts
				temp3 = 8'b11111111;
				temp2 = 8'b11111111;
				temp1 = 8'b11111111;
				
				// ASSUMPTION: There are no more than 15 Attempts
				case(attempts)
				4'h0: temp0 = 8'b11000000;
				4'h1: temp0 = 8'b11111001;
				4'h2: temp0 = 8'b10100100;
				4'h3: temp0 = 8'b10110000;
				4'h4: temp0 = 8'b10011001;
				4'h5: temp0 = 8'b10010010;
				4'h6: temp0 = 8'b10000010;
				4'h7: temp0 = 8'b11111000;
				4'h8: temp0 = 8'b10000000;
				4'h9: temp0 = 8'b10010000;
				4'hA: temp0 = 8'b10001000;
				4'hb: temp0 = 8'b10000011;
				4'hC: temp0 = 8'b11000110;
				4'hd: temp0 = 8'b10100001;
				4'hE: temp0 = 8'b10000110;
				4'hF: temp0 = 8'b10001110;
				default: temp0 = 8'b11000000;
				endcase
			end
			else if(checking == 2)
			begin
				// Guessed LOW
				// Set the 7 - Segments to " 2LO"
				temp3 = 8'b11111111;
				temp2 = 8'b10100100;
				temp1 = 8'b11000111;
				temp0 = 8'b11000000;
			end
			else
			begin
				// Guessed HIGH
				// Set the 7 - Segments t0 " 2HI"
				temp3 = 8'b11111111;
				temp2 = 8'b10100100;
				temp1 = 8'b10001001;
				temp0 = 8'b11001111;
			end
			
			if(switches[5] == 0 && switches[4] == 1 && checking != 1)
			begin
				// To give Player2 another chance to
				// guess correct number
				
				defaultMessage = 0;
				checking = 0;
				flag_attempts = 1'b1;
			end
			
			if(switches[5] == 0 && switches[4] == 0 && checking == 1)
			begin
				// To start a new game
				// Reset Everything
				defaultMessage = 1;
				checking = 0;
				attempts = 0;
				flag_attempts = 1'b1;
				count = 0;
				myCount = 0;
				pressed = 0;
				player = 0;
				leds = 0;
				
				temp0 = 8'b10111111;
				temp1 = 8'b10111111;
				temp2 = 8'b10111111;
				temp3 = 8'b10111111;
				
				backupValue0 = 0;
				backupValue1 = 0;
				backupValue2 = 0;
				backupValue3 = 0;
				
				finalValue0 = 0;
				finalValue1 = 0;
				finalValue2 = 0;
				finalValue3 = 0;
			end
		end
		else
		begin
			if(switches[5] == 1 && player == 1)
			begin
				// If Player 2 guesses the correct value
				if(finalValue0 == backupValue0 && finalValue1 == backupValue1 &&
					finalValue2 == backupValue2 && finalValue3 == backupValue3)
				begin
					checking = 1;
				end
				else if((backupValue0 > finalValue0) ||
						 (backupValue0 == finalValue0 && 
						  backupValue1 > finalValue1) ||
						 (backupValue0 == finalValue0 &&
						  backupValue1 == finalValue1 &&
						  backupValue2 > finalValue2) ||
						 (backupValue0 == finalValue0 &&
						  backupValue1 == finalValue1 &&
						  backupValue2 == finalValue2 &&
						  backupValue3 > finalValue3)
						 )
				begin
					// LOW Guess
					checking = 2;
				end
				else
				begin
					// HIGH Guess
					checking = 3;
				end
			end
			
			if(switches[4] != player)
			begin
				backupValue0 = finalValue0;
				backupValue1 = finalValue1;
				backupValue2 = finalValue2;
				backupValue3 = finalValue3;
				
				finalValue0 = 0;
				finalValue1 = 0;
				finalValue2 = 0;
				finalValue3 = 0;
				
				defaultMessage = 1;
			end
			
			// Default Messages which Player selected
			if(defaultMessage == 1)
			begin
				temp3 = 8'b10001100;
				temp2 = 8'b11000111;
				temp1 = 8'b11111111;
				
				if(switches[4] == 1'b0)
				begin
					// If switch 4 is in low position
					// Set to player 1
					player = 0;
					temp0 = 8'b11111001;
				end
				else
				begin
					// Else set player 2
					player = 1;
					temp0 = 8'b10100100;
				end
			end
			
			if(switches[3:0] != 0)
			begin
				// When first time we make the changes to the sliders
				if(defaultMessage == 1)
				begin
					// Don't show the default message now
					defaultMessage = 0;
					
					// Set the 7-Segements to display just 0
					temp0 = 8'b11000000;
					temp1 = 8'b11000000;
					temp2 = 8'b11000000;
					temp3 = 8'b11000000;
				end
				else
				begin
					if(pressed == 0)
					begin
						pressed = 1;
						
						case(switches[3:0])
						4'h1: 
							finalValue0 = finalValue0 + buttons[3:0];
						4'h2:
							finalValue1 = finalValue1 + buttons[3:0];
						4'h4: 
							finalValue2 = finalValue2 + buttons[3:0];
						4'h8:
							finalValue3 = finalValue3 + buttons[3:0];
						endcase
					end
					else
					begin
						if(buttons[3:0] == 0)
						begin
							pressed = 0;
						end
					end
				end
				
				if(finalValue0 > 15)
				begin
					finalValue0 = 0;
				end
				if(finalValue1 > 15)
				begin
					finalValue1 = 0;
				end
				if(finalValue2 > 15)
				begin
					finalValue2 = 0;
				end
				if(finalValue3 > 15)
				begin
					finalValue3 = 0;
				end
				
				case(finalValue0)
				4'h0: temp0 = 8'b11000000;
				4'h1: temp0 = 8'b11111001;
				4'h2: temp0 = 8'b10100100;
				4'h3: temp0 = 8'b10110000;
				4'h4: temp0 = 8'b10011001;
				4'h5: temp0 = 8'b10010010;
				4'h6: temp0 = 8'b10000010;
				4'h7: temp0 = 8'b11111000;
				4'h8: temp0 = 8'b10000000;
				4'h9: temp0 = 8'b10010000;
				4'hA: temp0 = 8'b10001000;
				4'hb: temp0 = 8'b10000011;
				4'hC: temp0 = 8'b11000110;
				4'hd: temp0 = 8'b10100001;
				4'hE: temp0 = 8'b10000110;
				4'hF: temp0 = 8'b10001110;
				default: temp0 = 8'b11000000;
				endcase
				
				case(finalValue1)
				4'h0: temp1 = 8'b11000000;
				4'h1: temp1 = 8'b11111001;
				4'h2: temp1 = 8'b10100100;
				4'h3: temp1 = 8'b10110000;
				4'h4: temp1 = 8'b10011001;
				4'h5: temp1 = 8'b10010010;
				4'h6: temp1 = 8'b10000010;
				4'h7: temp1 = 8'b11111000;
				4'h8: temp1 = 8'b10000000;
				4'h9: temp1 = 8'b10010000;
				4'hA: temp1 = 8'b10001000;
				4'hb: temp1 = 8'b10000011;
				4'hC: temp1 = 8'b11000110;
				4'hd: temp1 = 8'b10100001;
				4'hE: temp1 = 8'b10000110;
				4'hF: temp1 = 8'b10001110;
				default: temp1 = 8'b11000000;
				endcase
				
				case(finalValue2)
				4'h0: temp2 = 8'b11000000;
				4'h1: temp2 = 8'b11111001;
				4'h2: temp2 = 8'b10100100;
				4'h3: temp2 = 8'b10110000;
				4'h4: temp2 = 8'b10011001;
				4'h5: temp2 = 8'b10010010;
				4'h6: temp2 = 8'b10000010;
				4'h7: temp2 = 8'b11111000;
				4'h8: temp2 = 8'b10000000;
				4'h9: temp2 = 8'b10010000;
				4'hA: temp2 = 8'b10001000;
				4'hb: temp2 = 8'b10000011;
				4'hC: temp2 = 8'b11000110;
				4'hd: temp2 = 8'b10100001;
				4'hE: temp2 = 8'b10000110;
				4'hF: temp2 = 8'b10001110;
				default: temp2 = 8'b11000000;
				endcase
				
				case(finalValue3)
				4'h0: temp3 = 8'b11000000;
				4'h1: temp3 = 8'b11111001;
				4'h2: temp3 = 8'b10100100;
				4'h3: temp3 = 8'b10110000;
				4'h4: temp3 = 8'b10011001;
				4'h5: temp3 = 8'b10010010;
				4'h6: temp3 = 8'b10000010;
				4'h7: temp3 = 8'b11111000;
				4'h8: temp3 = 8'b10000000;
				4'h9: temp3 = 8'b10010000;
				4'hA: temp3 = 8'b10001000;
				4'hb: temp3 = 8'b10000011;
				4'hC: temp3 = 8'b11000110;
				4'hd: temp3 = 8'b10100001;
				4'hE: temp3 = 8'b10000110;
				4'hF: temp3 = 8'b10001110;
				default: temp3 = 8'b11000000;
				endcase
			end
		end
		
		// Strobing
		if(count <= 1500)
		begin
			anodes = 4'b0111;
			cathods = temp0;
			count = count + 1;
		end
		else if(count <= 3000)
		begin
			anodes = 4'b1011;
			cathods = temp1;
			count = count + 1;
		end
		else if(count <= 4500)
		begin
			anodes = 4'b1101;
			cathods = temp2;
			count = count + 1;
		end
		else if(count <= 6000)
		begin
			anodes = 4'b1110;
			cathods = temp3;
			count = count + 1;
		end
		else
		begin
			count = 0;
		end
	end
endmodule

// EOF