.data
G: .space 16000
nn: .space 4
nl: .space 4
roles: .space 80
coada: .space 80
host1: .space 4
host2: .space 4
mesaj: .asciiz ""
verif_a: .byte 'a'
verif_z: .byte 'z'
sp: .asciiz " "
sp1: .asciiz ":"
sp2: .asciiz ";"
endl: .asciiz "\n"
sir0: .asciiz "index"
sir1: .asciiz "host"
sir2: .asciiz "switch"
sir3: .asciiz "switch malitios"
sir4: .asciiz "controller"
sirY: .asciiz "Yes"
sirN: .asciiz "No"
.text
main:

li $v0, 5
syscall
sw $v0, nn

li $v0, 5
syscall
sw $v0, nl

move $t0, $v0
li $t1, 0
lw $t2, nn
li $t6, 1
li $t7, 4
read_l:
beq $t0, $t1, exit_read_l

li $v0, 5
syscall
move $t3, $v0 #t3=a

li $v0, 5
syscall
move $t4, $v0 

mul $t5, $t3, $t2
add $t5, $t5, $t4 
mul $t5, $t5, $t7
sw $t6, G($t5)
 
mul $t5, $t4, $t2
add $t5, $t5, $t3 
mul $t5, $t5, $t7
sw $t6, G($t5)

addi $t1, $t1, 1
j read_l
exit_read_l:

lw $t0, nn
li $t1, 0
li $t2, 0
read_roles:
beq $t0, $t1, exit_read_roles

li $v0, 5
syscall
sw $v0, roles($t2)
	
addi $t1, $t1, 1
addi $t2, $t2, 4
j read_roles
exit_read_roles:

li $v0, 5
syscall
li $t0, 1
beq $v0, $t0, cerinta1
li $t0, 2
beq $v0, $t0, cerinta2
li $t0, 3
beq $v0, $t0, cerinta3

cerinta1:
lw $t0, nn
li $t1, 0
li $t2, 0
cauta_3:
beq $t0, $t1 exit_cauta_3
li $t3, 3
li $t4, 4
li $t8, 1
lw $t5, roles($t2)
beq $t5, $t3, noduri_adiacente
j exit_noduri_adiacente

noduri_adiacente:
li $t6, 0
move $t7, $t1
mul $t7, $t7, $t0
mul $t7, $t7, $t4

la $a0, sir3
li $v0, 4
syscall

la $a0, sp
li $v0, 4
syscall

la $a0, sir0
li $v0, 4
syscall

la $a0, sp
li $v0, 4
syscall

move $a0, $t1
li $v0, 1
syscall

la $a0, sp1
li $v0, 4
syscall

la $a0, sp
li $v0, 4
syscall

noduri_adiacente_loop:
beq $t0, $t6 exit_noduri_adiacente_loop
lw $t9, G($t7)
beq $t9, $t8, afisare
j nu_afisare

afisare:

li $t4, 4
mul $t4, $t4, $t6
lw $t9, roles($t4)

li $t3, 1
beq $t9, $t3, afis1

li $t3, 2
beq $t9, $t3, afis2

li $t3, 3
beq $t9, $t3, afis3

li $t3, 4
beq $t9, $t3, afis4

afis1:
la $a0, sir1
li $v0, 4
syscall
j afisc

afis2:
la $a0, sir2
li $v0, 4
syscall
j afisc

afis3:
la $a0, sir3
li $v0, 4
syscall
j afisc

afis4:
la $a0, sir4
li $v0, 4
syscall
afisc:

la $a0, sp
li $v0, 4
syscall

la $a0, sir0
li $v0, 4
syscall

la $a0, sp
li $v0, 4
syscall

move $a0, $t6
li $v0, 1
syscall

la $a0, sp2
li $v0, 4
syscall

la $a0, sp
li $v0, 4
syscall

nu_afisare:
addi $t6, $t6, 1
addi $t7, $t7, 4
j noduri_adiacente_loop
exit_noduri_adiacente_loop:

la $a0, endl
li $v0, 4
syscall

exit_noduri_adiacente:

addi $t1, $t1, 1
addi $t2, $t2, 4
j cauta_3
exit_cauta_3:
j exit



cerinta2:
li $t0, 0
li $t2, 0
sw $t2, coada($t0)
li $t1, 4

