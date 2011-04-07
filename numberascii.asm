; Convert a number to a string

include 'general.inc'
include 'numberascii.inc'

format ELF executable
entry start

segment readable executable


getlen_loop:
    xor edx, edx
    push esi
    mov esi, 10
    idiv esi ; divide eax by ten
    pop esi
    inc esi ; up our counter
    cmp eax, 0 
    jnz getlen_loop ; if it zero, it is time to leave
    ret
    

getlen:
; Gets the length of eax in terms of base10 numbers, stores in esi
    push eax
    call getlen_loop
    pop eax
    ret

int2str_loop:
    ; Isolates the current number, converts to to an ascii character, and places it into the buffer, then continues to the next number
    
    mov ebx, eax ; move the current value into ebx (123)
    xor edx, edx
    push esi
    mov esi, 10
    idiv esi ; divide eax by ten
    pop esi
   
    
    mov edx, eax ; move the current value into edx (12)
   
 
    push eax
    imul edx,10 ; multiply eax by ten, should store the result in edx (120)
    pop eax

    
    push eax
     
      
    sub ebx, edx ;(subtract edx (120 from ebx (123)
  
    mov eax, ebx ; move the result of the subtraction into eax
   
    add eax,0x30 ; add 0x30 (ascii base)
    mov [buffer+esi-1],al ; Place into the proper position into the buffer
   
    pop eax ; restore eax to before the whole mess with the subtraction
    
    dec esi ; move the counter down one
    cmp esi,0 
    jnz int2str_loop ; if we have not reached the last char yet, continue
    ret

int2str_error:
    printmsg error,error.size
    exit 1

int2str:
; Converts eax to a string - expects a number in eax.  Unsigned
    cmp eax, MAX_NUM
    ja int2str_error
    push eax
    xor esi,esi  ; length
    call getlen ; get the length into esi
    pop eax
    call int2str_loop
    ret



start:
    printmsg tmesg,tmesg.size   ; Print the message
    printmsg announce,announce.size
    mov eax, NUMBER
    call int2str
    printmsg buffer,buffer.size
    pnl
    printmsg announcetwo,announcetwo.size
    mov eax, ANOTHER_NUMBER
    call int2str
    printmsg buffer,buffer.size
    pnl
    exit 0           ; Exit cleanly


segment readable writeable
tmesg db MESSAGE,newline
announce db MESSAGE_NUMBERIS
error db ERRORMSG,newline
announcetwo db MESSAGE_NUMBERISTWO
nl db newline
buffer db NUM_BYTES dup(' ')

