/*--------------------------------------*/
/*Universidad del Valle de Guatemala    */
/*Taller de assembler                   */
/*Laboratorio 2.s                       */
/*Autores:                              */
/*  Marlon Fuentes 15240                */
/*  Oscar Lopez 15506                   */
/*--------------------------------------*/
.text
.align 2
.global main
main:
//llama a la funcion que crea la memoria virtual
 bl GetGpioAddress

//Puertos 13,14 y 15 de salida
 mov r0,#13
 mov r1,#1
 bl SetGpioFunction

 mov r0,#14
 mov r1,#1
 bl SetGpioFunction

 mov r0,#15
 mov r1,#1
 bl SetGpioFunction

// Puertos 21,22 y 23 de entrada
 mov r0,#21
 mov r1,#0
 bl SetGpioFunction

 mov r0,#22
 mov r1,#0
 bl SetGpioFunction

 mov r0,#23
 mov r1,#0
 bl SetGpioFunction
ciclo:
 //r10= contador de boton presionado con valor inicial 0
 	mov r10,#0

 //Apagar todos los leds

 	mov r0,#13
 	mov r1,#0
 	bl SetGpio

 	mov r0,#14
 	mov r1,#0
 	bl SetGpio

 	mov r0,#15
 	mov r1,#0
 	bl SetGpio
BotPres:
//Revisa si los botones estan presionados
  mov r0,#21
  bl GetGpio
  cmp r0,#0
  //si el boton que esta en el puerto 21 esta presionado entonces se le suma 1 al contador
  addne r10,#1
//si el contador esta en 1 se debe  encender el puerto 13
	cmp r10,#1
	moveq r0,#13
	moveq r1,#1
	bleq SetGpio
  //si el contador esta en 2 se debe  encender el puerto 14
  cmp r10,#1
  moveq r0,#14
  moveq r1,#1
  bleq SetGpio
    //si el contador esta en 3 se debe  encender el puerto 15
  cmp r10,#1
  moveq r0,#15
  moveq r1,#1
  bleq SetGpio
  //si el contador llega a 4 entonces comienza el ciclo otra vez
	cmp r10,#4
	beq ciclo
	b BotPres


.data
.align 2
.global myloc
myloc: .word 0
.end
