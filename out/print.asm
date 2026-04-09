;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module print
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CopyNo8HeightFontData
	.globl _Print_ValidatePattern
	.globl _Print_ValidateChar
	.globl _Print_InitColorBuffer
	.globl _Print_MergeColor
	.globl _Print_SplitColor
	.globl _VPD_CommandWriteLoop
	.globl _VPD_CommandSetupR36
	.globl _VPD_CommandSetupR32
	.globl _VDP_CommandWait
	.globl _VDP_SetSpriteExMultiColor
	.globl _VDP_Poke_128K
	.globl _VDP_FillVRAM_128K
	.globl _VDP_WriteVRAM_128K
	.globl _VDP_RegWrite
	.globl _g_PrintInvalid
	.globl _g_PrintData
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
	.globl _g_HexChar
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
	.globl _Print_Initialize
	.globl _Print_SetMode
	.globl _Print_SetFont
	.globl _Print_SetColor
	.globl _Print_SetColorShade
	.globl _Print_SetBitmapFont
	.globl _DrawChar_8B
	.globl _DrawChar_4B
	.globl _DrawChar_2B
	.globl _DrawChar_Trans
	.globl _Print_SetVRAMFont
	.globl _DrawChar_VRAM256
	.globl _DrawChar_VRAM512
	.globl _Print_SetTextFont
	.globl _DrawChar_Layout
	.globl _Print_SetSpriteFont
	.globl _DrawChar_Sprite
	.globl _Print_SetShadow
	.globl _Print_EnableShadow
	.globl _Print_SetOutline
	.globl _Print_EnableOutline
	.globl _Print_Clear
	.globl _Print_Backspace
	.globl _Print_DrawChar
	.globl _Print_DrawCharX
	.globl _Print_DrawText
	.globl _Print_DrawBin8
	.globl _Print_DrawHex8
	.globl _Print_DrawHex16
	.globl _Print_DrawHex32
	.globl _Print_DrawInt
	.globl _Print_DrawFormat
	.globl _Print_DrawLineH
	.globl _Print_DrawLineV
	.globl _Print_DrawBox
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
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
_g_PrintData::
	.ds 59
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_PrintInvalid::
	.ds 8
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
;/home/bruno/dev/MSXgl/engine/src/print.c:98: u8 Print_SplitColor(u8 color)
;	---------------------------------
; Function Print_SplitColor
; ---------------------------------
_Print_SplitColor::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:101: if(g_PrintData.SourceMode == PRINT_MODE_SPRITE)
	ld	a, (#_g_PrintData+26)
	and	a, #0x0f
	sub	a, #0x03
	jr	NZ, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.c:102: return color;
	ld	a, c
	ret
00102$:
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
;/home/bruno/dev/MSXgl/engine/src/print.c:105: switch(VDP_GetMode())
	cp	a, #0x06
	jr	Z, 00103$
	cp	a, #0x07
	jr	Z, 00104$
	cp	a, #0x08
	jr	Z, 00105$
	sub	a, #0x09
	jr	Z, 00106$
	jp	00107$
;/home/bruno/dev/MSXgl/engine/src/print.c:108: case VDP_MODE_GRAPHIC4: return color & 0x0F;
00103$:
	ld	a, c
	and	a, #0x0f
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:111: case VDP_MODE_GRAPHIC5: return color & 0x03;
00104$:
	ld	a, c
	and	a, #0x03
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:114: case VDP_MODE_GRAPHIC6: return color & 0x0F;
00105$:
	ld	a, c
	and	a, #0x0f
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:117: case VDP_MODE_GRAPHIC7: return color;
00106$:
	ld	a, c
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:119: }
00107$:
;/home/bruno/dev/MSXgl/engine/src/print.c:120: return color;
	ld	a, c
;/home/bruno/dev/MSXgl/engine/src/print.c:121: }
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
;/home/bruno/dev/MSXgl/engine/src/print.c:124: u8 Print_MergeColor(u8 color)
;	---------------------------------
; Function Print_MergeColor
; ---------------------------------
_Print_MergeColor::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
;/home/bruno/dev/MSXgl/engine/src/print.c:126: switch(VDP_GetMode())
	ld	a, (#_g_VDP_Data+0)
	cp	a,#0x06
	jr	Z, 00101$
	cp	a,#0x07
	jr	Z, 00102$
	cp	a,#0x08
	jr	Z, 00103$
	sub	a, #0x09
	jr	Z, 00104$
	jp	00105$
;/home/bruno/dev/MSXgl/engine/src/print.c:129: case VDP_MODE_GRAPHIC4: return (color & 0x0F) << 4 | (color & 0x0F);
00101$:
	ld	a, c
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	ld	a, c
	and	a, #0x0f
	or	a, b
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:132: case VDP_MODE_GRAPHIC5: return (color & 0x03) << 6 + (color & 0x03) << 4 + (color & 0x03) << 2 + (color & 0x03);
00102$:
	ld	a, c
	and	a, #0x03
	ld	c, a
	add	a, #0x06
	push	af
	ld	e, c
	pop	af
	inc	a
	jp	00134$
00133$:
	sla	e
00134$:
	dec	a
	jr	NZ,00133$
	ld	a, c
	inc	a
	inc	a
	inc	a
	inc	a
	ld	b, a
	ld	a, e
	inc	b
	jp	00136$
00135$:
	add	a, a
00136$:
	djnz	00135$
	inc	c
	inc	c
	inc	c
	jp	00138$
00137$:
	add	a, a
00138$:
	dec	c
	jr	NZ,00137$
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:135: case VDP_MODE_GRAPHIC6: return (color & 0x0F) << 4 | (color & 0x0F);
00103$:
	ld	a, c
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	ld	a, c
	and	a, #0x0f
	or	a, b
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:138: case VDP_MODE_GRAPHIC7: return color;
00104$:
	ld	a, c
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:140: }
00105$:
;/home/bruno/dev/MSXgl/engine/src/print.c:141: return color;
	ld	a, c
;/home/bruno/dev/MSXgl/engine/src/print.c:142: }
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:153: bool Print_Initialize()
;	---------------------------------
; Function Print_Initialize
; ---------------------------------
_Print_Initialize::
;/home/bruno/dev/MSXgl/engine/src/print.c:155: Print_SetColor(0xF, 0x0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_Print_SetColor
;/home/bruno/dev/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #0x0000
	ld	((_g_PrintData + 5)), hl
;/home/bruno/dev/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 7)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/print.c:158: Print_EnableShadow(FALSE);
	xor	a, a
	call	_Print_EnableShadow
