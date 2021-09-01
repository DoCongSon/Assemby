.MODEL SMALL
.STACK 10
.DATA
    num DW 0
    TB1 DB "Nhap so (tu 0 den 65535): $"
    TB2 DB 10, 13, "Ket qua: $"   
.CODE 
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        XOR CX, CX     ; CF = 0
        MOV BX, 10     ; BX = 10
        
        LEA DX, TB1
        MOV AH, 9
        INT 21h
    nhap:    
        MOV AH, 1
        INT 21h
        CMP AL, 27
        JZ ket_qua
        SUB AL, 30h   ; AL -= 30h chuyen ma ascii sang he co so 10) 
        MOV CL, AL    ; CL = AL 
        
        MOV AX, num   ; AX = num (ban dau num = 0)
        MUL BX        ; AX *= BX => AX *= 10
        ADD AX, CX    ; AX += CX (CX gom CH va CL)
        MOV num, AX   ; num = AX
        JMP nhap      ; nhay den nhap de tiep tuc nhap 
    ket_qua:
        MOV AH, 9
        LEA DX, TB2
        INT 21h
        MOV BX, num   ; BX = num
        MOV CX, 16    ; CX = 16 (so bit) so lan can lap de in ra kq
    in_tiep:    
        XOR DL, DL    ; CF = 0
        SHL BX, 1     ; dich trai 1 bit cua thanh ghi BX luu bit MSB vao CF
        ADC DL, DL    ; DL = DL + DL + CF = CF phu thuoc vao lenh ben tren
        ADD DL, 30h   ; DL += 30h (chuyen gia tri DL sang ma ascii de in ra)
        MOV AH ,2
        INT 21h
        LOOP in_tiep  ; lap CX = 16 lan
    MAIN ENDP
    END MAIN