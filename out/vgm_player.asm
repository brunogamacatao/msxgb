;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module vgm_player
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _MSXAudio_Resume
	.globl _MSXAudio_Mute
	.globl _MSXAudio_SetRegister
	.globl _MSXMusic_Resume
	.globl _MSXMusic_Mute
	.globl _MSXMusic_SetRegister
	.globl _SCC_Resume
	.globl _SCC_Mute
	.globl _SCC_SetRegister
	.globl _PSG_Resume
	.globl _PSG_Mute
	.globl _PSG_SetRegister
	.globl _g_VGM_State
	.globl _g_VGM_WaitFrame
	.globl _g_VGM_WaitCount
	.globl _g_VGM_Loop
	.globl _g_VGM_Pointer
	.globl _g_VGM_Header
	.globl _g_SLTSL
	.globl _g_GRPACY
	.globl _g_GRPACX
	.globl _g_LOGOPR
	.globl _g_CMASK
	.globl _g_CLOC
	.globl _g_FNKSTR
	.globl _g_ATRBYT
	.globl _g_BDRCLR
	.globl _g_BAKCLR
	.globl _g_FORCLR
	.globl _g_CSRX
	.globl _g_CSRY
	.globl _g_CLIKSW
	.globl _g_MLTPAT
	.globl _g_MLTATR
	.globl _g_MLTCGP
	.globl _g_MLTCOL
	.globl _g_MLTNAM
	.globl _g_GRPPAT
	.globl _g_GRPATR
	.globl _g_GRPCGP
	.globl _g_GRPCOL
	.globl _g_GRPNAM
	.globl _g_T32PAT
	.globl _g_T32ATR
	.globl _g_T32CGP
	.globl _g_T32COL
	.globl _g_T32NAM
	.globl _g_TXTPAT
	.globl _g_TXTATR
	.globl _g_TXTCGP
	.globl _g_TXTCOL
	.globl _g_TXTNAM
	.globl _g_CLMLST
	.globl _g_CRTCNT
	.globl _g_LINLEN
	.globl _g_LINL32
	.globl _g_LINL40
	.globl _g_CHAR_16
	.globl _g_MSXMID
	.globl _g_MSXVER
	.globl _g_ROMVersion
	.globl _g_BASRVN
	.globl _g_VDP_DW
	.globl _g_VDP_DR
	.globl _g_CGTABL
	.globl _g_SVFFFD
	.globl _g_RG27SAV
	.globl _g_RG26SAV
	.globl _g_RG25SAV
	.globl _g_SVFFF8
	.globl _g_MINROM
	.globl _g_RG23SAV
	.globl _g_RG22SAV
	.globl _g_RG21SAV
	.globl _g_RG20SAV
	.globl _g_RG19SAV
	.globl _g_RG18SAV
	.globl _g_RG17SAV
	.globl _g_RG16SAV
	.globl _g_RG15SAV
	.globl _g_RG14SAV
	.globl _g_RG13SAV
	.globl _g_RG12SAV
	.globl _g_RG11SAV
	.globl _g_RG10SAV
	.globl _g_RG09SAV
	.globl _g_RG08SAV
	.globl _g_PROCNM
	.globl _g_SLTWRK
	.globl _g_SLTATR
	.globl _g_SLTTBL
	.globl _g_EXPTBL
	.globl _g_MNROM
	.globl _g_DRWANG
	.globl _g_DRWSCL
	.globl _g_DRWFLG
	.globl _g_GYPOS
	.globl _g_GXPOS
	.globl _g_BRDATR
	.globl _g_CASPRV
	.globl _g_OLDSCR
	.globl _g_SCRMOD
	.globl _g_FLBMEM
	.globl _g_KANAMD
	.globl _g_KANAST
	.globl _g_CAPST
	.globl _g_CSTYLE
	.globl _g_CSRSW
	.globl _g_INSFLG
	.globl _g_ESCCNT
	.globl _g_GRPHED
	.globl _g_WINWID
	.globl _g_LOWLIM
	.globl _g_INTCNT
	.globl _g_INTVAL
	.globl _g_JIFFY
	.globl _g_PADX
	.globl _g_PADY
	.globl _g_INTFLG
	.globl _g_RTYCNT
	.globl _g_TRPTBL
	.globl _g_HIMEM
	.globl _g_BOTTOM
	.globl _g_PATWRK
	.globl _g_LINWRK
	.globl _g_KEYBUF
	.globl _g_NEWKEY
	.globl _g_OLDKEY
	.globl _g_CLIKFL
	.globl _g_ONGSBF
	.globl _g_FNKFLG
	.globl _g_FNKSWI
	.globl _g_CODSAV
	.globl _g_FSTPOS
	.globl _g_LINTTB
	.globl _g_BASROM
	.globl _g_ENSTOP
	.globl _g_VCBC
	.globl _g_VCBB
	.globl _g_VCBA
	.globl _g_PLYCNT
	.globl _g_MUSICF
	.globl _g_QUEUEN
	.globl _g_MCLPTR
	.globl _g_MCLLEN
	.globl _g_SAVVOL
	.globl _g_VOICEN
	.globl _g_SAVSP
	.globl _g_PRSCNT
	.globl _g_LSTMOD
	.globl _g_LSTCOM
	.globl _g_COMMSK
	.globl _g_ESTBLS
	.globl _g_FLAGS
	.globl _g_ERRORS
	.globl _g_DATCNT
	.globl _g_DEVNUM
	.globl _g_OLDINT
	.globl _g_OLDSTT
	.globl _g_MEXBIh
	.globl _g_RSIQLN
	.globl _g_RSFCB
	.globl _g_TOCNT
	.globl _g_RSTMP
	.globl _g_YSAVE
	.globl _g_XSAVE
	.globl _g_NORUSE
	.globl _g_MODE
	.globl _g_ROMA
	.globl _g_CHRCNT
	.globl _g_EXBRSA
	.globl _g_AVCSAV
	.globl _g_ACPAGE
	.globl _g_DPPAGE
	.globl _g_RS2IQ
	.globl _g_VOICCQ
	.globl _g_VOICBQ
	.globl _g_VOICAQ
	.globl _g_QUEBAK
	.globl _g_QUETAB
	.globl _g_ASPCT2
	.globl _g_ASPCT1
	.globl _g_HEADER
	.globl _g_HIGH
	.globl _g_LOW
	.globl _g_CS240
	.globl _g_CS120
	.globl _g_GETPNT
	.globl _g_PUTPNT
	.globl _g_REPCNT
	.globl _g_SCNCNT
	.globl _g_FRCNEW
	.globl _g_QUEUES
	.globl _g_MINUPD
	.globl _g_MAXUPD
	.globl _g_TRGFLG
	.globl _g_STATFL
	.globl _g_RG7SAV
	.globl _g_RG6SAV
	.globl _g_RG5SAV
	.globl _g_RG4SAV
	.globl _g_RG3SAV
	.globl _g_RG2SAV
	.globl _g_RG1SAV
	.globl _g_RG0SAV
	.globl _g_CNSDFG
	.globl _g_USRTAB
	.globl _g_CLPRIM
	.globl _g_WRPRIM
	.globl _g_RDPRIM
	.globl _VGM_Play
	.globl _VGM_Resume
	.globl _VGM_Pause
	.globl _VGM_Stop
	.globl _VGM_Decode
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
_g_LINL40	=	0xf3ae
_g_LINL32	=	0xf3af
_g_LINLEN	=	0xf3b0
_g_CRTCNT	=	0xf3b1
_g_CLMLST	=	0xf3b2
_g_TXTNAM	=	0xf3b3
_g_TXTCOL	=	0xf3b5
_g_TXTCGP	=	0xf3b7
_g_TXTATR	=	0xf3b9
_g_TXTPAT	=	0xf3bb
_g_T32NAM	=	0xf3bd
_g_T32COL	=	0xf3bf
_g_T32CGP	=	0xf3c1
_g_T32ATR	=	0xf3c3
_g_T32PAT	=	0xf3c5
_g_GRPNAM	=	0xf3c7
_g_GRPCOL	=	0xf3c9
_g_GRPCGP	=	0xf3cb
_g_GRPATR	=	0xf3cd
_g_GRPPAT	=	0xf3cf
_g_MLTNAM	=	0xf3d1
_g_MLTCOL	=	0xf3d3
_g_MLTCGP	=	0xf3d5
_g_MLTATR	=	0xf3d7
_g_MLTPAT	=	0xf3d9
_g_CLIKSW	=	0xf3db
_g_CSRY	=	0xf3dc
_g_CSRX	=	0xf3dd
_g_FORCLR	=	0xf3e9
_g_BAKCLR	=	0xf3ea
_g_BDRCLR	=	0xf3eb
_g_ATRBYT	=	0xf3f2
_g_FNKSTR	=	0xf87f
_g_CLOC	=	0xf92a
_g_CMASK	=	0xf92c
_g_LOGOPR	=	0xfb02
_g_GRPACX	=	0xfcb7
_g_GRPACY	=	0xfcb9
_g_SLTSL	=	0xffff
_g_VGM_Header::
	.ds 2
