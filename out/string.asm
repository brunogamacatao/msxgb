;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module string
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _String_FromUInt8ZT
	.globl _String_FromUInt8
	.globl _String_FromUInt16ZT
	.globl _String_FromUInt16
	.globl _String_Format
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
;/home/bruno/dev/MSXgl/engine/src/string.c:29: void String_FromUInt8ZT(u8 value, c8* string)
;	---------------------------------
; Function String_FromUInt8ZT
; ---------------------------------
_String_FromUInt8ZT::
;/home/bruno/dev/MSXgl/engine/src/string.c:37: __endasm;
	call	_String_FromUInt8
	xor	a
	ld	(de), a
;/home/bruno/dev/MSXgl/engine/src/string.c:38: }
	ret
_g_HexChar:
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
;/home/bruno/dev/MSXgl/engine/src/string.c:42: void String_FromUInt8(u8 value, c8* string)
;	---------------------------------
; Function String_FromUInt8
; ---------------------------------
_String_FromUInt8::
;/home/bruno/dev/MSXgl/engine/src/string.c:67: __endasm;
	DispA:
	ld	c, #-100
	call	Na1
	ld	c, #-10
	call	Na1
	ld	c, #-1
	Na1:
	ld	b, #'0'-1
	Na2:
	inc	b
	add	a, c
	jr	c, Na2
	sub	c
	ex	af, af'		; '
	ld	a, b
	ld	(de), a
	inc	de
	ex	af, af'		; '
	ret
;/home/bruno/dev/MSXgl/engine/src/string.c:69: }
	ret
;/home/bruno/dev/MSXgl/engine/src/string.c:76: void String_FromUInt16ZT(u16 value, c8* string)
;	---------------------------------
; Function String_FromUInt16ZT
; ---------------------------------
_String_FromUInt16ZT::
;/home/bruno/dev/MSXgl/engine/src/string.c:84: __endasm;
	call	_String_FromUInt16
	xor	a
	ld	(de), a
;/home/bruno/dev/MSXgl/engine/src/string.c:85: }
	ret
;/home/bruno/dev/MSXgl/engine/src/string.c:89: void String_FromUInt16(u16 value, c8* string)
;	---------------------------------
; Function String_FromUInt16
; ---------------------------------
_String_FromUInt16::
;/home/bruno/dev/MSXgl/engine/src/string.c:116: __endasm;
	Num2Dec:
	ld	bc, #-10000
	call	Num1
	ld	bc, #-1000
	call	Num1
	ld	bc, #-100
	call	Num1
	ld	c, #-10
	call	Num1
	ld	c, b
	Num1:
	ld	a, #'0'-1
	Num2:
	inc	a
	add	hl, bc
	jr	c, Num2
	sbc	hl, bc
	ld	(de), a
	inc	de
	ret
;/home/bruno/dev/MSXgl/engine/src/string.c:117: }
	ret
;/home/bruno/dev/MSXgl/engine/src/string.c:129: void String_Format(c8* dest, const c8* format, ...)
;	---------------------------------
; Function String_Format
; ---------------------------------
_String_Format::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-35
	add	hl, sp
	ld	sp, hl
;/home/bruno/dev/MSXgl/engine/src/string.c:132: va_start(args, format);
	ld	hl, #43
	add	hl, sp
	ld	-19 (ix), l
	ld	-18 (ix), h
;/home/bruno/dev/MSXgl/engine/src/string.c:135: const c8* ptr = format;
	ld	a, 6 (ix)
	ld	-7 (ix), a
	ld	a, 7 (ix)
	ld	-6 (ix), a
;/home/bruno/dev/MSXgl/engine/src/string.c:136: while(*ptr != 0)
00166$:
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	or	a, a
	jp	Z, 00168$
;/home/bruno/dev/MSXgl/engine/src/string.c:138: if(*ptr == '%')
	ld	a, -1 (ix)
	sub	a, #0x25
	jp	NZ,00164$
;/home/bruno/dev/MSXgl/engine/src/string.c:140: ptr++;
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/string.c:143: u8 pad = STRINT_PAD_NONE;
	ld	-17 (ix), #0x00
