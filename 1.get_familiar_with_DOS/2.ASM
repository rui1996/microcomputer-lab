DATA SEGMENT
        ADDER DB 01H, 01H, 01H, 01H, 01H
        COUNT DB 6H
        SUMLOW DB 0H
        SUMHIGH DB 0H
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
START:  MOV AX, DATA
        MOV DS, AX       
        MOV AL, 0H      
        MOV AH, 0H      
        MOV BX, 0H

LOOP1:  CALL ADD_FUNC
        INC BX
        CMP BX, COUNT
        JL  LOOP1
        MOV SUMLOW, AL
        MOV SUMHIGH, AH
        MOV AX, 4C00H 
        INT 21H

ADD_FUNC PROC NEAR
        ADD AL, ADDER[BX]
        ADC AH, 0H
        RET
ADD_FUNC ENDP
CODE ENDS
END START