;/home/bruno/dev/MSXgl/engine/src/print.c:161: Print_EnableOutline(FALSE);
	xor	a, a
	call	_Print_EnableOutline
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	hl, #_g_VDP_Data+0
	ld	c, (hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:164: switch(VDP_GetMode()) // Screen mode specific initialization
	ld	a, #0x14
	sub	a, c
	jp	C, 00114$
	ld	b, #0x00
	ld	hl, #00134$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00134$:
	jp	00101$
	jp	00115$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00109$
	jp	00110$
	jp	00111$
	jp	00112$
	jp	00113$
	jp	00114$
	jp	00114$
	jp	00114$
	jp	00114$
	jp	00114$
	jp	00114$
	jp	00114$
	jp	00114$
	jp	00109$
	jp	00109$
	jp	00109$
;/home/bruno/dev/MSXgl/engine/src/print.c:167: case VDP_MODE_TEXT1:		// 40 characters per line of text, one colour for each character
00101$:
;/home/bruno/dev/MSXgl/engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x03
;/home/bruno/dev/MSXgl/engine/src/print.c:169: g_PrintData.ScreenWidth = 40;
	ld	hl, #0x0028
	ld	((_g_PrintData + 27)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:170: break;
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:177: case VDP_MODE_GRAPHIC1:		// 32 characters per one line of text, the COLOURed character available
00103$:
;/home/bruno/dev/MSXgl/engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x03
;/home/bruno/dev/MSXgl/engine/src/print.c:179: g_PrintData.ScreenWidth = 32;
	ld	hl, #0x0020
	ld	((_g_PrintData + 27)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:180: break;
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:183: case VDP_MODE_GRAPHIC2:		// 256 x 192, the colour is specififed for each 8 dots
00104$:
;/home/bruno/dev/MSXgl/engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x03
;/home/bruno/dev/MSXgl/engine/src/print.c:185: g_PrintData.ScreenWidth = 32;
	ld	hl, #0x0020
	ld	((_g_PrintData + 27)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:186: break;
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:189: case VDP_MODE_TEXT2:		// 80 characters per line of text, character blinkable selection
00105$:
;/home/bruno/dev/MSXgl/engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x03
;/home/bruno/dev/MSXgl/engine/src/print.c:191: g_PrintData.ScreenWidth = 80;
	ld	hl, #0x0050
	ld	((_g_PrintData + 27)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:192: break;
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:200: case VDP_MODE_GRAPHIC3:		// GRAPHIC 2 which can use sprite mode 2
00109$:
;/home/bruno/dev/MSXgl/engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x03
;/home/bruno/dev/MSXgl/engine/src/print.c:202: g_PrintData.ScreenWidth = 32;
	ld	hl, #0x0020
	ld	((_g_PrintData + 27)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:203: break;
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:206: case VDP_MODE_GRAPHIC4:		// 256 x 212; 16 colours are available for each dot
00110$:
;/home/bruno/dev/MSXgl/engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x18
;/home/bruno/dev/MSXgl/engine/src/print.c:208: g_PrintData.ScreenWidth = 256;
	ld	hl, #0x0100
	ld	((_g_PrintData + 27)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:209: break;
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:212: case VDP_MODE_GRAPHIC5:		// 512 x 212; 4 colours are available for each dot
00111$:
;/home/bruno/dev/MSXgl/engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x18
;/home/bruno/dev/MSXgl/engine/src/print.c:214: Print_SetColor(0x03, 0x0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x03
	call	_Print_SetColor
;/home/bruno/dev/MSXgl/engine/src/print.c:215: g_PrintData.ScreenWidth = 512;
	ld	hl, #0x0200
	ld	((_g_PrintData + 27)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:216: break;
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:219: case VDP_MODE_GRAPHIC6:		// 512 x 212; 16 colours are available for each dot
00112$:
;/home/bruno/dev/MSXgl/engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x18
;/home/bruno/dev/MSXgl/engine/src/print.c:221: g_PrintData.ScreenWidth = 512;
	ld	hl, #0x0200
	ld	((_g_PrintData + 27)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:222: break;
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:225: case VDP_MODE_GRAPHIC7:		// 256 x 212; 256 colours are available for each dot
00113$:
;/home/bruno/dev/MSXgl/engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x18
;/home/bruno/dev/MSXgl/engine/src/print.c:227: Print_SetColor(0xFF, 0x0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0xff
	call	_Print_SetColor
;/home/bruno/dev/MSXgl/engine/src/print.c:228: g_PrintData.ScreenWidth = 256;
	ld	hl, #0x0100
	ld	((_g_PrintData + 27)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:229: break;
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:231: default:
00114$:
;/home/bruno/dev/MSXgl/engine/src/print.c:233: return FALSE;
	xor	a, a
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:234: }
00115$:
;/home/bruno/dev/MSXgl/engine/src/print.c:238: return TRUE;
	ld	a, #0x01
;/home/bruno/dev/MSXgl/engine/src/print.c:239: }
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:243: void Print_SetMode(u8 mode)
;	---------------------------------
; Function Print_SetMode
; ---------------------------------
_Print_SetMode::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:245: g_PrintData.SourceMode = mode;
	ld	hl, #_g_PrintData + 26
	rrd
	ld	a, c
	rld
;/home/bruno/dev/MSXgl/engine/src/print.c:247: switch(g_PrintData.SourceMode)
	ld	a, (hl)
	and	a, #0x0f
	ld	c, a
	ld	a, #0x04
	sub	a, c
	ret	C
	ld	b, #0x00
	ld	hl, #00161$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00161$:
	jp	00101$
	jp	00107$
	jp	00108$
	jp	00114$
	jp	00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:250: case PRINT_MODE_BITMAP:
00101$:
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
;/home/bruno/dev/MSXgl/engine/src/print.c:252: switch(VDP_GetMode()) // Screen mode specific initialization
	cp	a, #0x06
	jr	Z, 00104$
	cp	a, #0x07
	jr	Z, 00102$
	cp	a, #0x08
	jr	Z, 00104$
	sub	a, #0x09
	jr	Z, 00105$
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:255: case VDP_MODE_GRAPHIC5:
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:256: g_PrintData.DrawChar = DrawChar_2B;
	ld	hl, #_DrawChar_2B
	ld	((_g_PrintData + 24)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:257: break;
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:261: case VDP_MODE_GRAPHIC6:
00104$:
;/home/bruno/dev/MSXgl/engine/src/print.c:262: g_PrintData.DrawChar = DrawChar_4B;
	ld	hl, #_DrawChar_4B
	ld	((_g_PrintData + 24)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:263: break;
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:266: case VDP_MODE_GRAPHIC7:
00105$:
;/home/bruno/dev/MSXgl/engine/src/print.c:267: g_PrintData.DrawChar = DrawChar_8B; 
	ld	hl, #_DrawChar_8B
	ld	((_g_PrintData + 24)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:271: break;
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:274: case PRINT_MODE_BITMAP_TRANS:
00107$:
;/home/bruno/dev/MSXgl/engine/src/print.c:276: g_PrintData.DrawChar = DrawChar_Trans;
	ld	hl, #_DrawChar_Trans
	ld	((_g_PrintData + 24)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:277: break;
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:282: case PRINT_MODE_BITMAP_VRAM:
00108$:
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
;/home/bruno/dev/MSXgl/engine/src/print.c:284: switch(VDP_GetMode()) // Screen mode specific initialization
	cp	a, #0x06
	jr	Z, 00110$
	cp	a, #0x07
	jr	Z, 00112$
	cp	a, #0x08
	jr	Z, 00112$
	sub	a, #0x09
	ret	NZ
;/home/bruno/dev/MSXgl/engine/src/print.c:288: case VDP_MODE_GRAPHIC7:
00110$:
;/home/bruno/dev/MSXgl/engine/src/print.c:289: g_PrintData.DrawChar = DrawChar_VRAM256;
	ld	hl, #_DrawChar_VRAM256
	ld	((_g_PrintData + 24)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:290: break;
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:294: case VDP_MODE_GRAPHIC6:
00112$:
;/home/bruno/dev/MSXgl/engine/src/print.c:295: g_PrintData.DrawChar = DrawChar_VRAM512;
	ld	hl, #_DrawChar_VRAM512
	ld	((_g_PrintData + 24)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:299: break;
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:303: case PRINT_MODE_SPRITE:
00114$:
;/home/bruno/dev/MSXgl/engine/src/print.c:305: g_PrintData.DrawChar = DrawChar_Sprite;
	ld	hl, #_DrawChar_Sprite
	ld	((_g_PrintData + 24)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:306: break;
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:310: case PRINT_MODE_TEXT:
00115$:
;/home/bruno/dev/MSXgl/engine/src/print.c:312: g_PrintData.DrawChar = DrawChar_Layout;
	ld	hl, #_DrawChar_Layout
	ld	((_g_PrintData + 24)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:316: };
;/home/bruno/dev/MSXgl/engine/src/print.c:317: }
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:322: void Print_SetFont(const u8* font)
;	---------------------------------
; Function Print_SetFont
; ---------------------------------
_Print_SetFont::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:324: if(font == NULL) // Use Bios font (if any)
	ld	a, d
	or	a, e
	jr	NZ, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.c:325: Print_SetFontEx(8, 8, 6, 8, 1, 255, (const u8*)g_CGTABL + 8);
	ld	bc, (_g_CGTABL)
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;/home/bruno/dev/MSXgl/engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	bc, #_g_PrintData + 1
	ld	a, #0x08
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x06
;/home/bruno/dev/MSXgl/engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x08
;/home/bruno/dev/MSXgl/engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 21)
	ld	(hl), #0x01
;/home/bruno/dev/MSXgl/engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 22)
	ld	(hl), #0xff
;/home/bruno/dev/MSXgl/engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #(_g_PrintData + 23)
	ld	(hl), #0xff
;/home/bruno/dev/MSXgl/engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	((_g_PrintData + 29)), de
;/home/bruno/dev/MSXgl/engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	((_g_PrintData + 31)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:325: Print_SetFontEx(8, 8, 6, 8, 1, 255, (const u8*)g_CGTABL + 8);
	jp	00106$
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:327: Print_SetFontEx(font[0] >> 4, font[0] & 0x0F, font[1] >> 4, font[1] & 0x0F, font[2], font[3], font+4);
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	push	af
	and	a, #0x0f
	ld	-2 (ix), a
	pop	af
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	-1 (ix), a
	ld	a, (de)
	push	af
	and	a, #0x0f
	ld	e, a
	pop	af
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	d, a
;/home/bruno/dev/MSXgl/engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), d
;/home/bruno/dev/MSXgl/engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	hl, #(_g_PrintData + 1)
	ld	(hl), e
;/home/bruno/dev/MSXgl/engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 21)
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 22)
	ld	a, -4 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	a, -4 (ix)
	sub	a, -3 (ix)
	inc	a
	ld	(#(_g_PrintData + 23)),a
;/home/bruno/dev/MSXgl/engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	((_g_PrintData + 29)), bc
;/home/bruno/dev/MSXgl/engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	push	bc
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00113$:
	add	hl, hl
	jr	NC, 00114$
	add	hl, de
00114$:
	djnz	00113$
	pop	bc
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
	ld	((_g_PrintData + 31)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:327: Print_SetFontEx(font[0] >> 4, font[0] & 0x0F, font[1] >> 4, font[1] & 0x0F, font[2], font[3], font+4);
00106$:
;/home/bruno/dev/MSXgl/engine/src/print.c:328: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:333: void Print_InitColorBuffer(u8 t, u8 b)
;	---------------------------------
; Function Print_InitColorBuffer
; ---------------------------------
_Print_InitColorBuffer::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
;/home/bruno/dev/MSXgl/engine/src/print.c:336: switch(VDP_GetMode())
	ld	-3 (ix), a
	sub	a, #0x06
	jr	Z, 00102$
	ld	a, -3 (ix)
	sub	a, #0x07
	jr	Z, 00103$
	ld	a, -3 (ix)
	sub	a, #0x08
	jr	Z, 00102$
	ld	a, -3 (ix)
	sub	a, #0x09
	jp	Z,00104$
	jp	00107$
;/home/bruno/dev/MSXgl/engine/src/print.c:342: case VDP_MODE_GRAPHIC6:
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:345: g_PrintData.Buffer[0] = (b << 4) | b;	// [ 0, 0 ]
	ld	a, -2 (ix)
	ld	-3 (ix), a
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	ld	-3 (ix), a
	or	a, -2 (ix)
	ld	-4 (ix), a
	ld	hl, #(_g_PrintData + 42)
	ld	a, -4 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:346: g_PrintData.Buffer[1] = (b << 4) | t;	// [ 0, 1 ]
	ld	a, -3 (ix)
	or	a, -1 (ix)
	ld	-3 (ix), a
	ld	hl, #(_g_PrintData + 43)
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:347: g_PrintData.Buffer[2] = (t << 4) | b;	// [ 1, 0 ]
	ld	a, -1 (ix)
	ld	-3 (ix), a
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	ld	-4 (ix), a
	or	a, -2 (ix)
	ld	-3 (ix), a
	ld	hl, #(_g_PrintData + 44)
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:348: g_PrintData.Buffer[3] = (t << 4) | t;	// [ 1, 1 ]
	ld	a, -4 (ix)
	or	a, -1 (ix)
	ld	(#(_g_PrintData + 45)),a
;/home/bruno/dev/MSXgl/engine/src/print.c:349: break;
	jp	00107$
;/home/bruno/dev/MSXgl/engine/src/print.c:352: case VDP_MODE_GRAPHIC5:
00103$:
;/home/bruno/dev/MSXgl/engine/src/print.c:353: g_PrintData.Buffer[ 0] = (b << 6) | (b << 4) | (b << 2) | b;	// [ 0, 0, 0, 0 ]
	ld	a, -2 (ix)
	ld	-3 (ix), a
	rrca
	rrca
	and	a, #0xc0
	ld	-8 (ix), a
	ld	a, -3 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	ld	-7 (ix), a
	ld	a, -8 (ix)
	or	a, -7 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	add	a, a
	add	a, a
	ld	-5 (ix), a
	ld	a, -6 (ix)
	or	a, -5 (ix)
	ld	-4 (ix), a
	or	a, -2 (ix)
	ld	-3 (ix), a
	ld	hl, #(_g_PrintData + 42)
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:354: g_PrintData.Buffer[ 1] = (b << 6) | (b << 4) | (b << 2) | t;	// [ 0, 0, 0, 1 ]
	ld	a, -4 (ix)
	or	a, -1 (ix)
	ld	(#(_g_PrintData + 43)),a
;/home/bruno/dev/MSXgl/engine/src/print.c:355: g_PrintData.Buffer[ 2] = (b << 6) | (b << 4) | (t << 2) | b;	// [ 0, 0, 1, 0 ]
	ld	c, -1 (ix)
	ld	a, c
	add	a, a
	add	a, a
	ld	e, a
	ld	a, -6 (ix)
	or	a, e
	ld	b, a
	or	a, -2 (ix)
	ld	(#(_g_PrintData + 44)),a
;/home/bruno/dev/MSXgl/engine/src/print.c:356: g_PrintData.Buffer[ 3] = (b << 6) | (b << 4) | (t << 2) | t;	// [ 0, 0, 1, 1 ]
	ld	hl, #_g_PrintData + 45
	ld	a, b
	or	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:357: g_PrintData.Buffer[ 4] = (b << 6) | (t << 4) | (b << 2) | b;	// [ 0, 1, 0, 0 ]
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	ld	-4 (ix), a
	ld	a, -8 (ix)
	or	a, -4 (ix)
	ld	-3 (ix), a
	or	a, -5 (ix)
	ld	-6 (ix), a
	or	a, -2 (ix)
	ld	(#(_g_PrintData + 46)),a
;/home/bruno/dev/MSXgl/engine/src/print.c:358: g_PrintData.Buffer[ 5] = (b << 6) | (t << 4) | (b << 2) | t;	// [ 0, 1, 0, 1 ]
	ld	hl, #_g_PrintData + 47
	ld	a, -6 (ix)
	or	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:359: g_PrintData.Buffer[ 6] = (b << 6) | (t << 4) | (t << 2) | b;	// [ 0, 1, 1, 0 ]
	ld	hl, #_g_PrintData + 48
	ld	a, -3 (ix)
	or	a, e
	ld	b, a
	or	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:360: g_PrintData.Buffer[ 7] = (b << 6) | (t << 4) | (t << 2) | t;	// [ 0, 1, 1, 1 ]
	ld	hl, #_g_PrintData + 49
	ld	a, b
	or	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:361: g_PrintData.Buffer[ 8] = (t << 6) | (b << 4) | (b << 2) | b;	// [ 1, 0, 0, 0 ]
	ld	a, c
	rrca
	rrca
	and	a, #0xc0
	ld	c, a
	or	a, -7 (ix)
	ld	b, a
	or	a, -5 (ix)
	ld	-3 (ix), a
	or	a, -2 (ix)
	ld	(#(_g_PrintData + 50)),a
;/home/bruno/dev/MSXgl/engine/src/print.c:362: g_PrintData.Buffer[ 9] = (t << 6) | (b << 4) | (b << 2) | t;	// [ 1, 0, 0, 1 ]
	ld	hl, #_g_PrintData + 51
	ld	a, -3 (ix)
	or	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:363: g_PrintData.Buffer[10] = (t << 6) | (b << 4) | (t << 2) | b;	// [ 1, 0, 1, 0 ]
	ld	hl, #_g_PrintData + 52
	ld	a, b
	or	a, e
	ld	b, a
	or	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:364: g_PrintData.Buffer[11] = (t << 6) | (b << 4) | (t << 2) | t;	// [ 1, 0, 1, 1 ]
	ld	hl, #_g_PrintData + 53
	ld	a, b
	or	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:365: g_PrintData.Buffer[12] = (t << 6) | (t << 4) | (b << 2) | b;	// [ 1, 1, 0, 0 ]
	ld	hl, #_g_PrintData + 54
	ld	a, c
	or	a, -4 (ix)
	ld	d, a
	or	a, -5 (ix)
	ld	c, a
	or	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:366: g_PrintData.Buffer[13] = (t << 6) | (t << 4) | (b << 2) | t;	// [ 1, 1, 0, 1 ]
	ld	hl, #_g_PrintData + 55
	ld	a, c
	or	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:367: g_PrintData.Buffer[14] = (t << 6) | (t << 4) | (t << 2) | b;	// [ 1, 1, 1, 0 ]
	ld	bc, #_g_PrintData + 56
	ld	a, e
	or	a, d
	ld	e, a
	or	a, -2 (ix)
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/print.c:368: g_PrintData.Buffer[15] = (t << 6) | (t << 4) | (t << 2) | t;	// [ 1, 1, 1, 1 ]
	ld	bc, #_g_PrintData + 57
	ld	a, e
	or	a, -1 (ix)
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/print.c:369: break;
	jp	00107$
;/home/bruno/dev/MSXgl/engine/src/print.c:372: case VDP_MODE_GRAPHIC7:
00104$:
;/home/bruno/dev/MSXgl/engine/src/print.c:373: g_PrintData.Buffer[0] = b;	// [ 0, 0 ]
	ld	hl, #(_g_PrintData + 42)
	ld	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:374: g_PrintData.Buffer[1] = b;
	ld	hl, #(_g_PrintData + 43)
	ld	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:375: g_PrintData.Buffer[2] = b;	// [ 0, 1 ]
	ld	hl, #(_g_PrintData + 44)
	ld	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:376: g_PrintData.Buffer[3] = t;
	ld	hl, #(_g_PrintData + 45)
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:377: g_PrintData.Buffer[4] = t;	// [ 1, 0 ]
	ld	hl, #(_g_PrintData + 46)
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:378: g_PrintData.Buffer[5] = b;
	ld	hl, #(_g_PrintData + 47)
	ld	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:379: g_PrintData.Buffer[6] = t;	// [ 1, 1 ]
	ld	hl, #(_g_PrintData + 48)
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:380: g_PrintData.Buffer[7] = t;
	ld	hl, #(_g_PrintData + 49)
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:383: }	
00107$:
;/home/bruno/dev/MSXgl/engine/src/print.c:384: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:391: void Print_SetColor(u8 text, u8 bg)
;	---------------------------------
; Function Print_SetColor
; ---------------------------------
_Print_SetColor::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	c, a
	ld	-1 (ix), l
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
	ld	-2 (ix), a
;/home/bruno/dev/MSXgl/engine/src/vdp.h:463: return mode >= VDP_MODE_GRAPHIC4;
	ld	b, a
	sub	a, #0x06
	ld	a, #0x00
	rla
	xor	a, #0x01
;/home/bruno/dev/MSXgl/engine/src/print.c:393: if(VDP_IsBitmapMode(VDP_GetMode())) // Bitmap mode
	ld	e, a
	or	a, a
	jr	Z, 00109$
;/home/bruno/dev/MSXgl/engine/src/print.c:398: t = Print_SplitColor(t);
	ld	a, c
	call	_Print_SplitColor
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:403: for(u8 i = 0; i < PRINT_COLOR_NUM; ++i)
	ld	e, #0x00
00116$:
	ld	a, e
	sub	a, #0x0c
	jr	NC, 00101$
;/home/bruno/dev/MSXgl/engine/src/print.c:405: g_PrintData.TextColor[i] = t;
	ld	hl, #(_g_PrintData + 8)
	ld	d, #0x00
	add	hl, de
	ld	(hl), c
;/home/bruno/dev/MSXgl/engine/src/print.c:403: for(u8 i = 0; i < PRINT_COLOR_NUM; ++i)
	inc	e
	jp	00116$
00101$:
;/home/bruno/dev/MSXgl/engine/src/print.c:411: b = Print_SplitColor(b);
	push	bc
	ld	a, -1 (ix)
	call	_Print_SplitColor
	pop	bc
	ld	b, a
;/home/bruno/dev/MSXgl/engine/src/print.c:413: g_PrintData.BGColor = b;
	ld	hl, #(_g_PrintData + 20)
	ld	(hl), b
;/home/bruno/dev/MSXgl/engine/src/print.c:415: Print_InitColorBuffer(t, b);
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_Print_InitColorBuffer
	jp	00118$
00109$:
;/home/bruno/dev/MSXgl/engine/src/print.c:421: u8 col = text << 4 | bg;
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	or	a, -1 (ix)
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:422: switch(VDP_GetMode())
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00103$
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	Z, 00104$
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	Z, 00106$
	ld	a, -2 (ix)
	sub	a, #0x04
	jr	Z, 00103$
	ld	a, -2 (ix)
	sub	a, #0x05
	jr	Z, 00106$
	jp	00118$
;/home/bruno/dev/MSXgl/engine/src/print.c:428: case VDP_MODE_TEXT2:		// 80 characters per line of text, character blinkable selection
00103$:
;/home/bruno/dev/MSXgl/engine/src/vdp.h:688: inline void VDP_SetColor(u8 color) { VDP_RegWrite(7, color); }
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	call	_VDP_RegWrite
;/home/bruno/dev/MSXgl/engine/src/print.c:432: break;
	jp	00118$
;/home/bruno/dev/MSXgl/engine/src/print.c:435: case VDP_MODE_GRAPHIC1:		// 32 characters per one line of text, the COLOURed character available
00104$:
;/home/bruno/dev/MSXgl/engine/src/print.c:436: VDP_FillVRAM(col, g_ScreenColorLow, 0, 32);
	ld	hl, #0x0020
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	de, (_g_ScreenColorLow)
	ld	a, c
	call	_VDP_FillVRAM_128K
;/home/bruno/dev/MSXgl/engine/src/print.c:437: break;
	jp	00118$
;/home/bruno/dev/MSXgl/engine/src/print.c:443: case VDP_MODE_GRAPHIC3:		// GRAPHIC 2 which can use sprite mode 2
00106$:
;/home/bruno/dev/MSXgl/engine/src/print.c:447: u16 dst = (u16)g_ScreenColorLow + g_PrintData.PatternOffset * 8;
	ld	a, (#_g_PrintData + 37)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	iy, (_g_ScreenColorLow)
	ex	de, hl
	add	iy, de
;/home/bruno/dev/MSXgl/engine/src/print.c:448: VDP_FillVRAM(col, dst, 0, g_PrintData.CharCount * 8);
	ld	a, (#(_g_PrintData + 23) + 0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	bc
	push	iy
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	iy
	pop	de
	ld	a, c
	call	_VDP_FillVRAM_128K
	pop	iy
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:449: dst += 256 * 8;
	ld	de, #0x0800
	add	iy, de
;/home/bruno/dev/MSXgl/engine/src/print.c:450: VDP_FillVRAM(col, dst, 0, g_PrintData.CharCount * 8);
	ld	a, (#(_g_PrintData + 23) + 0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	bc
	push	iy
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	iy
	pop	de
	ld	a, c
	call	_VDP_FillVRAM_128K
	pop	iy
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:451: dst += 256 * 8;
	push	iy
	pop	de
	ld	hl, #0x0800
	add	hl, de
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:452: VDP_FillVRAM(col, dst, 0, g_PrintData.CharCount * 8);
	ld	a, (#(_g_PrintData + 23) + 0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, c
	call	_VDP_FillVRAM_128K
;/home/bruno/dev/MSXgl/engine/src/print.c:456: };
00118$:
;/home/bruno/dev/MSXgl/engine/src/print.c:459: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:464: void Print_SetColorShade(const u8* shade)
;	---------------------------------
; Function Print_SetColorShade
; ---------------------------------
_Print_SetColorShade::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, l
	ld	b, h
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	hl, #_g_VDP_Data+0
	ld	e, (hl)
;/home/bruno/dev/MSXgl/engine/src/vdp.h:463: return mode >= VDP_MODE_GRAPHIC4;
	ld	a, e
	sub	a, #0x06
	ld	a, #0x00
	rla
	xor	a, #0x01
;/home/bruno/dev/MSXgl/engine/src/print.c:466: if(VDP_IsBitmapMode(VDP_GetMode())) // Bitmap mode
	ld	d, a
	or	a, a
	jr	Z, 00107$
;/home/bruno/dev/MSXgl/engine/src/print.c:469: for(u8 i = 0; i < PRINT_COLOR_NUM; ++i)
	ld	e, #0x00
00113$:
	ld	a, e
	sub	a, #0x0c
	jp	NC, 00118$
;/home/bruno/dev/MSXgl/engine/src/print.c:471: u8 t = shade[i];
	ld	l, e
	ld	h, #0x00
	add	hl, bc
	ld	d, (hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:473: t = Print_SplitColor(t);
	push	bc
	push	de
	ld	a, d
	call	_Print_SplitColor
	pop	de
	pop	bc
	ld	d, a
;/home/bruno/dev/MSXgl/engine/src/print.c:475: g_PrintData.TextColor[i] = t;
	ld	a, #<((_g_PrintData + 8))
	add	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>((_g_PrintData + 8))
	adc	a, #0x00
	ld	h, a
	ld	(hl), d
;/home/bruno/dev/MSXgl/engine/src/print.c:469: for(u8 i = 0; i < PRINT_COLOR_NUM; ++i)
	inc	e
	jp	00113$
00107$:
;/home/bruno/dev/MSXgl/engine/src/print.c:482: switch(VDP_GetMode())
	ld	a,e
	cp	a,#0x03
	jr	Z, 00103$
	sub	a, #0x05
	jr	NZ, 00118$
;/home/bruno/dev/MSXgl/engine/src/print.c:488: case VDP_MODE_GRAPHIC3:		// GRAPHIC 2 which can use sprite mode 2
00103$:
;/home/bruno/dev/MSXgl/engine/src/print.c:492: u16 dst = (u16)g_ScreenColorLow + g_PrintData.PatternOffset * 8;
	ld	a, (#_g_PrintData + 37)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	iy, (_g_ScreenColorLow)
	ex	de, hl
	add	iy, de
;/home/bruno/dev/MSXgl/engine/src/print.c:493: for(u8 i = 0; i < g_PrintData.CharCount; ++i)
	ld	-1 (ix), #0x00
00116$:
	ld	hl, #_g_PrintData + 23
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NC, 00118$
;/home/bruno/dev/MSXgl/engine/src/print.c:495: VDP_WriteVRAM(shade, dst,           0, 8);
	push	bc
	push	iy
	ld	hl, #0x0008
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	iy
	pop	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_128K
	pop	iy
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:496: VDP_WriteVRAM(shade, dst + 256 * 8, 0, 8);
	push	iy
	pop	hl
	ld	e, l
	ld	a, h
	add	a, #0x08
	ld	d, a
	push	hl
	push	bc
	ld	hl, #0x0008
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_128K
	pop	bc
	pop	hl
;/home/bruno/dev/MSXgl/engine/src/print.c:497: VDP_WriteVRAM(shade, dst + 512 * 8, 0, 8);
	ld	e, l
	ld	a, h
	add	a, #0x10
	ld	d, a
	push	hl
	push	bc
	ld	hl, #0x0008
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_128K
	pop	bc
	pop	hl
;/home/bruno/dev/MSXgl/engine/src/print.c:498: dst += 8;
	ld	de, #0x0008
	add	hl, de
	push	hl
	pop	iy
;/home/bruno/dev/MSXgl/engine/src/print.c:493: for(u8 i = 0; i < g_PrintData.CharCount; ++i)
	inc	-1 (ix)
	jp	00116$
;/home/bruno/dev/MSXgl/engine/src/print.c:503: };
00118$:
;/home/bruno/dev/MSXgl/engine/src/print.c:506: }
	inc	sp
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:520: u8 Print_ValidateChar(u8 chr)
;	---------------------------------
; Function Print_ValidateChar
; ---------------------------------
_Print_ValidateChar::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:522: if((chr < g_PrintData.CharFirst) || (chr > g_PrintData.CharLast))
	ld	hl, #_g_PrintData + 21
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00113$
	ld	a, (#_g_PrintData + 22)
	sub	a, c
	jr	NC, 00114$
00113$:
;/home/bruno/dev/MSXgl/engine/src/print.c:524: if((chr >= 'a') && (chr <= 'z') && (g_PrintData.CharFirst <= 'A') && (g_PrintData.CharLast >= 'Z')) // try to remap to upper case letter
	ld	a, c
	sub	a, #0x61
	jr	C, 00108$
	ld	a, #0x7a
	sub	a, c
	jr	C, 00108$
	ld	a, #0x41
	sub	a, b
	jr	C, 00108$
	ld	a, (#_g_PrintData + 22)
	sub	a, #0x5a
	jr	C, 00108$
;/home/bruno/dev/MSXgl/engine/src/print.c:526: chr = chr - 'a' + 'A';
	ld	a, c
	add	a, #0xe0
	ld	c, a
	jp	00114$
00108$:
;/home/bruno/dev/MSXgl/engine/src/print.c:528: else if((chr >= 'A') && (chr <= 'Z') && (g_PrintData.CharFirst <= 'a') && (g_PrintData.CharLast >= 'z')) // try to remap to lower case letter
	ld	a, c
	sub	a, #0x41
	jr	C, 00102$
	ld	a, #0x5a
	sub	a, c
	jr	C, 00102$
	ld	a, #0x61
	sub	a, b
	jr	C, 00102$
	ld	a, (#_g_PrintData + 22)
	sub	a, #0x7a
	jr	C, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.c:530: chr = chr - 'A' + 'a';
	ld	a, c
	add	a, #0x20
	ld	c, a
	jp	00114$
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:533: chr = g_PrintData.CharFirst;
	ld	c, b
00114$:
;/home/bruno/dev/MSXgl/engine/src/print.c:535: return chr;
	ld	a, c
;/home/bruno/dev/MSXgl/engine/src/print.c:536: }
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:541: u8 Print_ValidatePattern(u8 chr, const c8** patterns)
;	---------------------------------
; Function Print_ValidatePattern
; ---------------------------------
_Print_ValidatePattern::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	c, a
	ld	-2 (ix), e
	ld	-1 (ix), d
;/home/bruno/dev/MSXgl/engine/src/print.c:543: if((chr < g_PrintData.CharFirst) || (chr > g_PrintData.CharLast))
	ld	hl, #_g_PrintData + 21
	ld	e, (hl)
	ld	a, c
	sub	a, e
	jr	C, 00113$
	ld	a, (#_g_PrintData + 22)
	sub	a, c
	jp	NC, 00114$
00113$:
;/home/bruno/dev/MSXgl/engine/src/print.c:545: if((chr >= 'a') && (chr <= 'z') && (g_PrintData.CharFirst <= 'A') && (g_PrintData.CharLast >= 'Z')) // try to remap to upper case letter
	ld	a, c
	sub	a, #0x61
	jr	C, 00108$
	ld	a, #0x7a
	sub	a, c
	jr	C, 00108$
	ld	a, #0x41
	sub	a, e
	jr	C, 00108$
	ld	a, (#_g_PrintData + 22)
	sub	a, #0x5a
	jr	C, 00108$
;/home/bruno/dev/MSXgl/engine/src/print.c:547: chr = chr - 'a' + 'A';
	ld	a, c
	add	a, #0xe0
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:548: *patterns = g_PrintData.FontPatterns + g_PrintData.PatternY * (chr - g_PrintData.CharFirst);
	ld	hl, #_g_PrintData + 29
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	hl, #_g_PrintData + 1
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
	ld	d, h
	cp	a, a
	sbc	hl, de
	ex	de, hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	pop	bc
	ld	a, e
	add	a, -4 (ix)
	ld	b, a
	ld	a, d
	adc	a, -3 (ix)
	ld	e, a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), b
	inc	hl
	ld	(hl), e
	jp	00114$
00108$:
;/home/bruno/dev/MSXgl/engine/src/print.c:550: else if((chr >= 'A') && (chr <= 'Z') && (g_PrintData.CharFirst <= 'a') && (g_PrintData.CharLast >= 'z')) // try to remap to lower case letter
	ld	a, c
	sub	a, #0x41
	jr	C, 00102$
	ld	a, #0x5a
	sub	a, c
	jr	C, 00102$
	ld	a, #0x61
	sub	a, e
	jr	C, 00102$
	ld	a, (#_g_PrintData + 22)
	sub	a, #0x7a
	jr	C, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.c:552: chr = chr - 'A' + 'a';
	ld	a, c
	add	a, #0x20
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:553: *patterns = g_PrintData.FontPatterns + g_PrintData.PatternY * (chr - g_PrintData.CharFirst);
	ld	hl, #_g_PrintData + 29
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	hl, #_g_PrintData + 1
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
	ld	d, h
	cp	a, a
	sbc	hl, de
	ex	de, hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	__mulint
	pop	bc
	ld	a, e
	add	a, -4 (ix)
	ld	b, a
	ld	a, d
	adc	a, -3 (ix)
	ld	e, a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), b
	inc	hl
	ld	(hl), e
	jp	00114$
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:556: *patterns = g_PrintInvalid;
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), #<(_g_PrintInvalid)
	inc	hl
	ld	(hl), #>(_g_PrintInvalid)
00114$:
;/home/bruno/dev/MSXgl/engine/src/print.c:558: return chr;
	ld	a, c
;/home/bruno/dev/MSXgl/engine/src/print.c:559: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:573: bool Print_SetBitmapFont(const u8* font)
;	---------------------------------
; Function Print_SetBitmapFont
; ---------------------------------
_Print_SetBitmapFont::
;/home/bruno/dev/MSXgl/engine/src/print.c:575: Print_SetFont(font);
	call	_Print_SetFont
;/home/bruno/dev/MSXgl/engine/src/print.c:576: Print_SetMode(PRINT_MODE_BITMAP);
	xor	a, a
	call	_Print_SetMode
;/home/bruno/dev/MSXgl/engine/src/print.c:577: Print_Initialize();
;/home/bruno/dev/MSXgl/engine/src/print.c:578: }
	jp	_Print_Initialize
;/home/bruno/dev/MSXgl/engine/src/print.c:584: void DrawChar_8B(u8 chr)
;	---------------------------------
; Function DrawChar_8B
; ---------------------------------
_DrawChar_8B::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:586: const u8* patterns = g_PrintData.FontAddr + chr * PRINT_H(g_PrintData.PatternY); // Get character patterns' base address
	ld	de, (#_g_PrintData + 31)
	ld	a, (#(_g_PrintData + 1) + 0)
	push	de
	ld	e, a
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00120$:
	add	hl, hl
	jr	NC, 00121$
	add	hl, de
00121$:
	djnz	00120$
	pop	de
	add	hl, de
	ex	(sp), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:588: chr = Print_ValidatePattern(chr, &patterns);
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	a, c
	call	_Print_ValidatePattern
;/home/bruno/dev/MSXgl/engine/src/print.c:590: u16* l = (u16*)g_HeapStartAddress;
	ld	bc, (_g_HeapStartAddress)
;/home/bruno/dev/MSXgl/engine/src/print.c:591: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j) // Unpack each 6/8-bits line to buffer and send it to VRAM
	ld	-1 (ix), #0x00
00105$:
	ld	hl, #(_g_PrintData + 1)
	ld	e, (hl)
	ld	a, -1 (ix)
	sub	a, e
	jp	NC, 00101$
;/home/bruno/dev/MSXgl/engine/src/print.c:594: Print_InitColorBuffer(g_PrintData.TextColor[j], g_PrintData.BGColor);
	ld	hl, #_g_PrintData + 20
	ld	e, (hl)
	ld	a, #<((_g_PrintData + 8))
	add	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>((_g_PrintData + 8))
	adc	a, #0x00
	ld	h, a
	ld	d, (hl)
	push	bc
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	call	_Print_InitColorBuffer
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:596: u8 f = patterns[j];
	ld	a, -6 (ix)
	add	a, -1 (ix)
	ld	e, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
;/home/bruno/dev/MSXgl/engine/src/print.c:597: *l++ = ((u16*)g_PrintData.Buffer)[f >> 6];
	ld	-2 (ix), a
	rlca
	rlca
	and	a, #0x03
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	ld	de, #(_g_PrintData + 42)
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
	inc	bc
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:598: *l++ = ((u16*)g_PrintData.Buffer)[(f >> 4) & 0x03];
	ld	a, -2 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x3
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #(_g_PrintData + 42)
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
	inc	bc
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:599: *l++ = ((u16*)g_PrintData.Buffer)[(f >> 2) & 0x03];
	ld	a, -2 (ix)
	rrca
	rrca
	and	a, #0x3
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #(_g_PrintData + 42)
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
	inc	bc
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:601: *l++ = ((u16*)g_PrintData.Buffer)[f & 0x03];
	ld	a, -2 (ix)
	and	a, #0x03
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #(_g_PrintData + 42)
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
	inc	bc
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:591: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j) // Unpack each 6/8-bits line to buffer and send it to VRAM
	inc	-1 (ix)
	jp	00105$
00101$:
;/home/bruno/dev/MSXgl/engine/src/print.c:604: VDP_CommandHMMC((u8*)g_HeapStartAddress, g_PrintData.CursorX, g_PrintData.CursorY, DATA_LEN, PRINT_H(g_PrintData.PatternY));
	ld	-4 (ix), e
	ld	-3 (ix), #0x00
	ld	a, (#_g_PrintData + 7)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	bc, (#_g_PrintData + 5)
	ld	de, (_g_HeapStartAddress)
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:23: g_VDP_Command.DX = dx;
	ld	((_g_VDP_Command + 4)), bc
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:24: g_VDP_Command.DY = dy;
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:25: g_VDP_Command.NX = nx;
	ld	hl, #0x0008
	ld	((_g_VDP_Command + 8)), hl
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:26: g_VDP_Command.NY = ny;
	ld	hl, #(_g_VDP_Command + 10)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:27: g_VDP_Command.CLR = *addr;
	ld	a, (de)
	ld	(#(_g_VDP_Command + 12)),a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:28: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:29: g_VDP_Command.CMD = VDP_CMD_HMMC;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0xf0
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:30: VPD_CommandSetupR36();
	push	de
	call	_VPD_CommandSetupR36
	pop	de
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:31: VPD_CommandWriteLoop(addr);
	ex	de, hl
	call	_VPD_CommandWriteLoop
;/home/bruno/dev/MSXgl/engine/src/print.c:604: VDP_CommandHMMC((u8*)g_HeapStartAddress, g_PrintData.CursorX, g_PrintData.CursorY, DATA_LEN, PRINT_H(g_PrintData.PatternY));
;/home/bruno/dev/MSXgl/engine/src/print.c:605: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:613: void DrawChar_4B(u8 chr)
;	---------------------------------
; Function DrawChar_4B
; ---------------------------------
_DrawChar_4B::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:615: const u8* patterns = g_PrintData.FontAddr + chr * PRINT_H(g_PrintData.PatternY); // Get character patterns' base address
	ld	de, (#_g_PrintData + 31)
	ld	a, (#(_g_PrintData + 1) + 0)
	push	de
	ld	e, a
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00120$:
	add	hl, hl
	jr	NC, 00121$
	add	hl, de
00121$:
	djnz	00120$
	pop	de
	add	hl, de
	ex	(sp), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:617: chr = Print_ValidatePattern(chr, &patterns);
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	a, c
	call	_Print_ValidatePattern
;/home/bruno/dev/MSXgl/engine/src/print.c:619: u8* l = (u8*)g_HeapStartAddress;
	ld	bc, (_g_HeapStartAddress)
;/home/bruno/dev/MSXgl/engine/src/print.c:620: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j) // Unpack each 6/8-bits line to buffer and send it to VRAM
	ld	e, #0x00
00105$:
	ld	hl, #(_g_PrintData + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, e
	sub	a, l
	jr	NC, 00101$
;/home/bruno/dev/MSXgl/engine/src/print.c:623: Print_InitColorBuffer(g_PrintData.TextColor[j], g_PrintData.BGColor);
	ld	hl, #_g_PrintData + 20
	ld	d, (hl)
	ld	a, #<((_g_PrintData + 8))
	add	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>((_g_PrintData + 8))
	adc	a, #0x00
	ld	h, a
	ld	h, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	call	_Print_InitColorBuffer
	pop	de
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:625: u8 f = patterns[j];
	pop	hl
	push	hl
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:626: *l++ = g_PrintData.Buffer[f >> 6];
	ld	a, d
	rlca
	rlca
	and	a, #0x03
	add	a, #<((_g_PrintData + 42))
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x00
	adc	a, #>((_g_PrintData + 42))
	ld	h, a
	ld	a, (hl)
	ld	(bc), a
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:627: *l++ = g_PrintData.Buffer[(f >> 4) & 0x03];
	ld	a, d
	rlca
	rlca
	rlca
	rlca
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x3
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	de
	ld	de, #(_g_PrintData + 42)
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:628: *l++ = g_PrintData.Buffer[(f >> 2) & 0x03];
	ld	a, d
	rrca
	rrca
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x3
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	de
	ld	de, #(_g_PrintData + 42)
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	(bc), a
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:630: *l++ = g_PrintData.Buffer[f & 0x03];
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	and	a, #0x03
	ld	d, #0x00
	add	a, #<((_g_PrintData + 42))
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #>((_g_PrintData + 42))
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	(bc), a
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:620: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j) // Unpack each 6/8-bits line to buffer and send it to VRAM
	inc	e
	jp	00105$
00101$:
;/home/bruno/dev/MSXgl/engine/src/print.c:633: VDP_CommandHMMC((u8*)g_HeapStartAddress, g_PrintData.CursorX, g_PrintData.CursorY, DATA_LEN, PRINT_H(g_PrintData.PatternY));
	ld	-4 (ix), l
	ld	-3 (ix), #0x00
	ld	a, (#_g_PrintData + 7)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	bc, (#_g_PrintData + 5)
	ld	de, (_g_HeapStartAddress)
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:23: g_VDP_Command.DX = dx;
	ld	((_g_VDP_Command + 4)), bc
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:24: g_VDP_Command.DY = dy;
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:25: g_VDP_Command.NX = nx;
	ld	hl, #0x0008
	ld	((_g_VDP_Command + 8)), hl
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:26: g_VDP_Command.NY = ny;
	ld	hl, #(_g_VDP_Command + 10)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:27: g_VDP_Command.CLR = *addr;
	ld	a, (de)
	ld	(#(_g_VDP_Command + 12)),a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:28: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:29: g_VDP_Command.CMD = VDP_CMD_HMMC;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0xf0
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:30: VPD_CommandSetupR36();
	push	de
	call	_VPD_CommandSetupR36
	pop	de
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:31: VPD_CommandWriteLoop(addr);
	ex	de, hl
	call	_VPD_CommandWriteLoop
;/home/bruno/dev/MSXgl/engine/src/print.c:633: VDP_CommandHMMC((u8*)g_HeapStartAddress, g_PrintData.CursorX, g_PrintData.CursorY, DATA_LEN, PRINT_H(g_PrintData.PatternY));
;/home/bruno/dev/MSXgl/engine/src/print.c:634: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:642: void DrawChar_2B(u8 chr)
;	---------------------------------
; Function DrawChar_2B
; ---------------------------------
_DrawChar_2B::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:644: const u8* patterns = g_PrintData.FontAddr + chr * PRINT_H(g_PrintData.PatternY); // Get character patterns' base address
	ld	de, (#_g_PrintData + 31)
	ld	a, (#(_g_PrintData + 1) + 0)
	push	de
	ld	e, a
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00120$:
	add	hl, hl
	jr	NC, 00121$
	add	hl, de
00121$:
	djnz	00120$
	pop	de
	add	hl, de
	ex	(sp), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:646: chr = Print_ValidatePattern(chr, &patterns);
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	a, c
	call	_Print_ValidatePattern
;/home/bruno/dev/MSXgl/engine/src/print.c:648: u8* l = (u8*)g_HeapStartAddress;
	ld	bc, (_g_HeapStartAddress)
;/home/bruno/dev/MSXgl/engine/src/print.c:649: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j) // Unpack each 6/8-bits line to buffer and send it to VRAM
	ld	e, #0x00
00105$:
	ld	hl, #(_g_PrintData + 1)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, e
	sub	a, l
	jr	NC, 00101$
;/home/bruno/dev/MSXgl/engine/src/print.c:652: Print_InitColorBuffer(g_PrintData.TextColor[j], g_PrintData.BGColor);
	ld	hl, #_g_PrintData + 20
	ld	d, (hl)
	ld	a, #<((_g_PrintData + 8))
	add	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>((_g_PrintData + 8))
	adc	a, #0x00
	ld	h, a
	ld	h, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	call	_Print_InitColorBuffer
	pop	de
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:654: u8 f = patterns[j];
	pop	hl
	push	hl
	ld	d, #0x00
	add	hl, de
	ld	d, (hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:655: *l++ = g_PrintData.Buffer[f >> 4];
	ld	a, d
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	add	a, #<((_g_PrintData + 42))
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x00
	adc	a, #>((_g_PrintData + 42))
	ld	h, a
	ld	a, (hl)
	ld	(bc), a
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:656: *l++ = g_PrintData.Buffer[f & 0x0F];
	ld	a, d
	and	a, #0x0f
	ld	d, #0x00
	add	a, #<((_g_PrintData + 42))
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #>((_g_PrintData + 42))
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	(bc), a
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:649: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j) // Unpack each 6/8-bits line to buffer and send it to VRAM
	inc	e
	jp	00105$
00101$:
;/home/bruno/dev/MSXgl/engine/src/print.c:658: VDP_CommandHMMC((u8*)g_HeapStartAddress, g_PrintData.CursorX, g_PrintData.CursorY, 8, PRINT_H(g_PrintData.PatternY));
	ld	-4 (ix), l
	ld	-3 (ix), #0x00
	ld	a, (#_g_PrintData + 7)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	bc, (#_g_PrintData + 5)
	ld	de, (_g_HeapStartAddress)
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:23: g_VDP_Command.DX = dx;
	ld	((_g_VDP_Command + 4)), bc
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:24: g_VDP_Command.DY = dy;
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:25: g_VDP_Command.NX = nx;
	ld	hl, #0x0008
	ld	((_g_VDP_Command + 8)), hl
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:26: g_VDP_Command.NY = ny;
	ld	hl, #(_g_VDP_Command + 10)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:27: g_VDP_Command.CLR = *addr;
	ld	a, (de)
	ld	(#(_g_VDP_Command + 12)),a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:28: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:29: g_VDP_Command.CMD = VDP_CMD_HMMC;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0xf0
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:30: VPD_CommandSetupR36();
	push	de
	call	_VPD_CommandSetupR36
	pop	de
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:31: VPD_CommandWriteLoop(addr);
	ex	de, hl
	call	_VPD_CommandWriteLoop
;/home/bruno/dev/MSXgl/engine/src/print.c:658: VDP_CommandHMMC((u8*)g_HeapStartAddress, g_PrintData.CursorX, g_PrintData.CursorY, 8, PRINT_H(g_PrintData.PatternY));
;/home/bruno/dev/MSXgl/engine/src/print.c:659: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:665: void DrawChar_Trans(u8 chr)
;	---------------------------------
; Function DrawChar_Trans
; ---------------------------------
_DrawChar_Trans::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:667: const u8* patterns = g_PrintData.FontAddr + chr * PRINT_H(g_PrintData.PatternY); // Get character patterns' base address
	ld	de, (#_g_PrintData + 31)
	ld	a, (#(_g_PrintData + 1) + 0)
	push	de
	ld	e, a
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00330$:
	add	hl, hl
	jr	NC, 00331$
	add	hl, de
00331$:
	djnz	00330$
	pop	de
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
;/home/bruno/dev/MSXgl/engine/src/print.c:669: chr = Print_ValidatePattern(chr, &patterns);
	ld	hl, #2
	add	hl, sp
	ex	de, hl
	ld	a, c
	call	_Print_ValidatePattern
;/home/bruno/dev/MSXgl/engine/src/print.c:672: if(g_PrintData.FX & PRINT_FX_SHADOW)
	ld	a, (#(_g_PrintData + 38) + 0)
	rrca
	jp	NC,00119$
;/home/bruno/dev/MSXgl/engine/src/print.c:674: g_VDP_Command.DY = g_PrintData.CursorY + g_PrintData.ShadowOffsetY - 3;
	ld	a, (#_g_PrintData + 7)
	ld	c, a
	ld	b, #0x00
	ld	a, (#(_g_PrintData + 39) + 0)
	rrca
	rrca
	rrca
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	bc, #0xfffd
	add	hl,bc
	ld	c, l
	ld	a,h
	ld	b,a
	ld	((_g_VDP_Command + 6)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:675: g_VDP_Command.CLR = g_PrintData.ShadowColor;
	ld	bc, #_g_VDP_Command + 12
	ld	a, (#_g_PrintData + 40)
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/print.c:676: g_VDP_Command.ARG = 0;
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/print.c:677: g_VDP_Command.CMD = VDP_CMD_PSET + 0;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0x50
;/home/bruno/dev/MSXgl/engine/src/print.c:678: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j)
	ld	-1 (ix), #0x00
00157$:
	ld	hl, #(_g_PrintData + 1)
	ld	a,-1 (ix)
	sub	a,(hl)
	jp	NC, 00119$
;/home/bruno/dev/MSXgl/engine/src/print.c:680: g_VDP_Command.DX = g_PrintData.CursorX + g_PrintData.ShadowOffsetX - 3;
	ld	bc, (#_g_PrintData + 5)
	ld	a, (#(_g_PrintData + 39) + 0)
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	bc, #0xfffd
	add	hl,bc
	ld	c, l
	ld	a,h
	ld	b,a
	ld	((_g_VDP_Command + 4)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:682: u8 f = patterns[j];
	ld	a, -3 (ix)
	add	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	h, a
	ld	c, (hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:683: if(f & BIT_7) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	7, c
	jr	Z, 00102$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00102$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:684: if(f & BIT_6) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	6, c
	jr	Z, 00104$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00104$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:685: if(f & BIT_5) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	5, c
	jr	Z, 00106$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00106$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:686: if(f & BIT_4) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	4, c
	jr	Z, 00108$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00108$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:687: if(f & BIT_3) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	3, c
	jr	Z, 00110$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00110$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:688: if(f & BIT_2) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	2, c
	jr	Z, 00112$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00112$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:689: if(f & BIT_1) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	1, c
	jr	Z, 00114$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00114$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:690: if(f & BIT_0) VPD_CommandSetupR36();
	bit	0, c
	jr	Z, 00116$
	call	_VPD_CommandSetupR36
00116$:
;/home/bruno/dev/MSXgl/engine/src/print.c:691: g_VDP_Command.DY++;
	ld	bc, (#(_g_VDP_Command + 6) + 0)
	inc	bc
	ld	((_g_VDP_Command + 6)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:678: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j)
	inc	-1 (ix)
	jp	00157$
00119$:
;/home/bruno/dev/MSXgl/engine/src/print.c:696: if(g_PrintData.FX & PRINT_FX_OUTLINE)
	ld	a, (#(_g_PrintData + 38) + 0)
	bit	1, a
	jp	Z,00138$
;/home/bruno/dev/MSXgl/engine/src/print.c:698: g_VDP_Command.DY = g_PrintData.CursorY - 1;
	ld	a, (#_g_PrintData + 7)
	ld	b, #0x00
	ld	c, a
	dec	bc
	ld	((_g_VDP_Command + 6)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:699: g_VDP_Command.NX = 3;
	ld	hl, #0x0003
	ld	((_g_VDP_Command + 8)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:700: g_VDP_Command.NY = 3;
	ld	((_g_VDP_Command + 10)), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:701: g_VDP_Command.CLR = g_PrintData.OutlineColor;
	ld	a, (#_g_PrintData + 41)
	ld	(#(_g_VDP_Command + 12)),a
;/home/bruno/dev/MSXgl/engine/src/print.c:702: g_VDP_Command.ARG = 0;
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/print.c:703: g_VDP_Command.CMD = (u8)(VDP_CMD_LMMV + 0);
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0x80
;/home/bruno/dev/MSXgl/engine/src/print.c:704: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j)
	ld	c, #0x00
00160$:
	ld	hl, #(_g_PrintData + 1)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jp	NC, 00138$
;/home/bruno/dev/MSXgl/engine/src/print.c:706: g_VDP_Command.DX = g_PrintData.CursorX - 1;
	ld	de, (#_g_PrintData + 5)
	dec	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:708: u8 f = patterns[j];
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:709: if(f & BIT_7) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	7, b
	jr	Z, 00121$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00121$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:710: if(f & BIT_6) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	6, b
	jr	Z, 00123$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00123$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:711: if(f & BIT_5) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	5, b
	jr	Z, 00125$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00125$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:712: if(f & BIT_4) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	4, b
	jr	Z, 00127$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00127$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:713: if(f & BIT_3) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	3, b
	jr	Z, 00129$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00129$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:714: if(f & BIT_2) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	2, b
	jr	Z, 00131$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00131$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:715: if(f & BIT_1) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	1, b
	jr	Z, 00133$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00133$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:716: if(f & BIT_0) VPD_CommandSetupR36();
	bit	0, b
	jr	Z, 00135$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00135$:
;/home/bruno/dev/MSXgl/engine/src/print.c:717: g_VDP_Command.DY++;
	ld	hl, (#(_g_VDP_Command + 6) + 0)
	inc	hl
	ex	(sp), hl
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:704: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j)
	inc	c
	jp	00160$
00138$:
;/home/bruno/dev/MSXgl/engine/src/print.c:726: g_VDP_Command.DY = g_PrintData.CursorY;
	ld	a, (#_g_PrintData + 7)
	ld	c, a
	ld	b, #0x00
	ld	((_g_VDP_Command + 6)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:727: g_VDP_Command.ARG = 0;
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/print.c:728: g_VDP_Command.CMD = VDP_CMD_PSET + 0;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0x50
;/home/bruno/dev/MSXgl/engine/src/print.c:732: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j)
	ld	-1 (ix), #0x00
00163$:
	ld	hl, #(_g_PrintData + 1)
	ld	a,-1 (ix)
	sub	a,(hl)
	jp	NC, 00165$
;/home/bruno/dev/MSXgl/engine/src/print.c:735: g_VDP_Command.CLR = g_PrintData.TextColor[j];
	ld	bc, #_g_VDP_Command + 12
	ld	a, #<((_g_PrintData + 8))
	add	a, -1 (ix)
	ld	e, a
	ld	a, #>((_g_PrintData + 8))
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/print.c:737: g_VDP_Command.DX = g_PrintData.CursorX;
	ld	bc, (#_g_PrintData + 5)
	ld	((_g_VDP_Command + 4)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:739: u8 f = patterns[j];
	ld	a, -3 (ix)
	add	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	h, a
	ld	c, (hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:740: if(f & BIT_7) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	7, c
	jr	Z, 00140$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00140$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:741: if(f & BIT_6) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	6, c
	jr	Z, 00142$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00142$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:742: if(f & BIT_5) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	5, c
	jr	Z, 00144$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00144$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:743: if(f & BIT_4) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	4, c
	jr	Z, 00146$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00146$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:744: if(f & BIT_3) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	3, c
	jr	Z, 00148$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00148$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:745: if(f & BIT_2) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	2, c
	jr	Z, 00150$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00150$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:746: if(f & BIT_1) VPD_CommandSetupR36(); g_VDP_Command.DX++;
	bit	1, c
	jr	Z, 00152$
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
00152$:
	ld	de, (#(_g_VDP_Command + 4) + 0)
	inc	de
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:747: if(f & BIT_0) VPD_CommandSetupR36();
	bit	0, c
	jr	Z, 00154$
	call	_VPD_CommandSetupR36
00154$:
;/home/bruno/dev/MSXgl/engine/src/print.c:748: g_VDP_Command.DY++;
	ld	bc, (#(_g_VDP_Command + 6) + 0)
	inc	bc
	ld	((_g_VDP_Command + 6)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:732: for(u8 j = 0; j < PRINT_H(g_PrintData.PatternY); ++j)
	inc	-1 (ix)
	jp	00163$
00165$:
;/home/bruno/dev/MSXgl/engine/src/print.c:750: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:765: void Print_SetVRAMFont(const u8* font, UY y, u8 color)
;	---------------------------------
; Function Print_SetVRAMFont
; ---------------------------------
_Print_SetVRAMFont::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:767: UX cx = g_PrintData.CursorX;
	ld	hl, #(_g_PrintData + 5)
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:768: UY cy = g_PrintData.CursorY;
	ld	hl, #(_g_PrintData + 7)
	ld	a, (hl)
	ld	-10 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:770: Print_SetFont(font);
	ex	de, hl
	call	_Print_SetFont
;/home/bruno/dev/MSXgl/engine/src/print.c:771: Print_Initialize();
	call	_Print_Initialize
;/home/bruno/dev/MSXgl/engine/src/print.c:772: Print_SetColor(color, 0x0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, 5 (ix)
	call	_Print_SetColor
;/home/bruno/dev/MSXgl/engine/src/print.c:775: Print_SetMode(PRINT_MODE_BITMAP_TRANS); // Activate default mode to write font data into VRAM
	ld	a, #0x01
	call	_Print_SetMode
;/home/bruno/dev/MSXgl/engine/src/print.c:776: g_PrintData.FontVRAMY = y;
	ld	hl, #(_g_PrintData + 33)
	ld	a, 4 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:778: u8 nx = g_PrintData.ScreenWidth / PRINT_W(g_PrintData.UnitX);
	ld	bc, (#(_g_PrintData + 27) + 0)
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	e, a
	ld	d, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__divuint
	ld	-9 (ix), e
;/home/bruno/dev/MSXgl/engine/src/print.c:779: for(u16 chr = g_PrintData.CharFirst; chr <= g_PrintData.CharLast; ++chr)
	ld	a, (#(_g_PrintData + 21) + 0)
	ld	c, a
	ld	b, #0x00
00105$:
	ld	a, (#_g_PrintData + 22)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	h, a
	sbc	hl, bc
	jp	C, 00101$
;/home/bruno/dev/MSXgl/engine/src/print.c:781: u16 idx = chr - g_PrintData.CharFirst;
	ld	a, (#(_g_PrintData + 21) + 0)
	ld	d, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	e, a
	cp	a, a
	sbc	hl, de
	ld	-4 (ix), l
	ld	-3 (ix), h
;/home/bruno/dev/MSXgl/engine/src/print.c:783: g_PrintData.CursorX = (idx % nx) * PRINT_W(g_PrintData.UnitX);		
	ld	a, -9 (ix)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__moduint
	push	de
	pop	iy
	pop	bc
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	e, a
	ld	d, #0x00
	push	bc
	push	iy
	pop	hl
	call	__mulint
	ld	-8 (ix), e
	ld	-7 (ix), d
	pop	bc
	ld	hl, #(_g_PrintData + 5)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:784: g_PrintData.CursorY = (idx / nx) * PRINT_H(g_PrintData.PatternY) + y;
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divuint
	pop	bc
	ld	a, (#(_g_PrintData + 1) + 0)
	push	bc
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00120$:
	add	hl, hl
	jr	NC, 00121$
	add	hl, de
00121$:
	djnz	00120$
	pop	bc
	ld	a, l
	add	a, 4 (ix)
	ld	e, a
	ld	hl, #(_g_PrintData + 7)
	ld	(hl), e
;/home/bruno/dev/MSXgl/engine/src/print.c:785: VDP_CommandHMMV(g_PrintData.CursorX, g_PrintData.CursorY, PRINT_W(g_PrintData.UnitX), PRINT_H(g_PrintData.PatternY), 0);
	ld	a, (#(_g_PrintData + 1) + 0)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	-2 (ix), e
	ld	-1 (ix), #0x00
	ld	e, -8 (ix)
	ld	d, -7 (ix)
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:107: g_VDP_Command.DX = dx; 
	ld	((_g_VDP_Command + 4)), de
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:108: g_VDP_Command.DY = dy; 
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:109: g_VDP_Command.NX = nx; 
	ld	hl, #(_g_VDP_Command + 8)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:110: g_VDP_Command.NY = ny; 
	ld	hl, #(_g_VDP_Command + 10)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:111: g_VDP_Command.CLR = col; 
	ld	hl, #(_g_VDP_Command + 12)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:112: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:113: g_VDP_Command.CMD = VDP_CMD_HMMV;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0xc0
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:114: VPD_CommandSetupR36();
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:786: g_PrintData.DrawChar(chr);
	ld	hl, (#_g_PrintData + 24)
	ld	e, c
	push	bc
	ld	a, e
	call	___sdcc_call_hl
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:779: for(u16 chr = g_PrintData.CharFirst; chr <= g_PrintData.CharLast; ++chr)
	inc	bc
	jp	00105$
00101$:
;/home/bruno/dev/MSXgl/engine/src/print.c:789: g_PrintData.CursorX = cx;
	ld	hl, #(_g_PrintData + 5)
	ld	a, -12 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -11 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:790: g_PrintData.CursorY = cy;
	ld	hl, #(_g_PrintData + 7)
	ld	a, -10 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:792: g_PrintData.CharPerLine = g_PrintData.ScreenWidth / PRINT_W(g_PrintData.UnitX);
	ld	bc, (#(_g_PrintData + 27) + 0)
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	e, a
	ld	d, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__divuint
	ld	hl, #(_g_PrintData + 34)
	ld	(hl), e
;/home/bruno/dev/MSXgl/engine/src/print.c:794: Print_SetMode(PRINT_MODE_BITMAP_VRAM);
	ld	a, #0x02
	call	_Print_SetMode
;/home/bruno/dev/MSXgl/engine/src/print.c:795: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:801: void DrawChar_VRAM256(u8 chr)
;	---------------------------------
; Function DrawChar_VRAM256
; ---------------------------------
_DrawChar_VRAM256::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:804: chr = Print_ValidateChar(chr);
	call	_Print_ValidateChar
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:806: u8 idx = chr - g_PrintData.CharFirst;
	ld	hl, #_g_PrintData + 21
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	e, a
;/home/bruno/dev/MSXgl/engine/src/print.c:814: u16 sx = (idx % g_PrintData.CharPerLine) * PRINT_W(g_PrintData.UnitX);		
	ld	hl, #_g_PrintData + 34
	ld	d, (hl)
	push	de
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	__moduchar
	ld	a, e
	pop	de
	ld	hl, #_g_PrintData + 2
	ld	c, (hl)
	push	de
	ld	e, c
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00105$:
	add	hl, hl
	jr	NC, 00106$
	add	hl, de
00106$:
	djnz	00105$
	pop	de
	ex	(sp), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:815: u16 sy = (idx / g_PrintData.CharPerLine) * PRINT_H(g_PrintData.PatternY) + g_PrintData.FontVRAMY;
	push	bc
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	__divuchar
	pop	bc
	ld	a, (#_g_PrintData + 1)
	ld	-1 (ix), a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00107$:
	add	hl, hl
	jr	NC, 00108$
	add	hl, de
00108$:
	djnz	00107$
	ex	de, hl
	ld	a, (#_g_PrintData + 33)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:818: VDP_CommandHMMM(sx, sy, g_PrintData.CursorX, g_PrintData.CursorY, PRINT_W(g_PrintData.UnitX), PRINT_H(g_PrintData.PatternY));
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	b, #0x00
	ld	a, (#_g_PrintData + 7)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	hl, #_g_PrintData + 5
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:75: g_VDP_Command.SX = sx;
	ld	hl, #_g_VDP_Command
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:76: g_VDP_Command.SY = sy;
	ld	((_g_VDP_Command + 2)), de
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:77: g_VDP_Command.DX = dx;
	ld	hl, #(_g_VDP_Command + 4)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:78: g_VDP_Command.DY = dy;
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:79: g_VDP_Command.NX = nx;
	ld	((_g_VDP_Command + 8)), bc
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:80: g_VDP_Command.NY = ny;
	ld	hl, #(_g_VDP_Command + 10)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:81: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:82: g_VDP_Command.CMD = VDP_CMD_HMMM;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0xd0
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:83: VPD_CommandSetupR32();
	call	_VPD_CommandSetupR32
;/home/bruno/dev/MSXgl/engine/src/print.c:818: VDP_CommandHMMM(sx, sy, g_PrintData.CursorX, g_PrintData.CursorY, PRINT_W(g_PrintData.UnitX), PRINT_H(g_PrintData.PatternY));
;/home/bruno/dev/MSXgl/engine/src/print.c:819: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:826: void DrawChar_VRAM512(u8 chr)
;	---------------------------------
; Function DrawChar_VRAM512
; ---------------------------------
_DrawChar_VRAM512::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:829: chr = Print_ValidateChar(chr);
	call	_Print_ValidateChar
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:831: u8 idx = chr - g_PrintData.CharFirst;
	ld	hl, #_g_PrintData + 21
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	e, a
;/home/bruno/dev/MSXgl/engine/src/print.c:839: u16 sx = (idx % g_PrintData.CharPerLine) * PRINT_W(g_PrintData.UnitX);		
	ld	hl, #_g_PrintData + 34
	ld	d, (hl)
	push	de
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	__moduchar
	ld	a, e
	pop	de
	ld	hl, #_g_PrintData + 2
	ld	c, (hl)
	push	de
	ld	e, c
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00105$:
	add	hl, hl
	jr	NC, 00106$
	add	hl, de
00106$:
	djnz	00105$
	pop	de
	ex	(sp), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:840: u16 sy = (idx / g_PrintData.CharPerLine) * PRINT_H(g_PrintData.PatternY) + g_PrintData.FontVRAMY;
	push	bc
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	__divuchar
	pop	bc
	ld	a, (#_g_PrintData + 1)
	ld	-1 (ix), a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00107$:
	add	hl, hl
	jr	NC, 00108$
	add	hl, de
00108$:
	djnz	00107$
	ex	de, hl
	ld	a, (#_g_PrintData + 33)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:843: VDP_CommandHMMM(sx, sy, g_PrintData.CursorX, g_PrintData.CursorY, PRINT_W(g_PrintData.UnitX), PRINT_H(g_PrintData.PatternY));
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	b, #0x00
	ld	a, (#_g_PrintData + 7)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	hl, #_g_PrintData + 5
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:75: g_VDP_Command.SX = sx;
	ld	hl, #_g_VDP_Command
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:76: g_VDP_Command.SY = sy;
	ld	((_g_VDP_Command + 2)), de
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:77: g_VDP_Command.DX = dx;
	ld	hl, #(_g_VDP_Command + 4)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:78: g_VDP_Command.DY = dy;
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:79: g_VDP_Command.NX = nx;
	ld	((_g_VDP_Command + 8)), bc
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:80: g_VDP_Command.NY = ny;
	ld	hl, #(_g_VDP_Command + 10)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:81: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:82: g_VDP_Command.CMD = VDP_CMD_HMMM;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0xd0
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:83: VPD_CommandSetupR32();
	call	_VPD_CommandSetupR32
;/home/bruno/dev/MSXgl/engine/src/print.c:843: VDP_CommandHMMM(sx, sy, g_PrintData.CursorX, g_PrintData.CursorY, PRINT_W(g_PrintData.UnitX), PRINT_H(g_PrintData.PatternY));
;/home/bruno/dev/MSXgl/engine/src/print.c:844: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:860: void CopyNo8HeightFontData(const u8* src, u16 dst, u8 height)
;	---------------------------------
; Function CopyNo8HeightFontData
; ---------------------------------
_CopyNo8HeightFontData::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ex	(sp), hl
	ld	c, e
	ld	b, d
;/home/bruno/dev/MSXgl/engine/src/print.c:862: for(u8 i = 0; i < g_PrintData.CharCount; ++i)
	ld	-1 (ix), #0x00
00103$:
	ld	hl, #(_g_PrintData + 23)
	ld	e, (hl)
	ld	a, -1 (ix)
	sub	a, e
	jr	NC, 00105$
;/home/bruno/dev/MSXgl/engine/src/print.c:864: VDP_FillVRAM(0, dst, 0, 8);
	push	bc
	ld	hl, #0x0008
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	e, c
	ld	d, b
	xor	a, a
	call	_VDP_FillVRAM_128K
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:865: VDP_WriteVRAM(src, dst, 0, height);
	ld	e, 4 (ix)
	ld	d, #0x00
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	e, c
	ld	d, b
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_128K
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:866: src += height;
	ld	a, -3 (ix)
	add	a, 4 (ix)
	ld	-3 (ix), a
	jr	NC, 00118$
	inc	-2 (ix)
00118$:
;/home/bruno/dev/MSXgl/engine/src/print.c:867: dst += 8;
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
;/home/bruno/dev/MSXgl/engine/src/print.c:862: for(u8 i = 0; i < g_PrintData.CharCount; ++i)
	inc	-1 (ix)
	jp	00103$
00105$:
;/home/bruno/dev/MSXgl/engine/src/print.c:869: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:874: void Print_SetTextFont(const u8* fontData, u8 offset)
;	---------------------------------
; Function Print_SetTextFont
; ---------------------------------
_Print_SetTextFont::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;/home/bruno/dev/MSXgl/engine/src/print.c:876: g_PrintData.PatternOffset = offset;
	ld	hl, #(_g_PrintData + 37)
	ld	a, 4 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:879: if(fontData == NULL) // Use Bios font (if any)
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jp	NZ, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.c:880: Print_SetFontEx(8, 8, 1, 1, 1, 255, (const u8*)g_CGTABL + 8); // @todo Should be [1, 255] to include all characters
	ld	hl, (_g_CGTABL)
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, -4 (ix)
	add	a, #0x08
	ld	-8 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;/home/bruno/dev/MSXgl/engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	hl, #(_g_PrintData + 1)
	ld	(hl), #0x08
;/home/bruno/dev/MSXgl/engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x01
;/home/bruno/dev/MSXgl/engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x01
;/home/bruno/dev/MSXgl/engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 21)
	ld	(hl), #0x01
;/home/bruno/dev/MSXgl/engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 22)
	ld	(hl), #0xff
;/home/bruno/dev/MSXgl/engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #_g_PrintData + 23
	ex	(sp), hl
	pop	hl
	push	hl
	ld	(hl), #0xff
;/home/bruno/dev/MSXgl/engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	hl, #_g_PrintData + 29
	ld	-10 (ix), l
	ld	-9 (ix), h
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (#(_g_PrintData + 1) + 0)
	ld	-3 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -8 (ix)
	sub	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	sbc	a, -5 (ix)
	ld	-3 (ix), a
	ld	hl, #(_g_PrintData + 31)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:880: Print_SetFontEx(8, 8, 1, 1, 1, 255, (const u8*)g_CGTABL + 8); // @todo Should be [1, 255] to include all characters
	jp	00103$
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:882: Print_SetFontEx(8, 8, 1, 1, fontData[2], fontData[3], fontData+4);
	ld	a, -2 (ix)
	add	a, #0x04
	ld	-8 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -1 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;/home/bruno/dev/MSXgl/engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	hl, #(_g_PrintData + 1)
	ld	(hl), #0x08
;/home/bruno/dev/MSXgl/engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x01
;/home/bruno/dev/MSXgl/engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x01
;/home/bruno/dev/MSXgl/engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 21)
	ld	a, -6 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 22)
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #_g_PrintData + 23
	ex	(sp), hl
	ld	a, -3 (ix)
	sub	a, -6 (ix)
	ld	-3 (ix), a
	inc	-3 (ix)
	pop	hl
	push	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	hl, #_g_PrintData + 29
	ld	-10 (ix), l
	ld	-9 (ix), h
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (#(_g_PrintData + 1) + 0)
	ld	-3 (ix), a
	ld	e, a
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00146$:
	add	hl, hl
	jr	NC, 00147$
	add	hl, de
00147$:
	djnz	00146$
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, -8 (ix)
	sub	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	sbc	a, -3 (ix)
	ld	-5 (ix), a
	ld	hl, #(_g_PrintData + 31)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:882: Print_SetFontEx(8, 8, 1, 1, fontData[2], fontData[3], fontData+4);
00103$:
;/home/bruno/dev/MSXgl/engine/src/print.c:883: Print_Initialize();
	call	_Print_Initialize
;/home/bruno/dev/MSXgl/engine/src/print.c:884: Print_SetMode(PRINT_MODE_TEXT);
	ld	a, #0x04
	call	_Print_SetMode
;/home/bruno/dev/MSXgl/engine/src/print.c:887: const u8* src = g_PrintData.FontPatterns;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:888: u16 dst = (u16)g_ScreenPatternLow + (offset * 8);
	ld	a, 4 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	b, #0x03
00148$:
	sla	-6 (ix)
	rl	-5 (ix)
	djnz	00148$
	ld	hl, (_g_ScreenPatternLow)
	ld	-10 (ix), l
	ld	-9 (ix), h
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	add	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -9 (ix)
	adc	a, -7 (ix)
	ld	-5 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:890: if(fontData != NULL)
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	Z, 00105$
;/home/bruno/dev/MSXgl/engine/src/print.c:891: CopyNo8HeightFontData(src, dst, fontData[0] & 0x0F);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	and	a, #0x0f
	push	af
	inc	sp
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CopyNo8HeightFontData
	jp	00106$
00105$:
;/home/bruno/dev/MSXgl/engine/src/print.c:894: VDP_WriteVRAM(src, dst, 0, g_PrintData.CharCount * 8);
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-7 (ix), a
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	ld	b, #0x03
00149$:
	sla	-8 (ix)
	rl	-7 (ix)
	djnz	00149$
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_128K
00106$:
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
;/home/bruno/dev/MSXgl/engine/src/print.c:896: switch(VDP_GetMode())
	ld	-7 (ix), a
	sub	a, #0x03
	jr	Z, 00108$
	ld	a, -7 (ix)
	sub	a, #0x05
	jp	NZ,00119$
;/home/bruno/dev/MSXgl/engine/src/print.c:902: case VDP_MODE_GRAPHIC3:		// GRAPHIC 2 which can use sprite mode 2
00108$:
;/home/bruno/dev/MSXgl/engine/src/print.c:905: dst += 256 * 8;
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, #0x08
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:907: if(fontData != NULL)
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	Z, 00110$
;/home/bruno/dev/MSXgl/engine/src/print.c:908: CopyNo8HeightFontData(src, dst, fontData[0] & 0x0F);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	and	a, #0x0f
	push	af
	inc	sp
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CopyNo8HeightFontData
	jp	00111$
00110$:
;/home/bruno/dev/MSXgl/engine/src/print.c:911: VDP_WriteVRAM(src, dst, 0, g_PrintData.CharCount * 8);
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	b, #0x03
00153$:
	sla	-6 (ix)
	rl	-5 (ix)
	djnz	00153$
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_128K
00111$:
;/home/bruno/dev/MSXgl/engine/src/print.c:912: dst += 256 * 8;
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	add	a, #0x08
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:914: if(fontData != NULL)
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jr	Z, 00113$
;/home/bruno/dev/MSXgl/engine/src/print.c:915: CopyNo8HeightFontData(src, dst, fontData[0] & 0x0F);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	and	a, #0x0f
	push	af
	inc	sp
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CopyNo8HeightFontData
	jp	00119$
00113$:
;/home/bruno/dev/MSXgl/engine/src/print.c:918: VDP_WriteVRAM(src, dst, 0, g_PrintData.CharCount * 8);
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	ld	b, #0x03
00154$:
	sla	-8 (ix)
	rl	-7 (ix)
	djnz	00154$
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_128K
;/home/bruno/dev/MSXgl/engine/src/print.c:921: };
00119$:
;/home/bruno/dev/MSXgl/engine/src/print.c:922: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:927: void DrawChar_Layout(u8 chr)
;	---------------------------------
; Function DrawChar_Layout
; ---------------------------------
_DrawChar_Layout::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;/home/bruno/dev/MSXgl/engine/src/print.c:930: chr = Print_ValidateChar(chr);
	call	_Print_ValidateChar
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:932: u8 shape = chr - g_PrintData.CharFirst + g_PrintData.PatternOffset;
	ld	hl, #_g_PrintData + 21
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	hl, #_g_PrintData + 37
	ld	c, (hl)
	add	a, c
	ld	-1 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:933: u16 dst = (u16)g_ScreenLayoutLow + (g_PrintData.CursorY * g_PrintData.ScreenWidth) + g_PrintData.CursorX;
	ld	hl, #_g_PrintData + 7
	ld	c, (hl)
	ld	de, (#_g_PrintData + 27)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	ld	iy, (_g_ScreenLayoutLow)
	add	iy, de
	ld	hl, (#_g_PrintData + 5)
	push	iy
	pop	de
	add	hl, de
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:934: VDP_Poke(shape, dst, g_ScreenLayoutHigh);
	ld	a, (_g_ScreenLayoutHigh+0)
	push	af
	inc	sp
	ld	a, -1 (ix)
	call	_VDP_Poke_128K
;/home/bruno/dev/MSXgl/engine/src/print.c:935: }
	inc	sp
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:954: void Print_SetSpriteFont(const u8* font, u8 patIdx, u8 sprtIdx)
;	---------------------------------
; Function Print_SetSpriteFont
; ---------------------------------
_Print_SetSpriteFont::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:956: g_PrintData.SpritePattern = patIdx;
	ld	hl, #(_g_PrintData + 35)
	ld	a, 4 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:957: g_PrintData.SpriteID = sprtIdx;
	ld	hl, #(_g_PrintData + 36)
	ld	a, 5 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:959: Print_SetFont(font);
	ex	de, hl
	call	_Print_SetFont
;/home/bruno/dev/MSXgl/engine/src/print.c:960: Print_Initialize();
	call	_Print_Initialize
;/home/bruno/dev/MSXgl/engine/src/print.c:961: Print_SetMode(PRINT_MODE_SPRITE);
	ld	a, #0x03
	call	_Print_SetMode
;/home/bruno/dev/MSXgl/engine/src/print.c:966: u16 ram = (u16)g_PrintData.FontPatterns;
	ld	hl, (#_g_PrintData + 29)
	ex	(sp), hl
;/home/bruno/dev/MSXgl/engine/src/print.c:967: u16 vram = g_SpritePatternLow;
	ld	hl, (_g_SpritePatternLow)
	ld	-10 (ix), l
	ld	-9 (ix), h
;/home/bruno/dev/MSXgl/engine/src/print.c:968: for(u16 chr = g_PrintData.CharFirst; chr <= g_PrintData.CharLast; ++chr)
	ld	a, (#_g_PrintData + 21)
	ld	-1 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
00106$:
	ld	a, (#_g_PrintData + 22)
	ld	-3 (ix), a
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	a, -4 (ix)
	sub	a, -2 (ix)
	ld	a, -3 (ix)
	sbc	a, -1 (ix)
	jp	C, 00108$
;/home/bruno/dev/MSXgl/engine/src/print.c:971: if(PRINT_H(g_PrintData.PatternY) < 8)
	ld	a, (#(_g_PrintData + 1) + 0)
	ld	-7 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:973: VDP_WriteVRAM((u8*)ram, vram, g_SpritePatternHigh, PRINT_H(g_PrintData.PatternY));
	ld	a, -12 (ix)
	ld	-6 (ix), a
	ld	a, -11 (ix)
	ld	-5 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:974: vram += PRINT_H(g_PrintData.PatternY);
	ld	a, -10 (ix)
	ld	-4 (ix), a
	ld	a, -9 (ix)
	ld	-3 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:971: if(PRINT_H(g_PrintData.PatternY) < 8)
	ld	a, -7 (ix)
	sub	a, #0x08
	jr	NC, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.c:973: VDP_WriteVRAM((u8*)ram, vram, g_SpritePatternHigh, PRINT_H(g_PrintData.PatternY));
	ld	c, -7 (ix)
	ld	b, #0x00
	push	bc
	ld	a, (_g_SpritePatternHigh+0)
	push	af
	inc	sp
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_128K
;/home/bruno/dev/MSXgl/engine/src/print.c:974: vram += PRINT_H(g_PrintData.PatternY);
	ld	a, (#(_g_PrintData + 1) + 0)
	ld	c, a
	ld	b, #0x00
	ld	e, c
	ld	d, b
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, de
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:975: VDP_FillVRAM(0, vram, g_SpritePatternHigh, 8 - PRINT_H(g_PrintData.PatternY));
	ld	hl, #0x0008
	cp	a, a
	sbc	hl, bc
	push	de
	push	hl
	ld	a, (_g_SpritePatternHigh+0)
	push	af
	inc	sp
	xor	a, a
	call	_VDP_FillVRAM_128K
	pop	de
;/home/bruno/dev/MSXgl/engine/src/print.c:976: vram += 8 - PRINT_H(g_PrintData.PatternY);
	ld	a, (#(_g_PrintData + 1) + 0)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0008
	cp	a, a
	sbc	hl, bc
	add	hl, de
	ld	-10 (ix), l
	ld	-9 (ix), h
	jp	00103$
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:980: VDP_WriteVRAM((u8*)ram, vram, g_SpritePatternHigh, 8);
	ld	hl, #0x0008
	push	hl
	ld	a, (_g_SpritePatternHigh+0)
	push	af
	inc	sp
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_128K
;/home/bruno/dev/MSXgl/engine/src/print.c:981: vram += 8;
	ld	a, -4 (ix)
	add	a, #0x08
	ld	-6 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-10 (ix), a
	ld	a, -5 (ix)
	ld	-9 (ix), a
00103$:
;/home/bruno/dev/MSXgl/engine/src/print.c:983: ram += PRINT_H(g_PrintData.PatternY);
	ld	a, (#(_g_PrintData + 1) + 0)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	a, -12 (ix)
	ld	-8 (ix), a
	ld	a, -11 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	adc	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-12 (ix), a
	ld	a, -3 (ix)
	ld	-11 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:968: for(u16 chr = g_PrintData.CharFirst; chr <= g_PrintData.CharLast; ++chr)
	inc	-2 (ix)
	jp	NZ,00106$
	inc	-1 (ix)
	jp	00106$
00108$:
;/home/bruno/dev/MSXgl/engine/src/print.c:986: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:992: void DrawChar_Sprite(u8 chr)
;	---------------------------------
; Function DrawChar_Sprite
; ---------------------------------
_DrawChar_Sprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:994: u16 shape = chr - g_PrintData.CharFirst + g_PrintData.SpritePattern;
	ld	hl, #_g_PrintData + 21
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	hl, #_g_PrintData + 35
	ld	c, (hl)
	add	a, c
	ld	-1 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:998: VDP_SetSpriteExMultiColor(g_PrintData.SpriteID++, g_PrintData.CursorX, g_PrintData.CursorY, shape, g_PrintData.TextColor);
	ld	hl, #_g_PrintData + 7
	ld	e, (hl)
	ld	hl, #_g_PrintData + 5
	ld	c, (hl)
	ld	hl, #_g_PrintData + 36
	ld	b, (hl)
	ld	a, b
	inc	a
	ld	(hl), a
	ld	hl, #(_g_PrintData + 8)
	push	hl
	ld	d, -1 (ix)
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_VDP_SetSpriteExMultiColor
;/home/bruno/dev/MSXgl/engine/src/print.c:1000: }
	inc	sp
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:1018: void Print_SetShadow(bool enable, i8 offsetX, i8 offsetY, u8 color)
;	---------------------------------
; Function Print_SetShadow
; ---------------------------------
_Print_SetShadow::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
	ld	e, l
;/home/bruno/dev/MSXgl/engine/src/print.c:1020: Print_EnableShadow(enable);
	push	de
	ld	a, c
	call	_Print_EnableShadow
	pop	de
;/home/bruno/dev/MSXgl/engine/src/print.c:1021: g_PrintData.ShadowOffsetX = 3 + offsetX;
	ld	bc, #_g_PrintData + 39
	ld	a, e
	add	a, #0x03
	and	a, #0x07
	ld	e, a
	ld	a, (bc)
	and	a, #0xf8
	or	a, e
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1022: g_PrintData.ShadowOffsetY = 3 + offsetY;
	ld	a, 4 (ix)
	add	a, #0x03
	rlca
	rlca
	rlca
	and	a, #0x38
	ld	e, a
	ld	a, (bc)
	and	a, #0xc7
	or	a, e
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1023: g_PrintData.ShadowColor   = color;
	ld	hl, #(_g_PrintData + 40)
	ld	a, 5 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1024: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:1029: void Print_EnableShadow(bool enable)
;	---------------------------------
; Function Print_EnableShadow
; ---------------------------------
_Print_EnableShadow::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:1031: g_PrintData.FX = enable ? PRINT_FX_SHADOW : 0;
	ld	hl, #_g_PrintData+38
	ld	a, c
	or	a, a
	jr	Z, 00103$
	ld	de, #0x0001
	jp	00104$
00103$:
	ld	de, #0x0000
00104$:
	ld	(hl), e
;/home/bruno/dev/MSXgl/engine/src/print.c:1032: Print_SetMode(enable ? PRINT_MODE_BITMAP_TRANS : PRINT_MODE_BITMAP); // enable default mode to write font data into VRAM
	ld	a, c
	or	a, a
	jr	Z, 00105$
	ld	bc, #0x0001
	jp	00106$
00105$:
	ld	bc, #0x0000
00106$:
	ld	a, c
;/home/bruno/dev/MSXgl/engine/src/print.c:1033: }
	jp	_Print_SetMode
;/home/bruno/dev/MSXgl/engine/src/print.c:1058: void Print_SetOutline(bool enable, u8 color)
;	---------------------------------
; Function Print_SetOutline
; ---------------------------------
_Print_SetOutline::
	ld	b, a
	ld	c, l
;/home/bruno/dev/MSXgl/engine/src/print.c:1060: Print_EnableOutline(enable);
	push	bc
	ld	a, b
	call	_Print_EnableOutline
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1061: g_PrintData.OutlineColor = color;
	ld	hl, #(_g_PrintData + 41)
	ld	(hl), c
;/home/bruno/dev/MSXgl/engine/src/print.c:1062: }
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:1066: void Print_EnableOutline(bool enable)
;	---------------------------------
; Function Print_EnableOutline
; ---------------------------------
_Print_EnableOutline::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:1068: g_PrintData.FX = enable ? PRINT_FX_OUTLINE : 0;
	ld	hl, #_g_PrintData+38
	ld	a, c
	or	a, a
	jr	Z, 00103$
	ld	de, #0x0002
	jp	00104$
00103$:
	ld	de, #0x0000
00104$:
	ld	(hl), e
;/home/bruno/dev/MSXgl/engine/src/print.c:1069: Print_SetMode(enable ? PRINT_MODE_BITMAP_TRANS : PRINT_MODE_BITMAP); // enable default mode to write font data into VRAM
	ld	a, c
	or	a, a
	jr	Z, 00105$
	ld	bc, #0x0001
	jp	00106$
00105$:
	ld	bc, #0x0000
00106$:
	ld	a, c
;/home/bruno/dev/MSXgl/engine/src/print.c:1070: }
	jp	_Print_SetMode
;/home/bruno/dev/MSXgl/engine/src/print.c:1100: void Print_Clear()
;	---------------------------------
; Function Print_Clear
; ---------------------------------
_Print_Clear::
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
;/home/bruno/dev/MSXgl/engine/src/vdp.h:463: return mode >= VDP_MODE_GRAPHIC4;
	ld	a, (#_g_VDP_Data+0)
	sub	a, #0x06
	ld	a, #0x00
	rla
;/home/bruno/dev/MSXgl/engine/src/print.c:1102: if(VDP_IsBitmapMode(VDP_GetMode())) // Bitmap mode
	xor	a,#0x01
	jr	Z, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.c:1105: u8 color = Print_MergeColor(g_PrintData.BGColor);
	ld	a, (#_g_PrintData + 20)
	call	_Print_MergeColor
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:1106: VDP_CommandHMMV(0, 0, g_PrintData.ScreenWidth, 212, color); // @todo Check the 192/212 lines parameter
	ld	de, (#_g_PrintData + 27)
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:107: g_VDP_Command.DX = dx; 
	ld	hl, #0x0000
	ld	((_g_VDP_Command + 4)), hl
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:108: g_VDP_Command.DY = dy; 
	ld	((_g_VDP_Command + 6)), hl
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:109: g_VDP_Command.NX = nx; 
	ld	((_g_VDP_Command + 8)), de
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:110: g_VDP_Command.NY = ny; 
	ld	l, #0xd4
	ld	((_g_VDP_Command + 10)), hl
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:111: g_VDP_Command.CLR = col; 
	ld	hl, #(_g_VDP_Command + 12)
	ld	(hl), c
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:112: g_VDP_Command.ARG = arg; 
	ld	hl, #(_g_VDP_Command + 13)
	ld	(hl), #0x00
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:113: g_VDP_Command.CMD = VDP_CMD_HMMV;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0xc0
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:114: VPD_CommandSetupR36();
	call	_VPD_CommandSetupR36
;/home/bruno/dev/MSXgl/engine/src/print.c:1107: VDP_CommandWait();
	jp	_VDP_CommandWait
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1113: VDP_FillVRAM(0, g_ScreenLayoutLow, g_ScreenLayoutHigh, 24 * g_PrintData.ScreenWidth);
	ld	hl, (#(_g_PrintData + 27) + 0)
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, (_g_ScreenLayoutHigh+0)
	push	af
	inc	sp
	ld	de, (_g_ScreenLayoutLow)
	xor	a, a
	call	_VDP_FillVRAM_128K
;/home/bruno/dev/MSXgl/engine/src/print.c:1116: }
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:1121: void Print_Backspace(u8 num)
;	---------------------------------
; Function Print_Backspace
; ---------------------------------
_Print_Backspace::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;/home/bruno/dev/MSXgl/engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
;/home/bruno/dev/MSXgl/engine/src/vdp.h:463: return mode >= VDP_MODE_GRAPHIC4;
	ld	a, (#_g_VDP_Data+0)
	sub	a, #0x06
	ld	a, #0x00
	rla
;/home/bruno/dev/MSXgl/engine/src/print.c:1123: if(VDP_IsBitmapMode(VDP_GetMode())) // Bitmap mode
	xor	a,#0x01
	jp	Z, 00105$
;/home/bruno/dev/MSXgl/engine/src/print.c:1126: u16 x = PRINT_W(g_PrintData.UnitX) * num;
	ld	a, (#_g_PrintData + 2)
	ld	e, -1 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00123$:
	add	hl, hl
	jr	NC, 00124$
	add	hl, de
00124$:
	djnz	00123$
	ld	c, l
	ld	b, h
;/home/bruno/dev/MSXgl/engine/src/print.c:1127: if(x >  g_PrintData.CursorX)
	ld	hl, (#(_g_PrintData + 5) + 0)
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jr	NC, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.c:1128: x = 0;
	ld	bc, #0x0000
	jp	00103$
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1130: x = g_PrintData.CursorX - x;
	ld	a, l
	sub	a, c
	ld	c, a
	ld	a, h
	sbc	a, b
	ld	b, a
00103$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1132: u8 color = Print_MergeColor(g_PrintData.BGColor);
	ld	hl, #_g_PrintData + 20
	ld	e, (hl)
	push	bc
	ld	a, e
	call	_Print_MergeColor
	pop	bc
	ld	-6 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1133: VDP_CommandHMMV(x, g_PrintData.CursorY, x - g_PrintData.CursorX, PRINT_H(g_PrintData.UnitY), color); // @todo Check the 192/212 lines parameter
	ld	a, (#_g_PrintData + 3)
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
	ld	hl, (#(_g_PrintData + 5) + 0)
	ld	a, c
	sub	a, l
	ld	e, a
	ld	a, b
	sbc	a, h
	ld	d, a
	ld	a, (#_g_PrintData + 7)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:107: g_VDP_Command.DX = dx; 
	ld	((_g_VDP_Command + 4)), bc
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:108: g_VDP_Command.DY = dy; 
	ld	hl, #(_g_VDP_Command + 6)
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:109: g_VDP_Command.NX = nx; 
	ld	((_g_VDP_Command + 8)), de
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:110: g_VDP_Command.NY = ny; 
	ld	hl, #(_g_VDP_Command + 10)
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:111: g_VDP_Command.CLR = col; 
	ld	hl, #(_g_VDP_Command + 12)
	ld	a, -6 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:112: g_VDP_Command.ARG = arg; 
	ld	de, #_g_VDP_Command + 13
	xor	a, a
	ld	(de), a
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:113: g_VDP_Command.CMD = VDP_CMD_HMMV;
	ld	hl, #(_g_VDP_Command + 14)
	ld	(hl), #0xc0
;/home/bruno/dev/MSXgl/engine/src/vdp_inl.h:114: VPD_CommandSetupR36();
	push	bc
	call	_VPD_CommandSetupR36
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1134: g_PrintData.CursorX = x;
	ld	((_g_PrintData + 5)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1135: VDP_CommandWait();	
	call	_VDP_CommandWait
	jp	00111$
00105$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1141: u16 dst = g_ScreenLayoutLow + (g_PrintData.CursorY * g_PrintData.ScreenWidth) + g_PrintData.CursorX - num;
	ld	hl, #_g_PrintData + 7
	ld	l, (hl)
	ld	de, (#_g_PrintData + 27)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	ld	iy, (_g_ScreenLayoutLow)
	add	iy, de
	ld	hl, (#(_g_PrintData + 5) + 0)
	push	iy
	pop	de
	add	hl, de
	ld	c, -1 (ix)
	ld	b, #0x00
	cp	a, a
	sbc	hl, bc
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1142: VDP_FillVRAM(0, dst, g_ScreenLayoutHigh, num);
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	a, (_g_ScreenLayoutHigh+0)
	push	af
	inc	sp
	xor	a, a
	call	_VDP_FillVRAM_128K
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1143: g_PrintData.CursorX -= num;
	ld	hl, (#(_g_PrintData + 5) + 0)
	cp	a, a
	sbc	hl, bc
	ex	de, hl
	ld	((_g_PrintData + 5)), de
00111$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1146: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:1151: void Print_DrawChar(u8 chr)
;	---------------------------------
; Function Print_DrawChar
; ---------------------------------
_Print_DrawChar::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:1154: if(g_PrintData.CursorX + PRINT_W(g_PrintData.UnitX) > g_PrintData.ScreenWidth) // Handle automatic new-line when 
	ld	de, (#(_g_PrintData + 5) + 0)
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ex	de, hl
	ld	hl, (#_g_PrintData + 27)
	xor	a, a
	sbc	hl, de
	jr	NC, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.h:431: g_PrintData.CursorX = 0;
	ld	hl, #0x0000
	ld	((_g_PrintData + 5)), hl
;/home/bruno/dev/MSXgl/engine/src/print.h:432: g_PrintData.CursorY += PRINT_H(g_PrintData.UnitY);
	ld	de, #_g_PrintData + 7
	ld	a, (de)
	ld	hl, #_g_PrintData + 3
	ld	b, (hl)
	add	a, b
	ld	(de), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1155: Print_Return();
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1157: VDP_CommandWait();
	call	_VDP_CommandWait
;/home/bruno/dev/MSXgl/engine/src/print.c:1160: g_PrintData.DrawChar(chr);
	ld	hl, (#_g_PrintData + 24)
	ld	a, c
	call	___sdcc_call_hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1163: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX);
	ld	bc, (#(_g_PrintData + 5) + 0)
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:1164: }
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:1170: void Print_DrawCharX(c8 chr, u8 num)
;	---------------------------------
; Function Print_DrawCharX
; ---------------------------------
_Print_DrawCharX::
	ld	c, a
;/home/bruno/dev/MSXgl/engine/src/print.c:1172: for(u8 i = 0; i < num; ++i)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, l
	ret	NC
;/home/bruno/dev/MSXgl/engine/src/print.c:1173: Print_DrawChar(chr);
	push	hl
	push	bc
	ld	a, c
	call	_Print_DrawChar
	pop	bc
	pop	hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1172: for(u8 i = 0; i < num; ++i)
	inc	b
;/home/bruno/dev/MSXgl/engine/src/print.c:1174: }
	jp	00103$
;/home/bruno/dev/MSXgl/engine/src/print.c:1179: void Print_DrawText(const c8* str)
;	---------------------------------
; Function Print_DrawText
; ---------------------------------
_Print_DrawText::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	c, l
	ld	b, h
;/home/bruno/dev/MSXgl/engine/src/print.c:1181: while(*str != 0)
00110$:
	ld	a, (bc)
;/home/bruno/dev/MSXgl/engine/src/print.c:1183: if(*str == '\t')
	ld	e,a
	or	a,a
	jr	Z, 00116$
	sub	a, #0x09
	jr	NZ, 00108$
;/home/bruno/dev/MSXgl/engine/src/print.h:423: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX) + g_PrintData.TabSize - 1;
	ld	de, (#(_g_PrintData + 5) + 0)
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	a, (#(_g_PrintData + 4) + 0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, -1 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	dec	hl
	add	hl, de
	ex	de, hl
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.h:424: g_PrintData.CursorX &= ~(g_PrintData.TabSize - 1);
	ld	a, (#(_g_PrintData + 4) + 0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	dec	hl
	ld	a, l
	cpl
	push	af
	ld	a, h
	cpl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	and	a, e
	ld	e, a
	ld	a, l
	and	a, d
	ld	d, a
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:1184: Print_Tab();
	jp	00109$
00108$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1185: else if(*str == '\n')
	ld	a, e
	sub	a, #0x0a
	jr	NZ, 00105$
;/home/bruno/dev/MSXgl/engine/src/print.h:431: g_PrintData.CursorX = 0;
	ld	hl, #0x0000
	ld	((_g_PrintData + 5)), hl
;/home/bruno/dev/MSXgl/engine/src/print.h:432: g_PrintData.CursorY += PRINT_H(g_PrintData.UnitY);
	ld	de, #_g_PrintData + 7
	ld	a, (de)
	ld	hl, #_g_PrintData + 3
	ld	l, (hl)
;	spillPairReg hl
	add	a, l
	ld	(de), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1186: Print_Return();
	jp	00109$
00105$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1188: else if(*str == ' ')
	ld	a, e
	sub	a, #0x20
	jr	NZ, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.h:416: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX);
	ld	de, (#(_g_PrintData + 5) + 0)
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ex	de, hl
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:1189: Print_Space();
	jp	00109$
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1192: Print_DrawChar(*str);
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
00109$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1193: str++;
	inc	bc
	jp	00110$
00116$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1195: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:1200: void Print_DrawBin8(u8 value)
;	---------------------------------
; Function Print_DrawBin8
; ---------------------------------
_Print_DrawBin8::
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1202: u8 flag = (u8)(1 << 7);
;/home/bruno/dev/MSXgl/engine/src/print.c:1203: for(u8 i = 0; i < 8; ++i)
	ld	bc, #0x80
00103$:
	ld	a, b
	sub	a, #0x08
	ret	NC
;/home/bruno/dev/MSXgl/engine/src/print.c:1205: Print_DrawChar((value & flag) ? '1' : '0');
	ld	a, l
	and	a,c
	jr	Z, 00107$
	ld	de, #0x0031
	jp	00108$
00107$:
	ld	de, #0x0030
00108$:
	push	hl
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
	pop	hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1206: flag >>= 1;
	srl	c
;/home/bruno/dev/MSXgl/engine/src/print.c:1203: for(u8 i = 0; i < 8; ++i)
	inc	b
;/home/bruno/dev/MSXgl/engine/src/print.c:1211: }
	jp	00103$
;/home/bruno/dev/MSXgl/engine/src/print.c:1216: void Print_DrawHex8(u8 value)
;	---------------------------------
; Function Print_DrawHex8
; ---------------------------------
_Print_DrawHex8::
	ld	e, a
;/home/bruno/dev/MSXgl/engine/src/print.c:1218: Print_DrawChar(g_HexChar[(value >> 4) & 0x000F]);
	ld	bc, #_g_HexChar+0
	ld	a, e
	rlca
	rlca
	rlca
	rlca
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0xf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	d, (hl)
	push	bc
	push	de
	ld	a, d
	call	_Print_DrawChar
	pop	de
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1219: Print_DrawChar(g_HexChar[value & 0x000F]);
	ld	d, #0x00
	ld	a, e
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, (hl)
	ld	a, c
;/home/bruno/dev/MSXgl/engine/src/print.c:1223: }
	jp	_Print_DrawChar
;/home/bruno/dev/MSXgl/engine/src/print.c:1228: void Print_DrawHex16(u16 value)
;	---------------------------------
; Function Print_DrawHex16
; ---------------------------------
_Print_DrawHex16::
;/home/bruno/dev/MSXgl/engine/src/print.c:1230: Print_DrawHex8(value >> 8);
	ld	c, h
	push	hl
	ld	a, c
	call	_Print_DrawHex8
	pop	hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1231: Print_DrawHex8((u8)value);
	ld	a, l
;/home/bruno/dev/MSXgl/engine/src/print.c:1232: }
	jp	_Print_DrawHex8
;/home/bruno/dev/MSXgl/engine/src/print.c:1238: void Print_DrawHex32(u32 value)
;	---------------------------------
; Function Print_DrawHex32
; ---------------------------------
_Print_DrawHex32::
;/home/bruno/dev/MSXgl/engine/src/print.c:1240: Print_DrawHex16(value >> 16);
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	call	_Print_DrawHex16
	pop	de
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1241: Print_DrawHex16((u16)value);
	ex	de, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1242: }
	jp	_Print_DrawHex16
;/home/bruno/dev/MSXgl/engine/src/print.c:1249: void Print_DrawInt(i32 value)
;	---------------------------------
; Function Print_DrawInt
; ---------------------------------
_Print_DrawInt::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
;/home/bruno/dev/MSXgl/engine/src/print.c:1256: if(value < 0)
	bit	7, -1 (ix)
	jr	Z, 00102$
;/home/bruno/dev/MSXgl/engine/src/print.c:1258: Print_DrawChar('-');
	ld	a, #0x2d
	call	_Print_DrawChar
;/home/bruno/dev/MSXgl/engine/src/print.c:1259: value = -value;
	xor	a, a
	sub	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, #0x00
	sbc	a, -3 (ix)
	ld	-3 (ix), a
	ld	a, #0x00
	sbc	a, -2 (ix)
	ld	-2 (ix), a
	sbc	a, a
	sub	a, -1 (ix)
	ld	-1 (ix), a
00102$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1263: c8* ptr = str;
	ld	hl, #0
	add	hl, sp
	ld	c, l
	ld	b, h
;/home/bruno/dev/MSXgl/engine/src/print.c:1264: *ptr = 0;
	xor	a, a
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1265: while(value >= 10)
00103$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1267: *++ptr = '0' + (value % 10);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1265: while(value >= 10)
	ld	a, -4 (ix)
	sub	a, #0x0a
	ld	a, -3 (ix)
	sbc	a, #0x00
	ld	a, -2 (ix)
	sbc	a, #0x00
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00105$
;/home/bruno/dev/MSXgl/engine/src/print.c:1267: *++ptr = '0' + (value % 10);
	ld	c, l
	ld	b, h
	push	hl
	push	bc
	ld	de, #0x0000
	push	de
	ld	e, #0x0a
	push	de
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modslong
	pop	af
	ex	(sp),hl
	pop	iy
	pop	bc
	pop	hl
	ld	a, e
	add	a, #0x30
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1268: value /= 10;
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divslong
	pop	af
	pop	af
	pop	bc
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
	jp	00103$
00105$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1270: *++ptr = '0' + value;
	ld	a, -4 (ix)
	add	a, #0x30
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1271: while(*ptr != 0)
00106$:
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
;/home/bruno/dev/MSXgl/engine/src/print.c:1272: Print_DrawChar(*ptr--);	
	dec	hl
	ld	c, a
	push	hl
	ld	a, c
	call	_Print_DrawChar
	pop	hl
	jp	00106$
00109$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1273: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:1282: void Print_DrawFormat(const c8* format, ...)
;	---------------------------------
; Function Print_DrawFormat
; ---------------------------------
_Print_DrawFormat::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-20
	add	hl, sp
	ld	sp, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1287: va_start(args, format);
	ld	hl, #26
	add	hl, sp
	ld	-8 (ix), l
	ld	-7 (ix), h
;/home/bruno/dev/MSXgl/engine/src/print.c:1289: const c8* ptr = format;
	ld	a, 4 (ix)
	ld	-4 (ix), a
	ld	a, 5 (ix)
	ld	-3 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1290: while(*ptr != 0)
00194$:
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	or	a, a
	jp	Z, 00200$
;/home/bruno/dev/MSXgl/engine/src/print.c:1292: if(*ptr == '%')
	ld	a, -1 (ix)
	sub	a, #0x25
	jp	NZ,00192$
;/home/bruno/dev/MSXgl/engine/src/print.c:1294: ptr++;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1297: u8 len = 0;
	ld	-1 (ix), #0x00
;/home/bruno/dev/MSXgl/engine/src/print.c:1298: if((*ptr >= '0') && (*ptr <= '9'))
	ld	a, (bc)
	ld	e, a
	sub	a, #0x30
	jr	C, 00208$
	ld	a, #0x39
	sub	a, e
	jr	C, 00208$
;/home/bruno/dev/MSXgl/engine/src/print.c:1300: len = *ptr - '0';
	ld	a, e
	add	a, #0xd0
	ld	-1 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1301: ptr++;
	inc	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1303: while((*ptr >= '0') && (*ptr <= '9'))
00208$:
	ld	-10 (ix), c
	ld	-9 (ix), b
00105$:
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	sub	a, #0x30
	jr	C, 00244$
	ld	a, #0x39
	sub	a, -2 (ix)
	jr	C, 00244$
;/home/bruno/dev/MSXgl/engine/src/print.c:1305: len *= 10;
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	c, l
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1306: len += *ptr - '0';
	ld	a, -2 (ix)
	add	a, #0xd0
	add	a, l
	ld	-1 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1307: ptr++;
	inc	-10 (ix)
	jr	NZ, 00105$
	inc	-9 (ix)
	jp	00105$
00244$:
	ld	a, -10 (ix)
	ld	-4 (ix), a
	ld	a, -9 (ix)
	ld	-3 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1311: if((*ptr == 'i') || (*ptr == 'd'))
	ld	a, -2 (ix)
	sub	a, #0x69
	jr	Z, 00178$
	ld	a, -2 (ix)
	sub	a, #0x64
	jr	NZ, 00179$
00178$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1313: i16 val = (i16)va_arg(args, i16);
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -6 (ix)
	add	a, #0xfe
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1314: Print_DrawInt(val);
	ld	a, -2 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
	rlca
	sbc	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawInt
	jp	00193$
00179$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1316: else if(*ptr == 'u')
	ld	a, -2 (ix)
	sub	a, #0x75
	jr	NZ, 00176$
;/home/bruno/dev/MSXgl/engine/src/print.c:1318: u16 val = (u16)va_arg(args, u16);
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -6 (ix)
	add	a, #0xfe
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1319: Print_DrawInt(val);
	ld	a, -2 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
	xor	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawInt
	jp	00193$
00176$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1321: else if(*ptr == 'x')
	ld	a, -2 (ix)
	sub	a, #0x78
	jp	NZ,00173$
;/home/bruno/dev/MSXgl/engine/src/print.c:1323: if(len == 0)
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00109$
;/home/bruno/dev/MSXgl/engine/src/print.c:1324: len = 4;
	ld	-1 (ix), #0x04
00109$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1325: u16 val = (u16)va_arg(args, u16);
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-10 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	add	a, #0xfe
	ld	-6 (ix), a
	ld	a, -9 (ix)
	adc	a, #0xff
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1326: if(len > 3)
	ld	a, #0x03
	sub	a, -1 (ix)
	jr	NC, 00111$
;/home/bruno/dev/MSXgl/engine/src/print.c:1327: Print_DrawChar(g_HexChar[(val >> 12) & 0x000F]);
	ld	a, -11 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	and	a, #0x0f
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -10 (ix)
	ld	-6 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -9 (ix)
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	call	_Print_DrawChar
00111$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1328: if(len > 2)
	ld	a, #0x02
	sub	a, -1 (ix)
	jr	NC, 00113$
;/home/bruno/dev/MSXgl/engine/src/print.c:1329: Print_DrawChar(g_HexChar[(val >> 8) & 0x000F]);
	ld	a, -11 (ix)
	ld	-2 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	and	a, #0x0f
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -10 (ix)
	ld	-6 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -9 (ix)
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	call	_Print_DrawChar
00113$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1330: if(len > 1)
	ld	a, #0x01
	sub	a, -1 (ix)
	jr	NC, 00115$
;/home/bruno/dev/MSXgl/engine/src/print.c:1331: Print_DrawChar(g_HexChar[(val >> 4) & 0x000F]);
	ld	a, -12 (ix)
	ld	-2 (ix), a
	ld	a, -11 (ix)
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
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -5 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	call	_Print_DrawChar
00115$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1332: Print_DrawChar(g_HexChar[val & 0x000F]);
	ld	a, -12 (ix)
	ld	-2 (ix), a
	ld	a, -11 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	and	a, #0x0f
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -5 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	call	_Print_DrawChar
	jp	00193$
00173$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1334: else if(*ptr == 'b')
	ld	a, -2 (ix)
	sub	a, #0x62
	jp	NZ,00170$
;/home/bruno/dev/MSXgl/engine/src/print.c:1336: if(len == 0)
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00117$
;/home/bruno/dev/MSXgl/engine/src/print.c:1337: len = 16;
	ld	-1 (ix), #0x10
00117$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1338: u16 val = (u16)va_arg(args, u16);
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-10 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	add	a, #0xfe
	ld	-6 (ix), a
	ld	a, -9 (ix)
	adc	a, #0xff
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1339: u16 bit = 1 << (len - 1);
	dec	-1 (ix)
	ld	b, -1 (ix)
	ld	-2 (ix), #0x01
	ld	-1 (ix), #0
	inc	b
	jp	00426$
00425$:
	sla	-2 (ix)
	rl	-1 (ix)
00426$:
	djnz	00425$
;/home/bruno/dev/MSXgl/engine/src/print.c:1340: while(bit)
00121$:
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jp	Z, 00193$
;/home/bruno/dev/MSXgl/engine/src/print.c:1342: if(val & bit)
	ld	a, -6 (ix)
	and	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -5 (ix)
	and	a, -1 (ix)
	ld	-9 (ix), a
	or	a, -10 (ix)
	jr	Z, 00119$
;/home/bruno/dev/MSXgl/engine/src/print.c:1343: Print_DrawChar('1');
	ld	a, #0x31
	call	_Print_DrawChar
	jp	00120$
00119$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1345: Print_DrawChar('0');
	ld	a, #0x30
	call	_Print_DrawChar
00120$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1346: bit >>= 1;
	srl	-1 (ix)
	rr	-2 (ix)
	jp	00121$
00170$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1350: else if((*ptr == 'I') || (*ptr == 'D'))
	ld	a, -2 (ix)
	sub	a, #0x49
	jr	Z, 00165$
	ld	a, -2 (ix)
	sub	a, #0x44
	jr	NZ, 00166$
00165$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1352: i32 val = (i32)va_arg(args, i32);
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, l
	add	a, #0xfc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1353: Print_DrawInt(val);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawInt
	jp	00193$
00166$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1355: else if(*ptr == 'U')
	ld	a, -2 (ix)
	sub	a, #0x55
	jr	NZ, 00163$
;/home/bruno/dev/MSXgl/engine/src/print.c:1357: u32 val = (u32)va_arg(args, u32);
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, l
	add	a, #0xfc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1358: Print_DrawInt(val);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawInt
	jp	00193$
00163$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1360: else if(*ptr == 'X')
	ld	a, -2 (ix)
	sub	a, #0x58
	jp	NZ,00160$
;/home/bruno/dev/MSXgl/engine/src/print.c:1362: if(len == 0)
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00125$
;/home/bruno/dev/MSXgl/engine/src/print.c:1363: len = 8;
	ld	-1 (ix), #0x08
00125$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1364: u32 val = (u32)va_arg(args, u32);
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, l
	add	a, #0xfc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:1366: if(len > 7)
	ld	a, #0x07
	sub	a, -1 (ix)
	jr	NC, 00127$
;/home/bruno/dev/MSXgl/engine/src/print.c:1367: Print_DrawChar(g_HexChar[(val >> 28) & 0xF]);
	ld	-12 (ix), d
	xor	a, a
	ld	-11 (ix), a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	a, #0x04
00434$:
	srl	-12 (ix)
	dec	a
	jr	NZ, 00434$
	ld	a, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00127$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1368: if(len > 6)
	ld	a, #0x06
	sub	a, -1 (ix)
	jr	NC, 00129$
;/home/bruno/dev/MSXgl/engine/src/print.c:1369: Print_DrawChar(g_HexChar[(val >> 24) & 0xF]);
	ld	a, d
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00129$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1370: if(len > 5)
	ld	a, #0x05
	sub	a, -1 (ix)
	jr	NC, 00131$
;/home/bruno/dev/MSXgl/engine/src/print.c:1371: Print_DrawChar(g_HexChar[(val >> 20) & 0xF]);
	ld	-12 (ix), e
	ld	-11 (ix), d
	xor	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	a, #0x04
00436$:
	srl	-11 (ix)
	rr	-12 (ix)
	dec	a
	jr	NZ, 00436$
	ld	a, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00131$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1372: if(len > 4)
	ld	a, #0x04
	sub	a, -1 (ix)
	jr	NC, 00133$
;/home/bruno/dev/MSXgl/engine/src/print.c:1373: Print_DrawChar(g_HexChar[(val >> 16) & 0xF]);
	ld	a, e
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00133$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1374: if(len > 3)
	ld	a, #0x03
	sub	a, -1 (ix)
	jr	NC, 00135$
;/home/bruno/dev/MSXgl/engine/src/print.c:1375: Print_DrawChar(g_HexChar[(val >> 12) & 0xF]);
	ld	-12 (ix), b
	ld	-11 (ix), e
	ld	-10 (ix), d
	ld	-9 (ix), #0x00
	ld	a, #0x04
00438$:
	srl	-10 (ix)
	rr	-11 (ix)
	rr	-12 (ix)
	dec	a
	jr	NZ, 00438$
	ld	a, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	de
	ld	de, #_g_HexChar
	add	hl, de
	pop	de
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00135$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1376: if(len > 2)
	ld	a, #0x02
	sub	a, -1 (ix)
	jr	NC, 00137$
;/home/bruno/dev/MSXgl/engine/src/print.c:1377: Print_DrawChar(g_HexChar[(val >> 8) & 0xF]);
	ld	a, b
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00137$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1378: if(len > 1)
	ld	a, #0x01
	sub	a, -1 (ix)
	jr	NC, 00139$
;/home/bruno/dev/MSXgl/engine/src/print.c:1379: Print_DrawChar(g_HexChar[(val >> 4) & 0xF]);
	ld	-12 (ix), c
	ld	-11 (ix), b
	ld	-10 (ix), e
	ld	-9 (ix), d
	ld	a, #0x04
00440$:
	srl	-9 (ix)
	rr	-10 (ix)
	rr	-11 (ix)
	rr	-12 (ix)
	dec	a
	jr	NZ, 00440$
	ld	a, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00139$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1380: Print_DrawChar(g_HexChar[val & 0xF]);
	ld	a, c
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	hl, #_g_HexChar
	add	hl, bc
	ld	a, (hl)
	call	_Print_DrawChar
	jp	00193$
00160$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1382: else if(*ptr == 'B')
	ld	a, -2 (ix)
	sub	a, #0x42
	jp	NZ,00157$
;/home/bruno/dev/MSXgl/engine/src/print.c:1384: if(len == 0)
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00141$
;/home/bruno/dev/MSXgl/engine/src/print.c:1385: len = 16;
	ld	-1 (ix), #0x10
00141$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1386: u32 val = (u32)va_arg(args, u32);
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	de, #0xfffc
	add	hl, de
	ex	de,hl
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
;/home/bruno/dev/MSXgl/engine/src/print.c:1387: u32 bit = 1 << (len - 1);
	ld	b, -1 (ix)
	dec	b
	ld	hl, #0x0001
	inc	b
	jp	00445$
00444$:
	add	hl, hl
00445$:
	djnz	00444$
	ld	-12 (ix), l
	ld	a, h
	ld	-11 (ix), a
	rlca
	sbc	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1388: while(bit)
00145$:
	ld	a, -9 (ix)
	or	a, -10 (ix)
	or	a, -11 (ix)
	or	a, -12 (ix)
	jp	Z, 00193$
;/home/bruno/dev/MSXgl/engine/src/print.c:1390: if(val & bit)
	ld	a, -16 (ix)
	and	a, -12 (ix)
	ld	-20 (ix), a
	ld	a, -15 (ix)
	and	a, -11 (ix)
	ld	-19 (ix), a
	ld	a, -14 (ix)
	and	a, -10 (ix)
	ld	-18 (ix), a
	ld	a, -13 (ix)
	and	a, -9 (ix)
	ld	-17 (ix), a
	or	a, -18 (ix)
	or	a, -19 (ix)
	or	a, -20 (ix)
	jr	Z, 00143$
;/home/bruno/dev/MSXgl/engine/src/print.c:1391: Print_DrawChar('1');
	ld	a, #0x31
	call	_Print_DrawChar
	jp	00144$
00143$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1393: Print_DrawChar('0');
	ld	a, #0x30
	call	_Print_DrawChar
00144$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1394: bit >>= 1;
	srl	-9 (ix)
	rr	-10 (ix)
	rr	-11 (ix)
	rr	-12 (ix)
	jp	00145$
00157$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1398: else if(*ptr == 'c')
	ld	a, -2 (ix)
	sub	a, #0x63
	jr	NZ, 00154$
;/home/bruno/dev/MSXgl/engine/src/print.c:1400: c8 val = (c8)va_arg(args, u16);
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	-8 (ix), l
	ld	-7 (ix), h
	dec	hl
	dec	hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1401: Print_DrawChar(val);
	ld	a, (hl)
	call	_Print_DrawChar
	jp	00193$
00154$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1403: else if(*ptr == 's')
	ld	a, -2 (ix)
	sub	a, #0x73
	jr	NZ, 00151$
;/home/bruno/dev/MSXgl/engine/src/print.c:1405: const c8* val = (const c8*)va_arg(args, const c8*);
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	-8 (ix), l
	ld	-7 (ix), h
	dec	hl
	dec	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;/home/bruno/dev/MSXgl/engine/src/print.c:1406: Print_DrawText(val);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawText
	jp	00193$
00151$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1408: else if(*ptr == '%')
	ld	a, -2 (ix)
	sub	a, #0x25
	jr	NZ, 00193$
;/home/bruno/dev/MSXgl/engine/src/print.c:1410: Print_DrawChar('%');
	ld	a, #0x25
	call	_Print_DrawChar
	jp	00193$
00192$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1414: else if(*ptr == '\t')
	ld	a, -1 (ix)
	sub	a, #0x09
	jr	NZ, 00189$
;/home/bruno/dev/MSXgl/engine/src/print.h:423: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX) + g_PrintData.TabSize - 1;
	ld	bc, (#(_g_PrintData + 5) + 0)
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	e, a
	ld	d, #0x00
	ld	a, (#(_g_PrintData + 4) + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	dec	hl
	add	hl, bc
	ex	de, hl
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.h:424: g_PrintData.CursorX &= ~(g_PrintData.TabSize - 1);
	ld	a, (#(_g_PrintData + 4) + 0)
	ld	b, #0x00
	ld	c, a
	dec	bc
	ld	a, c
	cpl
	ld	c, a
	ld	a, b
	cpl
	ld	b, a
	ld	a, e
	and	a, c
	ld	c, a
	ld	a, d
	and	a, b
	ld	b, a
	ld	((_g_PrintData + 5)), bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1415: Print_Tab();
	jp	00193$
00189$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1416: else if(*ptr == '\n')
	ld	a, -1 (ix)
	sub	a, #0x0a
	jr	NZ, 00186$
;/home/bruno/dev/MSXgl/engine/src/print.h:431: g_PrintData.CursorX = 0;
	ld	hl, #0x0000
	ld	((_g_PrintData + 5)), hl
;/home/bruno/dev/MSXgl/engine/src/print.h:432: g_PrintData.CursorY += PRINT_H(g_PrintData.UnitY);
	ld	bc, #_g_PrintData + 7
	ld	a, (bc)
	ld	hl, #_g_PrintData + 3
	ld	e, (hl)
	add	a, e
	ld	(bc), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1417: Print_Return();
	jp	00193$
00186$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1418: else if(*ptr == ' ')
	ld	a, -1 (ix)
	sub	a, #0x20
	jr	NZ, 00183$
;/home/bruno/dev/MSXgl/engine/src/print.h:416: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX);
	ld	bc, (#(_g_PrintData + 5) + 0)
	ld	a, (#(_g_PrintData + 2) + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.c:1419: Print_Space();
	jp	00193$
00183$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1421: Print_DrawChar(*ptr);
	ld	a, -1 (ix)
	call	_Print_DrawChar
00193$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1423: ptr++;
	inc	-4 (ix)
	jp	NZ,00194$
	inc	-3 (ix)
	jp	00194$
;/home/bruno/dev/MSXgl/engine/src/print.c:1426: va_end(args);
00200$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1427: }
	ld	sp, ix
	pop	ix
	ret
;/home/bruno/dev/MSXgl/engine/src/print.c:1437: void Print_DrawLineH(u8 x, u8 y, u8 len)
;	---------------------------------
; Function Print_DrawLineH
; ---------------------------------
_Print_DrawLineH::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	e, a
	ld	c, l
;/home/bruno/dev/MSXgl/engine/src/print.c:1439: Print_SetPosition(x, y);
	ld	d, #0x00
;/home/bruno/dev/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 7)
	ld	(hl), c
;/home/bruno/dev/MSXgl/engine/src/print.c:1440: Print_DrawCharX(0x17, len);
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x17
	call	_Print_DrawCharX
;/home/bruno/dev/MSXgl/engine/src/print.c:1441: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:1445: void Print_DrawLineV(u8 x, u8 y, u8 len)
;	---------------------------------
; Function Print_DrawLineV
; ---------------------------------
_Print_DrawLineV::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	-1 (ix), a
	ld	-2 (ix), l
;/home/bruno/dev/MSXgl/engine/src/print.c:1447: for(u8 i = 0; i < len; i++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, 4 (ix)
	jr	NC, 00106$
;/home/bruno/dev/MSXgl/engine/src/print.c:1449: Print_SetPosition(x, y + i);
	ld	a, -2 (ix)
	add	a, c
	ld	-3 (ix), a
	ld	e, -1 (ix)
	ld	d, #0x00
;/home/bruno/dev/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 7)
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1450: Print_DrawChar(0x16);
	push	bc
	ld	a, #0x16
	call	_Print_DrawChar
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1447: for(u8 i = 0; i < len; i++)
	inc	c
	jp	00104$
00106$:
;/home/bruno/dev/MSXgl/engine/src/print.c:1452: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;/home/bruno/dev/MSXgl/engine/src/print.c:1456: void Print_DrawBox(u8 x, u8 y, u8 width, u8 height)
;	---------------------------------
; Function Print_DrawBox
; ---------------------------------
_Print_DrawBox::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	-1 (ix), a
	ld	-2 (ix), l
;/home/bruno/dev/MSXgl/engine/src/print.c:1459: Print_SetPosition(x, y);
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	e, c
	ld	d, b
;/home/bruno/dev/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 7)
	ld	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1460: Print_DrawChar(0x18);
	push	bc
	ld	a, #0x18
	call	_Print_DrawChar
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1461: Print_SetPosition(x + width - 1, y);
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	dec	hl
	ex	(sp), hl
	pop	de
	push	de
;/home/bruno/dev/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	((_g_PrintData + 5)), de
;/home/bruno/dev/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 7)
	ld	a, -2 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.c:1462: Print_DrawChar(0x19);
	push	bc
	ld	a, #0x19
	call	_Print_DrawChar
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1463: Print_SetPosition(x, y + height - 1);
	ld	a, -2 (ix)
	add	a, 5 (ix)
	dec	a
	ld	e, a
;/home/bruno/dev/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	((_g_PrintData + 5)), bc
;/home/bruno/dev/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	(#(_g_PrintData + 7)),a
;/home/bruno/dev/MSXgl/engine/src/print.c:1464: Print_DrawChar(0x1A);
	push	de
	ld	a, #0x1a
	call	_Print_DrawChar
	pop	de
;/home/bruno/dev/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/bruno/dev/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 7)
	ld	(hl), e
;/home/bruno/dev/MSXgl/engine/src/print.c:1466: Print_DrawChar(0x1B);
	push	de
	ld	a, #0x1b
	call	_Print_DrawChar
	pop	de
;/home/bruno/dev/MSXgl/engine/src/print.c:1469: Print_DrawLineH(x + 1, y,              width - 2);
	ld	b, 4 (ix)
	dec	b
	dec	b
	ld	c, -1 (ix)
	inc	c
	push	bc
	push	de
	push	bc
	inc	sp
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_Print_DrawLineH
	pop	de
	pop	bc
;/home/bruno/dev/MSXgl/engine/src/print.c:1470: Print_DrawLineH(x + 1, y + height - 1, width - 2);
	push	bc
	inc	sp
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_Print_DrawLineH
;/home/bruno/dev/MSXgl/engine/src/print.c:1473: Print_DrawLineV(x,             y + 1, height - 2);
	ld	d, 5 (ix)
	dec	d
	dec	d
	ld	e, -2 (ix)
	inc	e
	push	de
	push	de
	inc	sp
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_Print_DrawLineV
	pop	de
;/home/bruno/dev/MSXgl/engine/src/print.c:1474: Print_DrawLineV(x + width - 1, y + 1, height - 2);
	ld	a, -1 (ix)
	add	a, 4 (ix)
	ld	c, a
	dec	c
	push	de
	inc	sp
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_Print_DrawLineV
;/home/bruno/dev/MSXgl/engine/src/print.c:1475: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
__xinit__g_PrintInvalid:
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.area _CABS (ABS)
