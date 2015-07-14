// C64 game code - routines for games on the C64
// Author: Wouter Bovelander
// Date: 2015
// Environment: KickAssembler 3.40

//--------------------------------------------------
// Include constants
//--------------------------------------------------
.import source	"vic2constants.asm"
.import source	"cia.asm"

//--------------------------------------------------
// Include character set and screen definitions
//--------------------------------------------------
.import source	"charset2.asm"
.import source 	"screens.asm"

//--------------------------------------------------
//  sprite data
//--------------------------------------------------
.import source	"sprite_data.asm"

//--------------------------------------------------
// Main program with Basic starter
//--------------------------------------------------
.pc= $0801 "Basic startup"
:BasicUpstart(start)		
.pc= $0810 "Main Program"
start:		jsr 	init	
		lda 	#0				// select screen number
		jsr	print_welcome
		jsr 	draw_screen
		jsr 	set_interrupt
		jmp 	*				// infinite loop
//--------------------------------------------------
// End Main program
//--------------------------------------------------

//--------------------------------------------------
// Init
// Initialise screen, charset and memory setup
//--------------------------------------------------
init:
		lda 	#00 	
		sta 	BORDER_COLOR
		sta 	SCREEN_COLOR		// set screen to black
		//jsr 	print_welcome		// print welcome message and clear screen
		jsr 	setup_sprite		// initialise sprite 1
						// install new character set
		lda 	#%11000 		// set screen to $0400, chars set to $2000
		sta 	$d018	
						// switch off basic rom
		lda 	#$2f			// set bits 0-2 to 1 for read/write
		sta 	0		
		lda 	#$36			// set bits 0-2 to %110 to switch off BASIC ROM
		sta 	1		
		rts

//--------------------------------------------------
//  set new interrupt handler
//--------------------------------------------------
set_interrupt:
		sei
		ldy 	#$7f				// $7f = %01111111
		sty 	CIA1				// Turn off CIA 1  Timer interrupts
		sty 	CIA2				// Turn off CIA 2  Timer interrupts
		lda 	CIA1				// cancel all CIA-IRQs in queue/unprocessed
		lda 	CIA2				// cancel all CIA-IRQs in queue/unprocessed
		lda 	#<int	
		sta 	$0314	
		lda 	#>int	
		sta 	$0315				// setup the vector for our own irq
		lda 	#75 				// set rasterline to where the
		sta 	RASTER_LINE			// interrupt should occur
		lda 	#01 				// bit 0 is raster interrupt
		sta 	INTERRUPT_ENABLE	// request a raster interrupt from vic2
		lda 	RASTER_LINE_MSB		// Bit#7 of $d011 is basically...
		and 	#$7f				// ...the 9th Bit for $d012
		sta 	RASTER_LINE_MSB		// we need to make sure it is set to zero
		lda 	#0		
		sta 	curr				// set table pointer to 0
		cli
		rts

//--------------------------------------------------
int: 		lda 	INTERRUPT_EVENT
		and 	#$01	
		sta 	INTERRUPT_EVENT// has the raster interrupt happened?
		bne 	irq 	
		jmp 	$ea81	
//--------------------------------------------------
irq: 		jsr 	animate		// move along the x axis
		ldx 	curr		// load table index
		lda 	tb_ypos,x	// get y position raster position
		sta 	SPRITE_0_Y	// set y position
		lda 	tb_shp,x	// get next sprite pointer
		sta 	$07f8		// store $0a00 = $28*#64
		lda 	tb_rst,x	// get next raster line
		sta 	RASTER_LINE
		lda 	tb_col,x	// get next color
		sta 	SPRITE_SOLID_ALL_2
		inc 	curr		// increase cursor
		lda 	curr	
		cmp 	#4		
		bne 	end 	
		lda 	#0		
		sta 	curr	
end: 		jmp 	$ea81

//--------------------------------------------------
//  Import the rest of the code
//--------------------------------------------------
.import source "game_code.asm"


