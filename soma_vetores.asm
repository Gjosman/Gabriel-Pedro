;/*******************************************************

*                                                      *

*   Criado em: Sex 09/Dez/2016,  20:09 hs              *
;
*   Instituicao: Universidade Federal do Ceará         *
;
*   Autor: Gabriel Josman e Pedro Victor               *
;
*   email: gabrieljosman@gmail.com,                    *
;
*          martinsp098@gmail.com                        *
;
********************************************************/



section .bss 

	
vetor_A: resb 10
	
vetor_B: resb 10
	
vetor_C: resb 10
	
enter:   resb 1



section .text
	global main




; LER VETOR A ---------------------------------------------------------------------



main: 


mov ecx, 10

mov edx, vetor_A


for_leitura_A:


	
push rcx
	
	push rdx



	mov eax, 3					; parametro de leitura
  
	mov ebx, 2					; parametro de leitura do terminal
  
	mov ecx, edx    	                        ; para onde vai a informação	
  
	mov edx, 1                                      ; 1 bytes (numeric, 1 for sign) of that information
  
	int 0x80
	
	
	
	mov edx, [ecx]
	
	sub edx, 0x30
	
	mov [ecx], edx
	
	
	mov eax, 3					; parametro de leitura
  
	mov ebx, 2					; parametro de leitura do terminal
  
	mov ecx, enter    	                        ; para onde vai a informação	
  
	mov edx, 1                                      ; 1 bytes (numeric, 1 for sign) of that information
  
	int 0x80					; interrupção	

	
	
	pop rdx
	
	pop rcx

	
	
	inc edx

	

loop for_leitura_A



; LER VETOR B --------------------------------------------------------------------

	

mov ecx, 10
	
mov edx, vetor_B



for_leitura_B:                                          ; label de leitura       
	

	
	push rcx
	
	push rdx

	

	mov eax, 3					; parametro de leitura
  
	mov ebx, 2					; parametro de leitura do terminal
  
	mov ecx, edx    	                        ; para onde vai a informação	
  
	mov edx, 1                                      ; 1 bytes (numeric, 1 for sign) of that information
  
	int 0x80
					; Interrupção	
	
	
	mov edx, [ecx]
	
	sub edx, 0x30
	
	mov [ecx], edx
	
	
	mov eax, 3					; parametro de leitura
  mov ebx, 2					
	mov ebx, 2 					; parametro de leitura do terminal  
	mov ecx, enter    	                        ; para onde vai a informação	
  
	mov edx, 1                                      ; 1 bytes (numeric, 1 for sign) of that information
  
	int 0x80

					; interrupção

	pop rdx
	
	pop rcx

	

	inc edx

	
loop for_leitura_B

; SOMA DOS DOIS VETORES ------------------------------------------------------------

	

mov ecx, 10
	
mov edi, vetor_A


mov esi, vetor_B		


for_leitura_C:
	


	mov edx,[edi]
	mov ebx,[esi]
	mov bh, 0
	mov dh, 0
	sub bl, 1                              ; ou 48 
	sub dl, 1                              ; ou 48
	add edx,ebx


loop for_leitura_C




; Imprimir Vetor Resultante--------------------------------------------------------

mov eax, 0
mov ecx, 10

write_A: 



	push rcx
	
	push rax


	mov ecx, edi
	add ecx, eax

	mov eax, 4			; parametro de escrita	 
	mov ebx, 1			; parametro de escrita do terminal
  	
                                        
	int 0x80
	
		; interrupção 


	pop rax
	
	pop rcx


	
	inc eax

loop write_A
