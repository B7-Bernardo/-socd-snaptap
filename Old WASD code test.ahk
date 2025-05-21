#SingleInstance
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A

; Null Movement Script
; Este script atualiza as teclas W, A, S e D para garantir que apenas uma delas esteja pressionada por vez
; Isso evita que motores de jogo tratem a combinação de teclas de movimentação como não movendo
; Em vez disso, a tecla pressionada por último será a que determina a direção do movimento

w_held := 0 ; Variável que armazena o estado real do teclado para a tecla W
a_held := 0 ; Variável que armazena o estado real do teclado para a tecla A
s_held := 0 ; Variável que armazena o estado real do teclado para a tecla S
d_held := 0 ; Variável que armazena o estado real do teclado para a tecla D
w_scrip := 0 ; Variável que armazena o estado da tecla W saindo do script
a_scrip := 0 ; Variável que armazena o estado da tecla A saindo do script
s_scrip := 0 ; Variável que armazena o estado da tecla S saindo do script
d_scrip := 0 ; Variável que armazena o estado da tecla D saindo do script

*$w:: ; Toda vez que a tecla W é pressionada
	w_held := 1 ; Rastreia o estado real da tecla W
	
	if (a_scrip){ 
		a_scrip := 0
		Send {Blind}{a up} ; Solta a tecla A se estiver pressionada
	}
	
	if (d_scrip){ 
		d_scrip := 0
		Send {Blind}{d up} ; Solta a tecla D se estiver pressionada
	}
	
	if (s_scrip){ 
		s_scrip := 0
		Send {Blind}{s up} ; Solta a tecla S se estiver pressionada
	}
	
	if (!w_scrip){
		w_scrip := 1
		Send {Blind}{w down} ; Envia o pressionamento da tecla W
	}
	return

*$w up:: ; Toda vez que a tecla W é liberada
	w_held := 0
	
	if (w_scrip){
		w_scrip := 0
		Send {Blind}{w up} ; Envia a liberação da tecla W
	}
	
	if (a_held AND !a_scrip){
		a_scrip := 1
		Send {Blind}{a down} ; Envia o pressionamento da tecla A se estiver pressionada
	}
	
	if (s_held AND !s_scrip){
		s_scrip := 1
		Send {Blind}{s down} ; Envia o pressionamento da tecla S se estiver pressionada
	}
	
	if (d_held AND !d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Envia o pressionamento da tecla D se estiver pressionada
	}
	return

*$a:: ; Toda vez que a tecla A é pressionada
	a_held := 1
	
	if (w_scrip){ 
		w_scrip := 0
		Send {Blind}{w up} ; Solta a tecla W se estiver pressionada
	}
	
	if (d_scrip){ 
		d_scrip := 0
		Send {Blind}{d up} ; Solta a tecla D se estiver pressionada
	}
	
	if (s_scrip){ 
		s_scrip := 0
		Send {Blind}{s up} ; Solta a tecla S se estiver pressionada
	}
	
	if (!a_scrip){
		a_scrip := 1
		Send {Blind}{a down} ; Envia o pressionamento da tecla A
	}
	return

*$a up:: ; Toda vez que a tecla A é liberada
	a_held := 0
	
	if (a_scrip){
		a_scrip := 0
		Send {Blind}{a up} ; Envia a liberação da tecla A
	}
	
	if (d_held AND !d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Envia o pressionamento da tecla D se estiver pressionada
	}
	
	if (s_held AND !s_scrip){
		s_scrip := 1
		Send {Blind}{s down} ; Envia o pressionamento da tecla S se estiver pressionada
	}
	
	if (w_held AND !w_scrip){
		w_scrip := 1
		Send {Blind}{w down} ; Envia o pressionamento da tecla W se estiver pressionada
	}
	return

*$d:: ; Toda vez que a tecla D é pressionada
	d_held := 1
	
	if (w_scrip){ 
		w_scrip := 0
		Send {Blind}{w up} ; Solta a tecla W se estiver pressionada
	}
	
	if (a_scrip){ 
		a_scrip := 0
		Send {Blind}{a up} ; Solta a tecla A se estiver pressionada
	}
	
	if (s_scrip){ 
		s_scrip := 0
		Send {Blind}{s up} ; Solta a tecla S se estiver pressionada
	}
	
	if (!d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Envia o pressionamento da tecla D
	}
	return

*$d up:: ; Toda vez que a tecla D é liberada
	d_held := 0
	
	if (d_scrip){
		d_scrip := 0
		Send {Blind}{d up} ; Envia a liberação da tecla D
	}
	
	if (a_held AND !a_scrip){
		a_scrip := 1
		Send {Blind}{a down} ; Envia o pressionamento da tecla A se estiver pressionada
	}
	
	if (s_held AND !s_scrip){
		s_scrip := 1
		Send {Blind}{s down} ; Envia o pressionamento da tecla S se estiver pressionada
	}
	
	if (w_held AND !w_scrip){
		w_scrip := 1
		Send {Blind}{w down} ; Envia o pressionamento da tecla W se estiver pressionada
	}
	return

*$s:: ; Toda vez que a tecla S é pressionada
	s_held := 1
	
	if (w_scrip){ 
		w_scrip := 0
		Send {Blind}{w up} ; Solta a tecla W se estiver pressionada
	}
	
	if (a_scrip){ 
		a_scrip := 0
		Send {Blind}{a up} ; Solta a tecla A se estiver pressionada
	}
	
	if (d_scrip){ 
		d_scrip := 0
		Send {Blind}{d up} ; Solta a tecla D se estiver pressionada
	}
	
	if (!s_scrip){
		s_scrip := 1
		Send {Blind}{s down} ; Envia o pressionamento da tecla S
	}
	return

*$s up:: ; Toda vez que a tecla S é liberada
	s_held := 0
	
	if (s_scrip){
		s_scrip := 0
		Send {Blind}{s up} ; Envia a liberação da tecla S
	}
	
	if (a_held AND !a_scrip){
		a_scrip := 1
		Send {Blind}{a down} ; Envia o pressionamento da tecla A se estiver pressionada
	}
	
	if (d_held AND !d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Envia o pressionamento da tecla D se estiver pressionada
	}
	
	if (w_held AND !w_scrip){
		w_scrip := 1
		Send {Blind}{w down} ; Envia o pressionamento da tecla W se estiver pressionada
	}
	return
