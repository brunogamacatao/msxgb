;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module cart
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cart_type_name
	.globl _cart_lic_name
	.globl _msx_printf
	.globl _Mem_HeapAlloc
	.globl _DOS_SeekHandle
	.globl _DOS_ReadHandle
	.globl _DOS_CloseHandle
	.globl _DOS_OpenHandle
	.globl _DOS_TPAUpperAddr
	.globl _card_load
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_DOS_TPAUpperAddr	=	0x0006
_ctx:
	.ds 1032
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_ROM_TYPES:
	.ds 70
_LIC_CODE:
	.ds 330
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
;./cart.c:117: const char *cart_lic_name() {
;	---------------------------------
; Function cart_lic_name
; ---------------------------------
_cart_lic_name::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;./cart.c:118: if (ctx.header->new_lic_code <= 0xA4) {
	ld	hl, #(_ctx + 1030)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	pop	bc
	push	bc
	ld	hl, #68
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xa4
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	C, 00102$
;./cart.c:119: return LIC_CODE[ctx.header->lic_code];
	ld	bc, #_LIC_CODE+0
	pop	de
	push	de
	ld	hl, #75
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	jp	00103$
00102$:
;./cart.c:122: return "UNKNOWN";
	ld	de, #___str_1
00103$:
;./cart.c:123: }
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.db 0x0a
	.db 0x0d
	.ascii "$"
	.db 0x00
___str_1:
	.ascii "UNKNOWN"
	.db 0x00
;./cart.c:125: const char *cart_type_name() {
;	---------------------------------
; Function cart_type_name
; ---------------------------------
_cart_type_name::
;./cart.c:126: if (ctx.header->type <= 0x22) {
	ld	hl, (#(_ctx + 1030) + 0)
	ld	de, #0x0047
	add	hl, de
	ld	c, (hl)
	ld	a, #0x22
	sub	a, c
	jr	C, 00102$
;./cart.c:127: return ROM_TYPES[ctx.header->type];
	ld	de, #_ROM_TYPES+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ret
00102$:
;./cart.c:130: return "UNKNOWN";
	ld	de, #___str_2
;./cart.c:131: }
	ret
___str_2:
	.ascii "UNKNOWN"
	.db 0x00
;./cart.c:133: bool card_load(c8 *filename) {
;	---------------------------------
; Function card_load
; ---------------------------------
_card_load::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./cart.c:134: u8 fp = DOS_FOpen(filename, O_RDONLY);
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	_DOS_OpenHandle
	pop	hl
;./cart.c:136: if (!fp) {
	ld	-1 (ix), a
	or	a, a
	jr	NZ, 00102$
;./cart.c:137: msx_printf("Failed to open: %s\r\n", filename);
	ld	bc, #___str_3+0
	push	hl
	push	bc
	call	_msx_printf
	pop	af
	pop	af
;./cart.c:138: return false;
	xor	a, a
	jp	00103$
00102$:
;./cart.c:141: msx_printf("Opened: %s\r\n", filename);
	ld	bc, #___str_4+0
	push	hl
	push	bc
	call	_msx_printf
	pop	af
;./cart.c:143: ctx.rom_size = DOS_SeekHandle(fp, 0, SEEK_END); // go to the end to the filename
	ld	h,#0x02
	ex	(sp),hl
	inc	sp
	ld	hl, #0x0000
	push	hl
	push	hl
	ld	a, -1 (ix)
	call	_DOS_SeekHandle
	ld	c, l
	ld	b, h
	ld	((_ctx + 1024)), de
	ld	((_ctx + 1024)+2), bc
;./cart.c:145: DOS_SeekHandle(fp, 0, SEEK_SET); // rewind 
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x0000
	push	hl
	push	hl
	ld	a, -1 (ix)
	call	_DOS_SeekHandle
;./cart.c:147: ctx.rom_data = Mem_HeapAlloc(ctx.rom_size);
	ld	hl, (#(_ctx + 1024) + 0)
	call	_Mem_HeapAlloc
	ld	((_ctx + 1028)), de
;./cart.c:149: DOS_FRead(fp, (void*)ctx.rom_data, ctx.rom_size);
	ld	hl, (#(_ctx + 1024) + 0)
	push	hl
	ld	a, -1 (ix)
	call	_DOS_ReadHandle
;./cart.c:150: DOS_FClose(fp); 
	ld	a, -1 (ix)
	call	_DOS_CloseHandle
;./cart.c:152: return true;
	ld	a, #0x01
00103$:
;./cart.c:153: }
	inc	sp
	pop	ix
	ret
___str_3:
	.ascii "Failed to open: %s"
	.db 0x0d
	.db 0x0a
	.db 0x00
___str_4:
	.ascii "Opened: %s"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area _CODE
___str_5:
	.ascii "ROM ONLY"
	.db 0x00
___str_6:
	.ascii "MBC1"
	.db 0x00
___str_7:
	.ascii "MBC1+RAM"
	.db 0x00
___str_8:
	.ascii "MBC1+RAM+BATTERY"
	.db 0x00
___str_9:
	.ascii "0x04 ???"
	.db 0x00
___str_10:
	.ascii "MBC2"
	.db 0x00
___str_11:
	.ascii "MBC2+BATTERY"
	.db 0x00
___str_12:
	.ascii "0x07 ???"
	.db 0x00
___str_13:
	.ascii "ROM+RAM 1"
	.db 0x00
___str_14:
	.ascii "ROM+RAM+BATTERY 1"
	.db 0x00
___str_15:
	.ascii "0x0A ???"
	.db 0x00
___str_16:
	.ascii "MMM01"
	.db 0x00
___str_17:
	.ascii "MMM01+RAM"
	.db 0x00
___str_18:
	.ascii "MMM01+RAM+BATTERY"
	.db 0x00
___str_19:
	.ascii "0x0E ???"
	.db 0x00
___str_20:
	.ascii "MBC3+TIMER+BATTERY"
	.db 0x00
___str_21:
	.ascii "MBC3+TIMER+RAM+BATTERY 2"
	.db 0x00
___str_22:
	.ascii "MBC3"
	.db 0x00
___str_23:
	.ascii "MBC3+RAM 2"
	.db 0x00
___str_24:
	.ascii "MBC3+RAM+BATTERY 2"
	.db 0x00
___str_25:
	.ascii "0x14 ???"
	.db 0x00
___str_26:
	.ascii "0x15 ???"
	.db 0x00
___str_27:
	.ascii "0x16 ???"
	.db 0x00
___str_28:
	.ascii "0x17 ???"
	.db 0x00
___str_29:
	.ascii "0x18 ???"
	.db 0x00
___str_30:
	.ascii "MBC5"
	.db 0x00
___str_31:
	.ascii "MBC5+RAM"
	.db 0x00
___str_32:
	.ascii "MBC5+RAM+BATTERY"
	.db 0x00
___str_33:
	.ascii "MBC5+RUMBLE"
	.db 0x00
___str_34:
	.ascii "MBC5+RUMBLE+RAM"
	.db 0x00
___str_35:
	.ascii "MBC5+RUMBLE+RAM+BATTERY"
	.db 0x00
___str_36:
	.ascii "0x1F ???"
	.db 0x00
___str_37:
	.ascii "MBC6"
	.db 0x00
___str_38:
	.ascii "0x21 ???"
	.db 0x00
___str_39:
	.ascii "MBC7+SENSOR+RUMBLE+RAM+BATTERY"
	.db 0x00
___str_40:
	.ascii "None"
	.db 0x00
___str_41:
	.ascii "Nintendo R&D1"
	.db 0x00
___str_42:
	.ascii "Capcom"
	.db 0x00
___str_43:
	.ascii "Electronic Arts"
	.db 0x00
___str_44:
	.ascii "Hudson Soft"
	.db 0x00
___str_45:
	.ascii "b-ai"
	.db 0x00
___str_46:
	.ascii "kss"
	.db 0x00
___str_47:
	.ascii "pow"
	.db 0x00
___str_48:
	.ascii "PCM Complete"
	.db 0x00
___str_49:
	.ascii "san-x"
	.db 0x00
___str_50:
	.ascii "Kemco Japan"
	.db 0x00
___str_51:
	.ascii "seta"
	.db 0x00
___str_52:
	.ascii "Viacom"
	.db 0x00
___str_53:
	.ascii "Nintendo"
	.db 0x00
___str_54:
	.ascii "Bandai"
	.db 0x00
___str_55:
	.ascii "Ocean/Acclaim"
	.db 0x00
___str_56:
	.ascii "Konami"
	.db 0x00
___str_57:
	.ascii "Hector"
	.db 0x00
___str_58:
	.ascii "Taito"
	.db 0x00
___str_59:
	.ascii "Hudson"
	.db 0x00
___str_60:
	.ascii "Banpresto"
	.db 0x00
___str_61:
	.ascii "Ubi Soft"
	.db 0x00
___str_62:
	.ascii "Atlus"
	.db 0x00
___str_63:
	.ascii "Malibu"
	.db 0x00
___str_64:
	.ascii "angel"
	.db 0x00
___str_65:
	.ascii "Bullet-Proof"
	.db 0x00
___str_66:
	.ascii "irem"
	.db 0x00
___str_67:
	.ascii "Absolute"
	.db 0x00
___str_68:
	.ascii "Acclaim"
	.db 0x00
___str_69:
	.ascii "Activision"
	.db 0x00
___str_70:
	.ascii "American sammy"
	.db 0x00
___str_71:
	.ascii "Hi tech entertainment"
	.db 0x00
___str_72:
	.ascii "LJN"
	.db 0x00
___str_73:
	.ascii "Matchbox"
	.db 0x00
___str_74:
	.ascii "Mattel"
	.db 0x00
___str_75:
	.ascii "Milton Bradley"
	.db 0x00
___str_76:
	.ascii "Titus"
	.db 0x00
___str_77:
	.ascii "Virgin"
	.db 0x00
___str_78:
	.ascii "LucasArts"
	.db 0x00
___str_79:
	.ascii "Ocean"
	.db 0x00
___str_80:
	.ascii "Infogrames"
	.db 0x00
___str_81:
	.ascii "Interplay"
	.db 0x00
___str_82:
	.ascii "Broderbund"
	.db 0x00
___str_83:
	.ascii "sculptured"
	.db 0x00
___str_84:
	.ascii "sci"
	.db 0x00
___str_85:
	.ascii "THQ"
	.db 0x00
___str_86:
	.ascii "Accolade"
	.db 0x00
___str_87:
	.ascii "misawa"
	.db 0x00
___str_88:
	.ascii "lozc"
	.db 0x00
___str_89:
	.ascii "Tokuma Shoten Intermedia"
	.db 0x00
___str_90:
	.ascii "Tsukuda Original"
	.db 0x00
___str_91:
	.ascii "Chunsoft"
	.db 0x00
___str_92:
	.ascii "Video system"
	.db 0x00
___str_93:
	.ascii "Varie"
	.db 0x00
___str_94:
	.ascii "Yonezawa/s"
	.db 0xe2
	.db 0x80
	.db 0x99
	.ascii "pal"
	.db 0x00
___str_95:
	.ascii "Kaneko"
	.db 0x00
___str_96:
	.ascii "Pack in soft"
	.db 0x00
___str_97:
	.ascii "Konami (Yu-Gi-Oh!)"
	.db 0x00
	.area _INITIALIZER
__xinit__ROM_TYPES:
	.dw ___str_5
	.dw ___str_6
	.dw ___str_7
	.dw ___str_8
	.dw ___str_9
	.dw ___str_10
	.dw ___str_11
	.dw ___str_12
	.dw ___str_13
	.dw ___str_14
	.dw ___str_15
	.dw ___str_16
	.dw ___str_17
	.dw ___str_18
	.dw ___str_19
	.dw ___str_20
	.dw ___str_21
	.dw ___str_22
	.dw ___str_23
	.dw ___str_24
	.dw ___str_25
	.dw ___str_26
	.dw ___str_27
	.dw ___str_28
	.dw ___str_29
	.dw ___str_30
	.dw ___str_31
	.dw ___str_32
	.dw ___str_33
	.dw ___str_34
	.dw ___str_35
	.dw ___str_36
	.dw ___str_37
	.dw ___str_38
	.dw ___str_39
__xinit__LIC_CODE:
	.dw ___str_40
	.dw ___str_41
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_42
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_43
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_44
	.dw ___str_45
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_46
	.dw #0x0000
	.dw ___str_47
	.dw #0x0000
	.dw ___str_48
	.dw ___str_49
	.dw #0x0000
	.dw #0x0000
	.dw ___str_50
	.dw ___str_51
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_52
	.dw ___str_53
	.dw ___str_54
	.dw ___str_55
	.dw ___str_56
	.dw ___str_57
	.dw #0x0000
	.dw ___str_58
	.dw ___str_59
	.dw ___str_60
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_61
	.dw ___str_62
	.dw #0x0000
	.dw ___str_63
	.dw #0x0000
	.dw ___str_64
	.dw ___str_65
	.dw #0x0000
	.dw ___str_66
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_67
	.dw ___str_68
	.dw ___str_69
	.dw ___str_70
	.dw ___str_56
	.dw ___str_71
	.dw ___str_72
	.dw ___str_73
	.dw ___str_74
	.dw ___str_75
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_76
	.dw ___str_77
	.dw #0x0000
	.dw #0x0000
	.dw ___str_78
	.dw #0x0000
	.dw #0x0000
	.dw ___str_79
	.dw #0x0000
	.dw ___str_43
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_80
	.dw ___str_81
	.dw ___str_82
	.dw ___str_83
	.dw #0x0000
	.dw ___str_84
	.dw #0x0000
	.dw #0x0000
	.dw ___str_85
	.dw ___str_86
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_87
	.dw #0x0000
	.dw #0x0000
	.dw ___str_88
	.dw #0x0000
	.dw #0x0000
	.dw ___str_89
	.dw ___str_90
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_91
	.dw ___str_92
	.dw ___str_55
	.dw #0x0000
	.dw ___str_93
	.dw ___str_94
	.dw ___str_95
	.dw #0x0000
	.dw ___str_96
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw ___str_97
	.area _CABS (ABS)
