.pc = $0801
:BasicUpstart(main)

.pc = $2000    //Assemble to $2000
main: 
         sei         //Disable IRQ's
         lda #$7f    //Disable CIA IRQ's
         sta $dc0d
         sta $dd0d

         lda #$35    //Bank out kernal and basic
         sta $01     //$e000-$ffff
 
         lda #<irq1  //Install RASTER IRQ
         ldx #>irq1  //into Hardware
         sta $fffe   //Interrupt Vector
         stx $ffff
 
 
         lda #$01    //Enable RASTER IRQs
         sta $d01a
         lda #$34    //IRQ on line 52
         sta $d012
         lda #$1b    //High bit (lines 256-311)
         sta $d011
                     //NOTE double IRQ
                     //cannot be on or
                     //around a BAD LINE!
                     //(Fast Line)
 
         lda #$0e    //Set Background
         sta $d020   //and Border colors
         lda #$06
         sta $d021
         lda #$00
         sta $d015   //turn off sprites
 
         jsr clrscreen
         jsr clrcolor
         jsr printtext
 
         asl $d019   //Ack any previous
         bit $dc0d   //IRQ's
         bit $dd0d
 
         cli         //Allow IRQ's
 
         jmp *       //Endless Loop
 
 
irq1:
         sta reseta1 //Preserve A,X and Y
         stx resetx1 //Registers
         sty resety1 //VIA self modifying
                     //code
                     //(Faster than the
                     //STACK is!)
 
         lda #<irq2  //Set IRQ Vector
         ldx #>irq2  //to point to the
                     //next part of the
         sta $fffe   //Stable IRQ
         stx $ffff   //ON NEXT LINE!
         inc $d012
         asl $d019   //Ack RASTER IRQ
         tsx         //We want the IRQ
         cli         //To return to our
         nop         //endless loop
         nop         //NOT THE END OF
         nop         //THIS IRQ!
         nop
         nop         //Execute nop's
         nop         //until next RASTER
         nop         //IRQ Triggers
         nop
         nop         //2 cycles per
         nop         //instruction so
         nop         //we will be within
         nop         //1 cycle of RASTER
         nop         //Register change
         nop
irq2:
         txs         //Restore STACK
                     //Pointer
         ldx #$08    //Wait exactly 1
         dex         //lines worth of
         bne *-1     //cycles for compare
         bit $ea     //Minus compare
         nop         //cycles
 
         //nop  //<--- remove 1 NOP for PAL
 
         lda #$35    //RASTER change yet?
         cmp $d012
         beq start   //If no waste 1 more
                     //cycle
start:
         nop         //Some delay
         nop         //So stable can be
         nop         //seen
 
         lda #$00    //Colors
         ldx #$05
 
         sta $d020   //Here is the proof
         stx $d021
 
         lda #<irq3  //Set IRQ to point
         ldx #>irq3  //to subsequent IRQ
         ldy #$68    //at line $68
         sta $fffe
         stx $ffff
         sty $d012
         asl $d019   //Ack RASTER IRQ
 
lab_a1:	lda #$00    //Reload A,X,and Y
.label reseta1 = lab_a1+1       //registers

lab_x1:	ldx #$00
.label resetx1 = lab_x1+1

lab_y1:	ldy #$00
.label	resety1 = lab_y1+1
 
         rti         //Return from IRQ
 
irq3:
         sta reseta2 //Preserve A,X,and Y
         stx resetx2 //Registers
         sty resety2
 
         ldx #$15    //Waste some more
         dex         //time so effect
         bne *-1     //can be seen
         nop
 
         lda #$0f    //More colors
         ldx #$07
 
         sta $d020   //Cool! subsequent
         stx $d021   //IRQ's are also
                     //stable :-)
                     //Unless you are
                     //running realtime
                     //code :-)
 
         ldy #$13    //Waste time so this
         dey         //IRQ does not try
         bne *-1     //to reoccur on the
                     //same line!
 
         lda #<irq1  //Reset Vectors to
         ldx #>irq1  //first IRQ again
         ldy #$34    //at line $34
         sta $fffe
         stx $ffff
         sty $d012
         asl $d019   //Ack RASTER IRQ
 
lab_a2:	lda #$00    //Reload A,X,and Y
.label reseta2  = lab_a2+1       //registers

lab_x2:	ldx #$00
.label resetx2  = lab_x2+1

lab_y2:	ldy #$00
.label resety2  = lab_y2+1
 
         rti         //Return from IRQ
 
                     //Pound RESTORE to
                     //get back to Turbo
nmi:
         asl $d019   //Ack all IRQ's
         lda $dc0d
         lda $dd0d
         lda #$81    //reset CIA 1 IRQ
         ldx #$00    //remove raster IRQ
         ldy #$37    //reset MMU to roms
         sta $dc0d
         stx $d01a
         sty $01
         ldx #$ff    //clear the stack
         txs
         cli         //reenable IRQ's
         jmp $ea31   //back to basic
 
clrscreen:
         lda #$20    //Clear the screen
         ldx #$00
clrscr:	sta $0400,x
         sta $0500,x
         sta $0600,x
         sta $0700,x
         dex
         bne clrscr
         rts
clrcolor:
         lda #$03    //Clear color memory
         ldx #$00
clrcol:   sta $d800,x
         sta $d900,x
         sta $da00,x
         sta $db00,x
         dex
         bne clrcol
         rts
 
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
 
text1:
         .text "Stable Raster IRQ sourc"
         .text "e (PAL/NTSC)     "
         .text "All Code by Fungus 1996"
         .text "                 "
         .text "Feel free to use and mo"
         .text "dify this code :)"