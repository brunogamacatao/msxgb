;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module dos_mapper
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_DOS_JumpTable
	.globl _g_DOS_VarTable
	.globl _g_EXTBIO
	.globl _g_HOKVLD
	.globl _DOSMapper_Init
	.globl _DOSMapper_Alloc
	.globl _DOSMapper_Free
	.globl _DOSMapper_ReadByte
	.globl _DOSMapper_WriteByte
	.globl _DOSMapper_SetPage
	.globl _DOSMapper_SetPage0
	.globl _DOSMapper_SetPage1
	.globl _DOSMapper_SetPage2
	.globl _DOSMapper_GetPage
	.globl _DOSMapper_GetPage0
	.globl _DOSMapper_GetPage1
	.globl _DOSMapper_GetPage2
	.globl _DOSMapper_GetPage3
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_DOS_VarTable::
	.ds 2
_g_DOS_JumpTable::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:34: bool DOSMapper_Init()
;	---------------------------------
; Function DOSMapper_Init
; ---------------------------------
_DOSMapper_Init::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:64: __endasm;
	push	ix
	call	init_extbios
	pop	ix
	ret
	init_extbios:
	ld	a, (0xFB20)
	and	#0x01
	ret	z
	xor	a
	ld	d, #0x04
	ld	e, #0x01
	call	0xFFCA
	or	a
	ret	z
	ld	(_g_DOS_VarTable), hl
	xor	a
	ld	d, #0x04
	ld	e, #0x02
	call	0xFFCA
	or	a
	ret	z
	ld	(_g_DOS_JumpTable), hl
	ld	a, #0xFF
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:66: }
	ret
_g_HOKVLD	=	0xfb20
_g_EXTBIO	=	0xffca
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:70: bool DOSMapper_Alloc(u8 type, u8 slot, DOS_Segment* seg) // Stack: 4 bytes
;	---------------------------------
; Function DOSMapper_Alloc
; ---------------------------------
_DOSMapper_Alloc::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:96: __endasm;
	push	ix
	ld	b, l
	ld	hl, (_g_DOS_JumpTable)
	call	___sdcc_call_hl
	pop	ix
	jr	c, alloc_error
	pop	iy
	pop	hl
	ld	(hl), a
	inc	hl
	ld	a, b
	ld	(hl), a
	ld	a, #0xFF
	jp	(iy)
	alloc_error:
	xor	a
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:98: }
	pop	hl
	pop	bc
	jp	(hl)
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:102: bool DOSMapper_Free(u8 seg, u8 slot)
;	---------------------------------
; Function DOSMapper_Free
; ---------------------------------
_DOSMapper_Free::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:116: __endasm;
	push	ix
	ld	b, l
	ld	hl, (_g_DOS_JumpTable)
	ld	de, #0x03
	add	hl, de
	call	___sdcc_call_hl
	ld	a, #0
	adc	#0xFF
	pop	ix
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:118: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:122: u8 DOSMapper_ReadByte(u8 seg, u16 addr) // preserve BC, IX
;	---------------------------------
; Function DOSMapper_ReadByte
; ---------------------------------
_DOSMapper_ReadByte::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:133: __endasm;
	ex	de, hl
	ld	iy, (_g_DOS_JumpTable)
	ld	de, #0x06
	add	iy, de
	call	___sdcc_call_iy
	ei
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:135: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:139: void DOSMapper_WriteByte(u8 seg, u16 addr, u8 val)
;	---------------------------------
; Function DOSMapper_WriteByte
; ---------------------------------
_DOSMapper_WriteByte::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:154: __endasm;
	ex	de, hl
	ld	iy, #2
	add	iy, sp
	ld	e, 0(iy)
	ld	iy, (_g_DOS_JumpTable)
	ld	bc, #0x09
	add	iy, bc
	call	___sdcc_call_iy
	ei
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:155: }
	pop	hl
	inc	sp
	jp	(hl)
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:159: void DOSMapper_SetPage(u8 page, u8 seg)
;	---------------------------------
; Function DOSMapper_SetPage
; ---------------------------------
_DOSMapper_SetPage::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:173: __endasm;
	rrca
	rrca
	ld	h, a
	ld	a, l
	ld	iy, (_g_DOS_JumpTable)
	ld	de, #0x12
	add	iy, de
	call	___sdcc_call_iy
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:174: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:178: void DOSMapper_SetPage0(u8 seg)
;	---------------------------------
; Function DOSMapper_SetPage0
; ---------------------------------
_DOSMapper_SetPage0::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:186: __endasm;
	ld	hl, (_g_DOS_JumpTable)
	ld	de, #0x18
	add	hl, de
	call	___sdcc_call_hl
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:187: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:191: void DOSMapper_SetPage1(u8 seg)
;	---------------------------------
; Function DOSMapper_SetPage1
; ---------------------------------
_DOSMapper_SetPage1::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:199: __endasm;
	ld	hl, (_g_DOS_JumpTable)
	ld	de, #0x1E
	add	hl, de
	call	___sdcc_call_hl
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:200: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:204: void DOSMapper_SetPage2(u8 seg)
;	---------------------------------
; Function DOSMapper_SetPage2
; ---------------------------------
_DOSMapper_SetPage2::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:212: __endasm;
	ld	hl, (_g_DOS_JumpTable)
	ld	de, #0x24
	add	hl, de
	call	___sdcc_call_hl
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:213: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:217: u8 DOSMapper_GetPage(u8 page)
;	---------------------------------
; Function DOSMapper_GetPage
; ---------------------------------
_DOSMapper_GetPage::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:229: __endasm;
	rrca
	rrca
	ld	h, a
	ld	iy, (_g_DOS_JumpTable)
	ld	de, #0x15
	add	iy, de
	call	___sdcc_call_iy
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:231: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:235: u8 DOSMapper_GetPage0()
;	---------------------------------
; Function DOSMapper_GetPage0
; ---------------------------------
_DOSMapper_GetPage0::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:242: __endasm;
	ld	hl, (_g_DOS_JumpTable)
	ld	de, #0x1B
	add	hl, de
	call	___sdcc_call_hl
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:244: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:248: u8 DOSMapper_GetPage1()
;	---------------------------------
; Function DOSMapper_GetPage1
; ---------------------------------
_DOSMapper_GetPage1::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:255: __endasm;
	ld	hl, (_g_DOS_JumpTable)
	ld	de, #0x21
	add	hl, de
	call	___sdcc_call_hl
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:257: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:261: u8 DOSMapper_GetPage2()
;	---------------------------------
; Function DOSMapper_GetPage2
; ---------------------------------
_DOSMapper_GetPage2::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:268: __endasm;
	ld	hl, (_g_DOS_JumpTable)
	ld	de, #0x27
	add	hl, de
	call	___sdcc_call_hl
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:270: }
	ret
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:274: u8 DOSMapper_GetPage3()
;	---------------------------------
; Function DOSMapper_GetPage3
; ---------------------------------
_DOSMapper_GetPage3::
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:281: __endasm;
	ld	hl, (_g_DOS_JumpTable)
	ld	de, #0x2D
	add	hl, de
	call	___sdcc_call_hl
;/home/bruno/dev/MSXgl/engine/src/dos_mapper.c:283: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__g_DOS_VarTable:
	.dw #0x0000
__xinit__g_DOS_JumpTable:
	.dw #0x0000
	.area _CABS (ABS)
