                          ;    R15       R14    [im/export]      R15       R14    [im/export]
                          ; AAAA AAAA AAAA AAAA [AAAA AAAA]   AAAA AAAA AAAA AAAA [AAAA AAAA]
                          ; 2222 1111 1111 1100 [0000 0000]   2222 1111 1111 1100 [0000 0000]
                          ; 3210 9876 5432 1098 [7654 3210]   3210 9876 5432 1098 [7654 3210]
                          ; ---- ---- ---- ---- ----- ----- - ---- ---- ---- ---- ----- -----
.equ UART,           0x00 ; 0000 0000 0000 0000 [0000 0000] - 0000 1111 1111 1111 [1111 1111] (0x000000-0x0FFFFF)
.equ ADC,            0x10 ; 0001 0000 0000 0000 [0000 0000] - 0001 1111 1111 1111 [1111 1111] (0x100000-0x1FFFFF)
.equ UNUSED_2,       0x20 ; 0010 0000 0000 0000 [0000 0000] - 0010 1111 1111 1111 [1111 1111] (0x200000-0x2FFFFF)
.equ UNUSED_3,       0x30 ; 0011 0000 0000 0000 [0000 0000] - 0011 1111 1111 1111 [1111 1111] (0x300000-0x3FFFFF)
.equ LED_SW,         0x40 ; 0100 0000 0000 0000 [0000 0000] - 0100 1111 1111 1111 [1111 1111] (0x400000-0x4FFFFF)
.equ UNUSED_5,       0x50 ; 0101 0000 0000 0000 [0000 0000] - 0101 1111 1111 1111 [1111 1111] (0x500000-0x5FFFFF)
.equ UNUSED_6,       0x60 ; 0110 0000 0000 0000 [0000 0000] - 0110 1111 1111 1111 [1111 1111] (0x600000-0x6FFFFF)
.equ UNUSED_7,       0x70 ; 0111 0000 0000 0000 [0000 0000] - 0111 1111 1111 1111 [1111 1111] (0x700000-0x7FFFFF)
.equ UNUSED_8,       0x80 ; 1000 0000 0000 0000 [0000 0000] - 1000 1111 1111 1111 [1111 1111] (0x800000-0x8FFFFF)
.equ UNUSED_9,       0x90 ; 1001 0000 0000 0000 [0000 0000] - 1001 1111 1111 1111 [1111 1111] (0x900000-0x9FFFFF)
.equ SPI,            0xA0 ; 1010 0000 0000 0000 [0000 0000] - 1010 1111 1111 1111 [1111 1111] (0xA00000-0xAFFFFF)
.equ TIMER,          0xB0 ; 1011 0000 0000 0000 [0000 0000] - 1011 1111 1111 1111 [1111 1111] (0xB00000-0xBFFFFF)
.equ UNUSED_12,      0xC0 ; 1100 0000 0000 0000 [0000 0000] - 1100 1111 1111 1111 [1111 1111] (0xC00000-0xCFFFFF)
.equ UNUSED_13,      0xD0 ; 1101 0000 0000 0000 [0000 0000] - 1101 1111 1111 1111 [1111 1111] (0xD00000-0xDFFFFF)
.equ EBR,            0xE0 ; 1110 0000 0000 0000 [0000 0000] - 1110 1111 1111 1111 [1111 1111] (0xE00000-0xEFFFFF)
.equ UNUSED_15,      0xF0 ; 1111 0000 0000 0000 [0000 0000] - 1111 1111 1111 1111 [1111 1111] (0xF00000-0xFFFFFF)

;UART REGISTERS
.equ REG_UART_DATA,  0x00
.equ REG_UART_IER,   0x01
.equ REG_UART_LCR,   0x03
.equ REG_UART_LSR,   0x05

;ASCII CHARS
.equ CHAR_FORM_FEED, 0x0C
.equ CHAR_TAB,       0x09
.equ CHAR_CR,        0x0D
.equ CHAR_LF,        0x0A

