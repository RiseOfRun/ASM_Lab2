.386
.MODEL FLAT
.data


.CODE
@TestString@8	PROC
add ecx,4
add edx,4
mov eax,0
mov bl, -1
mov al, 1
mov ESI, ecx
mov EDI, edx

NEXT:
mov ah, [esi]
cmp ah,0
je Finish

COMP:
	mov bh, [edi]
	cmp bh, 0
	je Fail
	cmp ah,bh
	je FOUND
	inc edi
	jmp comp

FOUND:
inc esi
inc al
mov edi, edx
jmp next

Fail:
mov bl,al

Finish:
xor eax,eax
xor ecx,ecx
mov cl,bl
mov eax,ecx
RET; возвращение в вызывающую функцию 
@TestString@8	ENDP 
END
