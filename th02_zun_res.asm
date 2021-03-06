;
; +-------------------------------------------------------------------------+
; |   This file has been generated by The Interactive Disassembler (IDA)    |
; |        Copyright (c) 2009 by Hex-Rays, <support@hex-rays.com>           |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	57FF9283F7BC1A6816D6181BBCEC5975

; File Name   :	th02/ZUN.COM:ZUN_RES
; Format      :	MS-DOS COM-file
; Base Address:	0h Range: 100h-1C66h Loaded length: 1B66h
; OS type	  :  MS	DOS
; Application type:  Executable	16bit

		.286 ; Force the .model directive to create 16-bit default segments...
		.model tiny
		__TINY__ equ 1
		.386 ; ... then switch to what we actually need.
		; And yes, we can't move this to an include file for some reason.

include ReC98.inc
include th02/th02.asm

; ===========================================================================

; Segment type:	Pure code
_TEXT		segment	word public 'CODE' use16
		assume cs:_TEXT
		org 100h
		assume es:nothing, ss:nothing, ds:_TEXT, fs:nothing, gs:nothing

include libs/BorlandC/c0.asm

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_367		proc near

var_6		= byte ptr -6
arg_0		= byte ptr  4

		enter	6, 0
		push	si
		push	di
		mov	di, offset aHuuma_cfg ;	"huuma.cfg"
		lea	ax, [bp+var_6]
		push	ss
		push	ax
		push	ds
		push	offset unk_183F
		mov	cx, 5
		call	N_SCOPY@
		push	3D02h
		push	di
		call	dos_axdx
		mov	si, ax
		or	si, si
		jle	short loc_398
		push	ax
		push	0
		push	5
		push	0
		call	dos_seek
		jmp	short loc_3AB
; ---------------------------------------------------------------------------

loc_398:
		push	di
		push	20h
		call	dos_create
		mov	si, ax
		push	ax
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		push	5
		call	dos_write

loc_3AB:
		push	si
		push	ss
		lea	ax, [bp+arg_0]
		push	ax
		push	2
		call	dos_write
		push	si
		push	ds
		push	offset byte_183E
		push	1
		call	dos_write
		push	si
		call	dos_close
		pop	di
		pop	si
		leave
		retn
sub_367		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __cdecl main(int argc, const char	**argv,	const char **envp)
_main		proc near

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
_argc		= word ptr  4
_argv		= word ptr  6
_envp		= word ptr  8

		enter	8, 0
		push	si
		push	di
		mov	si, [bp+_argv]
		mov	[bp+var_2], offset aMikoconfig ; "MIKOConfig"
		push	[bp+var_2]
		push	0Ah
		push	3
		call	resdata_exist
		mov	di, ax
		push	offset aUmx	; "\n\n東方封魔録用　 常駐プログラム　ZUN_RE"...
		call	dos_puts2
		call	graph_clear
		call	sub_4BA
		cmp	ax, 1
		jnz	short loc_3F9
		push	offset aGngcgxgrgagtg@ ; "ハイスコアファイルがおかしいの、もう一・...
		jmp	loc_47E
; ---------------------------------------------------------------------------

loc_3F9:
		cmp	[bp+_argc], 2
		jnz	short loc_45F
		mov	bx, [si+2]
		cmp	byte ptr [bx], 2Dh
		jz	short loc_40C
		cmp	byte ptr [bx], 2Fh
		jnz	short loc_434

loc_40C:
		mov	bx, [si+2]
		cmp	byte ptr [bx+1], 52h
		jz	short loc_41B
		cmp	byte ptr [bx+1], 72h
		jnz	short loc_434

loc_41B:
		or	di, di
		jnz	short loc_427
		push	offset aVavVBavVVvvVV ;	"わたし、まだいませんよぉ\n\n"
		call	dos_puts2
		jmp	short loc_481
; ---------------------------------------------------------------------------

loc_427:
		push	di
		call	dos_free
		push	offset aVVcvVcbavVIqvj ; "さよなら、また会えたらいいな\n\n"
		call	dos_puts2
		jmp	loc_4B3
; ---------------------------------------------------------------------------

loc_434:
		mov	bx, [si+2]
		cmp	byte ptr [bx], 2Dh
		jz	short loc_441
		cmp	byte ptr [bx], 2Fh
		jnz	short loc_457

loc_441:
		mov	bx, [si+2]
		cmp	byte ptr [bx+1], 44h
		jz	short loc_450
		cmp	byte ptr [bx+1], 64h
		jnz	short loc_457

loc_450:
		mov	byte_183E, 1
		jmp	short loc_45F
; ---------------------------------------------------------------------------

