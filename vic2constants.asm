// VIC-II sprite registers
.const	VIC_BASE  = $D000
//screen colors
.const	BORDER_COLOR = $D020
.const	SCREEN_COLOR = $D021
//raster line
.const	RASTER_LINE = $D012                  // bits 0-7
.const	RASTER_LINE_MSB = $D011                  // bit 7 is MSB
//sprite colors registers
.const	SPRITE_MULTICOLOR_1 = $D025
.const	SPRITE_MULTICOLOR_2 = $D026
.const	SPRITE_MULTICOLOR_3_0 = $D027
.const	SPRITE_MULTICOLOR_3_1 = $D028
.const	SPRITE_MULTICOLOR_3_2 = $D029
.const	SPRITE_MULTICOLOR_3_3 = $D02A
.const	SPRITE_MULTICOLOR_3_4 = $D02B
.const	SPRITE_MULTICOLOR_3_5 = $D02C
.const	SPRITE_MULTICOLOR_3_6 = $D02D
.const	SPRITE_MULTICOLOR_3_7 = $D02E
//sprite enable
.const	SPRITE_ENABLE = $D015
//address holding pointer info to graphics area
.const	GRAPHICS_POINTER = $D018
//sprite pointers - relative to GRAPHICS_POINTER
//sprite data address / 64
.const	SPRITE_POINTER_0 = $07F8
.const	SPRITE_POINTER_1 = $07F9
.const	SPRITE_POINTER_2 = $07FA
.const	SPRITE_POINTER_3 = $07FB
.const	SPRITE_POINTER_4 = $07FC
.const	SPRITE_POINTER_5 = $07FD
.const	SPRITE_POINTER_6 = $07FE
.const	SPRITE_POINTER_7 = $07FF
//sprite screen locations
.const	SPRITE_0_X = $D000
.const	SPRITE_0_Y = $D001
.const	SPRITE_1_X = $D002
.const	SPRITE_1_Y = $D003
.const	SPRITE_2_X = $D004
.const	SPRITE_2_Y = $D005
.const	SPRITE_3_X = $D006
.const	SPRITE_3_Y = $D007
.const	SPRITE_4_X = $D008
.const	SPRITE_4_Y = $D009
.const	SPRITE_5_X = $D00A
.const	SPRITE_5_Y = $D00B
.const	SPRITE_6_X = $D00C
.const	SPRITE_6_Y = $D00D
.const	SPRITE_7_X = $D00E
.const	SPRITE_7_Y = $D00F
.const	SPRITE_MSB_X = $D010
//high res or multicolor
.const	SPRITE_HIRES = $D01C
//sprite size expanders
.const	SPRITE_DOUBLE_X = $D01D
.const	SPRITE_DOUBLY_Y = $D017
//sprite color settings
.const	SPRITE_SOLID_ALL_1 = $D025
.const	SPRITE_SOLID_ALL_2 = $D026
.const	SPRITE_SOLID_0 = $D027
.const	SPRITE_SOLID_1 = $D028
.const	SPRITE_SOLID_2 = $D029
.const	SPRITE_SOLID_3 = $D02A
.const	SPRITE_SOLID_4 = $D02B
.const	SPRITE_SOLID_5 = $D02C
.const	SPRITE_SOLID_6 = $D02D
.const	SPRITE_SOLID_7 = $D02E
//sprite priority over background
.const	SPRITE_BG_PRIORITY = $D01B
//collision detection
.const	SPRITE_COLL_SPRITE = $D01E
.const	SPRITE_COLL_BG = $D01F
//interrupt registers
.const	INTERRUPT_EVENT = $D019
.const	INTERRUPT_ENABLE = $D01A
