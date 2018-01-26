(* An arithmetic expression followed by a while element *)

var k: integer;
begin
  for k := 1, 2 * k - 1 while k < 18 do
  	print_num(k); newline()
  end
end.

(*<<
1
3
5
9
17
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
@   for k := 1, 2 * k - 1 while k < 18 do
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
	set r4, _k
	ldr r0, [r4]
	lsl r0, r0, #1
	sub r0, r0, #1
	str r0, [r4]
.L8:
	set r0, _k
	ldr r4, [r0]
	cmp r4, #18
	mov r0, #0
	movlt r0, #1
	cmp r0, #2
	bne .L11
	cmp r4, #0
	blt .L1
	b .L12
.L11:
	set r0, _k
	ldr r0, [r0]
	cmp r0, #18
	mov r0, #0
	movlt r0, #1
	cmp r0, #0
	beq .L1
.L12:
	set r0, _k
	ldr r0, [r0]
	bl print_num
	bl newline
	set r4, _k
	ldr r5, [r4]
	cmp r5, #18
	mov r0, #0
	movlt r0, #1
	cmp r0, #2
	bne .L9
	str r5, [r4]
	b .L8
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _k, 4, 4
@ End
]]*)