; SOFT SPI CORE REGISTERS
.equ REG_SPI_RXDATA, 0x00
.equ REG_SPI_TXDATA, 0x04
.equ REG_SPI_STATUS, 0x08
.equ REG_SPI_CONTROL,0x0C
.equ REG_SPI_SSEL,   0x10

; EXTERNAL SPI FLASH REGISTERS
.equ SPI_INSTR_RDID, 0x9F
.equ SPI_INSTR_WREN, 0x06
.equ SPI_INSTR_WRDI, 0x04
.equ SPI_INSTR_RDSR, 0x05
.equ SPI_INSTR_PW,   0x02
.equ SPI_INSTR_PE,   0xDB
.equ SPI_INSTR_PP,   0x0A
.equ SPI_INSTR_READ, 0x03
.equ SPI_INSTR_RDP,  0xAB
.equ SPI_INSTR_GUP,  0x01
.equ SPI_INSTR_ERASE,  0x60

; *** Register rules ***
; Dedicated registers:
; r15 -- A23..A16 for external IO
; r14 -- A15..A8  for external IO

; r9  -- Current character for UART
; r5 -- Menu selection value

; General purpose registers:
; r10, r8, r7, r6 -- Return values for number conversion
; r4 -- Parameter value
; r23, r22, r21, r20, r19, r18, r12, r11, r3, r2, r1, r0 -- Temporary values
; r30, r29, r28, r27 used to hold page address bytes 1 and 2 for read/write operations
; Open: r31, r26, r25, r24, r13


;================
; PROGRAM START
nop
nop
nop

; insert delay
call delay

; initialize registers
movi r14, 0x00
movi r27, 0x00
movi r28, 0x00
movi r29, 0x00
movi r30, 0x00


; initialize modules
call init_uart
call init_spi

call small_delay

; clear the screen
init_menu:
  call wait_for_uart_txrdy
  movi r9, CHAR_FORM_FEED
  call send_uart_data
  movi r0, 0x00
  movi r14, 0x00

; display menu on the screen
display_menu:
  movi r15, EBR
  importi r9, r0
  importi r9, r0       ; Get EBR data from current address
  cmpi r9, CHAR_TAB    ; TAB is the first printable ascii char
  bc display_prompt    ; When data is less than this value, menu data is exhausted
  call send_uart_data
  addi r0, 0x01
  addic r14, 0x00
  b display_menu

display_prompt:
  call new_prompt
  
;================
; MAIN LOOP
; wait for user input through hyperterminal
waiting_for_input:
  movi r15,UART
  import r0, REG_UART_LSR
  andi r0, 0x01
  cmpi r0, 0x01
  callz get_char
  b waiting_for_input

;================
; ROUTINES
; the user input (a character from the hyperterminal)
; is matched to a function
get_char:
  movi r15,UART
  import r5, REG_UART_DATA ; Read from UART
  cmpi r5, 'm'
  bz init_menu
  cmpi r5, 't'
  callz read_uptime
  cmpi r5, 'a'
  callz read_adc
  cmpi r5, 's'
  callz check_id
  cmpi r5, 'r'
  callz read_switches
  cmpi r5, '0'
  callz write_led
  cmpi r5, '1'
  callz write_led
  cmpi r5, '2'
  callz write_led
  cmpi r5, '3'
  callz write_led
  cmpi r5, '4'
  callz write_led
  cmpi r5, '5'
  callz write_led
  cmpi r5, '6'
  callz write_led
  cmpi r5, '7'
  callz write_led
  cmpi r5, '8'
  callz write_led
  cmpi r5, '9'
  callz write_led

  cmpi r5, 'l'
  callz write_to_spi_flash

  cmpi r5, 'd'
  callz read_from_spi_flash

  cmpi r5, 'e'
  callz erase_spi

  cmpi r5, 'c'
  callz clear_page_pointers

  call new_prompt
  ret



