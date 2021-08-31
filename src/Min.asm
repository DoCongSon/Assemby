.MODEL SMALL
.STACK 10
.DATA
     B1 DB "Nhap so: $"
     B2 DB 10,13,"Min: $" 
     B3 DB 10,13,"Chua nhap so nao! $"
.CODE
    MAIN PROC 
        MOV AX, @DATA
        MOV DS, AX   ; lay dia chi segment cua data cho vao DS
        LEA DX,B1    ; lay dia chi offset cua B1 cho vao DX
        MOV AH,9
        INT 21h      ; in dong B1
        
        MOV AH, 1    ; nhap so nhu nhat
        INT 21h
        CMP AL, 27   ; k tra xem so vua nhap co bang 27(esc) khong
        JZ  Ko_co_so ; neu AL= 27(ma ascII cua esc) thi ZF = 1 -> nhay den vi tri Ko_co_so
    T2:    
        MOV BL, AL   ; chuyen g/tri cua AL vao BL (min)
    T1:    
        MOV AH, 1    
        INT 21h      ; tiep tuc nhap
        CMP AL, 27   ; kiem tra xem so vua nhap co bang 27(esc) khong
        JZ Ket_thuc  ; neu AL= 27(esc) thi ZF = 1 -> nhay den vi tri Ket_thuc
        CMP BL, AL   ; so sanh g/tri cua BL (min) voi g/tri AL vua nhap
        JC T1        ; neu BL < AL nhay toi T1
        JNC T2:      ; neu BL >= AL nhay toi T2
    Ko_co_so:
        LEA DX,B3
        MOV AH, 9
        INT 21h 
        JZ thoat
    ket_thuc:
        LEA DX,B2
        MOV AH, 9
        INT 21h
        MOV AH, 2
        MOV DL,BL
        INT 21h 
    thoat:
    MAIN ENDP
    END MAIN    
        
    