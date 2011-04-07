; Convert a number to a string

include 'general.inc'
include 'numberascii.inc'

format ELF executable
entry start

segment readable executable
    
start:
    printmsg tmesg,tmesg.size   ; Print the message
    printmsg announce,announce.size
    pnl
    printmsg announcetwo,announcetwo.size
    pnl
    exit 1           ; Exit cleanly


segment readable writeable
tmesg db MESSAGE,newline
announce db MESSAGE_NUMBERIS
announcetwo db MESSAGE_NUMBERISTWO
nl db newline
buffer db 5 dup(' ')

