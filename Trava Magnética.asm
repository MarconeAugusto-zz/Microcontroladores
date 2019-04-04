			;MIC
	;MARCONE AUGUSTO , AMELIZA CORREA
	;P2.0 LED VERMEHLO
	;P2.1 LED VERDE , BASE TRANSISTOR


	ORG 0000h 	;ENDEREÇO QUE APONTA A INTERRUPÇÃO RESET (EXTERNA - PINO 9))
	JMP CONFIG
;------------------------------------------------------------------------------------------------

	ORG 00003h 	;ENDEREÇO QUE APOTA A INTERRUPÇÃO INT_0 ( EXTERNA - PINO P3.2)
	;INSTRUÇÕES
	CALL INTERRUP	
	RETI 
;------------------------------------------------------------------------------------------------

CONFIG: MOV R1, #00h	;FORÇANDO R1 A SER 0 (PARA GARANTIA)
	MOV R0, #00h	;FORÇANDO R0 A SER 0 (PARA GARANTIA)
	MOV P1, #00h	;FORÇANDO R1 A SER 0 (PARA GARANTIA)
	MOV P2, #00h	;FORÇANDO R0 A SER 0 (PARA GARANTIA)
	SETB PX0
	MOV IE , #10000001b

INICIO:	
	CLR P2.1
	SETB P2.0
	JMP INICIO

INTERRUP: 
	CLR P2.0
	SETB P2.1
	CALL CONTA
	CALL CONTA
	CALL CONTA
	CALL CONTA
	RET

CONTA:	SETB TR0	;INICIA O TIMER_0
LOOP:	JNB TF0, LOOP	;ENQUANTO TF0 NÃO FOR 1, EXECUTARÁ O LOOP. QUANDO VIRAR 1, IRÁ PARA AS LINHAS ABAIXO
	INC R1
	CLR TR0		;DESLIGA O TIMER, FAZ ELE PARAR DE CONTAR
	CLR TF0		;PARA DESABILITAR O FLAG
	CJNE R1, #0FFh, CONTA	;COMPARA R1 COM #10h ENQUANTO FOR DIFERENTE SE MANTEM NO LOOP
	MOV R1,#00h
	RET		;FAZ VOLTAR NA LINHA ABAIXO DA ONDE FOI DADO O "CALL"

	END