loc_457:
		push	offset aVV	; "そんなオプション付けられても、困るんで・...
		call	dos_puts2
		jmp	short loc_481
; ---------------------------------------------------------------------------

loc_45F:
		or	di, di
		jz	short loc_46B
		push	offset aVavVBavVVVvvVV ; "わたし、すでにいますよぉ\n\n"
		call	dos_puts2
		jmp	short loc_481
; ---------------------------------------------------------------------------

loc_46B:
		push	[bp+var_2]
		push	0Ah
		push	3
		call	resdata_create
		mov	di, ax
		or	di, di
		jnz	short loc_486
		push	offset aNVVVV	; "作れません、わたしの居場所がないの！\n\n"

loc_47E:
		call	dos_puts2

loc_481:
		mov	ax, 1
		jmp	short loc_4B5
; ---------------------------------------------------------------------------

loc_486:
		mov	word ptr [bp+var_8+2], di
		mov	word ptr [bp+var_8], 0
		push	offset aVVVVBavcvivVnv ; "それでは、よろしくお願いします\n\n"
		call	dos_puts2
		mov	[bp+var_4], mikoconfig_t.stage
		jmp	short loc_4A8
; ---------------------------------------------------------------------------

loc_49B:
		les	bx, [bp+var_8]
		add	bx, [bp+var_4]
		mov	byte ptr es:[bx], 0
		inc	[bp+var_4]

loc_4A8:
		cmp	[bp+var_4], size mikoconfig_t
		jl	short loc_49B
		push	di
		call	sub_367
		pop	cx

loc_4B3:
		xor	ax, ax

loc_4B5:
		pop	di
		pop	si
		leave
		retn
_main		endp

; ---------------------------------------------------------------------------
		db 0

; =============== S U B	R O U T	I N E =======================================


sub_4BA		proc near
		push	si
		push	di
		push	off_19A8
		call	file_exist
		or	ax, ax
		jnz	short loc_4CD
		call	sub_6C1
		jmp	loc_584
; ---------------------------------------------------------------------------

loc_4CD:
		mov	byte ptr unk_1D1E, 0
		jmp	loc_57A
; ---------------------------------------------------------------------------

loc_4D5:
		call	sub_6CC
		mov	al, 0
		mov	byte_19AA, al
		mov	byte_19AB, al
		xor	ax, ax
		mov	word_19AD, ax
		mov	word_19AF, ax
		mov	word_19B1, ax
		mov	word_19B3, ax
		xor	si, si
		jmp	short loc_502
; ---------------------------------------------------------------------------

loc_4F2:
		mov	al, [si+1C68h]
		mov	ah, 0
		add	word_19B1, ax
		adc	word_19B3, 0
		inc	si

loc_502:
		cmp	si, 0B2h
		jl	short loc_4F2
		xor	si, si
		jmp	short loc_537
; ---------------------------------------------------------------------------

loc_50C:
		mov	bx, si
		shl	bx, 2
		mov	dx, word_1C6C[bx]
		mov	ax, word_1C6A[bx]
		add	word_19AD, ax
		adc	word_19AF, dx
		mov	bx, si
		imul	bx, 7
		mov	al, byte_1C96[bx]
		add	byte_19AA, al
		mov	al, byte_1CDD[si]
		add	byte_19AB, al
		inc	si

loc_537:
		cmp	si, 0Ah
		jl	short loc_50C
		mov	dx, word_19AF
		mov	ax, word_19AD
		cmp	dx, word ptr unk_1C94
		jnz	short loc_574
		cmp	ax, word ptr unk_1C92
		jnz	short loc_574
		mov	al, byte_19AA
		cmp	al, byte ptr unk_1CDC
		jnz	short loc_574
		mov	al, byte_19AB
		cmp	al, byte ptr unk_1CE7
		jnz	short loc_574
		mov	dx, word_19B3
		mov	ax, word_19B1
		cmp	dx, word ptr unk_1D1C
		jnz	short loc_574
		cmp	ax, word ptr unk_1D1A
		jz	short loc_576

loc_574:
		jmp	short loc_588
; ---------------------------------------------------------------------------

loc_576:
		inc	byte ptr unk_1D1E

loc_57A:
		cmp	byte ptr unk_1D1E, 5
		jge	short loc_584
		jmp	loc_4D5
; ---------------------------------------------------------------------------

loc_584:
		xor	ax, ax
		jmp	short loc_594
; ---------------------------------------------------------------------------

loc_588:
		push	off_19A8
		call	file_delete
		mov	ax, 1
		jmp	short $+2

loc_594:
		pop	di
		pop	si
		retn
sub_4BA		endp

