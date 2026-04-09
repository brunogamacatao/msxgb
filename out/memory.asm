;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module memory
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_StackAddress
	.globl _Mem_GetStackAddress
	.globl _Mem_HeapAlloc
	.globl _Mem_HeapFree
	.globl _Mem_Copy
	.globl _Mem_Set
	.globl _Mem_Set_16b
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_StackAddress::
	.ds 2
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
;/home/bruno/dev/MSXgl/engine/src/memory.c:24: u16 Mem_GetStackAddress()
;	---------------------------------
; Function Mem_GetStackAddress
; ---------------------------------
_Mem_GetStackAddress::
;/home/bruno/dev/MSXgl/engine/src/memory.c:29: __endasm;
	ld	(_g_StackAddress), sp
	ld	de, (_g_StackAddress)
;/home/bruno/dev/MSXgl/engine/src/memory.c:30: }
	ret
;/home/bruno/dev/MSXgl/engine/src/memory.c:34: void* Mem_HeapAlloc(u16 size)
;	---------------------------------
; Function Mem_HeapAlloc
; ---------------------------------
_Mem_HeapAlloc::
	ld	c, l
	ld	b, h
;/home/bruno/dev/MSXgl/engine/src/memory.c:36: u16 addr = g_HeapStartAddress;
	ld	de, (_g_HeapStartAddress)
;/home/bruno/dev/MSXgl/engine/src/memory.c:37: g_HeapStartAddress += size;
	ld	hl, #_g_HeapStartAddress
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/memory.c:38: return (void*)addr;
;/home/bruno/dev/MSXgl/engine/src/memory.c:39: }
	ret
;/home/bruno/dev/MSXgl/engine/src/memory.c:43: void Mem_HeapFree(u16 size)
;	---------------------------------
; Function Mem_HeapFree
; ---------------------------------
_Mem_HeapFree::
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/memory.c:45: g_HeapStartAddress -= size;	
	ld	hl, #_g_HeapStartAddress
	ld	a, (hl)
	sub	a, e
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, d
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/memory.c:46: }
	ret
;/home/bruno/dev/MSXgl/engine/src/memory.c:50: void Mem_Copy(const void* src, void* dest, u16 size) __NAKED // Stack: 4 bytes
;	---------------------------------
; Function Mem_Copy
; ---------------------------------
_Mem_Copy::
;/home/bruno/dev/MSXgl/engine/src/memory.c:69: __endasm;
	pop	iy
	pop	bc
	ldir
	 mem_copy_end:
	jp	(iy)
;/home/bruno/dev/MSXgl/engine/src/memory.c:70: }
;/home/bruno/dev/MSXgl/engine/src/memory.c:121: void Mem_Set(u8 val, void* dest, u16 size) __NAKED // Stack: 4 bytes
;	---------------------------------
; Function Mem_Set
; ---------------------------------
_Mem_Set::
;/home/bruno/dev/MSXgl/engine/src/memory.c:148: __endasm;
	push	de
	pop	hl
	ld	(hl), a
	inc	de
	pop	iy
	pop	bc
	dec	bc
	ldir
	 mem_fill_end:
	jp	(iy)
;/home/bruno/dev/MSXgl/engine/src/memory.c:149: }
;/home/bruno/dev/MSXgl/engine/src/memory.c:153: void Mem_Set_16b(u16 val, void* dest, u16 size)
;	---------------------------------
; Function Mem_Set_16b
; ---------------------------------
_Mem_Set_16b::
;/home/bruno/dev/MSXgl/engine/src/memory.c:187: __endasm;
	push	de
	ex	de, hl
	ld	(hl), d
	inc	hl
	ld	(hl), e
	inc	hl
	ex	de, hl
	pop	hl
	pop	iy
	pop	bc
	dec	bc
	dec	bc
	ldir
	 mem_fill16_end:
	jp	(iy)
;/home/bruno/dev/MSXgl/engine/src/memory.c:188: }
	pop	hl
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
