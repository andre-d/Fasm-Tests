; Convert a number to a string

include 'general.inc'
include 'numberascii.inc'

format ELF executable
entry start

segment readable executable


start:
    printmsg(tmesg)    ; Print the message
    exit(1)            ; Exit cleanly
    
segment readable writeable
tmesg db MESSAGE,0xA
