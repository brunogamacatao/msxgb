;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module scc
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SCC_AutoDetect
	.globl _SCC_CheckSlotID
	.globl _Bios_InterSlotWrite
	.globl _Bios_InterSlotRead
	.globl _Sys_CheckSlot
	.globl _g_SCC_SlotId
	.globl _g_SCC_MixerBackup
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
	.globl _g_SCC_WaveformAddr
	.globl _g_BDOS
	.globl _g_MASTER
	.globl _g_RAMAD3
	.globl _g_RAMAD2
	.globl _g_RAMAD1
	.globl _g_RAMAD0
	.globl _g_BREAKV
	.globl _g_DISKVE
	.globl _g_KANJTABLE
	.globl _g_STRSRC
	.globl _g_SUBRID
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
	.globl _SCC_Initialize
	.globl _SCC_Select
	.globl _SCC_SetRegister
	.globl _SCC_GetRegister
	.globl _SCC_Mute
	.globl _SCC_Resume
	.globl _SCC_LoadWaveform
	.globl _SCC_SetFrequency
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
_g_SCC_MixerBackup::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_SCC_SlotId::
	.ds 1
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
;/home/bruno/dev/MSXgl/engine/src/scc.c:50: bool SCC_CheckSlotID(u8 slotId)
;	---------------------------------
; Function SCC_CheckSlotID
; ---------------------------------
_SCC_CheckSlotID::
	ld	b, a
;/home/bruno/dev/MSXgl/engine/src/scc.c:53: u8 val = Bios_InterSlotRead(slotId, 0x8000);
	push	bc
	ld	de, #0x8000
	ld	a, b
	call	_Bios_InterSlotRead
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/scc.c:54: Bios_InterSlotWrite(slotId, 0x8000, ~val);
	ld	c, a
	cpl
	push	bc
	push	af
	inc	sp
	ld	de, #0x8000
	ld	a, b
	call	_Bios_InterSlotWrite
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/scc.c:55: if(Bios_InterSlotRead(slotId, 0x8000) != val) // Is RAM?
	push	bc
	ld	de, #0x8000
	ld	a, b
	call	_Bios_InterSlotRead
	pop	bc
	sub	a, c
	jr	Z, 00102$
;/home/bruno/dev/MSXgl/engine/src/scc.c:57: Bios_InterSlotWrite(slotId, 0x8000, val); // backup RAM value
	ld	a, c
	push	af
	inc	sp
	ld	de, #0x8000
	ld	a, b
	call	_Bios_InterSlotWrite
;/home/bruno/dev/MSXgl/engine/src/scc.c:58: return FALSE;
	xor	a, a
	ret
00102$:
;/home/bruno/dev/MSXgl/engine/src/scc.c:62: Bios_InterSlotWrite(slotId, 0x9000, 0x3F);
	push	bc
	ld	a, #0x3f
	push	af
	inc	sp
	ld	de, #0x9000
	ld	a, b
	call	_Bios_InterSlotWrite
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/scc.c:65: val = Bios_InterSlotRead(slotId, 0x9800);
	push	bc
	ld	de, #0x9800
	ld	a, b
	call	_Bios_InterSlotRead
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/scc.c:66: Bios_InterSlotWrite(slotId, 0x9800, ~val);
	ld	c, a
	cpl
	push	bc
	push	af
	inc	sp
	ld	de, #0x9800
	ld	a, b
	call	_Bios_InterSlotWrite
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/scc.c:67: if(Bios_InterSlotRead(slotId, 0x9800) != val) // Is SCC RAM?
	push	bc
	ld	de, #0x9800
	ld	a, b
	call	_Bios_InterSlotRead
	pop	bc
	sub	a, c
	jr	Z, 00104$
;/home/bruno/dev/MSXgl/engine/src/scc.c:69: Bios_InterSlotWrite(slotId, 0x9800, val); // backup SCC RAM value
	ld	a, c
	push	af
	inc	sp
	ld	de, #0x9800
	ld	a, b
	call	_Bios_InterSlotWrite
;/home/bruno/dev/MSXgl/engine/src/scc.c:70: return TRUE;
	ld	a, #0x01
	ret
00104$:
;/home/bruno/dev/MSXgl/engine/src/scc.c:73: return FALSE;
	xor	a, a
