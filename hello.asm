.MODEL SMALL       ; Defines memory model (16-bit small model: code and data fit in 64KB)
.STACK 100h        ; Allocate 256 bytes for the stack
.DATA              ; Data segment starts here
    msg DB "Hello, World!$"  ; Define a message string ending with '$' for DOS

.CODE              ; Code segment starts here
MAIN PROC
    MOV AX, @DATA   ; Load address of DATA segment into AX
    MOV DS, AX      ; Set DS (Data Segment Register)

    MOV DX, OFFSET msg  ; Load address of msg into DX
    MOV AH, 09h         ; DOS function to print a string
    INT 21h             ; Call DOS interrupt 21h to print the string

    MOV AH, 4Ch         ; DOS function to terminate program
    INT 21h             ; Call DOS interrupt 21h

MAIN ENDP
END MAIN               ; End of program