; ---------------------------------------------------------------------------
		nop

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_598		proc near
		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	si, si
		mov	di, 10000
		jmp	short loc_5F9
; ---------------------------------------------------------------------------

loc_5A4:
		mov	word ptr bdata@, 0
		mov	bx, si
		shl	bx, 2
		mov	word_1C6C[bx], 0
		mov	word_1C6A[bx], di
		sub	di, 1000
		mov	ax, si
		sar	ax, 1
		mov	dl, 5
		sub	dl, al
		mov	byte_1CDD[si], dl
		mov	bx, si
		imul	bx, 7
		mov	cx, 6

loc_5D1:
		mov	byte_1C96[bx], 0DAh
		inc	bx
		loop	loc_5D1
		mov	byte_1C96[bx], 0
		mov	bx, si
		shl	bx, 2
		mov	word_1CE8[bx], 1900
		mov	byte_1CEA[bx], 1
		mov	byte_1CEB[bx], 1
		mov	byte_1D10[si], 1
		inc	si

loc_5F9:
		cmp	si, 0Ah
		jge	short loc_600
		jmp	short loc_5A4
; ---------------------------------------------------------------------------

loc_600:
		pop	di
		pop	si
		pop	bp
		retn
sub_598		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_604		proc near
		push	bp
		mov	bp, sp
		push	si
		mov	word ptr unk_1C94, 0
		mov	word ptr unk_1C92, 0
		mov	byte ptr unk_1CDC, 0
		mov	byte ptr unk_1CE7, 0
		mov	word ptr unk_1D1C, 0
		mov	word ptr unk_1D1A, 0
		xor	si, si
		jmp	short loc_659
; ---------------------------------------------------------------------------

loc_62E:
		mov	bx, si
		shl	bx, 2
		mov	dx, word_1C6C[bx]
		mov	ax, word_1C6A[bx]
		add	word ptr unk_1C92, ax
		adc	word ptr unk_1C94, dx
		mov	bx, si
		imul	bx, 7
		mov	al, byte_1C96[bx]
		add	byte ptr unk_1CDC, al
		mov	al, byte_1CDD[si]
		add	byte ptr unk_1CE7, al
		inc	si

loc_659:
		cmp	si, 0Ah
		jl	short loc_62E
		xor	si, si
		jmp	short loc_67C
; ---------------------------------------------------------------------------

loc_662:
		mov	al, bdata@[si]
		mov	ah, 0
		add	word ptr unk_1D1A, ax
		adc	word ptr unk_1D1C, 0
		mov	al, bdata@[si]
		add	al, 12h
		mov	bdata@[si], al
		inc	si

loc_67C:
		cmp	si, 0B2h
		jl	short loc_662
		push	off_19A8
		call	file_create
		push	ds
		push	offset bdata@
		push	0B6h
		call	file_write
		push	ds
		push	offset bdata@
		push	0B6h
		call	file_write
		push	ds
		push	offset bdata@
		push	0B6h
		call	file_write
		push	ds
		push	offset bdata@
		push	0B6h
		call	file_write
		push	ds
		push	offset bdata@
		push	0B6h
		call	file_write
		call	file_close
		pop	si
		pop	bp
		retn
sub_604		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_6C1		proc near
		push	bp
		mov	bp, sp
		call	sub_598
		call	sub_604
		pop	bp
		retn
sub_6C1		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_6CC		proc near
		push	bp
		mov	bp, sp
		push	si
		push	off_19A8
		call	file_ropen
		mov	al, byte ptr unk_1D1E
		cbw
		imul	ax, 0B6h
		push	0
		push	ax
		push	0
		call	file_seek
		push	ds
		push	offset bdata@
		push	0B6h
		call	file_read
		xor	si, si
		jmp	short loc_700
; ---------------------------------------------------------------------------

loc_6F5:
		mov	al, bdata@[si]
		add	al, 0EEh
		mov	bdata@[si], al
		inc	si

loc_700:
		cmp	si, 0B2h
		jl	short loc_6F5
		call	file_close
		pop	si
		pop	bp
		retn
sub_6CC		endp