check_id:
  call read_spi_id  ; idcode now in r4
  movi r15, UART
  call wait_for_uart_txrdy
  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'I'
  call send_uart_data
  movi r9, 'D'
  call send_uart_data
  movi r9, ':'
  call send_uart_data

  call int2asc   ; takes r4 and converts to hex nibbles in r8,r7 -- eg 0x4A => '4', 'A'

  movi r9, '0'
  call send_uart_data
  movi r9, 'x'
  call send_uart_data

  mov r9, r8
  call send_uart_data
  mov r9, r7
  call send_uart_data
  setz
  ret


read_spi_id:
  movi r15, SPI

  movi r3, 0x80     ; Turn on SSO bit
  export r3, REG_SPI_CONTROL   ; SPI Control

  call wait_for_spi_txrdy
  movi r3, SPI_INSTR_RDID
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00
  export r3, REG_SPI_TXDATA

  call wait_for_spi_rxrdy
  import r4, REG_SPI_RXDATA   ; Read data

  call wait_for_spi_txrdy
  movi r3, 0x00
  export r3, REG_SPI_TXDATA

  movi r3, 0x00     ; Turn off SSO bit to disable CSn
  export r3, REG_SPI_CONTROL   ; SPI Control
  ret


write_to_spi_flash:

  movi r15, SPI

  movi r3, 0x80                ; Turn on SSO bit
  export r3, REG_SPI_CONTROL   ; SPI Control

  call wait_for_spi_txrdy
  movi r3, SPI_INSTR_WREN
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00                ; Turn off SSO bit to disable CSn
  export r3, REG_SPI_CONTROL   ; SPI Control

  call small_delay

  movi r15, ADC
  import r4, 0x00

  movi r15, SPI
  movi r3, 0x80                ; Turn on SSO bit
  export r3, REG_SPI_CONTROL   ; SPI Control

  call wait_for_spi_txrdy
  movi r3, SPI_INSTR_PW
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  mov r3, r28
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  mov r3, r27
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  mov r3, r4
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00     ; Turn off SSO bit to disable CSn
  export r3, REG_SPI_CONTROL   ; SPI Control


  call wait_for_uart_txrdy
  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'L'
  call send_uart_data
  movi r9, 'o'
  call send_uart_data
  movi r9, 'g'
  call send_uart_data
  movi r9, 'g'
  call send_uart_data
  movi r9, 'e'
  call send_uart_data
  movi r9, 'd'
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'd'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, 't'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'i'
  call send_uart_data
  movi r9, 'n'
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'p'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, 'g'
  call send_uart_data
  movi r9, 'e'
  call send_uart_data
  movi r9, ' '
  call send_uart_data

  mov r4, r27
  call int2asc10

  mov r9, r8
  call send_uart_data
  mov r9, r7
  call send_uart_data
  mov r9, r6
  call send_uart_data

  movi r15, SPI

  addi r27, 0x01
  addic r28, 0x00

  call small_delay

  movi r3, 0x80                ; Turn on SSO bit
  export r3, REG_SPI_CONTROL   ; SPI Control

  call wait_for_spi_txrdy
  movi r3, SPI_INSTR_WRDI
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00                ; Turn off SSO bit to disable CSn
  export r3, REG_SPI_CONTROL   ; SPI Control

  ret



read_from_spi_flash:
  movi r15, SPI

  movi r15, SPI
  movi r3, 0x80                ; Turn on SSO bit
  export r3, REG_SPI_CONTROL   ; SPI Control

  call wait_for_spi_txrdy
  movi r3, SPI_INSTR_READ
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  mov r3, r30
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  mov r3, r29
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00
  export r3, REG_SPI_TXDATA

  ;dummy byte
  call wait_for_spi_txrdy
  movi r3, 0x00
  export r3, REG_SPI_TXDATA

  call wait_for_spi_rxrdy
  import r4, REG_SPI_RXDATA   ; Read data
  mov r11, r4                 ; save data in r11

  movi r3, 0x00                ; Turn off SSO bit to disable CSn
  export r3, REG_SPI_CONTROL   ; SPI Control

  cmpi r4, 0xFF
  bz no_spi_data
  call display_V_spi

  addi r29, 0x01
  addic r30, 0x00

  b done_reading

  no_spi_data:
  call wait_for_uart_txrdy
  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'N'
  call send_uart_data
  movi r9, 'o'
  call send_uart_data
  
  movi r9, ' '
  call send_uart_data

  movi r9, 'M'
  call send_uart_data
  movi r9, 'o'
  call send_uart_data
  movi r9, 'r'
  call send_uart_data
  movi r9, 'e'
  call send_uart_data

  movi r9, ' '
  call send_uart_data

  movi r9, 'D'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, 't'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data

  done_reading:

  ret

