		;MIC
	;MARCONE AUGUSTO 
	;PORTA P2 EM ORDEM CRESCENTE

	ORG	0h
	mov	R0, #0h
	mov	R1, #0h
	
label0:	clr	TF0
	mov	P2, #0h
	setb	TR0
	jnb	TF0, $
	inc	R0
	cjne	R0, #80h, label0
	clr	TF0
	clr	TR0
	mov	R0, #0h
	ljmp	label1
	
label1:	clr	TF1
	mov	P2, #0FFh
	setb	TR1
	jnb	TF1, $
	inc	R1
	cjne	R1, #80h, label1
	clr	TF1
	clr	TR1
	mov	R1, #0h
	sjmp	label0


	END