;/home/bruno/dev/MSXgl/engine/src/string.c:144: u8 len = 0;
	ld	-16 (ix), #0x00
;/home/bruno/dev/MSXgl/engine/src/string.c:145: if(*ptr == '0')
	ld	a, (bc)
	ld	e, a
	sub	a, #0x30
	jr	NZ, 00105$
;/home/bruno/dev/MSXgl/engine/src/string.c:147: pad = STRINT_PAD_ZERO;
	ld	-17 (ix), #0x01
;/home/bruno/dev/MSXgl/engine/src/string.c:148: ptr++;
	inc	bc
	jp	00190$
00105$:
;/home/bruno/dev/MSXgl/engine/src/string.c:150: else if((*ptr >= '1') && (*ptr <= '9'))
	ld	a, e
	sub	a, #0x31
	jr	C, 00190$
	ld	a, #0x39
	sub	a, e
	jr	C, 00190$
;/home/bruno/dev/MSXgl/engine/src/string.c:152: pad = STRINT_PAD_SPACE;
	ld	-17 (ix), #0x02
;/home/bruno/dev/MSXgl/engine/src/string.c:153: len = *ptr - '0';
	ld	a, e
	add	a, #0xd0
	ld	-16 (ix), a
;/home/bruno/dev/MSXgl/engine/src/string.c:154: ptr++;
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/string.c:156: while((*ptr >= '0') && (*ptr <= '9'))
00190$:
	ld	-2 (ix), c
	ld	-1 (ix), b
00108$:
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	c, (hl)
	ld	a, c
	sub	a, #0x30
	jr	C, 00229$
	ld	a, #0x39
	sub	a, c
	jr	C, 00229$
;/home/bruno/dev/MSXgl/engine/src/string.c:158: len *= 10;
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
;/home/bruno/dev/MSXgl/engine/src/string.c:159: len += *ptr - '0';
	ld	a, c
	add	a, #0xd0
	add	a, l
	ld	-16 (ix), a
;/home/bruno/dev/MSXgl/engine/src/string.c:160: ptr++;
	inc	-2 (ix)
	jr	NZ, 00108$
	inc	-1 (ix)
	jp	00108$
00229$:
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -1 (ix)
	ld	-6 (ix), a
;/home/bruno/dev/MSXgl/engine/src/string.c:164: switch(*ptr)
	ld	a,c
	cp	a,#0x25
	jr	Z, 00111$
	cp	a,#0x44
	jr	Z, 00115$
	cp	a,#0x49
	jr	Z, 00115$
	cp	a,#0x55
	jp	Z,00165$
	cp	a,#0x58
	jp	Z,00133$
	cp	a,#0x63
	jp	Z,00159$
	cp	a,#0x64
	jr	Z, 00115$
	cp	a,#0x69
	jr	Z, 00115$
	cp	a,#0x73
	jp	Z,00160$
	cp	a,#0x75
	jp	Z,00165$
	sub	a, #0x78
	jp	Z,00150$
	jp	00165$
;/home/bruno/dev/MSXgl/engine/src/string.c:166: case '%':
00111$:
;/home/bruno/dev/MSXgl/engine/src/string.c:167: *dest++ = '%';
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), #0x25
	inc	hl
	ld	4 (ix), l
	ld	5 (ix), h
;/home/bruno/dev/MSXgl/engine/src/string.c:168: break;
	jp	00165$
;/home/bruno/dev/MSXgl/engine/src/string.c:176: case 'd':
00115$:
;/home/bruno/dev/MSXgl/engine/src/string.c:180: if((*ptr == 'I') || (*ptr == 'D'))
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	sub	a, #0x49
	jr	Z, 00116$
	ld	a, -1 (ix)
	sub	a, #0x44
	jr	NZ, 00117$
