(* While loop with side effect *)

var k, x: integer;
begin
  k := 1;
  x := 5;
  for k := k + x while k < 4 * x do
  	x := x + 3; print_num(k); newline()
  end
end.

(*<<
6
14
25
39
56
76
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
@   k := 1;
	mov r0, #1
	set r1, _k
	str r0, [r1]
@   x := 5;
	mov r0, #5
	set r1, _x
	str r0, [r1]
.L3:
@   for k := k + x while k < 4 * x do
	set r4, _k
	ldr r0, [r4]
	set r1, _x
	ldr r1, [r1]
	add r0, r0, r1
	str r0, [r4]
.L2:
	set r0, _k
	ldr r4, [r0]
	set r0, _x
	ldr r0, [r0]
	lsl r0, r0, #2
	cmp r4, r0
	mov r0, #0
	movlt r0, #1
	cmp r0, #2
	bne .L5
	cmp r4, #0
	blt .L1
	b .L6
.L5:
	set r0, _k
	ldr r0, [r0]
	set r1, _x
	ldr r1, [r1]
	lsl r1, r1, #2
	cmp r0, r1
	mov r0, #0
	movlt r0, #1
	cmp r0, #0
	beq .L1
.L6:
@   	x := x + 3; print_num(k); newline()
	set r4, _x
	ldr r0, [r4]
	add r0, r0, #3
	str r0, [r4]
	set r0, _k
	ldr r0, [r0]
	bl print_num
	bl newline
	set r4, _k
	ldr r5, [r4]
	set r0, _x
	ldr r0, [r0]
	lsl r0, r0, #2
	cmp r5, r0
	mov r0, #0
	movlt r0, #1
	cmp r0, #2
	bne .L3
	str r5, [r4]
	b .L2
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _k, 4, 4
	.comm _x, 4, 4
@ End
]]*)
