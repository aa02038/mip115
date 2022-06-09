/*
    Universidad de El Salvador
    Facultad de ingenieria y Arquitectura
    Escuela de Inginieria de Sistemas Informaticos
    Microprogramacion MIP115    Ciclo II-2022
    Convertidor de 8 bits a hexadecimal

    Alumnos:    ARITA AVELAR, WILLIAN BALMORE        AA02038
                HERNANDEZ RECINOS, ROLANDO ANTONIO   HR05048
                VANEGAS ZAMORA, JOSUE JOAQUIN        VZ04002

 */
.data
    .equ disp,     0xff200020       @ Direccion donde están mapeados los display D3 a D6
    .equ pulsador, 0xff200040       @ Direccion donde están mapeados los pulsadores
	.equ uatbase,  0xff201000
	
	//Codigos de impresion hexadecimal
	hexa:	.word	0x3F3F,0x3F06,0x3F5B,0x3F4F,0x3F66,0x3F6D,0x3F7D,0x3F07,0x3F7F,0x3F67,0x3F77,0x3F7C,0x3F39,0x3F5E,0x3F79,0x3F71,0x063F,0x0606,0x065B,0x064F,0x0666,0x066D,0x067D,0x0607,0x067F,0x0667,0x0677,0x067C,0x0639,0x065E,0x0679,0x0671,0x5B3F,0x5B06,0x5B5B,0x5B4F,0x5B66,0x5B6D,0x5B7D,0x5B07,0x5B7F,0x5B67,0x5B77,0x5B7C,0x5B39,0x5B5E,0x5B79,0x5B71,0x4F3F,0x4F06,0x4F5B,0x4F4F,0x4F66,0x4F6D,0x4F7D,0x4F07,0x4F7F,0x4F67,0x4F77,0x4F7C,0x4F39,0x4F5E,0x4F79,0x4F71,0x663F,0x6606,0x665B,0x664F,0x6666,0x666D,0x667D,0x6607,0x667F,0x6667,0x6677,0x667C,0x6639,0x665E,0x6679,0x6671,0x6D3F,0x6D06,0x6D5B,0x6D4F,0x6D66,0x6D6D,0x6D7D,0x6D07,0x6D7F,0x6D67,0x6D77,0x6D7C,0x6D39,0x6D5E,0x6D79,0x6D71,0x7D3F,0x7D06,0x7D5B,0x7D4F,0x7D66,0x7D6D,0x7D7D,0x7D07,0x7D7F,0x7D67,0x7D77,0x7D7C,0x7D39,0x7D5E,0x7D79,0x7D71,0x073F,0x0706,0x075B,0x074F,0x0766,0x076D,0x077D,0x0707,0x077F,0x0767,0x0777,0x077C,0x0739,0x075E,0x0779,0x0771,0x7F3F,0x7F06,0x7F5B,0x7F4F,0x7F66,0x7F6D,0x7F7D,0x7F07,0x7F7F,0x7F67,0x7F77,0x7F7C,0x7F39,0x7F5E,0x7F79,0x7F71,0x673F,0x6706,0x675B,0x674F,0x6766,0x676D,0x677D,0x6707,0x677F,0x6767,0x6777,0x677C,0x6739,0x675E,0x6779,0x6771,0x773F,0x7706,0x775B,0x774F,0x7766,0x776D,0x777D,0x7707,0x777F,0x7767,0x7777,0x777C,0x7739,0x775E,0x7779,0x7771,0x7C3F,0x7C06,0x7C5B,0x7C4F,0x7C66,0x7C6D,0x7C7D,0x7C07,0x7C7F,0x7C67,0x7C77,0x7C7C,0x7C39,0x7C5E,0x7C79,0x7C71,0x393F,0x3906,0x395B,0x394F,0x3966,0x396D,0x397D,0x3907,0x397F,0x3967,0x3977,0x397C,0x3939,0x395E,0x3979,0x3971,0x5E3F,0x5E06,0x5E5B,0x5E4F,0x5E66,0x5E6D,0x5E7D,0x5E07,0x5E7F,0x5E67,0x5E77,0x5E7C,0x5E39,0x5E5E,0x5E79,0x5E71,0x793F,0x7906,0x795B,0x794F,0x7966,0x796D,0x797D,0x7907,0x797F,0x7967,0x7977,0x797C,0x7939,0x795E,0x7979,0x7971,0x713F,0x7106,0x715B,0x714F,0x7166,0x716D,0x717D,0x7107,0x717F,0x7167,0x7177,0x717C,0x7139,0x715E,0x7179,0x7171
    //Codigos de impresion decimal
    deci:	.word 	0x303030,0x313030,0x323030,0x333030,0x343030,0x353030,0x363030,0x373030,0x383030,0x393030,0x303130,0x313130,0x323130,0x333130,0x343130,0x353130,0x363130,0x373130,0x383130,0x393130,0x303230,0x313230,0x323230,0x333230,0x343230,0x353230,0x363230,0x373230,0x383230,0x393230,0x303330,0x313330,0x323330,0x333330,0x343330,0x353330,0x363330,0x373330,0x383330,0x393330,0x303430,0x313430,0x323430,0x333430,0x343430,0x353430,0x363430,0x373430,0x383430,0x393430,0x303530,0x313530,0x323530,0x333530,0x343530,0x353530,0x363530,0x373530,0x383530,0x393530,0x303630,0x313630,0x323630,0x333630,0x343630,0x353630,0x363630,0x373630,0x383630,0x393630,0x303730,0x313730,0x323730,0x333730,0x343730,0x353730,0x363730,0x373730,0x383730,0x393730,0x303830,0x313830,0x323830,0x333830,0x343830,0x353830,0x363830,0x373830,0x383830,0x393830,0x303930,0x313930,0x323930,0x333930,0x343930,0x353930,0x363930,0x373930,0x383930,0x393930,0x303031,0x313031,0x323031,0x333031,0x343031,0x353031,0x363031,0x373031,0x383031,0x393031,0x303131,0x313131,0x323131,0x333131,0x343131,0x353131,0x363131,0x373131,0x383131,0x393131,0x303231,0x313231,0x323231,0x333231,0x343231,0x353231,0x363231,0x373231,0x383231,0x393231,0x303331,0x313331,0x323331,0x333331,0x343331,0x353331,0x363331,0x373331,0x383331,0x393331,0x303431,0x313431,0x323431,0x333431,0x343431,0x353431,0x363431,0x373431,0x383431,0x393431,0x303531,0x313531,0x323531,0x333531,0x343531,0x353531,0x363531,0x373531,0x383531,0x393531,0x303631,0x313631,0x323631,0x333631,0x343631,0x353631,0x363631,0x373631,0x383631,0x393631,0x303731,0x313731,0x323731,0x333731,0x343731,0x353731,0x363731,0x373731,0x383731,0x393731,0x303831,0x313831,0x323831,0x333831,0x343831,0x353831,0x363831,0x373831,0x383831,0x393831,0x303931,0x313931,0x323931,0x333931,0x343931,0x353931,0x363931,0x373931,0x383931,0x393932,0x303032,0x313032,0x323032,0x333032,0x343032,0x353032,0x363032,0x373032,0x383032,0x393032,0x303132,0x313132,0x323132,0x333132,0x343132,0x353132,0x363132,0x373132,0x383132,0x393132,0x303232,0x313232,0x323232,0x333232,0x343232,0x353232,0x363232,0x373232,0x383232,0x393232,0x303332,0x313332,0x323332,0x333332,0x343332,0x353332,0x363332,0x373332,0x383332,0x393332,0x303432,0x313432,0x323432,0x333432,0x343432,0x353432,0x363432,0x373432,0x383432,0x393432,0x303532,0x313532,0x323532,0x333532,0x343532,0x353532
	
	mensajeSup: .asciz "\nError solo debe usar los switches 7 a 0 \n"
	mensajeNum: .asciz "\nNumero base 10: "
	
