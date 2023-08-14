# =============================================================================
#
# Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
# 5555 NE Moore Court                            408-826-6000 (other locations)
# Hillsboro, OR 97124                      web  : http://www.latticesemi.com/
# U.S.A                                    email: techsupport@latticesemi.com
# =============================================================================
#                         FILE DETAILS
# Project          : isp8
# File             : tc_01.s
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
        nop
add:    
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

        movi    r1,0x05
        movi    r2,0x03
        add     r1,r2
        addi    r1,1

        mov     r3,r1
        mov     r4,r2

        movi    r5,0x35
        movi    r6,0x43
        add     r6,r5
        addi    r6,19

        mov     r7,r5
        mov     r8,r6
        movi    r9,22

        movi    r10,0xDF
        movi    r11,0x43
        addc    r10,r11
        addic   r10,28

        mov     r12,r10

        movi    r13,0xFE
        movi    r14,0x13
        addc    r14,r13
        addic   r14,28

        mov     r15,r13
        nop

sub:    
        movi    r16,0xAA

        movi    r17,0x05
        movi    r18,0x03
        sub     r17,r18
        subi    r17,1

        mov     r19,r17
        mov     r20,r18

        movi    r21,0x35
        movi    r22,0x43
        sub     r22,r21
        subi    r22,19

        mov     r23,r22
        mov     r24,r23
        movi    r25,22

        movi    r26,0xDF
        movi    r27,0x43
        subc    r26,r27
        subic   r26,28
        mov     r28,r27

        movi    r29,0xFE
        movi    r30,0x13
        subc    r30,r29
        subic   r30,28

        mov     r31,r29
end:
        call    exp_io 
        movi    r1,0xff
        exporti r0,r1   
        movi    r27,0  # return code value
        movi    r28,0xef
        movi    r29,0xbe
        movi    r30,0xad
        movi    r31,0xde
        b       none  

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
none:   nop     
        nop     
        b none  