_g_VGM_Pointer::
	.ds 2
_g_VGM_Loop::
	.ds 2
_g_VGM_WaitCount::
	.ds 2
_g_VGM_WaitFrame::
	.ds 2
_g_VGM_State::
	.ds 1
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
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:46: bool VGM_Play(const void* addr, bool loop)
;	---------------------------------
; Function VGM_Play
; ---------------------------------
_VGM_Play::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:48: VGM_Pause(); // Mute all sound chip
	push	hl
	call	_VGM_Pause
	pop	hl
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:50: g_VGM_Header = (struct VGM_Header*)addr;
	ld	(_g_VGM_Header), hl
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:52: if(g_VGM_Header->Ident != VGM_IDENT)
	ld	hl, (_g_VGM_Header)
	ex	(sp), hl
	pop	de
	push	de
	ld	hl, #2
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	ld	hl, (#___str_0 + 0)
	ld	bc, (#___str_0 + 2)
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	cp	a, a
	sbc	hl, de
	jr	NZ, 00135$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	cp	a, a
	sbc	hl, bc
	jr	Z, 00102$
00135$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:53: return FALSE;
	xor	a, a
	jp	00113$
00102$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:55: g_VGM_State = VGM_STATE_PLAY;
	ld	iy, #_g_VGM_State
	ld	0 (iy), #0x80
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:56: if(loop)
	ld	a, 4 (ix)
	or	a, a
	jr	Z, 00104$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:57: g_VGM_State |= VGM_STATE_LOOP;
	ld	0 (iy), #0x82
00104$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:59: g_VGM_Pointer = (u8*)((u16)&g_VGM_Header->Data_offset + (u16)g_VGM_Header->Data_offset);
	pop	hl
	push	hl
	ld	de, #0x0034
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	ld	(_g_VGM_Pointer), hl
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:60: if(g_VGM_Header->Loop_offset)
	pop	hl
	push	hl
	ld	de, #0x001c
	add	hl, de
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	pop	hl
	ld	a, d
	or	a, e
	or	a, b
	or	a, c
	jr	Z, 00106$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:61: g_VGM_Loop = (u8*)((u16)&g_VGM_Header->Loop_offset + (u16)g_VGM_Header->Loop_offset);
	add	hl, bc
	ld	(_g_VGM_Loop), hl
	jp	00107$
00106$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:63: g_VGM_Loop = 0;
	ld	hl, #0x0000
	ld	(_g_VGM_Loop), hl
00107$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:64: g_VGM_WaitCount = 0;
	ld	hl, #0x0000
	ld	(_g_VGM_WaitCount), hl
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:66: if(g_ROMVersion.VSF)
	ld	a, (#_g_ROMVersion + 0)
	rlca
	jr	NC, 00109$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.h:113: inline void VGM_SetFrequency50Hz() { g_VGM_State |= VGM_STATE_50HZ; g_VGM_WaitFrame = VGM_WAIT_50HZ; }
	ld	a, (_g_VGM_State+0)
	or	a, #0x01
	ld	(_g_VGM_State+0), a
	ld	hl, #0x0372
	ld	(_g_VGM_WaitFrame), hl
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:67: VGM_SetFrequency50Hz();
	jp	00110$
00109$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.h:117: inline void VGM_SetFrequency60Hz() { g_VGM_State &= ~VGM_STATE_50HZ; g_VGM_WaitFrame = VGM_WAIT_60HZ; }
	ld	a, (_g_VGM_State+0)
	and	a, #0xfe
	ld	(_g_VGM_State+0), a
	ld	hl, #0x02df
	ld	(_g_VGM_WaitFrame), hl
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:69: VGM_SetFrequency60Hz();
00110$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:71: return TRUE;
	ld	a, #0x01
00113$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:72: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
_g_RDPRIM	=	0xf380
_g_WRPRIM	=	0xf385
_g_CLPRIM	=	0xf38c
_g_USRTAB	=	0xf39a
_g_CNSDFG	=	0xf3de
_g_RG0SAV	=	0xf3df
_g_RG1SAV	=	0xf3e0
_g_RG2SAV	=	0xf3e1
_g_RG3SAV	=	0xf3e2
_g_RG4SAV	=	0xf3e3
_g_RG5SAV	=	0xf3e4
_g_RG6SAV	=	0xf3e5
_g_RG7SAV	=	0xf3e6
_g_STATFL	=	0xf3e7
_g_TRGFLG	=	0xf3e8
_g_MAXUPD	=	0xf3ec
_g_MINUPD	=	0xf3ef
_g_QUEUES	=	0xf3f3
_g_FRCNEW	=	0xf3f5
_g_SCNCNT	=	0xf3f6
_g_REPCNT	=	0xf3f7
_g_PUTPNT	=	0xf3f8
_g_GETPNT	=	0xf3fa
_g_CS120	=	0xf3fc
_g_CS240	=	0xf401
_g_LOW	=	0xf406
_g_HIGH	=	0xf408
_g_HEADER	=	0xf40a
_g_ASPCT1	=	0xf40b
_g_ASPCT2	=	0xf40d
_g_QUETAB	=	0xf959
_g_QUEBAK	=	0xf971
_g_VOICAQ	=	0xf975
_g_VOICBQ	=	0xf9f5
_g_VOICCQ	=	0xfa75
_g_RS2IQ	=	0xfaf5
_g_DPPAGE	=	0xfaf5
_g_ACPAGE	=	0xfaf6
_g_AVCSAV	=	0xfaf7
_g_EXBRSA	=	0xfaf8
_g_CHRCNT	=	0xfaf9
_g_ROMA	=	0xfafa
_g_MODE	=	0xfafc
_g_NORUSE	=	0xfafd
_g_XSAVE	=	0xfafe
_g_YSAVE	=	0xfb00
_g_RSTMP	=	0xfb03
_g_TOCNT	=	0xfb03
_g_RSFCB	=	0xfb04
_g_RSIQLN	=	0xfb06
_g_MEXBIh	=	0xfb07
_g_OLDSTT	=	0xfb0c
_g_OLDINT	=	0xfb0c
_g_DEVNUM	=	0xfb16
_g_DATCNT	=	0xfb17
_g_ERRORS	=	0xfb1a
_g_FLAGS	=	0xfb1b
_g_ESTBLS	=	0xfb1c
_g_COMMSK	=	0xfb1d
_g_LSTCOM	=	0xfb1e
_g_LSTMOD	=	0xfb1f
_g_PRSCNT	=	0xfb35
_g_SAVSP	=	0xfb36
_g_VOICEN	=	0xfb38
_g_SAVVOL	=	0xfb39
_g_MCLLEN	=	0xfb3b
_g_MCLPTR	=	0xfb3c
_g_QUEUEN	=	0xfb3e
_g_MUSICF	=	0xfb3f
_g_PLYCNT	=	0xfb40
_g_VCBA	=	0xfb41
_g_VCBB	=	0xfb66
_g_VCBC	=	0xfb8b
_g_ENSTOP	=	0xfbb0
_g_BASROM	=	0xfbb1
_g_LINTTB	=	0xfbb2
_g_FSTPOS	=	0xfbca
_g_CODSAV	=	0xfbcc
_g_FNKSWI	=	0xfbcd
_g_FNKFLG	=	0xfbce
_g_ONGSBF	=	0xfbd8
_g_CLIKFL	=	0xfbd9
_g_OLDKEY	=	0xfbda
_g_NEWKEY	=	0xfbe5
_g_KEYBUF	=	0xfbf0
_g_LINWRK	=	0xfc18
_g_PATWRK	=	0xfc40
_g_BOTTOM	=	0xfc48
_g_HIMEM	=	0xfc4a
_g_TRPTBL	=	0xfc4c
_g_RTYCNT	=	0xfc9a
_g_INTFLG	=	0xfc9b
_g_PADY	=	0xfc9c
_g_PADX	=	0xfc9d
_g_JIFFY	=	0xfc9e
_g_INTVAL	=	0xfca0
_g_INTCNT	=	0xfca2
_g_LOWLIM	=	0xfca4
_g_WINWID	=	0xfca5
_g_GRPHED	=	0xfca6
_g_ESCCNT	=	0xfca7
_g_INSFLG	=	0xfca8
_g_CSRSW	=	0xfca9
_g_CSTYLE	=	0xfcaa
_g_CAPST	=	0xfcab
_g_KANAST	=	0xfcac
_g_KANAMD	=	0xfcad
_g_FLBMEM	=	0xfcae
_g_SCRMOD	=	0xfcaf
_g_OLDSCR	=	0xfcb0
_g_CASPRV	=	0xfcb1
_g_BRDATR	=	0xfcb2
_g_GXPOS	=	0xfcb3
_g_GYPOS	=	0xfcb5
_g_DRWFLG	=	0xfcbb
_g_DRWSCL	=	0xfcbc
_g_DRWANG	=	0xfcbd
_g_MNROM	=	0xfcc1
_g_EXPTBL	=	0xfcc1
_g_SLTTBL	=	0xfcc5
_g_SLTATR	=	0xfcc9
_g_SLTWRK	=	0xfd09
_g_PROCNM	=	0xfd89
_g_RG08SAV	=	0xffe7
_g_RG09SAV	=	0xffe8
_g_RG10SAV	=	0xffe9
_g_RG11SAV	=	0xffea
_g_RG12SAV	=	0xffeb
_g_RG13SAV	=	0xffec
_g_RG14SAV	=	0xffed
_g_RG15SAV	=	0xffee
_g_RG16SAV	=	0xffef
_g_RG17SAV	=	0xfff0
_g_RG18SAV	=	0xfff1
_g_RG19SAV	=	0xfff2
_g_RG20SAV	=	0xfff3
_g_RG21SAV	=	0xfff4
_g_RG22SAV	=	0xfff5
_g_RG23SAV	=	0xfff6
_g_MINROM	=	0xfff7
_g_SVFFF8	=	0xfff8
_g_RG25SAV	=	0xfffa
_g_RG26SAV	=	0xfffb
_g_RG27SAV	=	0xfffc
_g_SVFFFD	=	0xfffd
_g_CGTABL	=	0x0004
_g_VDP_DR	=	0x0006
_g_VDP_DW	=	0x0007
_g_BASRVN	=	0x002b
_g_ROMVersion	=	0x002b
_g_MSXVER	=	0x002d
_g_MSXMID	=	0x002e
_g_CHAR_16	=	0x0034
___str_0:
	.ascii "Vgm "
	.db 0x00
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:76: void VGM_Resume()
;	---------------------------------
; Function VGM_Resume
; ---------------------------------
_VGM_Resume::
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:78: g_VGM_State |= VGM_STATE_PLAY;
	ld	a, (_g_VGM_State+0)
	or	a, #0x80
	ld	(_g_VGM_State+0), a
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.h:143: inline bool VGM_ContainsPSG() { return (g_VGM_Header->Version >= 0x0151) && g_VGM_Header->AY8910_clock; }
	ld	bc, (_g_VGM_Header)
	ld	e, c
	ld	d, b
	ld	hl, #8
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, #0x51
	ld	a, d
	sbc	a, #0x01
	ld	de, #0x0000
	sbc	hl, de
	jr	C, 00115$
	ld	hl, #116
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	or	a, b
	or	a, c
	jr	NZ, 00116$
00115$:
	xor	a, a
	jp	00117$
00116$:
	ld	a, #0x01
00117$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:81: if(VGM_ContainsPSG())
	or	a, a
	jr	Z, 00102$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:82: PSG_Resume();
	call	_PSG_Resume
00102$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.h:150: inline bool VGM_ContainsMSXMusic() { return g_VGM_Header->YM2413_clock; }
	ld	hl, (_g_VGM_Header)
	ld	de, #0x0010
	add	hl, de
	ld	a, (hl)
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:86: if(VGM_ContainsMSXMusic())
	or	a, a
	jr	Z, 00104$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:87: MSXMusic_Resume();
	call	_MSXMusic_Resume
00104$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.h:143: inline bool VGM_ContainsPSG() { return (g_VGM_Header->Version >= 0x0151) && g_VGM_Header->AY8910_clock; }
	ld	bc, (_g_VGM_Header)
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.h:157: inline bool VGM_ContainsMSXAudio() { return (g_VGM_Header->Version >= 0x0151) && g_VGM_Header->Y8950_clock; }
	ld	e, c
	ld	d, b
	ld	hl, #8
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, #0x51
	ld	a, d
	sbc	a, #0x01
	ld	de, #0x0000
	sbc	hl, de
	jr	C, 00118$
	ld	hl, #88
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	or	a, b
	or	a, c
	jr	NZ, 00119$
00118$:
	xor	a, a
	jp	00120$
00119$:
	ld	a, #0x01
00120$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:91: if(VGM_ContainsMSXAudio())
	or	a, a
	jr	Z, 00106$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:92: MSXAudio_Resume();
	call	_MSXAudio_Resume
00106$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.h:143: inline bool VGM_ContainsPSG() { return (g_VGM_Header->Version >= 0x0151) && g_VGM_Header->AY8910_clock; }
	ld	bc, (_g_VGM_Header)
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.h:164: inline bool VGM_ContainsSCC() { return (g_VGM_Header->Version >= 0x0161) && g_VGM_Header->K051649_clock; }
	ld	e, c
	ld	d, b
	ld	hl, #8
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, #0x61
	ld	a, d
	sbc	a, #0x01
	ld	de, #0x0000
	sbc	hl, de
	jr	C, 00121$
	ld	hl, #156
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, e
	or	a, b
	or	a, c
	jr	NZ, 00122$
00121$:
	xor	a, a
	jp	00123$
00122$:
	ld	a, #0x01
00123$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:96: if(VGM_ContainsSCC())
	or	a, a
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:97: SCC_Resume();
	jp	NZ,_SCC_Resume
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:99: }
	ret
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:103: void VGM_Pause()
;	---------------------------------
; Function VGM_Pause
; ---------------------------------
_VGM_Pause::
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:105: g_VGM_State &= ~VGM_STATE_PLAY;
	ld	a, (_g_VGM_State+0)
	and	a, #0x7f
	ld	(_g_VGM_State+0), a
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:107: PSG_Mute();
	call	_PSG_Mute
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:110: MSXMusic_Mute();
	call	_MSXMusic_Mute
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:114: MSXAudio_Mute();
	call	_MSXAudio_Mute
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:118: SCC_Mute();
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:120: }
	jp	_SCC_Mute
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:124: void VGM_Stop()
;	---------------------------------
; Function VGM_Stop
; ---------------------------------
_VGM_Stop::
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:126: VGM_Pause();
	call	_VGM_Pause
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:127: g_VGM_Pointer = (u8*)((u16)&g_VGM_Header->Data_offset + (u16)g_VGM_Header->Data_offset);
	ld	hl, (_g_VGM_Header)
	ld	bc, #0x0034
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	add	hl, bc
	ld	(_g_VGM_Pointer), hl
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:128: g_VGM_WaitCount = 0;
	ld	hl, #0x0000
	ld	(_g_VGM_WaitCount), hl
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:129: }
	ret
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:133: void VGM_Decode()
;	---------------------------------
; Function VGM_Decode
; ---------------------------------
_VGM_Decode::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:135: if(!(g_VGM_State & VGM_STATE_PLAY))
	ld	a, (_g_VGM_State+0)
	rlca
	jp	NC,00148$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:136: return;
	jp	00145$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:138: while(g_VGM_WaitCount < g_VGM_WaitFrame)
