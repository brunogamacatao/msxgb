;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module psg
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_PSG_VolumeBackup
	.globl _g_PSG_Regs
	.globl _PSG_SetRegister
	.globl _PSG_GetRegister
	.globl _PSG_SetTone
	.globl _PSG_SetNoise
	.globl _PSG_SetMixer
	.globl _PSG_SetVolume
	.globl _PSG_SetEnvelope
	.globl _PSG_SetShape
	.globl _PSG_EnableTone
	.globl _PSG_EnableNoise
	.globl _PSG_EnableEnvelope
	.globl _PSG_Mute
	.globl _PSG_Resume
	.globl _PSG_Apply
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_PortPrimarySlot	=	0x00a8
_g_PortReadKeyboard	=	0x00a9
_g_PortAccessKeyboard	=	0x00aa
_g_PortControl	=	0x00ab
_g_VDP_DataPort	=	0x0098
_g_VDP_RegPort	=	0x0099
_g_VDP_AddrPort	=	0x0099
_g_VDP_StatPort	=	0x0099
_g_VDP_PalPort	=	0x009a
_g_VDP_IRegPort	=	0x009b
_g_PSG_RegPort	=	0x00a0
_g_PSG_DataPort	=	0x00a1
_g_PSG_StatPort	=	0x00a2
_g_PSG_Ext_RegPort	=	0x0010
_g_PSG_Ext_DataPort	=	0x0011
_g_PSG_Ext_StatPort	=	0x0012
_g_MSXMusic_IndexPort	=	0x007c
_g_MSXMusic_DataPort	=	0x007d
_g_MSXAudio_IndexPort	=	0x00c0
_g_MSXAudio_DataPort	=	0x00c1
_g_MSXAudio_IndexPort2	=	0x00c2
_g_MSXAudio_DataPort2	=	0x00c3
_g_RTC_AddrPort	=	0x00b4
_g_RTC_DataPort	=	0x00b5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_PSG_Regs::
	.ds 16
_g_PSG_VolumeBackup::
	.ds 3
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
;/home/bruno/dev/MSXgl/engine/src/psg.c:60: void PSG_SetRegister(u8 reg, u8 value)
;	---------------------------------
; Function PSG_SetRegister
; ---------------------------------
_PSG_SetRegister::
	ld	e, a
	ld	c, l
;/home/bruno/dev/MSXgl/engine/src/psg.c:64: u8* ptr = (u8*)g_PSG_Regs;
	ld	hl, #_g_PSG_Regs+0
;/home/bruno/dev/MSXgl/engine/src/psg.c:65: ptr += reg;
	ld	d, #0x00
	add	hl, de
;/home/bruno/dev/MSXgl/engine/src/psg.c:66: *ptr = value;
	ld	(hl), c
;/home/bruno/dev/MSXgl/engine/src/psg.c:74: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:78: u8 PSG_GetRegister(u8 reg)
;	---------------------------------
; Function PSG_GetRegister
; ---------------------------------
_PSG_GetRegister::
	ld	e, a
;/home/bruno/dev/MSXgl/engine/src/psg.c:82: u8* ptr = (u8*)g_PSG_Regs;
	ld	hl, #_g_PSG_Regs+0
;/home/bruno/dev/MSXgl/engine/src/psg.c:83: ptr += reg;
	ld	d, #0x00
	add	hl, de
;/home/bruno/dev/MSXgl/engine/src/psg.c:84: return *ptr;
	ld	a, (hl)
;/home/bruno/dev/MSXgl/engine/src/psg.c:92: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:98: void PSG_SetTone(u8 chan, u16 period)
;	---------------------------------
; Function PSG_SetTone
; ---------------------------------
_PSG_SetTone::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/psg.c:102: u8* ptr = (u8*)g_PSG_Regs;
	ld	hl, #_g_PSG_Regs+0
;/home/bruno/dev/MSXgl/engine/src/psg.c:103: ptr += (chan * 2);
	ld	b, #0x00
	sla	c
	rl	b
	add	hl, bc
;/home/bruno/dev/MSXgl/engine/src/psg.c:104: *ptr = (u8)period;
	ld	(hl), e
;/home/bruno/dev/MSXgl/engine/src/psg.c:105: *++ptr = (u8)(period >> 8);
	inc	hl
	ld	(hl), d
;/home/bruno/dev/MSXgl/engine/src/psg.c:116: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:120: void PSG_SetNoise(u8 period)
;	---------------------------------
; Function PSG_SetNoise
; ---------------------------------
_PSG_SetNoise::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/psg.c:124: u8* ptr = (u8*)g_PSG_Regs + PSG_REG_NOISE;
	ld	de, #_g_PSG_Regs+0
	ld	hl, #0x0006
	add	hl, de