; read data from SPI and tx
; to hyperterminal
display_V_spi:
  call wait_for_uart_txrdy
  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'D'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, 't'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'f'
  call send_uart_data
  movi r9, 'r'
  call send_uart_data
  movi r9, 'o'
  call send_uart_data
  movi r9, 'm'
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'p'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, 'g'
  call send_uart_data
  movi r9, 'e'
  call send_uart_data
  movi r9, ' '
  call send_uart_data

  mov r4, r29
  call int2asc10

  mov r9, r8
  call send_uart_data  
  mov r9, r7
  call send_uart_data
  mov r9, r6
  call send_uart_data
  movi r9, ':'
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  mov r4, r11
  call adc_res2ascii
  mov r9, r10
  call send_uart_data
  movi r9, '.'
  call send_uart_data
  mov r9, r8
  call send_uart_data
  mov r9, r7
  call send_uart_data
  mov r9, r6
  call send_uart_data
  movi r9, 'V'
  call send_uart_data
  ret



write_led:                        

  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data

  ;echo the BCD character to Hyperterminal
  mov r9, r5
  call send_uart_data

  movi r15, LED_SW
  xori r5, 0xFF
  export r5, 0x00

  ret

; read data from ADC and tx
; to hyperterminal
read_adc:
  movi r15, ADC
  import r4, 0x00
  call wait_for_uart_txrdy
  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'A'
  call send_uart_data
  movi r9, 'D'
  call send_uart_data
  movi r9, 'C'
  call send_uart_data
  movi r9, ':'
  call send_uart_data
  call adc_res2ascii
  mov r9, r10
  call send_uart_data
  movi r9, '.'
  call send_uart_data
  mov r9, r8
  call send_uart_data
  mov r9, r7
  call send_uart_data
  mov r9, r6
  call send_uart_data
  movi r9, 'V'
  call send_uart_data
  setz
  ret


clear_page_pointers:

  movi r27, 0x00
  movi r28, 0x00
  movi r29, 0x00
  movi r30, 0x00

  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'C'
  call send_uart_data
  movi r9, 'l'
  call send_uart_data
  movi r9, 'e'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, 'r'
  call send_uart_data
  movi r9, 'e'
  call send_uart_data
  movi r9, 'd'
  call send_uart_data

  movi r9, ' '
  call send_uart_data
  movi r9, 'p'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, 'g'
  call send_uart_data
  movi r9, 'e'
  call send_uart_data

  movi r9, ' '
  call send_uart_data
  movi r9, 'p'
  call send_uart_data
  movi r9, 'o'
  call send_uart_data
  movi r9, 'i'
  call send_uart_data
  movi r9, 'n'
  call send_uart_data
  movi r9, 't'
  call send_uart_data
  movi r9, 'e'
  call send_uart_data
  movi r9, 'r'
  call send_uart_data
  movi r9, 's'
  call send_uart_data

  setz
  ret


; read data from dip-switches and tx
; to hyperterminal
read_switches:
  movi r15, LED_SW
  import r4, 0x00
  ;call send_crlf
  call wait_for_uart_txrdy
  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'S'
  call send_uart_data
  movi r9, 'W'
  call send_uart_data
  movi r9, ':'
  call send_uart_data
  call int2asc   ; takes r4 and converts to hex nibbles in r8,r7 -- eg 0x4A => '4', 'A'
  movi r9, '0'
  call send_uart_data
  movi r9, 'x'
  call send_uart_data
  mov r9, r8
  call send_uart_data
  mov r9, r7
  call send_uart_data
  setz
  ret


