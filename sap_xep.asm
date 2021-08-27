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

MOV CX, 9
MOV BX, 05h
MOV SI, 05h
MOV AL, 0
XLAT
MOV DL, AL 
T2:
INC AL
XLAT
CMP DL, AL
JNC T1
MOV DL, AL
T1:
DEC CX
CMP CX, 0
JNZ T2