include libs/master.lib/graph_clear.asm
include libs/master.lib/resdata.asm
include libs/master.lib/file_read.asm
include libs/master.lib/file_close.asm
include libs/master.lib/file_exist.asm
include libs/master.lib/file_ropen.asm
include libs/master.lib/file_write.asm
include libs/master.lib/file_create.asm
include libs/master.lib/file_delete.asm
include libs/master.lib/file_seek.asm
include libs/master.lib/dos_free.asm
include libs/master.lib/dos_axdx.asm
include libs/master.lib/dos_create.asm
include libs/master.lib/dos_puts2.asm
include libs/master.lib/dos_close.asm
include libs/master.lib/dos_ropen.asm
include libs/master.lib/dos_write.asm
include libs/master.lib/dos_seek.asm
include libs/BorlandC/_abort.asm
include libs/BorlandC/atexit.asm
include libs/BorlandC/errormsg.asm
include libs/BorlandC/exit.asm
include libs/BorlandC/ioerror.asm
include libs/BorlandC/_isatty.asm
include libs/BorlandC/lseek.asm
include libs/BorlandC/n_scopy.asm
include libs/BorlandC/setupio.asm
include libs/BorlandC/brk.asm
include libs/BorlandC/nearheap.asm
include libs/BorlandC/pathops.asm
include libs/BorlandC/fflush.asm
include libs/BorlandC/flushall.asm
include libs/BorlandC/fseek.asm
include libs/BorlandC/setvbuf.asm
include libs/BorlandC/_strlen.asm
include libs/BorlandC/write.asm
include libs/BorlandC/writea.asm
include libs/BorlandC/xfflush.asm
include libs/BorlandC/setargv.asm
; ---------------------------------------------------------------------------

include libs/BorlandC/c0[data].asm

byte_183E	db 0
unk_183F	db    1
		db    1
		db    3
		db    2
		db    0
aHuuma_cfg	db 'huuma.cfg',0
aMikoconfig	db 'MIKOConfig',0
aUmx		db 0Ah
		db 0Ah
		db '東方封魔録用　 常駐プログラム　ZUN_RES.com Version1.01       (c)zun 1997',0Ah,0
aGngcgxgrgagtg@	db 'ハイスコアファイルがおかしいの、もう一度実行してね。',0Ah,0
aVavVBavVVvvVV	db 'わたし、まだいませんよぉ',0Ah
		db 0Ah,0
aVVcvVcbavVIqvj	db 'さよなら、また会えたらいいな',0Ah
		db 0Ah,0
aVV		db 'そんなオプション付けられても、困るんですけど',0Ah
		db 0Ah,0
aVavVBavVVVvvVV	db 'わたし、すでにいますよぉ',0Ah
		db 0Ah,0
aNVVVV		db '作れません、わたしの居場所がないの！',0Ah
		db 0Ah,0
aVVVVBavcvivVnv	db 'それでは、よろしくお願いします',0Ah
		db 0Ah,0
		db    0
off_19A8	dw offset aHuuhi_dat
					; "huuhi.dat"
byte_19AA	db 0
byte_19AB	db 0
		db 0
word_19AD	dw 0
word_19AF	dw 0
word_19B1	dw 0
word_19B3	dw 0
aHuuhi_dat	db 'huuhi.dat',0
		db 0
include libs/master.lib/version[data].asm
include libs/master.lib/grp[data].asm
include libs/master.lib/resdata[data].asm
include libs/master.lib/fil[data].asm
include libs/master.lib/dos_ropen[data].asm
include libs/BorlandC/_abort[data].asm
include libs/BorlandC/atexit[data].asm
include libs/BorlandC/exit[data].asm
include libs/BorlandC/files[data].asm
__heaplen	dw 0
include libs/BorlandC/ioerror[data].asm
include libs/BorlandC/stklen[data].asm
include libs/BorlandC/nearheap[data].asm
include libs/BorlandC/pathops[data].asm
include libs/BorlandC/setvbuf[data].asm
include libs/BorlandC/sysnerr[data].asm
include libs/BorlandC/setargv[data].asm

InitStart	label byte
include libs/BorlandC/setupio[initdata].asm
include libs/BorlandC/pathops[initdata].asm
include libs/BorlandC/setargv[initdata].asm
InitEnd	label byte

ExitStart	label byte
ExitEnd	label byte

bdata@	label byte
		db ?
		db    ?	;
word_1C6A	dw ?
word_1C6C	dw ?
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
unk_1C92	db    ?	;
		db    ?	;
unk_1C94	db    ?	;
		db    ?	;
byte_1C96	db ?
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
unk_1CDC	db    ?	;
byte_1CDD	db ?
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
unk_1CE7	db    ?	;
word_1CE8	dw ?
byte_1CEA	db ?
byte_1CEB	db ?
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
byte_1D10	db ?
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
		db    ?	;
unk_1D1A	db    ?	;
		db    ?	;
unk_1D1C	db    ?	;
		db    ?	;
unk_1D1E	db    ?	;
		db    ?	;
include libs/master.lib/fil[bss].asm
include libs/BorlandC/atexit[bss].asm
edata@	label byte
_TEXT		ends


		end startx
