.data
.balign 4
get_num_1: .asciz "Number 1 : "

.balign 4
get_num_2: .asciz "Number 2 : "

.balign 4
pattern: .asciz "%d"

.balign 4
num_1: .word 0 @ int num1

.balign 4
num_2: .word 0 @ int num2

.balign 4
output: .asciz "Resulf of %d + %d = %d\n"

.balign 4
lr_bu: .word 0

.balign 4
lr_bu_2: .word 0

.text


sum_func:
	LDR R2, =lr_bu_2
	STR lr, [R2]
	
	ADD R0, R0, R1 @ sum = num1 + num2
	
	LDR lr, =lr_bu_2
	LDR lr, [lr]
	BX lr

.global main
.global printf
.global scanf

main:
	LDR R1, =lr_bu
	STR lr, [R1]
	
	LDR R0, =get_num_1
	BL printf

	LDR R0, =pattern
	LDR R1, =num_1
	BL scanf

	LDR R0, =get_num_2
	BL printf

	LDR R0, =pattern
	LDR R1, =num_2
	BL scanf

	LDR R0, =num_1
	LDR R0, [R0]
	LDR R1, =num_2
	LDR R1, [R1]
	BL sum_func

	MOV R3, R0
	
	LDR R0, =output
	LDR R1, =num_1
	LDR R1, [R1]
	LDR R2, =num_2
	LDR R2, [R2]
	BL printf

	LDR lr, =lr_bu
	LDR lr, [lr]
	BX lr
