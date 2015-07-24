.const image0= $ce00   // fIRST GRAPHICS PIECE TO SHOW
.const image1= $cf00   // sECOND PIECE
.const tech=   $cd00   // X-SHIFT
.const raster= $fa     // rASTERLINE FOR THE INTERRUPT
.const dummy=  $cfff   // dUMMY-ADDRESS FOR TIMING (REFER TO MISSING_CYCLES-ARTICLE)

.pc = $0801
:BasicUpstart(main)

.pc = $c000
main:
        sei             // dISABLE INTERRUPTS
        lda #$7f        // dISABLE TIMER INTERRUPTS (cia)
        sta $dc0d
        lda #$01        // eNABLE RASTER INTERRUPTS (vic)
        sta $d01a
        sta $d015       // eNABLE THE TIMING SPRITE
        lda #<irq
        sta $0314       // iNTERRUPT VECTOR TO OUR ROUTINE
        lda #>irq
        sta $0315
        lda #raster     // sET THE RASTER COMPARE (9TH BIT WILL BE SET
        sta $d012       //  INSIDE THE RASTER ROUTINE)
        lda #raster-20  // sPRITE IS SITUATED 20 LINES BEFORE THE INTERRUPT
        sta $d001

        ldx #111
        ldy #0
        sty $d017       // dISABLE Y-EXPAND
        lda #$32
        sta $01         // sELECT cHARACTER rom
loop0:  lda $d000,x
        sta image0,y    // cOPY A PART OF THE CHARSET TO BE THE GRAPHICS
        sta image0+112,y
        lda $d800,x
        sta image1,y
        sta image1+112,y
        iny             // uNTIL WE COPIED ENOUGH
        dex
        bpl loop0
        lda #$37        // cHAR rom OUT OF THE ADDRESS SPACE
        sta $01

        ldy #15
loop1:  lda xpos,y      // tAKE A HALF OF A SINUS AND MIRROR IT TO MAKE
        sta tech,y      //  A WHOLE CYCLE AND THEN COPY IT AS MANY TIMES
        sta tech+32,y   //   AS NECASSARY
        lda #24
        sec
        sbc xpos,y
        sta tech+16,y
        sta tech+48,y
        dey
        bpl loop1
        ldy #64
loop2:  lda tech,y
        sta tech+64,y
        sta tech+128,y
        dey
        bpl loop2
        cli             // eNABLE INTERRUPTS
        rts             // rETURN TO BASIC (?)


irq:    lda #$13        // oPEN THE BOTTOM BORDER (TOP BORDER WILL OPEN TOO)
        sta $d011
        nop
        ldy #111	// rEDUCE FOR ntsc ?
        inc dummy       // dO THE TIMING WITH A SPRITE
        bit $ea         // wAIT A BIT (ADD A nop FOR ntsc)

loop3:  lda tech,y      // dO THE X-SHIFT
        sta $d016
first:  ldx image0,y    // lOAD THE GRAPHICS TO REGISTERS
second: lda image1,y
        sta $3fff       // aLTERNATE THE GRAPHICS
        stx $3fff
        sta $3fff
        stx $3fff
        sta $3fff
        stx $3fff
        sta $3fff
        stx $3fff
        sta $3fff
        stx $3fff
        lda #0          // tHROW AWAY 2 CYCLES (ADD A nop FOR ntsc)
        dey
        bpl loop3

        sta $3fff       // cLEAR THE GRAPHICS
        lda #8
        sta $d016       // X-SCROLL TO NORMAL
        lda #$1b
        sta $d011       // nORMAL SCREEN (BE READY TO OPEN THE BORDER AGAIN)
        lda #111
        dec first+1     // mOVE THE GRAPHICS BY CHANGING THE LOW BYTE OF THE
        bpl over        //  LOAD INSTRUCTION
        sta first+1
over:   sec
        sbc first+1
        sta second+1    // aNOTHER GRAPHICS GOES TO OPPOSITE DIRECTION
        lda loop3+1     // mOVE THE X-SHIFT ALSO
        sec
        sbc #2
        and #31         // sINUS CYCLE IS 32 BYTES
        sta loop3+1

        lda #1
        sta $d019       // aCKNOWLEDGE THE RASTER INTERRUPT
        jmp $ea31       // JUMP TO THE NORMAL IRQ-HANDLER

xpos:   .byte $c,$c,$d,$e,$e,$f,$f,$f,$f,$f,$f,$f,$e,$e,$d,$c
        .byte $c,$b,$a,$9,$9,$8,$8,$8,$8,$8,$8,$8,$9,$9,$a,$b
                        // HALF OF THE SINUS