00116$:
;/home/bruno/dev/MSXgl/engine/src/string.c:181: val = (i32)va_arg(args, i32);
	ld	a, -19 (ix)
	add	a, #0x04
	ld	-4 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-19 (ix), a
	ld	a, -3 (ix)
	ld	-18 (ix), a
	ld	a, -4 (ix)
	add	a, #0xfc
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-9 (ix), a
	ld	a, -1 (ix)
	ld	-8 (ix), a
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	ld	hl, #30
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	jp	00118$
00117$:
;/home/bruno/dev/MSXgl/engine/src/string.c:183: val = (i32)va_arg(args, i16);
	ld	a, -19 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-19 (ix), a
	ld	a, -3 (ix)
	ld	-18 (ix), a
	ld	a, -4 (ix)
	add	a, #0xfe
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
	rlca
	sbc	a, a
	ld	-3 (ix), a
	ld	-2 (ix), a
00118$:
;/home/bruno/dev/MSXgl/engine/src/string.c:188: if(val < 0)
	bit	7, -2 (ix)
	jr	Z, 00121$
;/home/bruno/dev/MSXgl/engine/src/string.c:190: *dest++ = '-';
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), #0x2d
	inc	hl
	ld	4 (ix), l
	ld	5 (ix), h
;/home/bruno/dev/MSXgl/engine/src/string.c:191: val = -val;
	xor	a, a
	sub	a, -5 (ix)
	ld	-5 (ix), a
	ld	a, #0x00
	sbc	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, #0x00
	sbc	a, -3 (ix)
	ld	-3 (ix), a
	sbc	a, a
	sub	a, -2 (ix)
	ld	-2 (ix), a
00121$:
;/home/bruno/dev/MSXgl/engine/src/string.c:194: c8* ptr = str;
;/home/bruno/dev/MSXgl/engine/src/string.c:195: *ptr = 0;
	ld	-35 (ix), #0x00
;/home/bruno/dev/MSXgl/engine/src/string.c:197: while(val >= 10)
	push	hl
	push	af
	ld	hl, #4
	add	hl, sp
	ld	-15 (ix), l
	ld	hl, #4
	add	hl, sp
	pop	af
	ld	-14 (ix), h
	pop	hl
	ld	-1 (ix), #0x01
00122$:
;/home/bruno/dev/MSXgl/engine/src/string.c:199: *++ptr = '0' + (val % 10);
	ld	a, -15 (ix)
	add	a, #0x01
	ld	-13 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
;/home/bruno/dev/MSXgl/engine/src/string.c:197: while(val >= 10)
	ld	a, -5 (ix)
	sub	a, #0x0a
	ld	a, -4 (ix)
	sbc	a, #0x00
	ld	a, -3 (ix)
	sbc	a, #0x00
	ld	a, -2 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00230$
;/home/bruno/dev/MSXgl/engine/src/string.c:199: *++ptr = '0' + (val % 10);
	ld	a, -13 (ix)
	ld	-15 (ix), a
	ld	a, -12 (ix)
	ld	-14 (ix), a
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modslong
	pop	af
	pop	af
	ld	-11 (ix), e
	ld	-10 (ix), d
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, -11 (ix)
	ld	-8 (ix), a
	add	a, #0x30
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/string.c:200: val /= 10;
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divslong
	pop	af
	pop	af
	ld	-5 (ix), e
	ld	-4 (ix), d
	ld	-3 (ix), l
	ld	-2 (ix), h
;/home/bruno/dev/MSXgl/engine/src/string.c:201: digit++;
	inc	-1 (ix)
	jp	00122$
00230$:
	ld	a, -1 (ix)
	ld	-10 (ix), a
;/home/bruno/dev/MSXgl/engine/src/string.c:203: *++ptr = '0' + val;
	ld	a, -13 (ix)
	ld	-9 (ix), a
	ld	a, -12 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-2 (ix), a
	add	a, #0x30
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/string.c:205: if(len > digit)
	ld	a, -1 (ix)
	sub	a, -16 (ix)
	jr	NC, 00211$
;/home/bruno/dev/MSXgl/engine/src/string.c:207: c8 padChr = (pad == STRINT_PAD_ZERO) ? '0' : ' ';
	ld	a, -17 (ix)
	dec	a
	jr	NZ, 00181$
	ld	bc, #0x0030
	jp	00182$
00181$:
	ld	bc, #0x0020
