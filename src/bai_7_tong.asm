; tinh tong 2 so co 1 chu so 

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
        MOV AH, 1    ; nhap so thu 1
        INT 21h
        MOV BL, AL   ; luu vao BH
        
        LEA DX, B2
        MOV AH, 9
        INT 21h
        MOV AH, 1    ; nhap so thu 2
        INT 21h
        ADD AL, BL   ; cong 2 so ket qua dua lai vao AL
        MOV AH, 30h  ; dat AH = 30h (ma ascii cua so 0)
        AAA          ; hieu chinh kq. neu lon > 10 thi AH tang len 1 don vi, AL chua so hang don vi 
        ADD AL ,30h  ; chuyen AL ve ma ascii
        MOV BL , AL  ; chuyen AL vao BL
        MOV BH , AH  ; chuyen AH vao BH
                     ; luc nay BH chua so hang chuc
                     ;         AH chua so hang don vi 
        
        LEA DX, B3
        MOV AH, 9
        INT 21h
        MOV AH, 2
        CMP BH, 30h  ; so sanh BH voi 30h (so hang chuc bang 0)                    ;  
        JZ T1        ; neu BH = 30h thi CF = 1. luc do nhay toi T1
        MOV DL, BH   ; in so hang chuc
        INT 21h
        T1:
        MOV DL, BL   ; in so hang don vi
        INT 21h 
    MAIN ENDP
    END MAIN