;/home/bruno/dev/MSXgl/engine/src/psg.c:125: *ptr = period;
	ld	(hl), c
;/home/bruno/dev/MSXgl/engine/src/psg.c:133: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:137: void PSG_SetMixer(u8 mix)
;	---------------------------------
; Function PSG_SetMixer
; ---------------------------------
_PSG_SetMixer::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/psg.c:141: u8* ptr = (u8*)g_PSG_Regs + PSG_REG_MIXER;
	ld	de, #_g_PSG_Regs+0
	ld	hl, #0x0007
	add	hl, de
;/home/bruno/dev/MSXgl/engine/src/psg.c:142: *ptr = ~mix; // with PSG_INDIRECT bit #6 & #7 are handled in PSG_Apply() function
	ld	a, c
	cpl
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/psg.c:150: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:154: void PSG_SetVolume(u8 chan, u8 vol)
;	---------------------------------
; Function PSG_SetVolume
; ---------------------------------
_PSG_SetVolume::
	ld	b, a
	ld	c, l
;/home/bruno/dev/MSXgl/engine/src/psg.c:158: u8* ptr = (u8*)g_PSG_Regs + PSG_REG_AMP_A;
	ld	de, #_g_PSG_Regs+0
	ld	hl, #0x0008
	add	hl, de
;/home/bruno/dev/MSXgl/engine/src/psg.c:159: ptr += chan;
	ld	e, b
	ld	d, #0x00
	add	hl, de
;/home/bruno/dev/MSXgl/engine/src/psg.c:160: *ptr = vol;
	ld	(hl), c
;/home/bruno/dev/MSXgl/engine/src/psg.c:168: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:172: void PSG_SetEnvelope(u16 period)
;	---------------------------------
; Function PSG_SetEnvelope
; ---------------------------------
_PSG_SetEnvelope::
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/psg.c:176: g_PSG_Regs.Envelope = period;
	ld	((_g_PSG_Regs + 11)), de
;/home/bruno/dev/MSXgl/engine/src/psg.c:187: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:191: void PSG_SetShape(u8 shape)
;	---------------------------------
; Function PSG_SetShape
; ---------------------------------
_PSG_SetShape::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/psg.c:195: g_PSG_Regs.Shape = shape;
	ld	hl, #(_g_PSG_Regs + 13)
	ld	(hl), c
;/home/bruno/dev/MSXgl/engine/src/psg.c:203: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:207: void PSG_EnableTone(u8 chan, u8 val)
;	---------------------------------
; Function PSG_EnableTone
; ---------------------------------
_PSG_EnableTone::
	ld	e, a
	ld	c, l
;/home/bruno/dev/MSXgl/engine/src/psg.c:210: u8 mix = g_PSG_Regs.Mixer;
	ld	hl, #_g_PSG_Regs+7
	ld	d, (hl)
;/home/bruno/dev/MSXgl/engine/src/psg.c:216: u8 bit = 1 << chan;
	ld	b, e
	ld	e, #0x01
	inc	b
	jp	00111$
00110$:
	sla	e
00111$:
	djnz	00110$
;/home/bruno/dev/MSXgl/engine/src/psg.c:217: mix &= ~bit;
	ld	a, e
	cpl
	and	a, d
;/home/bruno/dev/MSXgl/engine/src/psg.c:219: if(val == 0)
	inc	c
	dec	c
	jr	NZ, 00102$
;/home/bruno/dev/MSXgl/engine/src/psg.c:220: mix |= bit;
	or	a, e
00102$:
;/home/bruno/dev/MSXgl/engine/src/psg.c:223: g_PSG_Regs.Mixer = mix;
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/psg.c:227: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:231: void PSG_EnableNoise(u8 chan, u8 val)
;	---------------------------------
; Function PSG_EnableNoise
; ---------------------------------
_PSG_EnableNoise::
	ld	e, a
	ld	c, l
;/home/bruno/dev/MSXgl/engine/src/psg.c:234: u8 mix = g_PSG_Regs.Mixer;
	ld	hl, #_g_PSG_Regs+7
	ld	d, (hl)
;/home/bruno/dev/MSXgl/engine/src/psg.c:240: u8 bit = 8 << chan;
	ld	b, e
	ld	e, #0x08
	inc	b
	jp	00111$
00110$:
	sla	e
00111$:
	djnz	00110$
