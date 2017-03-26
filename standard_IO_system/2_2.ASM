STACK SEGMENT PARA STACK
        DW 128H DUP(0)
STACK ENDS

DATA SEGMENT
   BUF DB 0H
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA, SS:STACK

START:
        MOV AX, DATA
        MOV DS, AX
LP:
        IN AL, 60H   ;input a character
        CMP AL, BUF
        JZ LP
        MOV BUF, AL
        CALL DISP_AL
        CMP BUF, 1
        JNZ LP
        MOV AX, 0C07H  ;clear the buf
        INT 21H
        MOV AH, 4CH
        INT 21H     

DISP_AL PROC NEAR
        PUSH BX
        PUSH DX
        PUSH CX
        MOV BL, AL
        AND AL, 0F0H   ;get high 4-bit of AL
        MOV CL, 4
        SHR AL, CL
        MOV DL, AL
        CMP DL, 9      ;branch and display high 4-bit of AL
        JLE NUM1
        ADD DL, 7
NUM1:   ADD DL, 30H
        MOV AH, 02H
        INT 21H
        MOV AL, BL
        AND AL, 0FH
        MOV DL, AL
        CMP DL, 9      ;branch and display low 4-bit of AL
        JLE NUM2
        ADD DL, 7
NUM2:   ADD DL, 30H
        MOV AH, 02H
        INT 21H
        POP CX
        POP DX
        POP BX
        RET
DISP_AL ENDP

CODE ENDS
END START
