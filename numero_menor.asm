#inicio del script 
#ingreso de datos 
.data
prompt:     .asciiz "Ingrese el primer número: "
prompt2:    .asciiz "Ingrese el segundo número: "
prompt3:    .asciiz "Ingrese el tercer número: "
resultMsg:  .asciiz "El número menor es: "

.text
main:
    # input Para el usuario para que ingrese tres números
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  # Almacene el primer número en $t0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0  # Almacene el segundo número en $t1

    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0  # Almacene el tercer número en $t2

    # Encuentre el número menor
    move $t3, $t0     # Copie el primer número en $t3
    bgt $t1, $t3, greater1  # Si el segundo número es menor, vaya a greater1
    move $t3, $t1     # Copie el segundo número en $t3
greater1:
    bgt $t2, $t3, greater2  # Si el tercer número es menor, vaya a greater2
    move $t3, $t2     # Copie el tercer número en $t3
greater2:

    # Muestre el resultado
    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Salir del programa
    li $v0, 10
    syscall
