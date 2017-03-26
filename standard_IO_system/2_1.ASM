DATA SEGMENT
        MSG DB 'H',0FH,'e',0FH,'l',0FH,'l',0FH,'o',0FH,' ',0FH,'w',0FH,'o',0FH,'r',0FH,'l',0FH,'d',0FH,'!',0FH
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,0B800H
        MOV ES,AX
        MOV DS,AX
        MOV SI,0H
        MOV DI,2000H
        MOV CX,25*80
        CLD
        REP MOVSW
        
        XOR DI,DI
        MOV CX,25*80
        MOV AH,0FH
        MOV AL,' '
        REP STOSW
        
        MOV AX,0B800H
        MOV ES,AX
        MOV AX,DATA
        MOV DS,AX
        MOV SI,0H
        MOV DI,7C0H
        MOV CX, 24
        CLD
        REP MOVSB

AGAIN:
        MOV AH,1
        INT 16H
        JZ AGAIN


        MOV AX,0B800H
        MOV ES,AX
        MOV DS,AX
        MOV SI,2000H
        MOV DI,0H
        MOV CX,25*80
        CLD
        REP MOVSW
        
        MOV AX,4C00H
        INT 21H
CODE ENDS
END START
