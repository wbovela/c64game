//scrapwriter charset
.pc= $2000
charset:
        .byte    $20,$3e,$41,$5d,$51,$5d,$41,$3e // character 0
        .byte    $00,$3f,$21,$21,$7f,$61,$61,$61 // character 1
        .byte    $00,$7e,$42,$42,$7f,$61,$61,$7f // character 2
        .byte    $00,$3f,$21,$20,$60,$60,$61,$7f // character 3
        .byte    $00,$3f,$21,$21,$61,$61,$61,$7f // character 4
        .byte    $00,$3f,$20,$20,$7c,$60,$60,$7f // character 5
        .byte    $00,$3f,$20,$20,$7c,$60,$60,$60 // character 6
        .byte    $00,$3f,$21,$20,$67,$61,$61,$7f // character 7
        .byte    $00,$21,$21,$21,$7f,$61,$61,$61 // character 8
        .byte    $00,$04,$04,$04,$0c,$0c,$0c,$0c // character 9
        .byte    $00,$01,$01,$01,$03,$43,$43,$7f // character 10
        .byte    $00,$21,$23,$26,$7c,$66,$63,$61 // character 11
        .byte    $00,$20,$20,$20,$60,$60,$60,$7f // character 12
        .byte    $00,$7f,$49,$49,$69,$61,$61,$61 // character 13
        .byte    $00,$21,$31,$39,$6d,$67,$63,$61 // character 14
        .byte    $00,$3f,$23,$23,$61,$61,$61,$7f // character 15
        .byte    $00,$3f,$21,$21,$7f,$60,$60,$60 // character 16
        .byte    $00,$3f,$23,$23,$61,$61,$62,$7d // character 17
        .byte    $00,$7e,$42,$42,$7f,$61,$61,$61 // character 18
        .byte    $00,$7f,$41,$40,$7f,$03,$43,$7f // character 19
        .byte    $00,$7f,$08,$08,$18,$18,$18,$18 // character 20
        .byte    $00,$21,$21,$21,$61,$61,$61,$7f // character 21
        .byte    $00,$61,$61,$61,$63,$36,$1c,$08 // character 22
        .byte    $00,$21,$21,$21,$61,$6d,$7f,$73 // character 23
        .byte    $00,$41,$23,$16,$1c,$34,$62,$41 // character 24
        .byte    $00,$61,$61,$61,$7f,$01,$01,$7f // character 25
        .byte    $00,$7f,$03,$03,$1c,$60,$60,$7f // character 26
        .byte    $00,$3c,$30,$30,$30,$30,$30,$3c // character 27
        .byte    $00,$0c,$12,$30,$7c,$30,$62,$fc // character 28
        .byte    $00,$3c,$0c,$0c,$0c,$0c,$0c,$3c // character 29
        .byte    $00,$00,$18,$3c,$7e,$18,$18,$18 // character 30
        .byte    $18,$00,$10,$30,$7f,$7f,$30,$10 // character 31
        .byte    $00,$00,$00,$00,$00,$00,$00,$00 // character 32
        .byte    $00,$08,$08,$08,$18,$18,$00,$18 // character 33
        .byte    $00,$63,$63,$63,$00,$00,$00,$00 // character 34
        .byte    $00,$36,$7f,$36,$36,$36,$7f,$36 // character 35
        .byte    $00,$08,$7f,$68,$7f,$0b,$7f,$08 // character 36
        .byte    $00,$61,$61,$02,$1c,$20,$43,$43 // character 37
        .byte    $00,$3c,$66,$3c,$38,$67,$66,$3f // character 38
        .byte    $00,$0c,$0c,$0c,$00,$00,$00,$00 // character 39
        .byte    $00,$0c,$18,$30,$30,$30,$18,$0c // character 40
        .byte    $00,$30,$18,$0c,$0c,$0c,$18,$30 // character 41
        .byte    $00,$08,$2a,$1c,$7f,$1c,$2a,$08 // character 42
        .byte    $00,$08,$08,$08,$7f,$08,$08,$08 // character 43
        .byte    $00,$00,$00,$00,$00,$00,$18,$18 // character 44
        .byte    $38,$00,$00,$00,$7f,$00,$00,$00 // character 45
        .byte    $00,$00,$00,$00,$00,$00,$18,$18 // character 46
        .byte    $00,$00,$03,$06,$0c,$18,$30,$60 // character 47
        .byte    $00,$7f,$7f,$63,$63,$63,$7f,$7f // character 48
        .byte    $00,$0c,$0c,$0c,$0c,$0c,$0c,$0c // character 49
        .byte    $00,$7f,$7f,$03,$7f,$60,$7f,$7f // character 50
        .byte    $00,$7f,$7f,$03,$0f,$03,$7f,$7f // character 51
        .byte    $00,$63,$63,$63,$7f,$03,$03,$03 // character 52
        .byte    $00,$7f,$7f,$60,$7f,$03,$7f,$7f // character 53
        .byte    $00,$7f,$7f,$60,$7f,$63,$7f,$7f // character 54
        .byte    $00,$7f,$7f,$03,$03,$03,$03,$03 // character 55
        .byte    $00,$7f,$7f,$63,$7f,$63,$7f,$7f // character 56
        .byte    $00,$7f,$7f,$63,$7f,$03,$7f,$7f // character 57
        .byte    $00,$00,$00,$18,$00,$00,$18,$00 // character 58
        .byte    $00,$00,$00,$18,$00,$00,$18,$18 // character 59
        .byte    $38,$0e,$18,$30,$60,$30,$18,$0e // character 60
        .byte    $00,$00,$7f,$7f,$00,$7f,$7f,$00 // character 61
        .byte    $00,$70,$18,$0c,$06,$0c,$18,$70 // character 62
        .byte    $00,$7f,$63,$03,$1f,$00,$18,$18 // character 63
        .byte    $00,$00,$00,$00,$ff,$ff,$00,$00 // character 64
        .byte    $00,$00,$00,$7f,$41,$7f,$41,$41 // character 65
        .byte    $00,$00,$00,$7e,$42,$7f,$41,$7f // character 66
        .byte    $00,$00,$00,$7f,$40,$40,$40,$7f // character 67
        .byte    $00,$00,$00,$7e,$41,$41,$41,$7e // character 68
        .byte    $00,$00,$00,$7f,$40,$78,$40,$7f // character 69
        .byte    $00,$00,$00,$7f,$40,$78,$40,$40 // character 70
        .byte    $00,$00,$00,$7f,$40,$4f,$41,$7f // character 71
        .byte    $00,$00,$00,$41,$41,$7f,$41,$41 // character 72
        .byte    $00,$00,$00,$08,$08,$08,$08,$08 // character 73
        .byte    $00,$00,$00,$01,$01,$01,$41,$7f // character 74
        .byte    $00,$00,$00,$41,$42,$7c,$42,$41 // character 75
        .byte    $00,$00,$00,$40,$40,$40,$40,$7f // character 76
        .byte    $00,$00,$00,$41,$63,$55,$49,$41 // character 77
        .byte    $00,$00,$00,$41,$61,$5d,$43,$41 // character 78
        .byte    $00,$00,$00,$7f,$41,$41,$41,$7f // character 79
        .byte    $00,$00,$00,$7f,$41,$7f,$40,$40 // character 80
        .byte    $00,$00,$00,$7f,$41,$45,$43,$7f // character 81
        .byte    $00,$00,$00,$7f,$41,$7f,$42,$43 // character 82
        .byte    $00,$00,$00,$7f,$40,$7f,$01,$7f // character 83
        .byte    $00,$00,$00,$7f,$08,$08,$08,$08 // character 84
        .byte    $00,$00,$00,$41,$41,$41,$41,$7f // character 85
        .byte    $00,$00,$00,$41,$41,$22,$14,$08 // character 86
        .byte    $00,$00,$00,$41,$49,$55,$63,$41 // character 87
        .byte    $00,$00,$00,$41,$22,$1c,$22,$41 // character 88
        .byte    $00,$00,$00,$41,$41,$7f,$01,$7f // character 89
        .byte    $00,$00,$00,$7f,$02,$1c,$20,$7f // character 90
        .byte    $00,$18,$18,$18,$ff,$ff,$18,$18 // character 91
        .byte    $18,$c0,$c0,$30,$30,$c0,$c0,$30 // character 92
        .byte    $30,$18,$18,$18,$18,$18,$18,$18 // character 93
        .byte    $18,$00,$00,$03,$3e,$76,$36,$36 // character 94
        .byte    $00,$ff,$7f,$3f,$1f,$0f,$07,$03 // character 95
        .byte    $01,$00,$00,$00,$00,$00,$00,$00 // character 96
        .byte    $00,$f0,$f0,$f0,$f0,$f0,$f0,$f0 // character 97
        .byte    $f0,$00,$00,$00,$00,$ff,$ff,$ff // character 98
        .byte    $ff,$ff,$00,$00,$00,$00,$00,$00 // character 99
        .byte    $00,$00,$00,$00,$00,$00,$00,$00 // character 100
        .byte    $ff,$c0,$c0,$c0,$c0,$c0,$c0,$c0 // character 101
        .byte    $c0,$cc,$cc,$33,$33,$cc,$cc,$33 // character 102
        .byte    $33,$03,$03,$03,$03,$03,$03,$03 // character 103
        .byte    $03,$00,$00,$00,$00,$cc,$cc,$33 // character 104
        .byte    $33,$ff,$fe,$fc,$f8,$f0,$e0,$c0 // character 105
        .byte    $80,$03,$03,$03,$03,$03,$03,$03 // character 106
        .byte    $03,$18,$18,$18,$1f,$1f,$18,$18 // character 107
        .byte    $18,$00,$00,$00,$00,$0f,$0f,$0f // character 108
        .byte    $0f,$18,$18,$18,$1f,$1f,$00,$00 // character 109
        .byte    $00,$00,$00,$00,$f8,$f8,$18,$18 // character 110
        .byte    $18,$00,$00,$00,$00,$00,$00,$ff // character 111
        .byte    $ff,$00,$00,$00,$1f,$1f,$18,$18 // character 112
        .byte    $18,$18,$18,$18,$ff,$ff,$00,$00 // character 113
        .byte    $00,$00,$00,$00,$ff,$ff,$18,$18 // character 114
        .byte    $18,$18,$18,$18,$f8,$f8,$18,$18 // character 115
        .byte    $18,$c0,$c0,$c0,$c0,$c0,$c0,$c0 // character 116
        .byte    $c0,$e0,$e0,$e0,$e0,$e0,$e0,$e0 // character 117
        .byte    $e0,$07,$07,$07,$07,$07,$07,$07 // character 118
        .byte    $07,$ff,$ff,$00,$00,$00,$00,$00 // character 119
        .byte    $00,$ff,$ff,$ff,$00,$00,$00,$00 // character 120
        .byte    $00,$00,$00,$00,$00,$00,$ff,$ff // character 121
        .byte    $ff,$03,$03,$03,$03,$03,$03,$ff // character 122
        .byte    $ff,$00,$00,$00,$00,$f0,$f0,$f0 // character 123
        .byte    $f0,$0f,$0f,$0f,$0f,$00,$00,$00 // character 124
        .byte    $00,$18,$18,$18,$f8,$f8,$00,$00 // character 125
        .byte    $00,$f0,$f0,$f0,$f0,$00,$00,$00 // character 126
        .byte    $00,$f0,$f0,$f0,$f0,$0f,$0f,$0f // character 127
        .byte    $0f,$c1,$be,$a2,$ae,$a2,$be,$c1 // character 128
        .byte    $ff,$c0,$de,$de,$80,$9e,$9e,$9e // character 129
        .byte    $ff,$81,$bd,$bd,$80,$9e,$9e,$80 // character 130
        .byte    $ff,$c0,$de,$df,$9f,$9f,$9e,$80 // character 131
        .byte    $ff,$c0,$de,$de,$9e,$9e,$9e,$80 // character 132
        .byte    $ff,$c0,$df,$df,$83,$9f,$9f,$80 // character 133
        .byte    $ff,$c0,$df,$df,$83,$9f,$9f,$9f // character 134
        .byte    $ff,$c0,$de,$df,$98,$9e,$9e,$80 // character 135
        .byte    $ff,$de,$de,$de,$80,$9e,$9e,$9e // character 136
        .byte    $ff,$fb,$fb,$fb,$f3,$f3,$f3,$f3 // character 137
        .byte    $ff,$fe,$fe,$fe,$fc,$bc,$bc,$80 // character 138
        .byte    $ff,$de,$dc,$d9,$83,$99,$9c,$9e // character 139
        .byte    $ff,$df,$df,$df,$9f,$9f,$9f,$80 // character 140
        .byte    $ff,$80,$b6,$b6,$96,$9e,$9e,$9e // character 141
        .byte    $ff,$de,$ce,$c6,$92,$98,$9c,$9e // character 142
        .byte    $ff,$c0,$dc,$dc,$9e,$9e,$9e,$80 // character 143
        .byte    $ff,$c0,$de,$de,$80,$9f,$9f,$9f // character 144
        .byte    $ff,$c0,$dc,$dc,$9e,$9e,$9d,$82 // character 145
        .byte    $ff,$81,$bd,$bd,$80,$9e,$9e,$9e // character 146
        .byte    $ff,$80,$be,$bf,$80,$fc,$bc,$80 // character 147
        .byte    $ff,$80,$f7,$f7,$e7,$e7,$e7,$e7 // character 148
        .byte    $ff,$de,$de,$de,$9e,$9e,$9e,$80 // character 149
        .byte    $ff,$9e,$9e,$9e,$9c,$c9,$e3,$f7 // character 150
        .byte    $ff,$de,$de,$de,$9e,$92,$80,$8c // character 151
        .byte    $ff,$be,$dc,$e9,$e3,$cb,$9d,$be // character 152
        .byte    $ff,$9e,$9e,$9e,$80,$fe,$fe,$80 // character 153
        .byte    $ff,$80,$fc,$fc,$e3,$9f,$9f,$80 // character 154
        .byte    $ff,$c3,$cf,$cf,$cf,$cf,$cf,$c3 // character 155
        .byte    $ff,$f3,$ed,$cf,$83,$cf,$9d,$03 // character 156
        .byte    $ff,$c3,$f3,$f3,$f3,$f3,$f3,$c3 // character 157
        .byte    $ff,$ff,$e7,$c3,$81,$e7,$e7,$e7 // character 158
        .byte    $e7,$ff,$ef,$cf,$80,$80,$cf,$ef // character 159
        .byte    $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff // character 160
        .byte    $ff,$f7,$f7,$f7,$e7,$e7,$ff,$e7 // character 161
        .byte    $ff,$9c,$9c,$9c,$ff,$ff,$ff,$ff // character 162
        .byte    $ff,$c9,$80,$c9,$c9,$c9,$80,$c9 // character 163
        .byte    $ff,$f7,$80,$97,$80,$f4,$80,$f7 // character 164
        .byte    $ff,$9e,$9e,$fd,$e3,$df,$bc,$bc // character 165
        .byte    $ff,$c3,$99,$c3,$c7,$98,$99,$c0 // character 166
        .byte    $ff,$f3,$f3,$f3,$ff,$ff,$ff,$ff // character 167
        .byte    $ff,$f3,$e7,$cf,$cf,$cf,$e7,$f3 // character 168
        .byte    $ff,$cf,$e7,$f3,$f3,$f3,$e7,$cf // character 169
        .byte    $ff,$f7,$d5,$e3,$80,$e3,$d5,$f7 // character 170
        .byte    $ff,$f7,$f7,$f7,$80,$f7,$f7,$f7 // character 171
        .byte    $ff,$ff,$ff,$ff,$ff,$ff,$e7,$e7 // character 172
        .byte    $c7,$ff,$ff,$ff,$80,$ff,$ff,$ff // character 173
        .byte    $ff,$ff,$ff,$ff,$ff,$ff,$e7,$e7 // character 174
        .byte    $ff,$ff,$fc,$f9,$f3,$e7,$cf,$9f // character 175
        .byte    $ff,$80,$80,$9c,$9c,$9c,$80,$80 // character 176
        .byte    $ff,$f3,$f3,$f3,$f3,$f3,$f3,$f3 // character 177
        .byte    $ff,$80,$80,$fc,$80,$9f,$80,$80 // character 178
        .byte    $ff,$80,$80,$fc,$f0,$fc,$80,$80 // character 179
        .byte    $ff,$9c,$9c,$9c,$80,$fc,$fc,$fc // character 180
        .byte    $ff,$80,$80,$9f,$80,$fc,$80,$80 // character 181
        .byte    $ff,$80,$80,$9f,$80,$9c,$80,$80 // character 182
        .byte    $ff,$80,$80,$fc,$fc,$fc,$fc,$fc // character 183
        .byte    $ff,$80,$80,$9c,$80,$9c,$80,$80 // character 184
        .byte    $ff,$80,$80,$9c,$80,$fc,$80,$80 // character 185
        .byte    $ff,$ff,$ff,$e7,$ff,$ff,$e7,$ff // character 186
        .byte    $ff,$ff,$ff,$e7,$ff,$ff,$e7,$e7 // character 187
        .byte    $c7,$f1,$e7,$cf,$9f,$cf,$e7,$f1 // character 188
        .byte    $ff,$ff,$80,$80,$ff,$80,$80,$ff // character 189
        .byte    $ff,$8f,$e7,$f3,$f9,$f3,$e7,$8f // character 190
        .byte    $ff,$80,$9c,$fc,$e0,$ff,$e7,$e7 // character 191
        .byte    $ff,$ff,$ff,$ff,$00,$00,$ff,$ff // character 192
        .byte    $ff,$ff,$ff,$80,$be,$80,$be,$be // character 193
        .byte    $ff,$ff,$ff,$81,$bd,$80,$be,$80 // character 194
        .byte    $ff,$ff,$ff,$80,$bf,$bf,$bf,$80 // character 195
        .byte    $ff,$ff,$ff,$81,$be,$be,$be,$81 // character 196
        .byte    $ff,$ff,$ff,$80,$bf,$87,$bf,$80 // character 197
        .byte    $ff,$ff,$ff,$80,$bf,$87,$bf,$bf // character 198
        .byte    $ff,$ff,$ff,$80,$bf,$b0,$be,$80 // character 199
        .byte    $ff,$ff,$ff,$be,$be,$80,$be,$be // character 200
        .byte    $ff,$ff,$ff,$f7,$f7,$f7,$f7,$f7 // character 201
        .byte    $ff,$ff,$ff,$fe,$fe,$fe,$be,$80 // character 202
        .byte    $ff,$ff,$ff,$be,$bd,$83,$bd,$be // character 203
        .byte    $ff,$ff,$ff,$bf,$bf,$bf,$bf,$80 // character 204
        .byte    $ff,$ff,$ff,$be,$9c,$aa,$b6,$be // character 205
        .byte    $ff,$ff,$ff,$be,$9e,$a2,$bc,$be // character 206
        .byte    $ff,$ff,$ff,$80,$be,$be,$be,$80 // character 207
        .byte    $ff,$ff,$ff,$80,$be,$80,$bf,$bf // character 208
        .byte    $ff,$ff,$ff,$80,$be,$ba,$bc,$80 // character 209
        .byte    $ff,$ff,$ff,$80,$be,$80,$bd,$bc // character 210
        .byte    $ff,$ff,$ff,$80,$bf,$80,$fe,$80 // character 211
        .byte    $ff,$ff,$ff,$80,$f7,$f7,$f7,$f7 // character 212
        .byte    $ff,$ff,$ff,$be,$be,$be,$be,$80 // character 213
        .byte    $ff,$ff,$ff,$be,$be,$dd,$eb,$f7 // character 214
        .byte    $ff,$ff,$ff,$be,$b6,$aa,$9c,$be // character 215
        .byte    $ff,$ff,$ff,$be,$dd,$e3,$dd,$be // character 216
        .byte    $ff,$ff,$ff,$be,$be,$80,$fe,$80 // character 217
        .byte    $ff,$ff,$ff,$80,$fd,$e3,$df,$80 // character 218
        .byte    $ff,$e7,$e7,$e7,$00,$00,$e7,$e7 // character 219