00145$:
	ld	hl, #_g_VGM_WaitFrame
	ld	a, (_g_VGM_WaitCount+0)
	sub	a, (hl)
	inc	hl
	ld	a, (_g_VGM_WaitCount+1)
	sbc	a, (hl)
	jp	NC, 00147$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:140: if(*g_VGM_Pointer == 0xA0) // AY8910, write value dd to register aa
	ld	hl, (_g_VGM_Pointer)
	ld	a, (hl)
	ld	-1 (ix), a
	sub	a, #0xa0
	jr	NZ, 00143$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:142: PSG_SetRegister(g_VGM_Pointer[1], g_VGM_Pointer[2]);
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	ld	c, (hl)
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_PSG_SetRegister
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:143: g_VGM_Pointer += 2;
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	inc	hl
	ld	(_g_VGM_Pointer), hl
	jp	00144$
00143$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:146: else if(*g_VGM_Pointer == 0xD2) // SCC1, port pp, write value dd to register aa
	ld	a, -1 (ix)
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:148: u8 reg = 0;
	sub	a,#0xd2
	jr	NZ, 00140$
	ld	c,a
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:149: switch(g_VGM_Pointer[1])
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	ld	a, (hl)
	cp	a, #0x01
	jr	Z, 00103$
	cp	a, #0x02
	jr	Z, 00104$
	cp	a, #0x03
	jr	Z, 00105$
	cp	a, #0x04
	jr	Z, 00106$
	sub	a, #0x05
	jr	Z, 00107$
	jp	00108$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:152: case 1:	reg = 0x80;	break; // 0x01 - frequency
