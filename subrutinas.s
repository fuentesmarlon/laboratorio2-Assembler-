/*--------------------------------------*/
/*Universidad del Valle de Guatemala    */
/*Taller de assembler                   */
/*Laboratorio 2.s                       */
/*Autores:                              */
/*  Marlon Fuentes 15240                */
/*  Oscar Lopez 15506                   */
/*--------------------------------------*/
.global GetGpio
GetGpio:
  push{lr}
  ldr r0,=myloc
  ldr r0,[r0]
  ldr r2,[r0,#0x34]
  cmp r2,#1
  moveq r0,r2
  cmp r2,#0
  mov r0,r2
  pop{pc}
  
