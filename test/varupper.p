(* Upper bound that varies *)

var k, x: integer;
begin
  x := 0;
  for k := 34 step x until -5 * x do
  	x := x - 1; print_num(k); newline()
  end
end.

(*<<
34
33
31
28
24
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
@   x := 0;
	mov r0, #0
	set r1, _x
	str r0, [r1]
@   for k := 34 step x until -5 * x do
	mov r0, #34
	set r1, _k
	str r0, [r1]
.L2:
	set r0, _x
	ldr r4, [r0]
	cmp r4, #0
	ble .L4
	set r0, _k
	ldr r0, [r0]
	mov r1, #-5
	mul r1, r4, r1
	cmp r0, r1
	bgt .L1
	b .L6
.L4:
	set r0, _k
	ldr r0, [r0]
	set r1, _x
	ldr r1, [r1]
	mov r2, #-5
	mul r1, r1, r2
	cmp r0, r1
	blt .L1
.L6:
@   	x := x - 1; print_num(k); newline()
	set r4, _x
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	set r0, _k
	ldr r0, [r0]
	bl print_num
	bl newline
	set r4, _k
	ldr r0, [r4]
	set r1, _x
	ldr r1, [r1]
	add r0, r0, r1
	str r0, [r4]
	b .L2
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _k, 4, 4
	.comm _x, 4, 4
@ End
]]*)
