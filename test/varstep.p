(* Step size that varies *)

var k, x: integer;
begin
  x := 0;
  for k := 66 step x until 11 do
  	x := x - 1; print_num(k); newline()
  end
end.

(*<<
66
65
63
60
56
51
45
38
30
21
11
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
@ x := 0;
	mov r0, #0
	set r1, _x
	str r0, [r1]
@   for k := 66 step x until 11 do
	mov r0, #66
	set r1, _k
	str r0, [r1]
.L2:
	set r0, _x
	ldr r0, [r0]
	cmp r0, #0
	ble .L4
	set r0, _k
	ldr r0, [r0]
	cmp r0, #11
	bgt .L1
	b .L6
.L4:
	set r0, _k
	ldr r0, [r0]
	cmp r0, #11
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
