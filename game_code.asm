.importonce
// we need this for the labels
.import	source "screens.asm"

//--------------------------------------------------
// draw_screen
// Draw screen and color data
// @param a = screen number
//--------------------------------------------------
draw_screen:
{
		asl 			// shift left to multiply by 2
		tax 			// x = screen number now
		stx 	screen		// store it.
		lda 	tb_scrn,x	// store the low .byte
		sta 	$fb 		// in zero page
		inx
		lda 	tb_scrn,x	// store high .byte
		sta 	$fc 		// in zero page

		// first the color data to $d800
		ldy 	#$00	
!loop:		lda 	scr1_col,y	// $d800 - $d8ff
		sta 	$d800,y 
		lda 	scr1_col+$0100,y// $d900 - $d9ff
		sta 	$d800+$0100,y
		lda 	scr1_col+$0200,y// $da00 - $daff
		sta 	$d800+$0200,y
		lda 	scr1_col+$0300,y// $db00 - $dbff
		sta 	$d800+$0300,y

		// and the screen data
		//ldx 	screen		// take the screen number we stored
		lda 	tb_scrn,x	// get the high .byte of the screen data address
		sta 	$fc 		// restore high .byte of destination in zero page
					// now we can copy the screen data
		lda 	($fb),y 	// first $ff block from screen data source
		sta 	$0400,y 	// to screen memory
		inc 	$fc 		// and increase high .byte (adds $0100 like above)
		lda 	($fb),y 	// second $ff block
		sta 	$0400+$0100,y
		inc 	$fc 	
		lda 	($fb),y 	// third $ff block
		sta 	$0400+$0200,y
		inc 	$fc 	
		lda 	($fb),y 	// fourth $ff block
		sta 	$0400+$0300,y
		iny
		bne 	!loop-	
		rts
screen:		.byte	 0		 // stores the screen number
}
//--------------------------------------------------
//	 move sprite along x axis
//--------------------------------------------------
animate:	
{
		inc 	SPRITE_0_X
		lda 	SPRITE_0_X
		bne 	ex		
		lda 	#50 	
		sta 	SPRITE_0_X
		// switch screens
		lda 	screen
		jsr 	draw_screen
		lda 	screen
		beq 	one
		ldx 	#0
		stx	screen
		rts
one: 		ldx 	#1
 		stx 	screen
ex:		rts
screen:		.byte	0
}
		
//--------------------------------------------------
//	 initialise sprite 1
//--------------------------------------------------
setup_sprite:
		lda 	#1		// colors
		sta 	SPRITE_SOLID_ALL_1
		lda 	#11 	
		sta 	SPRITE_SOLID_ALL_2
		lda 	#15 	
		sta 	SPRITE_SOLID_0// set
		lda 	#64 	
		sta 	SPRITE_0_X// X-Position
		lda 	#$01	//
		sta 	SPRITE_ENABLE// Sprite 1 on
		sta 	SPRITE_HIRES// Multicolor
		rts
//--------------------------------------------------
//	 print welcome
//--------------------------------------------------
print_welcome:
		ldx 	#0		
!loop:		lda	welcome,x
		cmp 	#$ff	
		beq 	ex_loop 
		sta 	$0400,x	
		inx
		jmp 	!loop-	
ex_loop:	rts

//--------------------------------------------------
//  General tables and data
//--------------------------------------------------
welcome: 	.byte	147
		.text	"The Highlander"
		.byte	$FF

// tables
tb_rst:		.byte	121, 143, 187, 77// raster lines where interrupts happen
tb_ypos:	.byte	78, 122, 144, 189// y position of sprite
tb_col:		.byte	0, 6, 3, 2// color codes for sprites
tb_shp:		.byte	$28, $29, $28, $29// sprite shape pointers
tb_scrn: 	.word	$a400, $a800
curr:		.byte	0		// table pointers