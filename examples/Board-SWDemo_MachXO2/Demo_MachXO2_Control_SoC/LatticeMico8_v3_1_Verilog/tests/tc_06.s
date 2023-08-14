# =============================================================================
#
# Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
# 5555 NE Moore Court                            408-826-6000 (other locations)
# Hillsboro, OR 97124                      web  : http://www.latticesemi.com/
# U.S.A                                    email: techsupport@latticesemi.com
# =============================================================================
#                         FILE DETAILS
# Project          : isp8
# File             : tc_06.s
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
        
# Initialize the memorie attached to the isp8.  Earlier testbenches
# fed themselves with known data, which did not really exercise the
# processor/memory combo.
        
        movi    r2, 0x20
        movi    r1, 0x1f
        movi    r0, 0
clear_memories: 
        exporti r0, r1
        sspi    r0, r1
        subi    r1, 1
        subi    r2, 1
        bnz     clear_memories        
        

        movi    r2, 0x1f
        movi    r1, 0
        exporti r2, r1
        sspi    r2, r1
        addi    r1, 1
        movi    r2, 0x49
        movi    r3, 15
init_ext_mem1:
        exporti r2, r1
        sspi    r2, r1
        addi    r2, 1
        addi    r1, 1
        subi    r3, 1
        bnz     init_ext_mem1

        movi    r2, 0x27
        movi    r1, 0x10
        movi    r3, 0x10
init_ext_mem2:
        exporti r2, r1
        sspi    r2, r1
        addi    r1, 1
        addi    r2, 1
        subi    r3, 1
        bnz init_ext_mem2


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
        movi    r0,0
        lspi    r0,r0
        movi    r0,1
        lspi    r1,r0
        movi    r0,2
        lspi    r2,r0
        movi    r0,3
        lspi    r3,r0
        movi    r0,4
        lspi    r4,r0
        movi    r0,5
        lspi    r5,r0
        movi    r0,6
        lspi    r6,r0
        movi    r0,7
        lspi    r7,r0
        movi    r0,8
        lspi    r8,r0
        movi    r0,9
        lspi    r9,r0
        movi    r0,10
        lspi    r10,r0
        movi    r0,11
        lspi    r11,r0
        movi    r0,12
        lspi    r12,r0
        movi    r0,13
        lspi    r13,r0
        movi    r0,14
        lspi    r14,r0
        movi    r0,15
        lspi    r15,r0

        nop
        nop     
        nop     
        nop     
        nop     
        nop     

        movi    r0,16
        importi r16,r0
        movi    r0,17
        importi r17,r0
        movi    r0,18
        importi r18,r0
        movi    r0,19
        importi r19,r0
        movi    r0,20
        importi r20,r0
        movi    r0,21
        importi r21,r0
        movi    r0,22
        importi r22,r0
        movi    r0,23
        importi r23,r0
        movi    r0,24
        importi r24,r0
        movi    r0,25
        importi r25,r0
        movi    r0,26
        importi r26,r0
        movi    r0,27
        importi r27,r0
        movi    r0,28
        importi r28,r0
        movi    r0,29
        importi r29,r0
        movi    r0,30
        importi r30,r0
        movi    r0,31
        importi r31,r0
        b end   
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
none1:  
        nop     
        nop     
        b none1 