00182$:
	ld	-2 (ix), c
;/home/bruno/dev/MSXgl/engine/src/string.c:208: for(u8 i = 0; i < len - digit; ++i)
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	-1 (ix), #0x00
00174$:
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -10 (ix)
	ld	d, #0x00
	cp	a, a
	sbc	hl, de
	ld	a, -1 (ix)
	ld	d, #0x00
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00440$
	xor	a, #0x80
00440$:
	jp	P, 00231$
;/home/bruno/dev/MSXgl/engine/src/string.c:209: *dest++ = padChr;
	ld	a, -2 (ix)
	ld	(bc), a
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/string.c:208: for(u8 i = 0; i < len - digit; ++i)
	inc	-1 (ix)
	jp	00174$
;/home/bruno/dev/MSXgl/engine/src/string.c:212: while(*ptr != 0)
00231$:
	ld	4 (ix), c
	ld	5 (ix), b
00211$:
	ld	c, -9 (ix)
	ld	b, -8 (ix)
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
00128$:
	ld	a, (bc)
	or	a, a
	jp	Z, 00232$
;/home/bruno/dev/MSXgl/engine/src/string.c:213: *dest++ = *ptr--;
	dec	bc
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), a
	inc	-2 (ix)
	jr	NZ, 00128$
	inc	-1 (ix)
	jp	00128$
;/home/bruno/dev/MSXgl/engine/src/string.c:226: case 'X':
00133$:
;/home/bruno/dev/MSXgl/engine/src/string.c:228: if(len == 0)
	ld	a, -16 (ix)
	or	a, a
	jr	NZ, 00135$
;/home/bruno/dev/MSXgl/engine/src/string.c:229: len = 8;
	ld	-16 (ix), #0x08
00135$:
;/home/bruno/dev/MSXgl/engine/src/string.c:230: u32 val = (u32)va_arg(args, u32);
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	-19 (ix), l
	ld	-18 (ix), h
	ld	de, #0xfffc
	add	hl, de
	ex	de,hl
	ld	hl, #31
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
;/home/bruno/dev/MSXgl/engine/src/string.c:232: if(len > 7)
	ld	a, #0x07
	sub	a, -16 (ix)
	jr	NC, 00137$
;/home/bruno/dev/MSXgl/engine/src/string.c:233: *dest++ = g_HexChar[(val >> 28) & 0xF];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, -1 (ix)
	ld	a, #0x04
00442$:
	srl	e
	dec	a
	jr	NZ, 00442$
	ld	a, e
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	hl, #_g_HexChar
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
00137$:
;/home/bruno/dev/MSXgl/engine/src/string.c:234: if(len > 6)
	ld	a, #0x06
	sub	a, -16 (ix)
	jr	NC, 00139$
;/home/bruno/dev/MSXgl/engine/src/string.c:235: *dest++ = g_HexChar[(val >> 24) & 0xF];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, -1 (ix)
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	hl, #_g_HexChar
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
00139$:
;/home/bruno/dev/MSXgl/engine/src/string.c:236: if(len > 5)
	ld	a, #0x05
	sub	a, -16 (ix)
	jr	NC, 00141$
;/home/bruno/dev/MSXgl/engine/src/string.c:237: *dest++ = g_HexChar[(val >> 20) & 0xF];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	a, #0x04
00444$:
	srl	d
	rr	e
	dec	a
	jr	NZ, 00444$
	ld	a, e
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	hl, #_g_HexChar
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
00141$:
;/home/bruno/dev/MSXgl/engine/src/string.c:238: if(len > 4)
	ld	a, #0x04
	sub	a, -16 (ix)
	jr	NC, 00143$
;/home/bruno/dev/MSXgl/engine/src/string.c:239: *dest++ = g_HexChar[(val >> 16) & 0xF];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, -2 (ix)
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	hl, #_g_HexChar
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
00143$:
;/home/bruno/dev/MSXgl/engine/src/string.c:240: if(len > 3)
	ld	a, #0x03
	sub	a, -16 (ix)
	jr	NC, 00145$