00103$:
	ld	c, #0x80
	jp	00108$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:153: case 2:	reg = 0x8A;	break; // 0x02 - volume
00104$:
	ld	c, #0x8a
	jp	00108$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:154: case 3:	reg = 0x8F;	break; // 0x03 - key on/off
00105$:
	ld	c, #0x8f
	jp	00108$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:155: case 4:	reg = 0xA0;	break; // 0x04 - waveform (0x00 used to do SCC access, 0x04 SCC+)
00106$:
	ld	c, #0xa0
	jp	00108$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:156: case 5:	reg = 0xE0;	break; // 0x05 - test register
00107$:
	ld	c, #0xe0
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:157: }
00108$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:158: SCC_SetRegister(reg + g_VGM_Pointer[2], g_VGM_Pointer[3]);
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	inc	hl
	ld	a, (hl)
	add	a, c
	ld	c, a
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_SCC_SetRegister
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:159: g_VGM_Pointer += 3;
	ld	hl, #_g_VGM_Pointer
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
	jp	NC,00144$
	inc	hl
	inc	(hl)
	jp	00144$
00140$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:163: else if(*g_VGM_Pointer == 0x51) // YM2413, write value dd to register aa
	ld	a, -1 (ix)
	sub	a, #0x51
	jr	NZ, 00137$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:165: MSXMusic_SetRegister(g_VGM_Pointer[1], g_VGM_Pointer[2]);
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	ld	c, (hl)
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_MSXMusic_SetRegister
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:166: g_VGM_Pointer += 2;
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	inc	hl
	ld	(_g_VGM_Pointer), hl
	jp	00144$