;/home/bruno/dev/MSXgl/engine/src/scc.c:74: }
	ret
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
_g_SUBRID	=	0x0000
_g_STRSRC	=	0x0002
_g_KANJTABLE	=	0xf30f
_g_DISKVE	=	0xf323
_g_BREAKV	=	0xf325
_g_RAMAD0	=	0xf341
_g_RAMAD1	=	0xf342
_g_RAMAD2	=	0xf343
_g_RAMAD3	=	0xf344
_g_MASTER	=	0xf348
_g_BDOS	=	0xf37d
_g_SCC_WaveformAddr:
	.dw #0x9800
	.dw #0x9820
	.dw #0x9840
	.dw #0x9860
	.dw #0x98a0
;/home/bruno/dev/MSXgl/engine/src/scc.c:78: u8 SCC_AutoDetect()
;	---------------------------------
; Function SCC_AutoDetect
; ---------------------------------
_SCC_AutoDetect::
;/home/bruno/dev/MSXgl/engine/src/scc.c:80: return Sys_CheckSlot(SCC_CheckSlotID);
	ld	hl, #_SCC_CheckSlotID
;/home/bruno/dev/MSXgl/engine/src/scc.c:81: }
	jp	_Sys_CheckSlot
;/home/bruno/dev/MSXgl/engine/src/scc.c:282: bool SCC_Initialize()
;	---------------------------------
; Function SCC_Initialize
; ---------------------------------
_SCC_Initialize::
;/home/bruno/dev/MSXgl/engine/src/scc.c:285: g_SCC_SlotId = SCC_AutoDetect();
	call	_SCC_AutoDetect
;/home/bruno/dev/MSXgl/engine/src/scc.c:286: if(g_SCC_SlotId == SLOT_NOTFOUND)
	ld	(_g_SCC_SlotId+0), a
;/home/bruno/dev/MSXgl/engine/src/scc.c:287: return FALSE;
	inc	a
	ret	Z
;/home/bruno/dev/MSXgl/engine/src/scc.c:292: SCC_Select();
	call	_SCC_Select
;/home/bruno/dev/MSXgl/engine/src/scc.c:293: return TRUE;
	ld	a, #0x01
;/home/bruno/dev/MSXgl/engine/src/scc.c:294: }
	ret
;/home/bruno/dev/MSXgl/engine/src/scc.c:298: void SCC_Select()
;	---------------------------------
; Function SCC_Select
; ---------------------------------
_SCC_Select::
;/home/bruno/dev/MSXgl/engine/src/scc.c:303: Bios_InterSlotWrite(SCC_SLOT, 0x9000, 0x3F);
	ld	a, #0x3f
	push	af
	inc	sp
	ld	de, #0x9000
	ld	a, (_g_SCC_SlotId+0)
	call	_Bios_InterSlotWrite
;/home/bruno/dev/MSXgl/engine/src/scc.c:305: }
	ret
;/home/bruno/dev/MSXgl/engine/src/scc.c:310: void SCC_SetRegister(u8 reg, u8 value)
;	---------------------------------
; Function SCC_SetRegister
; ---------------------------------
_SCC_SetRegister::
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;/home/bruno/dev/MSXgl/engine/src/scc.c:315: Bios_InterSlotWrite(SCC_SLOT, 0x9800 + reg, value);
	ld	e, h
	xor	a, a
	add	a, #0x98
	ld	d, a
	push	hl
	ld	a, l
	push	af
	inc	sp
	ld	a, (_g_SCC_SlotId+0)
	call	_Bios_InterSlotWrite
	pop	hl
;/home/bruno/dev/MSXgl/engine/src/scc.c:319: if(reg == SCC_REG_MIXER)
	ld	a, h
	sub	a, #0x8f
	ret	NZ
;/home/bruno/dev/MSXgl/engine/src/scc.c:320: g_SCC_MixerBackup = value;
	ld	a, l
	ld	(#_g_SCC_MixerBackup), a
;/home/bruno/dev/MSXgl/engine/src/scc.c:322: }
	ret
;/home/bruno/dev/MSXgl/engine/src/scc.c:326: u8 SCC_GetRegister(u8 reg)
;	---------------------------------
; Function SCC_GetRegister
; ---------------------------------
_SCC_GetRegister::
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;/home/bruno/dev/MSXgl/engine/src/scc.c:331: return Bios_InterSlotRead(SCC_SLOT, 0x9800 + reg);
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	a, h
	add	a, #0x98
	ld	d, a
	ld	a, (_g_SCC_SlotId+0)
