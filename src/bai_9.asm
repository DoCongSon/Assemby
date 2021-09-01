; SAP XEP
.MODEL SMALL
.STACK 10
.DATA
    ARR DB 50 DUP(?), "$"
    TB1 DB "Nhap so: $"
    TB2 DB 10, 13, "Ket qua: $" 
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, TB1
        MOV AH, 9
        INT 21h
        
        LEA SI, ARR
        MOV CX, 0
        MOV AH, 1
    nhap_tiep:
        INT 21h   ; nhap ki tu tu ban phim
        CMP AL, 27; kiem tra xem co phai la nhap esc khong
        MOV [SI], AL 
        JZ sap_xep
        INC SI
        INC CX
        JMP nhap_tiep
    sap_xep:
        PUSH CX      ; Cat CX vao ngan chua
        DEC CX       ; giam CX 1 don vi 
        MOV DX, CX   ; dx = cx
        LEA BX, ARR  ; cho BX tro vao phan tu dau tien

    tim_min:
        MOV SI, BX   ; SI = BX 
        MOV AL, [SI] ; gan AL bang gtri o nho [SI]
        MOV CX, DX 
        INC SI       ; tang SI len 1 don vi
    so_sanh:    
        CMP AL, [SI] ; so sanh AL voi [SI] tiep theo
        JC T1:       ; neu AL > [SI] thi doi gtri cua [SI] va AL
        XCHG AL, [SI]
    T1:
        INC SI       ; SI++
        LOOP so_sanh ; so sanh tiep
                     ; luc nay AL da la min
        MOV [BX],AL  ; gan gia tri AL cho [BX] 
        INC BX       ; BX++
        DEC DX       ; DX--
        JNZ tim_min  ; neu DS != 0 => ZF = 0 => tiep tuc tim min cua cac o con lai
        
        LEA DX, TB2  ; in kq 
        MOV AH, 9
        INT 21h
        POP CX
        LEA SI, ARR
    in_tiep:
        MOV AH, 2        
        MOV DL, [SI]
        INT 21h
        INC SI
        LOOP in_tiep   
    MAIN ENDP
    END MAIN