00137$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:170: else if(*g_VGM_Pointer == 0x5C) // Y8950, write value dd to register aa
	ld	a, -1 (ix)
	sub	a, #0x5c
	jr	NZ, 00134$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:172: u8 reg = g_VGM_Pointer[1];
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	ld	c, (hl)
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:173: if((reg != 0x04) && (reg != 0x18) && (reg != 0x19))
	ld	a,c
	cp	a,#0x04
	jr	Z, 00112$
	cp	a,#0x18
	jr	Z, 00112$
	sub	a, #0x19
	jr	Z, 00112$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:175: u8 value = g_VGM_Pointer[2];
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:176: if(reg == 0x08)
	ld	a, c
	sub	a, #0x08
	jr	NZ, 00110$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:177: value &= 0b11000100;
	ld	a, l
	and	a, #0xc4
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
00110$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:178: MSXAudio_SetRegister(reg, value);
	ld	a, c
	call	_MSXAudio_SetRegister
00112$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:180: g_VGM_Pointer += 2;
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	inc	hl
	ld	(_g_VGM_Pointer), hl
	jp	00144$
00134$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:183: else if(*g_VGM_Pointer == 0x61) // Wait n samples, n can range from 0 to 65535 (approx 1.49 seconds). Longer pauses than this are represented by multiple wait commands.
	ld	a, -1 (ix)
	sub	a, #0x61
	jr	NZ, 00131$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:185: g_VGM_WaitCount += *(u16*)(g_VGM_Pointer+1);
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #_g_VGM_WaitCount
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:186: g_VGM_Pointer += 2;
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	inc	hl
	ld	(_g_VGM_Pointer), hl
	jp	00144$
