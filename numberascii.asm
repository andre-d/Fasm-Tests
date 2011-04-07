; Convert a number to a string

include 'general.inc'
include 'numberascii.inc'

format ELF executable 3
entry start

segment readable executable


start:
    printmsg(MESSAGE)    ; Print the message
    printmsg("Okay...") 
    exit(0)              ; Exit cleanly
    
segment readable writeable

