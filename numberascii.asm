
; Convert a number to a string

format ELF executable 3
entry start

segment readable executable

    CFG_NUMBER = 103
    CFG_ANOTHER_NUMBER = 18721

exit:
    ; Call to exit the program
    ; ebx: int error_code
    mov eax,1   ; sys_exit
    int 0x80    ; kick the kernel


exit_clean:
    xor eax,eax ; Set the error code to 0
    jmp exit
    

printmsg:
    ; Prints a message
    ; ecx: char * buffer
    ; edx: int size
    push eax 
    push ebx
    mov eax,4 ; sys_write
    mov ebx,1 ; file descriptor
    int 0x80  ; kick the kernel
    pop ebx
    pop eax
    ret

start:
    mov ecx,msg      ; Place our message in ecx
    mov edx,msg_size ; Place the size in edx
    call printmsg    ; Print the message
    jmp exit_clean   ; Now exit cleanly
    
segment readable writeable

msg db 'Simple demo to convert an integer to a string',0xA
msg_size = $-msg
