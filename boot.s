.code16
.section .text
.global _start

_start:
  mov $msg, %si
  call print
hltloop:
  jmp hltloop

print:
  mov $0, %bx
prtloop:
  lodsb
  cmp $0, %al
  je done
  call printch
  jmp prtloop
done:
  ret

printch:
  movb $0x0e, %ah
  int $0x10
  ret

msg: .asciz "Hello World!"

.fill 510 - (. - _start), 1, 0
.word 0xaa55
