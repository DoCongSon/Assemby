MOV CX, 10h        ; gan gia tri cho 10
MOV BX, 1234h     ; o nho co dia chi 
MOV DS, BX        ; dau la 12345h
MOV SI, 05h       ; 21345h = 1234h:05h
MOV [SI], 10h
INC SI
MOV [SI], 9h
INC SI     
MOV [SI], 7h
INC SI
MOV [SI], 6h
INC SI
MOV [SI], 8h
INC SI
MOV [SI], 4h
INC SI
MOV [SI], 5h
INC SI
MOV [SI], 3h
INC SI
MOV [SI], 1h
INC SI
MOV [SI], 2h   

MOV CX, 9; Gan 9 cho CX (so lan so lap)
MOV SI, 05h; cho SI cho vao o nho dau tien
MOV AL, [SI]; ban dau dat AL(min) = o nho dau tien
T2:  
INC SI; tang SI len 1 don vi luc nay [SI] la dia chi cua o nho thu 2
CMP AL, [SI]; so sanh gia tri AL voi gia tri cua o nho co dia chi [SI]
            ; neu AL<[SI] thi CF=1, ZF=0
            ; neu AL>[SI] thi CF=0, ZF=0
            ; neu AL=[SI] thi CF=0, ZF=1
JC T1       ; CF = 1 thi nhay toi T1
MOV AL, [SI]; CF = 0 nen [SI] <= AL nen gan gia tri AL moi la [SI]
T1:
DEC CX; gam CX di 1 don vi
CMP CX, 0; so sanh CX voi 0
JG T2; neu ZF, CF = 0 (CX > 0) thi nhay den T2
 