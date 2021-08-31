; min cua 5 so nhap tu ban phim

.MODEL SMALL
.STACK 10
.DATA 
    B1 DB "nhap vao 5 so: $"
    B2 DB 10, 13, "Min: $"
.CODE
    MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, B1
    INT 21h    
    
    MOV AH, 1
    INT 21h
    MOV BL, AL
    
    MOV CX, 4
    nhap_tiep:    
    INT 21h
    CMP BL, AL
    JC T1
    MOV BL, AL
    T1:
    LOOP nhap_tiep    
    
    MOV AH, 9
    LEA DX, B2
    INT 21h
    MOV AH, 2
    MOV DL, BL
    INT 21h
        
    MAIN ENDP
    END MAIN