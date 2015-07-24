//Opening the top + bottom borders
//inside an IRQ interrupt player
.pc = $0801
:BasicUpstart(main)
.pc = $0810
main:         
     
         sei
         lda #$02
         sta $d020
         lda #$00
         sta $d021
         lda #<irq1
         sta $314
         lda #>irq1
         sta $315
         lda #$7f
         sta $dc0d
         lda #$1b
         sta $d011
         lda #$01
         sta $d01a
         cli
         jmp *
irq1:    inc $d019
         lda #$00
         sta $d012
         lda #$00
         sta $d011
         lda #<irq2
         sta $314
         lda #>irq2
         sta $315
         jmp $ea7e
irq2:    inc $d019
         lda #$fa
         sta $d012
         lda #$1b //If you want to display a bitmap pic, use #$3b instead
         sta $d011
         lda #<irq1
         sta $314
         lda #>irq1
         sta $315
         jmp $ea7e