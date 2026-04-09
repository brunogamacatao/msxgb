;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module msx_printf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DOS_CharOutput
	.globl _DOS_TPAUpperAddr
	.globl _print_string
	.globl _print_int
	.globl _msx_printf
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_DOS_TPAUpperAddr	=	0x0006
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
;./msx_printf.c:5: void print_string(const char *s) {
;	---------------------------------
; Function print_string
; ---------------------------------
_print_string::
;./msx_printf.c:6: while (*s) {
00101$:
	ld	a, (hl)
	or	a, a
	ret	Z
;./msx_printf.c:7: DOS_CharOutput(*s++);
	inc	hl
	ld	c, a
	push	hl
	ld	a, c
	call	_DOS_CharOutput
	pop	hl
;./msx_printf.c:9: }
	jp	00101$
___str_0:
	.db 0x0a
	.db 0x0d
	.ascii "$"
	.db 0x00
;./msx_printf.c:12: void print_int(int n) {
;	---------------------------------
; Function print_int
; ---------------------------------
_print_int::
;./msx_printf.c:13: if (n < 0) {
	bit	7, h
	jr	Z, 00102$
;./msx_printf.c:14: DOS_CharOutput('-');
	push	hl
	ld	a, #0x2d
	call	_DOS_CharOutput
	pop	hl
;./msx_printf.c:15: n = -n;
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	sbc	a, a
	sub	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
00102$:
;./msx_printf.c:18: if (n >= 10) {
	ld	a, l
	sub	a, #0x0a
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00104$
;./msx_printf.c:19: print_int(n / 10);
	push	hl
	ld	de, #0x000a
	call	__divsint
	pop	hl
	ex	de, hl
	push	de
	call	_print_int
	pop	hl
00104$:
;./msx_printf.c:22: DOS_CharOutput((n % 10) + '0');
	ld	de, #0x000a
	call	__modsint
	ld	a, e
	add	a, #0x30
	ld	c, a
;./msx_printf.c:23: }
	jp	_DOS_CharOutput
;./msx_printf.c:25: void msx_printf(const char *format, ...) {
;	---------------------------------
; Function msx_printf
; ---------------------------------
_msx_printf::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;./msx_printf.c:29: arg_ptr = (char*)(&format);
;./msx_printf.c:30: arg_ptr += 2;  // skip format pointer (16-bit)
	ld	hl, #8
	add	hl, sp
	ex	(sp), hl
;./msx_printf.c:32: while (*format) {
00110$:
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, (bc)
;./msx_printf.c:33: if (*format == '%') {
	ld	e,a
	or	a,a
	jp	Z,00113$
	sub	a, #0x25
	jr	NZ, 00108$
;./msx_printf.c:34: format++;
	inc	bc
;./msx_printf.c:36: switch (*format) {
	ld	4 (ix), c
	ld	5 (ix), b
	ld	a, (bc)
	cp	a, #0x25
	jr	Z, 00104$
	cp	a, #0x63
	jr	Z, 00103$
	cp	a, #0x64
	jr	Z, 00102$
	sub	a, #0x73
	jr	NZ, 00105$
;./msx_printf.c:38: char *s = *(char**)arg_ptr;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;./msx_printf.c:39: arg_ptr += 2;
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	jr	NC, 00157$
	inc	-1 (ix)
00157$:
;./msx_printf.c:40: print_string(s);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_print_string
;./msx_printf.c:41: break;
	jp	00109$
;./msx_printf.c:44: case 'd': {
00102$:
;./msx_printf.c:45: int n = *(int*)arg_ptr;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;./msx_printf.c:46: arg_ptr += 2;
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	jr	NC, 00158$
	inc	-1 (ix)
00158$:
;./msx_printf.c:47: print_int(n);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_print_int
;./msx_printf.c:48: break;
	jp	00109$
;./msx_printf.c:51: case 'c': {
00103$:
;./msx_printf.c:52: char c = *(char*)arg_ptr;
	pop	hl
	push	hl
	ld	c, (hl)
;./msx_printf.c:53: arg_ptr += 2;
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	jr	NC, 00159$
	inc	-1 (ix)
00159$:
;./msx_printf.c:54: DOS_CharOutput(c);
	ld	a, c
	call	_DOS_CharOutput
;./msx_printf.c:55: break;
	jp	00109$
;./msx_printf.c:58: case '%': {
00104$:
;./msx_printf.c:59: DOS_CharOutput('%');
	ld	a, #0x25
	call	_DOS_CharOutput
;./msx_printf.c:60: break;
	jp	00109$
;./msx_printf.c:63: default: {
00105$:
;./msx_printf.c:64: DOS_CharOutput('%');
	ld	a, #0x25
	call	_DOS_CharOutput
;./msx_printf.c:65: DOS_CharOutput(*format);
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	call	_DOS_CharOutput
;./msx_printf.c:67: }
	jp	00109$
00108$:
;./msx_printf.c:69: DOS_CharOutput(*format);
	ld	a, e
	call	_DOS_CharOutput
00109$:
;./msx_printf.c:72: format++;
	inc	4 (ix)
	jp	NZ,00110$
	inc	5 (ix)
	jp	00110$
00113$:
;./msx_printf.c:74: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
