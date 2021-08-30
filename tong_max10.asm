; tinh tong 2 so co 1 chu so 
; co tong nho hon 10

.MODEL SMALL
.STACK 10
.DATA
    B1 DB "Nhap so thu 1: $"
    B2 DB 10,13,"Nhap so thu 2: $"
    B3 DB 10,13,"Ket qua: $"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, B1
        MOV AH, 9
        INT 21h
        MOV AH, 1    ; nhap so nhu 1
        INT 21h
        MOV BL, AL  
        
        LEA DX, B2
        MOV AH, 9
        INT 21h
        MOV AH, 1    ; nhap so nhu 2
        INT 21h
        ADD AL, BL
        AAA
        ADD AL ,30h
        MOV BL , AL
        
        LEA DX, B3
        MOV AH, 9
        INT 21h
        
        MOV AH, 2
        MOV DL,BL
        INT 21h 
    MAIN ENDP
    END MAIN