00131$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:188: else if(*g_VGM_Pointer == 0x62) // Wait 735 samples (60th of a second), a shortcut for 0x61 0xdf 0x02
	ld	a, -1 (ix)
	sub	a, #0x62
	jr	NZ, 00128$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:190: g_VGM_WaitCount += 735;
	ld	hl, (_g_VGM_WaitCount)
	ld	bc, #0x02df
	add	hl, bc
	ld	(_g_VGM_WaitCount), hl
	jp	00144$
00128$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:192: else if(*g_VGM_Pointer == 0x63) // Wait 882 samples (50th of a second), a shortcut for 0x61 0x72 0x03
	ld	a, -1 (ix)
	sub	a, #0x63
	jr	NZ, 00125$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:194: g_VGM_WaitCount += 882;
	ld	hl, (_g_VGM_WaitCount)
	ld	bc, #0x0372
	add	hl, bc
	ld	(_g_VGM_WaitCount), hl
	jp	00144$
00125$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:196: else if(*g_VGM_Pointer == 0x66) // End of sound data
	ld	a, -1 (ix)
	sub	a, #0x66
	jr	NZ, 00122$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:198: if((g_VGM_Loop != 0) && (g_VGM_State & VGM_STATE_LOOP))
	ld	a, (_g_VGM_Loop+1)
	ld	hl, #_g_VGM_Loop
	or	a, (hl)
	jr	Z, 00116$
	ld	a, (_g_VGM_State+0)
	bit	1, a
	jr	Z, 00116$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:200: g_VGM_Pointer = g_VGM_Loop;
	ld	hl, (_g_VGM_Loop)
	ld	(_g_VGM_Pointer), hl
	jp	00144$