;/home/bruno/dev/MSXgl/engine/src/string.c:241: *dest++ = g_HexChar[(val >> 12) & 0xF];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x04
00446$:
	srl	l
	rr	d
	rr	e
	dec	a
	jr	NZ, 00446$
	ld	a, e
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	hl, #_g_HexChar
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
00145$:
;/home/bruno/dev/MSXgl/engine/src/string.c:242: if(len > 2)
	ld	a, #0x02
	sub	a, -16 (ix)
	jr	NC, 00147$
;/home/bruno/dev/MSXgl/engine/src/string.c:243: *dest++ = g_HexChar[(val >> 8) & 0xF];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, -3 (ix)
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	hl, #_g_HexChar
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
00147$:
;/home/bruno/dev/MSXgl/engine/src/string.c:244: if(len > 1)
	ld	a, #0x01
	sub	a, -16 (ix)
	jr	NC, 00149$
;/home/bruno/dev/MSXgl/engine/src/string.c:245: *dest++ = g_HexChar[(val >> 4) & 0xF];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x04
00448$:
	srl	h
	rr	l
	rr	d
	rr	e
	dec	a
	jr	NZ, 00448$
	ld	a, e
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	hl, #_g_HexChar
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
00149$:
;/home/bruno/dev/MSXgl/engine/src/string.c:246: *dest++ = g_HexChar[val & 0xF];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, -4 (ix)
	and	a, #0x0f
	ld	e, a
	ld	d, #0x00
	ld	hl, #_g_HexChar
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
;/home/bruno/dev/MSXgl/engine/src/string.c:247: break;
	jp	00165$
;/home/bruno/dev/MSXgl/engine/src/string.c:252: case 'x':
00150$:
;/home/bruno/dev/MSXgl/engine/src/string.c:254: if(len == 0)
	ld	a, -16 (ix)
	or	a, a
	jr	NZ, 00152$
;/home/bruno/dev/MSXgl/engine/src/string.c:255: len = 4;
	ld	-16 (ix), #0x04
00152$:
;/home/bruno/dev/MSXgl/engine/src/string.c:256: u16 val = (u16)va_arg(args, u16);
	ld	c, -19 (ix)
	ld	b, -18 (ix)
	inc	bc
	inc	bc
	ld	-19 (ix), c
	ld	-18 (ix), b
	dec	bc
	dec	bc
	ld	a, (bc)
	ld	-11 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-10 (ix), a
;/home/bruno/dev/MSXgl/engine/src/string.c:257: if(len > 3)
	ld	a, #0x03
	sub	a, -16 (ix)
	jr	NC, 00154$
;/home/bruno/dev/MSXgl/engine/src/string.c:258: *dest++ = g_HexChar[(val >> 12) & 0xF];
	ld	a, 4 (ix)
	ld	-9 (ix), a
	ld	a, 5 (ix)
	ld	-8 (ix), a
	ld	a, -10 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	a, -2 (ix)
	and	a, #0x0f
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
	ld	a, -9 (ix)
	add	a, #0x01
	ld	4 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	5 (ix), a
00154$:
;/home/bruno/dev/MSXgl/engine/src/string.c:259: if(len > 2)
	ld	a, #0x02
	sub	a, -16 (ix)
	jr	NC, 00156$
;/home/bruno/dev/MSXgl/engine/src/string.c:260: *dest++ = g_HexChar[(val >> 8) & 0xF];
	ld	a, 4 (ix)
	ld	-9 (ix), a
	ld	a, 5 (ix)
	ld	-8 (ix), a
	ld	a, -10 (ix)
	ld	-1 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	a, -2 (ix)
	and	a, #0x0f
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
	ld	a, -9 (ix)
	add	a, #0x01
	ld	4 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	5 (ix), a
00156$:
;/home/bruno/dev/MSXgl/engine/src/string.c:261: if(len > 1)
	ld	a, #0x01
	sub	a, -16 (ix)
	jr	NC, 00158$
