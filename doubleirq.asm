.pc = $0801
:BasicUpstart(main)

.pc = $2000		//Assemble to $2000
main: 
         sei		//Disable IRQ's
         lda #$7f	//Disable CIA IRQ's
         sta $dc0d
         sta $dd0d

         lda #$35	//Bank out kernal and basic
         sta $01	//$e000-$ffff
 
         lda #<irq1	//Install RASTER IRQ
         ldx #>irq1	//into Hardware
         sta $fffe	//Interrupt Vector
         stx $ffff
 
 
         lda #$01	//Enable RASTER IRQs
         sta $d01a
         lda #$34	//IRQ on line 52
         sta $d012
         lda #$1b	//Clear the High bit (lines 256-318)
         sta $d011
         lda #$0e	//Set Background
         sta $d020	//and Border colors
         lda #$06
         sta $d021
         lda #$00
         sta $d015	//turn off sprites
 
         jsr clrscreen
         jsr clrcolor
         jsr printtext
 
         asl $d019	// Ack any previous raster interrupt
         bit $dc0d   	// reading the interrupt control registers 
         bit $dd0d	// clears them
 
         cli		//Allow IRQ's
 
         jmp *		//Endless Loop
 
//===========================================================================================
// Main interrupt handler
// [x] denotes the number of cycles 
//=========================================================================================== 
irq1:
			//The CPU cycles spent to get in here		[7]
         sta reseta1	//Preserve A,X and Y				[4]
         stx resetx1	//Registers					[4]
         sty resety1	//using self modifying code			[4]
 
         lda #<irq2	//Set IRQ Vector				[4]
         ldx #>irq2	//to point to the				[4]
			//next part of the	
         sta $fffe	//Stable IRQ					[4]
         stx $ffff   	//						[4]
         inc $d012	//set raster interrupt to the next line		[6]
         asl $d019	//Ack raster interrupt				[6]
         tsx		//Store the stack pointer! It points to the	[2]
         cli		//return information of irq1.			[2]
         		//Total spent cycles up to this point		[51]
         nop		//						[53]
         nop		//						[55]
         nop		//						[57]
         nop		//						[59]
         nop		//Execute nop's					[61]
         nop		//until next RASTER				[63]
         nop		//IRQ Triggers					

//===========================================================================================
// Part 2 of the Main interrupt handler
//===========================================================================================                  
irq2:
         txs		//Restore stack pointer to point the the return
			//information of irq1, being our endless loop.
	
         ldx #$09	//Wait exactly 9 * (2+3) cycles so that the raster line
         dex		//is in the border				[2]
         bne *-1							[3]
 
         lda #$00	//Set the screen and border colors
         ldx #$05
         sta $d020	
         stx $d021
 
         lda #<irq3	//Set IRQ to point
         ldx #>irq3	//to subsequent IRQ
         ldy #$68	//at line $68
         sta $fffe
         stx $ffff
         sty $d012
         asl $d019	//Ack RASTER IRQ
 
lab_a1:	lda #$00	//Reload A,X,and Y
.label reseta1 = lab_a1+1

lab_x1:	ldx #$00
.label resetx1 = lab_x1+1

lab_y1:	ldy #$00
.label	resety1 = lab_y1+1
 
         rti		//Return from IRQ

//===========================================================================================
// Part 3 of the Main interrupt handler
//===========================================================================================           
irq3:
         sta reseta2	//Preserve A,X,and Y
         stx resetx2	//Registers
         sty resety2         

         ldy #$13	//Waste time so this
         dey		//IRQ does not try	[2]
         bne *-1	//to reoccur on the	[3]
			//same line!
         
         lda #$0f	//More colors
         ldx #$07 
         sta $d020	//Cool! subsequent
         stx $d021	//IRQ's are also
 
         lda #<irq1	//Reset Vectors to
         ldx #>irq1	//first IRQ again
         ldy #$34	//at line $34
         sta $fffe
         stx $ffff
         sty $d012
         asl $d019	//Ack RASTER IRQ
 
lab_a2:	lda #$00	//Reload A,X,and Y
.label reseta2  = lab_a2+1

lab_x2:	ldx #$00
.label resetx2  = lab_x2+1

lab_y2:	ldy #$00
.label resety2  = lab_y2+1
 
         rti		//Return from IRQ

//===========================================================================================
// Clrscreen - clears the screen memory at $0400
//===========================================================================================         
clrscreen:
	lda #$20	//Clear the screen
	ldx #$00
clrscr:	sta $0400,x
	sta $0500,x
	sta $0600,x
	sta $0700,x
	dex
	bne clrscr
	rts

//===========================================================================================
// Clrcolor - clears the color memory at $d800
//===========================================================================================         
clrcolor:
         lda #$03    //Clear color memory
         ldx #$00
clrcol:	sta $d800,x
         sta $d900,x
         sta $da00,x
         sta $db00,x
         dex
         bne clrcol
         rts

//===========================================================================================
// Printtext - prints a text in lower case
//===========================================================================================                   
printtext:
         lda #$16    //C-set = lower case
         sta $d018
 
         ldx #$00
moretext: lda text1,x
 
         bpl lower   //upper case ?
         eor #$80    //yes
 
         bne lower+2
 
lower:    and #$3f    //lower case
         sta $0450,x
         inx
         cpx #$78
         bne moretext
exit:     rts
 

//===========================================================================================
// Data
//===========================================================================================         
text1:
         .text "Stable Raster IRQ sourc"
         .text "e (PAL/NTSC)     "
         .text "All Code by Fungus 1996"
         .text "                 "
         .text "Feel free to use and mo"
         .text "dify this code :)"