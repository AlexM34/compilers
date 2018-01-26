(* Negative step size *)

var k: integer;
begin
  for k := 34 step - 7 until -8 do
  	print_num(k); newline()
  end
end.

(*<<
34
27
20
13
6
-1
-8
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
@   for k := 34 step - 7 until -8 do
	mov r0, #34
	set r1, _k
	str r0, [r1]
.L2:
	set r0, _k
	ldr r4, [r0]
	mov r0, #-8
	cmp r4, r0
	blt .L1
@   	print_num(k); newline()
	mov r0, r4
	bl print_num
	bl newline
	set r4, _k
	ldr r0, [r4]
	sub r0, r0, #7
	str r0, [r4]
	b .L2
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _k, 4, 4
@ End
]]*)