;/home/bruno/dev/MSXgl/engine/src/string.c:262: *dest++ = g_HexChar[(val >> 4) & 0xF];
	ld	a, 4 (ix)
	ld	-9 (ix), a
	ld	a, 5 (ix)
	ld	-8 (ix), a
	ld	a, -11 (ix)
	ld	-2 (ix), a
	ld	a, -10 (ix)
	ld	-1 (ix), a
	srl	-1 (ix)
	rr	-2 (ix)
	srl	-1 (ix)
	rr	-2 (ix)
	srl	-1 (ix)
	rr	-2 (ix)
	srl	-1 (ix)
	rr	-2 (ix)
	ld	a, -2 (ix)
	and	a, #0x0f
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
	ld	a, -9 (ix)
	add	a, #0x01
	ld	4 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	5 (ix), a
00158$:
;/home/bruno/dev/MSXgl/engine/src/string.c:263: *dest++ = g_HexChar[val & 0xF];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, -11 (ix)
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #_g_HexChar
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
;/home/bruno/dev/MSXgl/engine/src/string.c:264: break;
	jp	00165$
;/home/bruno/dev/MSXgl/engine/src/string.c:268: case 'c':
00159$:
;/home/bruno/dev/MSXgl/engine/src/string.c:270: c8 val = (c8)va_arg(args, c8);
	ld	c, -19 (ix)
	ld	b, -18 (ix)
	inc	bc
	ld	-19 (ix), c
	ld	-18 (ix), b
	dec	bc
	ld	a, (bc)
;/home/bruno/dev/MSXgl/engine/src/string.c:271: *dest++ = val;
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
;/home/bruno/dev/MSXgl/engine/src/string.c:272: break;
	jp	00165$
;/home/bruno/dev/MSXgl/engine/src/string.c:276: case 's':
00160$:
;/home/bruno/dev/MSXgl/engine/src/string.c:278: const c8* val = (const c8*)va_arg(args, const c8*);
	ld	l, -19 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -18 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	-19 (ix), l
	ld	-18 (ix), h
	dec	hl
	dec	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;/home/bruno/dev/MSXgl/engine/src/string.c:279: u8 len = String_Length(val);
	ld	e, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
00169$:
	ld	a, (hl)
	inc	hl
	or	a, a
	jr	Z, 00171$
	inc	e
	jp	00169$
00171$:
;/home/bruno/dev/MSXgl/engine/src/string.c:280: for(u8 i = 0; i < len; i++)
	push	bc
	pop	iy
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	d, #0x00
00177$:
	ld	a, d
	sub	a, e
	jr	NC, 00234$
;/home/bruno/dev/MSXgl/engine/src/string.c:281: *dest++ = *val++;
	ld	a, 0 (iy)
	inc	iy
	ld	(bc), a
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/string.c:280: for(u8 i = 0; i < len; i++)
	inc	d
	jp	00177$
;/home/bruno/dev/MSXgl/engine/src/string.c:284: }
00164$:
;/home/bruno/dev/MSXgl/engine/src/string.c:287: *dest++ = *ptr;
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, -1 (ix)
	ld	(bc), a
	inc	bc
	ld	4 (ix), c
	ld	5 (ix), b
;/home/bruno/dev/MSXgl/engine/src/string.c:293: va_end(args);
	jp	00165$
;/home/bruno/dev/MSXgl/engine/src/string.c:287: *dest++ = *ptr;
00232$:
	ld	a, -2 (ix)
	ld	4 (ix), a
	ld	a, -1 (ix)
	ld	5 (ix), a
;/home/bruno/dev/MSXgl/engine/src/string.c:293: va_end(args);
	jp	00165$
;/home/bruno/dev/MSXgl/engine/src/string.c:287: *dest++ = *ptr;
00234$:
	ld	4 (ix), c
	ld	5 (ix), b
00165$:
;/home/bruno/dev/MSXgl/engine/src/string.c:289: ptr++;
	inc	-7 (ix)
	jp	NZ,00166$
	inc	-6 (ix)
	jp	00166$
00168$:
;/home/bruno/dev/MSXgl/engine/src/string.c:291: *dest = 0;
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	xor	a, a
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/string.c:293: va_end(args);
;/home/bruno/dev/MSXgl/engine/src/string.c:294: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
