; if al = 4 then begin
;     bl:= 1; cl:= cl+1;
; end else begin
;     bl:= 2; cl:= cl-1;
; end;

ORG 1000H
  ACOMPARAR DB 4

ORG 2000H
  mov al, 4
  cmp ACOMPARAR, al
  jz CASO1
  jnz CASO2
  jmp FIN
  
  CASO1:  mov BL, 1
          inc cl
          jmp FIN

  CASO2:  mov BL, 2
          dec cl
          jmp FIN

   FIN: HLT
END