;/home/bruno/dev/MSXgl/engine/src/psg.c:241: mix &= ~bit;
	ld	a, e
	cpl
	and	a, d
;/home/bruno/dev/MSXgl/engine/src/psg.c:243: if(val == 0)
	inc	c
	dec	c
	jr	NZ, 00102$
;/home/bruno/dev/MSXgl/engine/src/psg.c:244: mix |= bit;
	or	a, e
00102$:
;/home/bruno/dev/MSXgl/engine/src/psg.c:247: g_PSG_Regs.Mixer = mix;
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/psg.c:251: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:255: void PSG_EnableEnvelope(u8 chan, u8 val)
;	---------------------------------
; Function PSG_EnableEnvelope
; ---------------------------------
_PSG_EnableEnvelope::
	ld	e, a
	ld	b, l
;/home/bruno/dev/MSXgl/engine/src/psg.c:258: u8 vol = g_PSG_Regs.Volume[chan];
	ld	hl, #_g_PSG_Regs+8
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
;/home/bruno/dev/MSXgl/engine/src/psg.c:264: vol &= 0x0F;
	and	a, #0x0f
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/psg.c:266: if(val != 0)
	ld	a, b
	or	a, a
	jr	Z, 00102$
;/home/bruno/dev/MSXgl/engine/src/psg.c:267: vol |= PSG_F_ENV;
	set	4, c
00102$:
;/home/bruno/dev/MSXgl/engine/src/psg.c:270: g_PSG_Regs.Volume[chan] = vol;
	ld	(hl), c
;/home/bruno/dev/MSXgl/engine/src/psg.c:274: }
	ret
;/home/bruno/dev/MSXgl/engine/src/psg.c:280: void PSG_Mute()
;	---------------------------------
; Function PSG_Mute
; ---------------------------------
_PSG_Mute::
;/home/bruno/dev/MSXgl/engine/src/psg.c:284: loop(i, 3)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;/home/bruno/dev/MSXgl/engine/src/psg.c:287: g_PSG_VolumeBackup[i] = g_PSG_Regs.Volume[i];
	ld	hl, #_g_PSG_VolumeBackup
	ld	b, #0x00
	add	hl, bc
	ld	a, #<((_g_PSG_Regs + 8))
	add	a, c
	ld	e, a
	ld	a, #>((_g_PSG_Regs + 8))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/psg.c:289: g_PSG_Regs.Volume[i] = 0;
	xor	a, a
	ld	(de), a
;/home/bruno/dev/MSXgl/engine/src/psg.c:284: loop(i, 3)
	inc	c
;/home/bruno/dev/MSXgl/engine/src/psg.c:304: }
	jp	00103$
;/home/bruno/dev/MSXgl/engine/src/psg.c:309: void PSG_Resume()
;	---------------------------------
; Function PSG_Resume
; ---------------------------------
_PSG_Resume::
;/home/bruno/dev/MSXgl/engine/src/psg.c:313: loop(i, 3)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;/home/bruno/dev/MSXgl/engine/src/psg.c:315: g_PSG_Regs.Volume[i] = g_PSG_VolumeBackup[i];
	ld	a, #<((_g_PSG_Regs + 8))
	add	a, c
	ld	e, a
	ld	a, #>((_g_PSG_Regs + 8))
	adc	a, #0x00
	ld	d, a
	ld	hl, #_g_PSG_VolumeBackup
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;/home/bruno/dev/MSXgl/engine/src/psg.c:313: loop(i, 3)
	inc	c
;/home/bruno/dev/MSXgl/engine/src/psg.c:327: }
	jp	00103$
;/home/bruno/dev/MSXgl/engine/src/psg.c:335: void PSG_Apply()
;	---------------------------------
; Function PSG_Apply
; ---------------------------------
_PSG_Apply::
;/home/bruno/dev/MSXgl/engine/src/psg.c:402: __endasm;
	ld	A, (#_g_PSG_Regs + 7)
	and	#0b00111111
	ld	B, A
	ld	A, #7
	out	(#0xA0), A
	in	A, (#0xA2)
	and	#0b11000000
	or	B
	ld	(#_g_PSG_Regs + 7), A
	ld	HL, #_g_PSG_Regs
	ld	C, #0xA1
	xor	A
	.rept	13
	out	(0xA0), A
	outi
	inc	A
	.endm
	out	(0xA0), A
	ld	A, (HL)
	and	A
	jp	M, PSG_End
	out	(0xA1), A
	PSG_End:
	or	#0x80
	ld	(HL), A
;/home/bruno/dev/MSXgl/engine/src/psg.c:403: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
