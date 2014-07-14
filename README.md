GuessingGame
============

NAME               : ANKIT SARRAF

PROJECT 2 (CSE 590): GUESSING GAME

UB ID              : sarrafan

DESCRIPTION        : STEPS TO REALIZE PROJECT 2 (Understanding with an example)

1) Start FPGA Board

2) Install the program on the Board

3) 7 Segments displays = "PL 1"

4) Select Slider Switches 0-3 to set corresponding Anodes on 7 Segments

  - Button 0 => 1

  - Button 1 => 2

  - Button 2 => 4

  - Button 3 => 8

5) Set Seven Segment to "8421"

6) Push the Slider Switch 4 = 1

7) "PL 2" displayed on 7 Segment

8) Player 2's turn

9) Set 7 Segment to "8420"

10) Put Slider Switch 6 = 1 to record the guess attempt number

11) Put slider switch 6 = 0

12) Put Slider switch 5 = 1 to compare with the player 1 input

13) It will show the " 2LO" on the 7 Segment display

14) Put the Slider Switch 5 = 0

15) Change the Slider 0-3 and Button 0-3 according to new input

16) Set the Slider Switch to "8422"

17) Put Slider Switch 6 = 1 to record the guess attempt number

18) Put slider switch 6 = 0

19) Put Slider switch 5 = 1 to compare with the player 1 input

20) It will show the " 2HI" on the 7 Segment display

21) Put the Slider Switch 5 = 0

22) Change the Slider 0-3 and Button 0-3 according to new input

23) Make the new input to "8421" (Correct input)

24) Make the slider Switch 6 = 1 -> Increments the attempt number

25) Put slider switch 6 = 0

26) Put Slider switch 5 = 1 to compare with the player 1 input

27) Leds Blink. Seven segments displays "   3" (Total number of Inputs)

28) Now a new game can be started by changing the (Only when the Player 1 finishes the first game)

  - slider switch 5 = 0

  - slider switch 4 = 0

    (Required to be done in order)



NOTE: Push Buttons might be required to be pressed mulltiple times to set the seven segment to particular value
