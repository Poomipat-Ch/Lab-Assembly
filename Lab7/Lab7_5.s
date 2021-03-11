.data
.balign 4
question : .asciz "What is your favorite number?"

.balign 4
message: .asciz "%d is a great number \n"

.balign 4
pattern : .asciz "%d"

.balign 4
number : .word 0

.balign 4
lr_bu : .word 0

.text
.global main
.func main

.global printf
.global scanf

main:
	LDR R1, =lr_bu
	STR LR, [R1]
	LDR R0, =question
	BL printf
	LDR R0, =pattern
	LDR R1, =number
	BL scanf
	LDR R0, =message
	LDR R1, =number
	LDR R1, [R1]
	BL printf
	LDR LR, =lr_bu
	LDR LR, [LR]
	BX LR

