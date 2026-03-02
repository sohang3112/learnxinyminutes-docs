; hello world in x86 64-bit NASM assembly on Linux: https://github.com/yds12/x64-roadmap/blob/master/tasks/helloworld/hello.asm

; Comments are denoted with a ';'
; Programs typically contain .data and .text sections

; Compile, Link & Run this file: nasm -f elf64 x64.asm && ld x64.o -o x64 && ./x64

global _start       ; Make instruction label _start known externally

section .data       ; data is stored here in memory (RAM), similar to variables in higher level languages
  helloMsg: db "Hello, world", 10     ; helloMsg is memory address of this string (10 is newline character's ASCII code), db indicates a byte (8 bits)
                    ; Note that
                    ; we could have written this whole string as a sequence of
                    ; comma-separated numbers, each number representing the
                    ; ASCII code of the character.

section .text       ; section of program that holds instructions (executable code)

_start:             ; starting point of program
  mov rax, 1        ; puts 1 into register rax
  mov rdi, 1        ; puts 1 into register rdi
  mov rsi, helloMsg ; puts the address pointed by helloMsg into rsi
  mov rdx, 13       ; 13 is the size of our message in bytes, put this into rdx

  syscall           ; Execute the system call. Remember that the type of
                    ; system call is determined by rax, in this case it has
                    ; a 1, which means a syscall for write. The content of
                    ; rdi is the file descriptor, in this case 1 means stdout,
                    ; the standard output. The system call takes the address
                    ; in rsi as the beginning of the text to write, and
                    ; the value in rdx as the number of bytes to be written.
                    ; The four mov instructions were just setting the
                    ; "parameters" for the system call.

  mov rax, 60       ; We are going to do another system call: 60 for exit
  xor rdi, rdi      ; This is a faster way (in terms of performance) 
                    ; of zeroing rdi: to make a XOR with itself. The zero will
                    ; be the exit code.
  syscall           ; Perform the system call.