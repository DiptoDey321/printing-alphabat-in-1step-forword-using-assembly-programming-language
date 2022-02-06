   INCLUDE "EMU8086.INC"
  .MODEL SMALL
  .STACK 100H
  .DATA 
  
  ;NN DW ?
  
  .CODE
  MAIN PROC 
  
      PRINT "ENTER THE ALPHABAT ORDER : "
      MOV AH,1
      XOR CX,CX ;TO RESET CX || USING CX AS A COUNTER
      
      INPUT: 
      INT 21H
      CMP AL,0DH
      JE EXIT_INPUT
      PUSH AX
      INC CX
      JMP INPUT
      
      
      EXIT_INPUT:
      PRINTN
      PRINT "THE EXPECTED ALPHABAT ORDER:  "
      MOV AH,2 
      MOV BX,1
      
      
      OUTPUT:
      POP DX   
      ADD DX,BX
     ; MOV NN, DX
      MOV AH,2 
       
      ADD BX,2 
      INT 21H
      LOOP OUTPUT
      
      
      MOV AH,4CH
      INT 21H
      MAIN ENDP
  END MAIN
  
  