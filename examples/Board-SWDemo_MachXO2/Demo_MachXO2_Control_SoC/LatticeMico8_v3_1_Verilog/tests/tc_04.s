# =============================================================================
#
# Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
# 5555 NE Moore Court                            408-826-6000 (other locations)
# Hillsboro, OR 97124                      web  : http://www.latticesemi.com/
# U.S.A                                    email: techsupport@latticesemi.com
# =============================================================================
#                         FILE DETAILS
# Project          : isp8
# File             : tc_04.s
# Title            : 
# Dependencies     :
# Description      : Assembly level source for checking different 
#                    logical/rotate instructions 
# =============================================================================
#                        REVISION HISTORY
# $Revision: 1.1 $
#
# =============================================================================
        
        b       start # interrupt vector
start:
        movi    r0, 0
        movi    r1, 0
        movi    r2, 0
        movi    r3, 0
        movi    r4, 0
        movi    r5, 0
        movi    r6, 0
        movi    r7, 0
        movi    r8, 0
        movi    r9, 0
        movi    r10, 0
        movi    r11, 0
        movi    r12, 0
        movi    r13, 0
        movi    r14, 0
        movi    r15, 0
        movi    r16, 0
        movi    r17, 0
        movi    r18, 0
        movi    r19, 0
        movi    r20, 0
        movi    r21, 0
        movi    r22, 0
        movi    r23, 0
        movi    r24, 0
        movi    r25, 0
        movi    r26, 0
        movi    r27, 0
        movi    r28, 0
        movi    r29, 0
        movi    r30, 0
        movi    r31, 0
        
        movi    r0,0x55
        movi    r1,0x33
        movi    r2,0xAA
        movi    r3,0x44
        movi    r4,0x35
        movi    r5,0x43
        nop
        setz    
        nop     
        callz   callz0
        nop     
        clrz    
        nop     
        callnz  callz1
        nop     
        setc    
        nop     
        callc   callc0
        nop     
        clrc    
        nop     
        callnc  callc1
        nop     
        nop     
        call    call0
        nop
        b       end
        nop
callz0: 
        movi    r6,0x35
        movi    r7,0x43
        movi    r8,0x18
        movi    r9,0xCF
        movi    r10,0x77
        movi    r11,0x88
        ret     
callz1: 
        movi    r8,0x18
        movi    r9,0xCF
        movi    r10,0x77
        movi    r11,0x88
        movi    r12,0xDF
        movi    r13,0x43
        ret     
callc0: 
        movi    r14,0x29
        movi    r15,0x73
        movi    r16,0xFE
        movi    r17,0x13
        movi    r18,0xFE
        movi    r19,0x13
        ret     
callc1: 
        movi    r20,0x29
        movi    r21,0x73
        movi    r22,0xFE
        movi    r23,0x13
        movi    r24,0xFE
        movi    r25,0x13
        ret     
call0:  
        movi    r26,0x29
        movi    r27,0x73
        movi    r28,0xFE
        movi    r29,0x13
        movi    r30,0xFE
        movi    r31,0x13
        ret     
end:
        call    exp_io 
        movi    r1,255
        exporti r0,r1   
        movi    r27,0  # return code value
        movi    r28,0xef
        movi    r29,0xbe
        movi    r30,0xad
        movi    r31,0xde
        b none  

exp_io: 
        export  r0,0
        export  r1,1
        export  r2,2
        export  r3,3
        export  r4,4
        export  r5,5
        export  r6,6
        export  r7,7
        export  r8,8
        export  r9,9
        export  r10,10
        export  r11,11
        export  r12,12
        export  r13,13
        export  r14,14
        export  r15,15
        export  r16,16
        export  r17,17
        export  r18,18
        export  r19,19
        export  r20,20
        export  r21,21
        export  r22,22
        export  r23,23
        export  r24,24
        export  r25,25
        export  r26,26
        export  r27,27
        export  r28,28
        export  r29,29
        export  r30,30
        export  r31,31
        ret
none:   
        nop     
        nop     
        b none  
