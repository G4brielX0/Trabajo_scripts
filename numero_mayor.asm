.data
prompt1:     .asciiz "Ingrese el primer número: "  # Mensaje para pedir el primer número
prompt2:     .asciiz "Ingrese el segundo número: " # Mensaje para pedir el segundo número
prompt3:     .asciiz "Ingrese el tercer número: "  # Mensaje para pedir el tercer número
resultMsg:   .asciiz "El número mayor es: "        # Mensaje para mostrar el resultado

.text
main:
    # Pida al usuario que ingrese tres números
    li $v0, 4         # Carga el código de servicio 4 (imprimir cadena)
    la $a0, prompt1   # Carga la dirección del primer mensaje en $a0
    syscall           # Llama al servicio para imprimir el mensaje

    li $v0, 5         # Carga el código de servicio 5 (leer entero)
    syscall           # Llama al servicio para leer un entero
    move $t0, $v0     # Almacena el primer número ingresado en $t0

    li $v0, 4         # Carga el código de servicio 4 (imprimir cadena)
    la $a0, prompt2   # Carga la dirección del segundo mensaje en $a0
    syscall           # Llama al servicio para imprimir el mensaje

    li $v0, 5         # Carga el código de servicio 5 (leer entero)
    syscall           # Llama al servicio para leer un entero
    move $t1, $v0     # Almacena el segundo número ingresado en $t1

    li $v0, 4         # Carga el código de servicio 4 (imprimir cadena)
    la $a0, prompt3   # Carga la dirección del tercer mensaje en $a0
    syscall           # Llama al servicio para imprimir el mensaje

    li $v0, 5         # Carga el código de servicio 5 (leer entero)
    syscall           # Llama al servicio para leer un entero
    move $t2, $v0     # Almacena el tercer número ingresado en $t2

    # Encuentre el número mayor
    move $t3, $t0     # Copia el primer número en $t3
    blt $t1, $t3, greater1  # Si el segundo número es mayor, salta a greater1
    move $t3, $t1     # Copia el segundo número en $t3
greater1:
    blt $t2, $t3, greater2  # Si el tercer número es mayor, salta a greater2
    move $t3, $t2     # Copia el tercer número en $t3
greater2:

    # Muestre el resultado
    li $v0, 4         # Carga el código de servicio 4 (imprimir cadena)
    la $a0, resultMsg # Carga la dirección del mensaje de resultado en $a0
    syscall           # Llama al servicio para imprimir el mensaje

    li $v0, 1         # Carga el código de servicio 1 (imprimir entero)
    move $a0, $t3     # Carga el número mayor en $a0
    syscall           # Llama al servicio para imprimir el número

    # Salir del programa
    li $v0, 10        # Carga el código de servicio 10 (salir)
    syscall           # Llama al servicio para salir del programa
