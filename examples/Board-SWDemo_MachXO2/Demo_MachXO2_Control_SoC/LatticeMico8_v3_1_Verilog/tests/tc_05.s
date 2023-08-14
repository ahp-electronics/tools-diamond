# =============================================================================
#
# Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
# 5555 NE Moore Court                            408-826-6000 (other locations)
# Hillsboro, OR 97124                      web  : http://www.latticesemi.com/
# U.S.A                                    email: techsupport@latticesemi.com
# =============================================================================
#                         FILE DETAILS
# Project          : isp8
# File             : tc_05.s
# Title            : 
# Dependencies     :
# Description      : Assembly level source for checking different 
#                    logical/rotate instructions 
# =============================================================================
#                        REVISION HISTORY
# $Revision: 1.1 $
#
# =============================================================================
        
        b       isr # interrupt vector
start:
        clri
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
        
        nop
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop
        nop
        seti
        b none0 
none0:  
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        nop     
        b end   
isr:    
        movi    r0,55
        movi    r1,56
        movi    r2,57
        movi    r3,58
        movi    r4,59
        movi    r5,60
        movi    r6,61
        movi    r7,62
        movi    r8,63
        movi    r9,64
        movi    r10,65
        movi    r11,66
        movi    r12,67
        movi    r13,68
        movi    r14,69
        movi    r15,70
        movi    r16,71
        movi    r17,72
        movi    r18,73
        movi    r19,74
        movi    r20,75
        movi    r21,76
        movi    r22,77
        movi    r23,78
        movi    r24,79
        movi    r25,80
        movi    r26,81
        movi    r27,82
        movi    r28,83
        movi    r29,84
        movi    r30,85
        movi    r31,86

        ssp     r1,0
        addi    r1,3
        lsp     r1,0

        ssp     r10,6
        addi    r10,1
        lsp     r10,6

        ssp     r23,18
        addi    r23,2
        lsp     r23,18

        ssp     r30,25
        addi    r30,5
        lsp     r30,25

        iret    
end:
        call    exp_io 
        movi    r1,255
        exporti r0,r1   
        movi    r27,0  # return code value
        movi    r28,0xef
        movi    r29,0xbe
        movi    r30,0xad
        movi    r31,0xde
        b none1 

exp_io: 
        movi    r0,0
        sspi    r0,r0
        movi    r0,1
        sspi    r1,r0
        movi    r0,2
        sspi    r2,r0
        movi    r0,3
        sspi    r3,r0
        movi    r0,4
        sspi    r4,r0
        movi    r0,5
        sspi    r5,r0
        movi    r0,6
        sspi    r6,r0
        movi    r0,7
        sspi    r7,r0
        movi    r0,8
        sspi    r8,r0
        movi    r0,9
        sspi    r9,r0
        movi    r0,10
        sspi    r10,r0
        movi    r0,11
        sspi    r11,r0
        movi    r0,12
        sspi    r12,r0
        movi    r0,13
        sspi    r13,r0
        movi    r0,14
        sspi    r14,r0
        movi    r0,15
        sspi    r15,r0
        movi    r0,16
        sspi    r16,r0
        movi    r0,17
        sspi    r17,r0
        movi    r0,18
        sspi    r18,r0
        movi    r0,19
        sspi    r19,r0
        movi    r0,20
        sspi    r20,r0
        movi    r0,21
        sspi    r21,r0
        movi    r0,22
        sspi    r22,r0
        movi    r0,23
        sspi    r23,r0
        movi    r0,24
        sspi    r24,r0
        movi    r0,25
        sspi    r25,r0
        movi    r0,26
        sspi    r26,r0
        movi    r0,27
        sspi    r27,r0
        movi    r0,28
        sspi    r28,r0
        movi    r0,29
        sspi    r29,r0
        movi    r0,30
        sspi    r30,r0
        movi    r0,31
        sspi    r31,r0
        ret
none1:  
        nop     
        nop     
        b none1 
