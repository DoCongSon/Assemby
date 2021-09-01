; upperCase

.MODEL SMALL
.STACK 10
.DATA
    B1 DB 5 DUP(?), "$"
    B2 DB "Nhap 5 chu cai thuong: $"
    B3 DB 10, 13, "Ket qua: $"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        LEA DX, B2
        MOV AH, 9
        INT 21h
        
        LEA SI, B1
        
        MOV CX, 5
    nhap_tiep:
        MOV AH, 1
        INT 21h
        SUB AL, 20h
        MOV [SI], AL
        INC SI
        LOOP nhap_tiep
        
        MOV AH, 9
        LEA DX, B3
        INT 21h
        LEA DX, B1
        INT 21h

    MAIN ENDP
    END MAIN