read_uptime:
  movi r15, TIMER
  export r0, 0x00  ;; issue a 'write' to latch the current time value
  import r4, 0x02  ;; hour byte of latched time value
  call wait_for_uart_txrdy
  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'U'
  call send_uart_data
  movi r9, 'p'
  call send_uart_data
  movi r9, 't'
  call send_uart_data
  movi r9, 'i'
  call send_uart_data
  movi r9, 'm'
  call send_uart_data
  movi r9, 'e'
  call send_uart_data
  movi r9, ':'
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  call int2asc10   ; takes r4 and converts to BCD in r8,r7,r6
  mov r9, r8
  call send_uart_data
  mov r9, r7
  call send_uart_data
  mov r9, r6
  call send_uart_data
  movi r9, 'h'
  call send_uart_data
  movi r15, TIMER
  import r4, 0x01  ;; minute byte of time of latched time value
  call int2asc10   ; takes r4 and converts to BCD in r8,r7,r6
  mov r9, r7
  call send_uart_data
  mov r9, r6
  call send_uart_data
  movi r9, 'm'
  call send_uart_data
  movi r15, TIMER
  import r4, 0x00  ;; seconds byte of time of latched time value
  call int2asc10   ; takes r4 and converts to BCD in r8,r7,r6
  mov r9, r7
  call send_uart_data
  mov r9, r6
  call send_uart_data
  movi r9, 's'
  call send_uart_data
  setz
  ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; *** Utility Functions *** ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

init_uart:
  movi r15, UART
  movi r0, 0x00  ; IER
  export r0, REG_UART_IER
  movi r0, 0x03  ; LCR
  export r0, REG_UART_LCR
  ret

wait_for_uart_txrdy:
  movi r15, UART
  uart_txrdy_loop:
  import r1, REG_UART_LSR
  andi r1, 0x20   ; Mask out all but THR Empty status bit
  cmpi r1, 0x20
  bnz uart_txrdy_loop
  ret

new_prompt:
  call send_crlf
  call send_crlf
  movi r9, '>'
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  ret

send_uart_data:
  movi r15, UART
  call wait_for_uart_txrdy
  export r9, REG_UART_DATA
  ret

send_crlf:
  movi r15, UART
  movi r9, CHAR_CR
  call send_uart_data
  movi r9, CHAR_LF
  call send_uart_data
  ret

delay:
  movi r1, 0x00
  movi r2, 0x00
  movi r3, 0x00
  dly_loop:
    addi r1,0x01
    addic r2, 0x00
    addic r3, 0x00
    cmpi r3, 0x20
    bnz dly_loop
  ret

small_delay:
  movi r1, 0x00
  movi r2, 0x00
  delay_loop:
    addi r1, 0x01
    addic r2, 0x00
    cmpi r2, 0x01
    bnz delay_loop
  ret