;/home/bruno/dev/MSXgl/engine/src/scc.c:333: }
	jp	_Bios_InterSlotRead
;/home/bruno/dev/MSXgl/engine/src/scc.c:337: void SCC_Mute()
;	---------------------------------
; Function SCC_Mute
; ---------------------------------
_SCC_Mute::
;/home/bruno/dev/MSXgl/engine/src/scc.c:342: Bios_InterSlotWrite(SCC_SLOT, SCC_ADDR_MIXER, 0x00);
	xor	a, a
	push	af
	inc	sp
	ld	de, #0x988f
	ld	a, (_g_SCC_SlotId+0)
	call	_Bios_InterSlotWrite
;/home/bruno/dev/MSXgl/engine/src/scc.c:344: }
	ret
;/home/bruno/dev/MSXgl/engine/src/scc.c:349: void SCC_Resume()
;	---------------------------------
; Function SCC_Resume
; ---------------------------------
_SCC_Resume::
;/home/bruno/dev/MSXgl/engine/src/scc.c:354: Bios_InterSlotWrite(SCC_SLOT, SCC_ADDR_MIXER, g_SCC_MixerBackup);
	ld	a, (_g_SCC_MixerBackup+0)
	push	af
	inc	sp
	ld	de, #0x988f
	ld	a, (_g_SCC_SlotId+0)
	call	_Bios_InterSlotWrite
;/home/bruno/dev/MSXgl/engine/src/scc.c:356: }
	ret
;/home/bruno/dev/MSXgl/engine/src/scc.c:367: void SCC_LoadWaveform(u8 channel, const u8* data)
;	---------------------------------
; Function SCC_LoadWaveform
; ---------------------------------
_SCC_LoadWaveform::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	sp
	inc	sp
	push	de
;/home/bruno/dev/MSXgl/engine/src/scc.c:369: u16 addr = g_SCC_WaveformAddr[channel];
	ld	bc, #_g_SCC_WaveformAddr+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;/home/bruno/dev/MSXgl/engine/src/scc.c:373: loopx(32)
	ld	-1 (ix), #0x00
00103$:
	ld	a, -1 (ix)
	sub	a, #0x20
	jr	NC, 00105$
;/home/bruno/dev/MSXgl/engine/src/scc.c:374: Bios_InterSlotWrite(SCC_SLOT, addr++, *data++);
	pop	hl
	push	hl
	ld	a, (hl)
	inc	-3 (ix)
	jr	NZ, 00118$
	inc	-2 (ix)
00118$:
	ld	e, c
	ld	d, b
	inc	bc
	push	bc
	push	af
	inc	sp
	ld	a, (_g_SCC_SlotId+0)
	call	_Bios_InterSlotWrite
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/scc.c:373: loopx(32)
	inc	-1 (ix)
	jp	00103$
00105$:
;/home/bruno/dev/MSXgl/engine/src/scc.c:376: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/scc.c:380: void SCC_SetFrequency(u8 channel, u16 freq)
;	---------------------------------
; Function SCC_SetFrequency
; ---------------------------------
_SCC_SetFrequency::
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	c, e
	ld	b, d
;/home/bruno/dev/MSXgl/engine/src/scc.c:382: u16 addr = SCC_ADDR_FREQ_1 + (channel * 2);
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #0x9880
	add	hl, de
;/home/bruno/dev/MSXgl/engine/src/scc.c:386: Bios_InterSlotWrite(SCC_SLOT, addr++, (u8)freq);
	ld	a, c
	ld	e, l
	ld	d, h
	inc	hl
	push	hl
	push	bc
	push	af
	inc	sp
	ld	a, (_g_SCC_SlotId+0)
	call	_Bios_InterSlotWrite
	pop	bc
	pop	hl
;/home/bruno/dev/MSXgl/engine/src/scc.c:387: Bios_InterSlotWrite(SCC_SLOT, addr, freq >> 8);
	push	bc
	inc	sp
	ex	de, hl
	ld	a, (_g_SCC_SlotId+0)
	call	_Bios_InterSlotWrite
;/home/bruno/dev/MSXgl/engine/src/scc.c:390: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__g_SCC_SlotId:
	.db #0xff	; 255
	.area _CABS (ABS)
