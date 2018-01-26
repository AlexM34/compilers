(* Simple arithmetic expression *)

var k: integer;
begin
  for k := 47 to 53 do
  	print_num(k); newline()
  end
end.

(*<<
47
48
49
50
51
52
53
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
@   for k := 47 to 53 do
	mov r0, #47
	set r1, _k
	str r0, [r1]
.L2:
	set r0, _k
	ldr r4, [r0]
	cmp r4, #53
	bgt .L1
@   	print_num(k); newline()
	mov r0, r4
	bl print_num
	bl newline
	set r4, _k
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b .L2
.L1:
	ldmfd fp, {r4-r10, fp, sp, pc}
	.ltorg

	.comm _k, 4, 4
@ End
]]*)
