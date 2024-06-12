; al := 10
; for cl:=1 to 10 do
;     al:= al + al;

ORG 1000H
  i db 10

ORG 2000H
  mov al, 10
  mov cl, 1
  
  FOR: ADD al, al
       inc cl
       cmp i, cl
       JNS FOR
    hlt
END