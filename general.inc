; General config
	newline equ 0xA

; General functions
	macro exit n{
		mov eax,1   ; sys_exit
		mov ebx, n  ; Error code
		int 0x80    ; kick the kernel
	}
	
	
	macro printmsg msg
	{	
		mov ecx,msg
		mov edx,-msg
		mov eax,4 ; sys_write
		mov ebx,1 ; file descriptor
		int 0x80  ; kick the kernel
	}
