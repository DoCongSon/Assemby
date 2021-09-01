; upperCase2
; nhap vao chuoi chu cai thuong ket thuc bang ESC sau do in ra man hinh chuoi chu cai in hoa

.MODEL SMALL
.STACK 10
.DATA
    B1 DB 500 DUP(?), "$"
    B0 DB 500 DUP(?), "$"
    B2 DB "Nhap chuoi chu cai thuong (ket thuc bang ESC): $"
    B3 DB 10, 13, "Ket qua in hoa: $"
    B4 DB 10, 13, "Chua nhap chu cai nao!$"   
    B5 DB 10, 13, "ket qua dao nguoc chuoi: $"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        LEA DX, B2
        MOV AH, 9
        INT 21h
        
        LEA SI, B1; cho SI tro vao dia chi o nho dau tien cua B1
        LEA BX, B0
        
        MOV CX, 0 ; gan gia tri bien dem CX ban dau la 0
    nhap_tiep:
        MOV AH, 1
        INT 21h   ; nhap ki tu tu ban phim
        CMP AL, 27; kiem tra xem co phai la nhap esc khong
        JZ ket_qua; neu dung thi nhay xuong ket_qua
                  ; neu sai thi chuyen xuong buoc tiep theo 
        MOV [BX], AL
        SUB AL, 20h    ; giam AL di 20h (chuyen ki tu thuong ve ki tu in hoa)
        MOV [SI], AL   ; luu AL vao o nho co dia chi [SI]  
        INC SI         ; tang SI len 1 don vi  
        INC BX
        INC CX         ; tang bien dem CX len 1 don vi
        JMP nhap_tiep  ; nhay len nhap_tiep de tiep tuc nhap
    ket_qua:
        CMP CX, 0      ; so sanh CX voi 0
        JZ chua_nhap   ; neu CX = 0 thi nhay chua nhap
                       ; neu CX != 0 thi tiep tuc lenh tiep theo 
        MOV AH, 9
        LEA DX, B3
        INT 21h
        PUSH CX        ; cat gia tri CX vao ngan xep 
        LEA SI, B1
    in_tiep_1:
        MOV AH, 2        
        MOV DL, [SI]
        INT 21h
        INC SI
        LOOP in_tiep_1
        
        MOV AH, 9
        LEA DX, B5
        INT 21h
        POP CX ; lay gia tri o ngan sep tra lai cho CX
        DEC BX ; chuyen BX tro ve o nho cuoi cung bang cach tru 1 dv
               ; ( vi khi nhap xong ki tu cuoi thi con tro BX tu dong nhay xuong o nho tiep theo)
    in_tiep_2:    
        MOV AH, 2
        MOV DL, [BX]
        INT 21h
        DEC BX 
        LOOP in_tiep_2
        
        
        JMP thoat_CT
    chua_nhap:
        MOV AH, 9
        LEA DX, B4
        INT 21h
    thoat_CT:    
    MAIN ENDP
    END MAIN