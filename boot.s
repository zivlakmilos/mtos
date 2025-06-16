.code16
.section .text
.global _start

_start:
  cli
  xor %ax, %ax
  mov %ax, %ds
  mov %ax, %ss
  mov $0x7c00, %sp

  mov $handle_zero, %ax
  mov %ax, 0x0000
  mov $0x0000, %ax
  mov %ax, 0x0002
  sti

  xor %ax, %ax
  div %ax

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

handle_zero:
  movb $0x0e, %ah
  movb $0x41, %al
  int $0x10
  iret

msg: .asciz "Hello World!"

.fill 510 - (. - _start), 1, 0
.word 0xaa55
