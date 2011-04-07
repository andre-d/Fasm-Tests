; General config
	newline equ 0xA

; General functions
	macro exit n{
		mov ax,1   ; sys_exit
		mov bx, n  ; Error code
		int 0x80    ; kick the kernel
	}
	
	macro printmsg msg
	{
		; Prints a message
		if (msg eqtype "")
			local str
			str db msg,newline	
			mov cx,str
			mov dx,$-msg
			mov ax,4 ; sys_write
			mov bx,1 ; file descriptor
			int 0x80  ; kick the kernel
		end if
			
	}
