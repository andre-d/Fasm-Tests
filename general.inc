; General config
	newline equ 0xA ; The unix newline character
	
; Used to set a size value easy
	struc db [data]{
	   common
		. db data
		.size = $ - .
	 }
	
; General functions

	; Use to quit, takes a number for an exit code
	macro exit n{
		mov esi, n
		mov eax,1   ; sys_exit
		mov ebx,esi   ; Error code
		int 0x80    ; kick the kernel
	}
	
	; Use to print a message to the screen.  Expects a char * and a length in bytes 
	macro printmsg msg,size
	{	
		mov ecx,msg
		mov edx,size
		mov eax,4 ; sys_write
		mov ebx,1 ; file descriptor
		int 0x80  ; kick the kernel
	}