.text
.global _start
_start:

    LDR R0, =pulsador	@ r0 contiene la direccion de memoria de pulsadores
    LDR R3, =disp		@ r3 contiene la direccion de memora de displays hexa
    LDR R2, =hexa       @ arreglo codigos hex a imprimir
	LDR R5, =uatbase	@contiene la direccion de jtag uart
	mov R9,#4			@ multiplicador para calculo de desplazamientos en arreglo
	mov r12,#0			@bandera error desbordamiento entrada
	mov r11,#0			@guarda numero anterior en la iteracion siguiente
init:
	 ldr r1, [r0]		@ r1 = valor de pulsadores
	 cmp r1,#0xff		@ compara si la entrada está arriba del limite permitido
	 bgt errorSuperior	@ejecutará error de desbordamiento bits entrada
	 mul r10,r1,r9		@ r1 = r1 * 4,  desplazamiento de posiciones en array (0,4,8,12,...)
	 add r8,r2,r10      @ r8 = direccion(hexa[0]+ desplazamiento)
	 ldr r7,[r8]		@ r7 = codigo para display hex
     str r7,[r3]		@ muestra display hex
	 cmp r11,r1			@compara numero anterior con actual
	 movne r11,r1		@valor de entrada actual, será valor anterior para proximo ciclo
	 bne imprimirN		@si el numero actual es distinto al anterior imprime	
	 b endif			@si son iguales pasa a otro ciclo
errorSuperior:
	ldr R4, =mensajeSup
	cmp r12,#0
	beq loop				@Si bandera=1 ejecuta loop e imprime mensaje
	bgt nada
	loop:					@imprime mensaje, al salir pone a cero displays y nadera a cero
		ldrb R6, [r4]       @Carga un byte del string
    	cmp R6, #0
    	beq salir           @para cuando encuentra el carater nulo
    	str R6, [r5]        @copia el carater en uart
    	add R4, r4, #1      @se mueve al proximo caracter en memoria
    	b loop	
		salir:
			mov r12,#1
			mov r6,#0x3f	@antes r11
			str r6,[r3]
			b endif
		nada:
			mov r6,#0x3f	@antes r11
			str r6,[r3]
			b endif
	
imprimirN:
	ldr r4,=mensajeNum
	loopN:					@imprime mensaje, al salir pone a cero displays y nadera a cero
		ldrb R6,[r4]        @Carga un byte del string
    	cmp R6, #0			@verifica si ha legado al final de la cadena
    	beq numero          @si ha llegado al final de cadena pasa a imprimir numero
    	str R6, [r5]        @copia el carater actual de la cadena en uart
    	add R4, r4, #1      @se mueve al proximo caracter en memoria
    	b loopN	
	numero:
		ldr r8,=deci
		add r8,r8,r10
		impn:
			ldrb r6,[r8]	@cargar un byte del dato en r8
			cmp r6,#0		@verifica si el dato es cero, se ha llegaod a fin
			beq endif
			strb r6,[r5]
			add r8,r8,#1
			b impn
endif:
	bal init