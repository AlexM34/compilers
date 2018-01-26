(* Sample *)

var k: integer;
begin
  for k := 1, 2, 3, 5, 10 step 10 until 100, 2 * k while k < 1000 do
  	print_num(k); newline()
  end
end.

(*<<
1
2
3
5
10
20
30
40
50
60
70
80
90
100
220
440
880
>>*)

(*[[
@ picoPascal compiler output
	.include "fixup.s"
	.global pmain

	.text
pmain:
	mov ip, sp
	stmfd sp!, {r4-r10, fp, ip, lr}
	mov fp, sp
@   for k := 1, 2, 3, 5, 10 step 10 until 100, 2 * k while k < 1000 do
	mov r0, #1
	set r1, _k
	str r0, [r1]
.L2:
	set r0, _k
	ldr r4, [r0]
	cmp r4, #1
	bgt .L9
@   	print_num(k); newline()
	mov r0, r4
	bl print_num
	bl newline
	set r4, _k
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b .L2
.L9:
	mov r0, #2
	set r1, _k
	str r0, [r1]
.L8:
	set r0, _k
	ldr r4, [r0]
	cmp r4, #2
	bgt .L15
	mov r0, r4
	bl print_num
	bl newline
	set r4, _k
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b .L8
.L15:
	mov r0, #3
	set r1, _k
	str r0, [r1]
.L14:
	set r0, _k
	ldr r4, [r0]
	cmp r4, #3
	bgt .L21
	mov r0, r4
	bl print_num
	bl newline
	set r4, _k
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b .L14
.L21:
	mov r0, #5
	set r1, _k
	str r0, [r1]
.L20:
	set r0, _k
	ldr r4, [r0]
	cmp r4, #5
	bgt .L27
	mov r0, r4
	bl print_num
	bl newline
	set r4, _k
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b .L20
.L27:
	mov r0, #10
	set r1, _k
	str r0, [r1]
.L26:
	set r0, _k
	ldr r4, [r0]
	cmp r4, #100
	bgt .L33
	mov r0, r4
	bl print_num
	bl newline
	set r4, _k
	ldr r0, [r4]
	add r0, r0, #10
	str r0, [r4]
	b .L26
.L33:
	set r4, _k
	ldr r0, [r4]
	lsl r0, r0, #1
	str r0, [r4]
.L32:
	set r0, _k
	ldr r4, [r0]
	cmp r4, #1000
	mov r0, #0
	movlt r0, #1
	cmp r0, #2
	bne .L35
	cmp r4, #0
	blt .L1
	b .L36
.L35:
	set r0, _k
	ldr r0, [r0]
	cmp r0, #1000
	mov r0, #0
	movlt r0, #1
	cmp r0, #0
	beq .L1
.L36:
	set r0, _k
	ldr r0, [r0]
	bl print_num
	bl newline
	set r4, _k
	ldr r5, [r4]
	cmp r5, #1000
	mov r0, #0
	movlt r0, #1
	cmp r0, #2
	bne .L33
	str r5, [r4]
	b .L32
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _k, 4, 4
@ End
]]*)