int2asc10:
  ; input in r4
  ; outputs to r8(100's), r7(10's), r6(1's)
  mov  r6, r4
  movi r7, 0x00 ; tens
  movi r8, 0x00 ; hundreds

  compare_10:
  cmpi r6, 10
  bnc incr_tens
  b bcd_done

  incr_tens:
    subi r6, 10
    addi r7, 1
    cmpi r7, 10
    bz incr_hundreds
    b compare_10

  incr_hundreds:
    addi r8, 1
    movi r7, 0
    b compare_10

  bcd_done:
    addi r6, 0x30
    addi r7, 0x30
    addi r8, 0x30
  ret


int2asc:
  ; input in r4
  ; outputs to r8 (MS-Nibble), r7 (LS-Nibble)
  mov r7, r4
  mov r8, r4
  andi r7, 0x0F
  andi r8, 0xF0
  ror r8, r8
  ror r8, r8
  ror r8, r8
  ror r8, r8
  cmpi r7, 0x0A
  bnc r7_is_alpha
  addi r7, 0x30

  conv_r8:
  cmpi r8, 0x0A
  bnc r8_is_alpha
  addi r8, 0x30
  b int2asc_done
  r7_is_alpha:
  addi r7, 0x37
  b conv_r8
  r8_is_alpha:
  addi r8, 0x37
  int2asc_done:
  ret

;convert the digital data of the ADC
;to ASCII characters to send to UART
adc_res2ascii:

   ;initialize count registers
   movi r0, 0x00
   movi r1, 0x00
   movi r2, 0x00
   movi r11, 0x00
   movi r12, 0x00
   movi r18, 0x00
   movi r19, 0x00
   movi r20, 0x00
   movi r21, 0x00
   movi r22, 0x00
   movi r23, 0x00

   ;initialize ascii registers
   movi r6, 0x30
   movi r7, 0x30
   movi r8, 0x30
   movi r10, 0x30

   sum_of_resolution:
     addi r0, 0x0D  ;VCCIO=3.3V, 256 States, 13mV (0x0D) resolution
     addic r1, 0x00
     addi  r2, 0x01
     cmp r4, r2     ;Z = 1 if R4-R2=0
     bnz sum_of_resolution

   ascii:
     addi r11, 0x01
     addic r12, 0x00
     mov r18, r11
     mov r19, r12
     xor r18, r0
     xor r19, r1
     or r18, r19
     bz done

     addi r20, 0x01
     andi r20, 0xFF
     bz compensate_1n
        addi r6, 0x01
     compensate_1n:
     cmpi r20, 0x0A
     bnz ascii

         movi r20, 0x00
         movi r6, 0x30
         addi r21, 0x01
         andi r21, 0xFF
         bz compensate_2n
            addi r7, 0x01
         compensate_2n:
         cmpi r21, 0x0A
         bnz ascii

             movi r20, 0x00
             movi r21, 0x00
             movi r6, 0x30
             movi r7, 0x30
             addi r22, 0x01
             andi r22, 0xFF
             bz compensate_3n
                addi r8, 0x01
             compensate_3n:
             cmpi r22, 0x0A
             bnz ascii

                   movi r20, 0x00
                   movi r21, 0x00
                   movi r22, 0x00
                   movi r6, 0x30
                   movi r7, 0x30
                   movi r8, 0x30
                   addi r23, 0x01
                   andi r23, 0xFF
                   bz compensate_4n
                      addi r10, 0x01
                   compensate_4n:
                   cmpi r23, 0x0A
                   bnz ascii
   done:
   ret
   
   

init_spi:
  movi r15, SPI
  movi r0, 0x01     ; SPI Select
  export r0, REG_SPI_SSEL

  movi r3, 0x80     ; Turn on SSO bit
  export r3, REG_SPI_CONTROL   ; SPI Control

  call wait_for_spi_txrdy
  movi r3, SPI_INSTR_RDP      ;Resume from Deep Power-down
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00     ; Turn off SSO bit to disable CSn
  export r3, REG_SPI_CONTROL   ; SPI Control

  call small_delay

  movi r3, 0x80                ; Turn on SSO bit
  export r3, REG_SPI_CONTROL   ; SPI Control

  call wait_for_spi_txrdy
  movi r3, SPI_INSTR_WREN      ; enable WRITE to flash
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00                ; Turn off SSO bit to disable CSn
  export r3, REG_SPI_CONTROL   ; SPI Control

  call small_delay


  movi r3, 0x80     ; Turn on SSO bit
  export r3, REG_SPI_CONTROL   ; SPI Control

  call wait_for_spi_txrdy
  movi r3, SPI_INSTR_GUP       ;Global Unprotect
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00     ; Turn off SSO bit to disable CSn
  export r3, REG_SPI_CONTROL   ; SPI Control

  call small_delay

  movi r3, 0x80                ; Turn on SSO bit
  export r3, REG_SPI_CONTROL   ; SPI Control

  call wait_for_spi_txrdy
  movi r3, SPI_INSTR_WRDI      ; disable WRITE to flash
  export r3, REG_SPI_TXDATA

  call wait_for_spi_txrdy
  movi r3, 0x00                ; Turn off SSO bit to disable CSn
  export r3, REG_SPI_CONTROL   ; SPI Control

  setz
  ret


  erase_spi :

  call wait_for_uart_txrdy
  movi r9, ' '
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, 'e'
  call send_uart_data
  movi r9, 'r'
  call send_uart_data
  movi r9, 'a'
  call send_uart_data
  movi r9, 's'
  call send_uart_data
  movi r9, 'i'
  call send_uart_data
  movi r9, 'n'
  call send_uart_data
  movi r9, 'g'
  call send_uart_data
  movi r9, ' '
  call send_uart_data
  movi r9, '.'
  call send_uart_data
  movi r9, '.'
  call send_uart_data
  movi r9, '.'
  call send_uart_data

      movi r15, SPI

      movi r3, 0x80                ; Turn on SSO bit
      export r3, REG_SPI_CONTROL   ; SPI Control

      call wait_for_spi_txrdy
      movi r3, SPI_INSTR_WREN
      export r3, REG_SPI_TXDATA

      call wait_for_spi_txrdy
      movi r3, 0x00                ; Turn off SSO bit to disable CSn
      export r3, REG_SPI_CONTROL   ; SPI Control

      call small_delay

      movi r3, 0x80                ; Turn on SSO bit
      export r3, REG_SPI_CONTROL   ; SPI Control

      call wait_for_spi_txrdy
      movi r3, SPI_INSTR_WREN
      export r3, REG_SPI_TXDATA

      call wait_for_spi_txrdy
      movi r3, 0x00                ; Turn off SSO bit to disable CSn
      export r3, REG_SPI_CONTROL   ; SPI Control

      call small_delay

      movi r3, 0x80                ; Turn on SSO bit
      export r3, REG_SPI_CONTROL   ; SPI Control
    
      call wait_for_spi_txrdy
      movi r3, SPI_INSTR_ERASE
      export r3, REG_SPI_TXDATA
    
      call wait_for_spi_txrdy
      movi r3, 0x00                ; Turn off SSO bit to disable CSn
      export r3, REG_SPI_CONTROL   ; SPI Control
    
      call small_delay

      movi r3, 0x80                ; Turn on SSO bit
      export r3, REG_SPI_CONTROL   ; SPI Control

      call wait_for_spi_txrdy
      movi r3, SPI_INSTR_RDSR
      export r3, REG_SPI_TXDATA

      check_erase_sts2:
      call wait_for_spi_txrdy
      movi r3, 0x00
      export r3, REG_SPI_TXDATA

      call wait_for_spi_rxrdy
      import r4, REG_SPI_RXDATA   ; Read data

      andi r4, 0x01
      bnz check_erase_sts2

      call wait_for_spi_txrdy
      movi r3, 0x00                ; Turn off SSO bit to disable CSn
      export r3, REG_SPI_CONTROL   ; SPI Control

      call small_delay

      movi r3, 0x80                ; Turn on SSO bit
      export r3, REG_SPI_CONTROL   ; SPI Control

      call wait_for_spi_txrdy
      movi r3, SPI_INSTR_WRDI
      export r3, REG_SPI_TXDATA

      call wait_for_spi_txrdy
      movi r3, 0x00                ; Turn off SSO bit to disable CSn
      export r3, REG_SPI_CONTROL   ; SPI Control

      setz
      ret

wait_for_spi_txrdy:
  movi r15, SPI
  spi_txrdy_loop:
  import r1, REG_SPI_STATUS ; Read Status register
  andi r1, 0x10   ; Mask out all but TMT status bit
  cmpi r1, 0x10
  bnz spi_txrdy_loop
  ret
wait_for_spi_rxrdy:
  movi r15, SPI
  import r1, REG_SPI_STATUS ; Read Status register
  andi r1, 0x50   ; Mask out all but RRDY status bit
  cmpi r1, 0x50
  bnz wait_for_spi_txrdy
  ret




