(* Finding the integer square root of an integer *)

var a, d, x: integer;
begin
  x := 393;
  a := 0;
  for d := 1, 2 * d while (a + d) * (a + d) <= x, d div 2 while d >= 1 do
  	if (a + d) * (a + d) <= x then a := a + d end
  end;
  print_num(a); newline();
end.

(*<<
19
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
@   x := 80;
	mov r0, #80
	set r1, _x
	str r0, [r1]
@   a := 0;
	mov r0, #0
	set r1, _a
	str r0, [r1]
@   for d := 1, 2 * d while (a + d) * (a + d) <= x, d div 2 while d >= 1 do
	mov r0, #1
	set r1, _d
	str r0, [r1]
.L2:
	set r0, _d
	ldr r4, [r0]
	cmp r4, #1
	bgt .L12
@   	if (a + d) * (a + d) <= x then a := a + d end
	set r5, _a
	ldr r0, [r5]
	add r4, r0, r4
	mul r0, r4, r4
	set r1, _x
	ldr r1, [r1]
	cmp r0, r1
	bgt .L10
	str r4, [r5]
.L10:
	set r4, _d
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b .L2
.L12:
	set r4, _d
	ldr r0, [r4]
	lsl r0, r0, #1
	str r0, [r4]
.L11:
	set r0, _d
	ldr r4, [r0]
	set r0, _a
	ldr r0, [r0]
	add r5, r0, r4
	mul r0, r5, r5
	set r1, _x
	ldr r1, [r1]
	cmp r0, r1
	mov r0, #0
	movle r0, #1
	cmp r0, #2
	bne .L14
	cmp r4, #0
	blt .L21
	b .L15
.L14:
	set r0, _a
	ldr r0, [r0]
	set r1, _d
	ldr r1, [r1]
	add r4, r0, r1
	mul r0, r4, r4
	set r1, _x
	ldr r1, [r1]
	cmp r0, r1
	mov r0, #0
	movle r0, #1
	cmp r0, #0
	beq .L21
.L15:
	set r4, _a
	ldr r0, [r4]
	set r1, _d
	ldr r1, [r1]
	add r5, r0, r1
	mul r0, r5, r5
	set r1, _x
	ldr r1, [r1]
	cmp r0, r1
	bgt .L19
	str r5, [r4]
.L19:
	set r4, _d
	ldr r5, [r4]
	set r0, _a
	ldr r0, [r0]
	add r6, r0, r5
	mul r0, r6, r6
	set r1, _x
	ldr r1, [r1]
	cmp r0, r1
	mov r0, #0
	movle r0, #1
	cmp r0, #2
	bne .L12
	str r5, [r4]
	b .L11
.L21:
	mov r1, #2
	set r0, _d
	ldr r0, [r0]
	bl int_div
	set r1, _d
	str r0, [r1]
.L20:
	set r0, _d
	ldr r4, [r0]
	cmp r4, #1
	mov r0, #0
	movge r0, #1
	cmp r0, #2
	bne .L23
	cmp r4, #0
	blt .L25
	b .L24
.L23:
	set r0, _d
	ldr r0, [r0]
	cmp r0, #1
	mov r0, #0
	movge r0, #1
	cmp r0, #0
	beq .L25
.L24:
	set r4, _a
	ldr r0, [r4]
	set r1, _d
	ldr r1, [r1]
	add r5, r0, r1
	mul r0, r5, r5
	set r1, _x
	ldr r1, [r1]
	cmp r0, r1
	bgt .L28
	str r5, [r4]
.L28:
	set r4, _d
	ldr r5, [r4]
	cmp r5, #1
	mov r0, #0
	movge r0, #1
	cmp r0, #2
	bne .L21
	str r5, [r4]
	b .L20
.L25:
@   print_num(a); newline();
	set r0, _a
	ldr r0, [r0]
	bl print_num
	bl newline
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _a, 4, 4
	.comm _d, 4, 4
	.comm _x, 4, 4
@ End
]]*)
