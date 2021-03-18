.global main

main:
	MOV R1, #1
	MOV R2, #2

	STR R1, [SP, #-4]!
	
	STR R2, [SP, #-4]!
	
	LDR R0, [SP], #+4
	LDR R0, [SP], #+4
end:
	BX LR
