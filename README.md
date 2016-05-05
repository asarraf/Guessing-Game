Guessing Game
=============
<b>NAME                  :</b> Ankit Sarraf<br />
<b>PROJECT 2 (CSE 590)   :</b> Guessing Game<br />
<b>PROGRAMMNING LANGUAGE :</b> Verilog<br />
<b>DESCRIPTION           :</b> Number Guessing Game developed using Verilog<br />
<b>SCHOOL                :</b> State University of New York at Buffalo (SUNY Buffalo)

Test Flow:
----------
1) Switch on the FPGA Board<br />
2) Install the program on the Board<br />
3) 7 Segments displays = "PL 1"<br />
4) Select Slider Switches 0-3 to set corresponding Anodes on 7 Segments<br />
- Button 0 => 1<br />
- Button 1 => 2<br />
- Button 2 => 4<br />
- Button 3 => 8<br />

5) Set Seven Segment to "8421"<br />
6) Push the Slider Switch 4 = 1<br />
7) "PL 2" displayed on 7 Segment<br />
8) Player 2's turn<br />
9) Set 7 Segment to "8420"<br />
10) Put Slider Switch 6 = 1 to record the guess attempt number<br />
11) Put slider switch 6 = 0<br />
12) Put Slider switch 5 = 1 to compare with the player 1 input<br />
13) It will show the " 2LO" on the 7 Segment display<br />
14) Put the Slider Switch 5 = 0<br />
15) Change the Slider 0-3 and Button 0-3 according to new input<br />
16) Set the Slider Switch to "8422"<br />
17) Put Slider Switch 6 = 1 to record the guess attempt number<br />
18) Put slider switch 6 = 0<br />
19) Put Slider switch 5 = 1 to compare with the player 1 input<br />
20) It will show the " 2HI" on the 7 Segment display<br />
21) Put the Slider Switch 5 = 0<br />
22) Change the Slider 0-3 and Button 0-3 according to new input<br />
23) Make the new input to "8421" (Correct input)<br />
24) Make the slider Switch 6 = 1 -> Increments the attempt number<br />
25) Put slider switch 6 = 0<br />
26) Put Slider switch 5 = 1 to compare with the player 1 input<br />
27) Leds Blink. Seven segments displays "   3" (Total number of Inputs)<br />
28) Now a new game can be started by changing the (Only when the Player 1 finishes the first game)<br />
- slider switch 5 = 0<br />
- slider switch 4 = 0<br />
  (Required to be done in order)


<b>NOTE:</b> Push Buttons might be required to be pressed mulltiple times to set the seven segment to particular value