loop_coada:
beq $t0, $t1, exit_loop_coada

lw $t2, coada($t0)
li $t3, 4
mul $t2, $t2, $t3
lw $t3, roles($t2)
li $t2, 1
beq $t2, $t3, afis_host
j nu_afis_host
afis_host:

la $a0, sir1
li $v0, 4
syscall

la $a0, sp
li $v0, 4
syscall

la $a0, sir0
li $v0, 4
syscall

la $a0, sp
li $v0, 4
syscall

lw $a0, coada($t0)
li $v0, 1
syscall

la $a0, sp2
li $v0, 4
syscall

la $a0, sp
li $v0, 4
syscall

nu_afis_host:

lw $t2, coada($t0)
lw $t3, nn
mul $t2, $t2, $t3
li $t3, 4
mul $t2, $t2, $t3

li $t3, 0
lw $t4, nn
loop_linie:
beq $t3, $t4, exit_loop_linie

lw $t5, G($t2)
li $t6, 1
beq $t6, $t5, adauga_in_coada
j nu_adauga
adauga_in_coada:

li $t5, 0
verificare:
beq $t5, $t1, exit_verificare

lw $t7, coada($t5)
beq $t3, $t7, nu_adauga

addi $t5, $t5, 4
j verificare
exit_verificare:

sw $t3, coada($t1)
addi $t1, $t1, 4

nu_adauga:

addi $t3, $t3, 1
addi $t2, $t2, 4
j loop_linie
exit_loop_linie:

addi $t0, $t0, 4
j loop_coada
exit_loop_coada:

la $a0, endl
li $v0, 4
syscall

li $t0, 4
div $t1, $t1, $t0
lw $t0, nn
beq $t0, $t1, afis_Y
j afis_N
afis_Y:

la $a0, sirY
li $v0, 4
syscall
j exit

afis_N:
la $a0, sirN
li $v0, 4
syscall

j exit



cerinta3:

li $v0, 5
syscall
sw $v0, host1

li $v0, 5
syscall
sw $v0, host2

li $v0, 8
li $a1, 101
la $a0, mesaj
syscall

li $t0, 0
lw $t2, host1
sw $t2, coada($t0)
li $t1, 4

loop_coada2:
beq $t0, $t1, exit_loop_coada2

lw $t2, coada($t0)
lw $t3, nn
mul $t2, $t2, $t3
li $t3, 4
mul $t2, $t2, $t3

li $t3, 0
lw $t4, nn
loop_linie2:
beq $t3, $t4, exit_loop_linie2

li $t5, 4
mul $t5, $t5, $t3
lw $t6, roles($t5)
li $t5, 3
beq $t5, $t6, nu_adauga2

lw $t5, G($t2)
li $t6, 1
beq $t6, $t5, adauga_in_coada2
j nu_adauga2
adauga_in_coada2:

li $t5, 0
verificare2:
beq $t5, $t1, exit_verificare2

lw $t7, coada($t5)
beq $t3, $t7, nu_adauga2

addi $t5, $t5, 4
j verificare2
exit_verificare2:

sw $t3, coada($t1)
addi $t1, $t1, 4

lw $t5, host2
beq $t3, $t5, curat

nu_adauga2:

addi $t3, $t3, 1
addi $t2, $t2, 4
j loop_linie2
exit_loop_linie2:

addi $t0, $t0, 4
j loop_coada2
exit_loop_coada2:

j nu_e_curat

curat: 
la $a0, mesaj
li $v0, 4
syscall
j exit

nu_e_curat:
li $t0, 0
lb $t1, mesaj($t0)
li $t3, 10
loop_decriptare:
beq $t1, $t3, exit_loop_decriptare

li $t4, 97
bge $t1, $t4, move_v1
j dont_move
move_v1:
li $t4, 122
ble $t1, $t4, move_v2
j dont_move
move_v2:

addi $t1, $t1, -10
li $t2, 97
blt $t1, $t2, cicleaza
j nu_cicla
cicleaza:
li $t2, 96
sub $t1, $t2, $t1
li $t2, 122
sub $t1, $t2, $t1
nu_cicla:

move $a0, $t1
li $v0, 11
syscall

dont_move:

addi $t0, $t0, 1
lb $t1, mesaj($t0)
j loop_decriptare
exit_loop_decriptare:

exit:
li $v0, 10
syscall