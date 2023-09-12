.data
prompt:     .asciiz "Ingrese el número de términos de la serie Fibonacci: "
resultMsg:  .asciiz "Serie Fibonacci: "

.text
main:
    # Pida al usuario el número de términos
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  # Almacene el número de términos en $t0

    # Inicialice los primeros dos términos de la serie
    li $t1, 0  # Primer término
    li $t2, 1  # Segundo término

    # Muestre el resultado
    li $v0, 4
    la $a0, resultMsg
    syscall

    # Genere y muestre la serie Fibonacci
    loop:
        beq $t0, $zero, endLoop  # Si $t0 es igual a 0, salga del bucle
        move $a0, $t1           # Cargue el término actual en $a0 para imprimirlo
        li $v0, 1
        syscall

        add $t3, $t1, $t2      # Calcule el siguiente término
        move $t1, $t2          # Mueva los términos actuales
        move $t2, $t3
        sub $t0, $t0, 1        # Decrementa el contador de términos
        j loop

    endLoop:
    # Salir del programa
    li $v0, 10
    syscall