00116$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:204: VGM_Stop();
	call	_VGM_Stop
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:205: return;
	jp	00148$
00122$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:208: else if ((*g_VGM_Pointer & 0xF0) == 0x70) // wait n+1 samples, n can range from 0 to 15.
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	a, c
	and	a, #0xf0
	ld	e, a
	ld	d, #0x00
	ld	a, e
	sub	a, #0x70
	or	a, d
	jr	NZ, 00144$
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:210: g_VGM_WaitCount += 1 + *g_VGM_Pointer & 0x0F;
	inc	bc
	ld	a, c
	and	a, #0x0f
	ld	b, #0x00
	ld	hl, (_g_VGM_WaitCount)
	ld	c, a
	add	hl, bc
	ld	(_g_VGM_WaitCount), hl
00144$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:215: g_VGM_Pointer++;
	ld	hl, (_g_VGM_Pointer)
	inc	hl
	ld	(_g_VGM_Pointer), hl
	jp	00145$
00147$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:217: g_VGM_WaitCount -= g_VGM_WaitFrame;
	ld	hl, #_g_VGM_WaitFrame
	push	de
	ld	de, #_g_VGM_WaitCount
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	(de), a
	pop	de
00148$:
;/home/bruno/dev/MSXgl/engine/src/vgm/vgm_player.c:218: }
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
