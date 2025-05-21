#SingleInstance
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A

; Null Movement Script
; Este script atualiza as teclas Q, W, E, R, D e F para garantir que apenas uma delas esteja pressionada por vez
; Isso evita que motores de jogo tratem a combinação de teclas de movimentação como não movendo
; Em vez disso, a tecla pressionada por último será a que determina a direção do movimento

q_held := 0 ; Variável que armazena o estado real do teclado para a tecla Q
w_held := 0 ; Variável que armazena o estado real do teclado para a tecla W
e_held := 0 ; Variável que armazena o estado real do teclado para a tecla E
r_held := 0 ; Variável que armazena o estado real do teclado para a tecla R
d_held := 0 ; Variável que armazena o estado real do teclado para a tecla D
f_held := 0 ; Variável que armazena o estado real do teclado para a tecla F
q_scrip := 0 ; Variável que armazena o estado da tecla Q saindo do script
w_scrip := 0 ; Variável que armazena o estado da tecla W saindo do script
e_scrip := 0 ; Variável que armazena o estado da tecla E saindo do script
r_scrip := 0 ; Variável que armazena o estado da tecla R saindo do script
d_scrip := 0 ; Variável que armazena o estado da tecla D saindo do script
f_scrip := 0 ; Variável que armazena o estado da tecla F saindo do script

*$q:: ; Toda vez que a tecla Q é pressionada
	q_held := 1
	
	if (w_scrip){ 
		w_scrip := 0
		Send {Blind}{w up} ; Solta a tecla W se estiver pressionada
	}
	
	if (e_scrip){ 
		e_scrip := 0
		Send {Blind}{e up} ; Solta a tecla E se estiver pressionada
	}
	
	if (r_scrip){ 
		r_scrip := 0
		Send {Blind}{r up} ; Solta a tecla R se estiver pressionada
	}
	
	if (d_scrip){ 
		d_scrip := 0
		Send {Blind}{d up} ; Solta a tecla D se estiver pressionada
	}
	
	if (f_scrip){ 
		f_scrip := 0
		Send {Blind}{f up} ; Solta a tecla F se estiver pressionada
	}
	
	if (!q_scrip){
		q_scrip := 1
		Send {Blind}{q down} ; Envia o pressionamento da tecla Q
	}
	return

*$q up:: ; Toda vez que a tecla Q é liberada
	q_held := 0
	
	if (q_scrip){
		q_scrip := 0
		Send {Blind}{q up} ; Envia a liberação da tecla Q
	}
	
	if (w_held AND !w_scrip){
		w_scrip := 1
		Send {Blind}{w down} ; Envia o pressionamento da tecla W se estiver pressionada
	}
	
	if (e_held AND !e_scrip){
		e_scrip := 1
		Send {Blind}{e down} ; Envia o pressionamento da tecla E se estiver pressionada
	}
	
	if (r_held AND !r_scrip){
		r_scrip := 1
		Send {Blind}{r down} ; Envia o pressionamento da tecla R se estiver pressionada
	}
	
	if (d_held AND !d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Envia o pressionamento da tecla D se estiver pressionada
	}
	
	if (f_held AND !f_scrip){
		f_scrip := 1
		Send {Blind}{f down} ; Envia o pressionamento da tecla F se estiver pressionada
	}
	return

*$w:: ; Toda vez que a tecla W é pressionada
	w_held := 1
	
	if (q_scrip){ 
		q_scrip := 0
		Send {Blind}{q up} ; Solta a tecla Q se estiver pressionada
	}
	
	if (e_scrip){ 
		e_scrip := 0
		Send {Blind}{e up} ; Solta a tecla E se estiver pressionada
	}
	
	if (r_scrip){ 
		r_scrip := 0
		Send {Blind}{r up} ; Solta a tecla R se estiver pressionada
	}
	
	if (d_scrip){ 
		d_scrip := 0
		Send {Blind}{d up} ; Solta a tecla D se estiver pressionada
	}
	
	if (f_scrip){ 
		f_scrip := 0
		Send {Blind}{f up} ; Solta a tecla F se estiver pressionada
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
	
	if (q_held AND !q_scrip){
		q_scrip := 1
		Send {Blind}{q down} ; Envia o pressionamento da tecla Q se estiver pressionada
	}
	
	if (e_held AND !e_scrip){
		e_scrip := 1
		Send {Blind}{e down} ; Envia o pressionamento da tecla E se estiver pressionada
	}
	
	if (r_held AND !r_scrip){
		r_scrip := 1
		Send {Blind}{r down} ; Envia o pressionamento da tecla R se estiver pressionada
	}
	
	if (d_held AND !d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Envia o pressionamento da tecla D se estiver pressionada
	}
	
	if (f_held AND !f_scrip){
		f_scrip := 1
		Send {Blind}{f down} ; Envia o pressionamento da tecla F se estiver pressionada
	}
	return

*$e:: ; Toda vez que a tecla E é pressionada
	e_held := 1
	
	if (q_scrip){ 
		q_scrip := 0
		Send {Blind}{q up} ; Solta a tecla Q se estiver pressionada
	}
	
	if (w_scrip){ 
		w_scrip := 0
		Send {Blind}{w up} ; Solta a tecla W se estiver pressionada
	}
	
	if (r_scrip){ 
		r_scrip := 0
		Send {Blind}{r up} ; Solta a tecla R se estiver pressionada
	}
	
	if (d_scrip){ 
		d_scrip := 0
		Send {Blind}{d up} ; Solta a tecla D se estiver pressionada
	}
	
	if (f_scrip){ 
		f_scrip := 0
		Send {Blind}{f up} ; Solta a tecla F se estiver pressionada
	}
	
	if (!e_scrip){
		e_scrip := 1
		Send {Blind}{e down} ; Envia o pressionamento da tecla E
	}
	return

*$e up:: ; Toda vez que a tecla E é liberada
	e_held := 0
	
	if (e_scrip){
		e_scrip := 0
		Send {Blind}{e up} ; Envia a liberação da tecla E
	}
	
	if (q_held AND !q_scrip){
		q_scrip := 1
		Send {Blind}{q down} ; Envia o pressionamento da tecla Q se estiver pressionada
	}
	
	if (w_held AND !w_scrip){
		w_scrip := 1
		Send {Blind}{w down} ; Envia o pressionamento da tecla W se estiver pressionada
	}
	
	if (r_held AND !r_scrip){
		r_scrip := 1
		Send {Blind}{r down} ; Envia o pressionamento da tecla R se estiver pressionada
	}
	
	if (d_held AND !d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Envia o pressionamento da tecla D se estiver pressionada
	}
	
	if (f_held AND !f_scrip){
		f_scrip := 1
		Send {Blind}{f down} ; Envia o pressionamento da tecla F se estiver pressionada
	}
	return

*$r:: ; Toda vez que a tecla R é pressionada
	r_held := 1
	
	if (q_scrip){ 
		q_scrip := 0
		Send {Blind}{q up} ; Solta a tecla Q se estiver pressionada
	}
	
	if (w_scrip){ 
		w_scrip := 0
		Send {Blind}{w up} ; Solta a tecla W se estiver pressionada
	}
	
	if (e_scrip){ 
		e_scrip := 0
		Send {Blind}{e up} ; Solta a tecla E se estiver pressionada
	}
	
	if (d_scrip){ 
		d_scrip := 0
		Send {Blind}{d up} ; Solta a tecla D se estiver pressionada
	}
	
	if (f_scrip){ 
		f_scrip := 0
		Send {Blind}{f up} ; Solta a tecla F se estiver pressionada
	}
	
	if (!r_scrip){
		r_scrip := 1
		Send {Blind}{r down} ; Envia o pressionamento da tecla R
	}
	return

*$r up:: ; Toda vez que a tecla R é liberada
	r_held := 0
	
	if (r_scrip){
		r_scrip := 0
		Send {Blind}{r up} ; Envia a liberação da tecla R
	}
	
	if (q_held AND !q_scrip){
		q_scrip := 1
		Send {Blind}{q down} ; Envia o pressionamento da tecla Q se estiver pressionada
	}
	
	if (w_held AND !w_scrip){
		w_scrip := 1
		Send {Blind}{w down} ; Envia o pressionamento da tecla W se estiver pressionada
	}
	
	if (e_held AND !e_scrip){
		e_scrip := 1
		Send {Blind}{e down} ; Envia o pressionamento da tecla E se estiver pressionada
	}
	
	if (d_held AND !d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Envia o pressionamento da tecla D se estiver pressionada
	}
	
	if (f_held AND !f_scrip){
		f_scrip := 1
		Send {Blind}{f down} ; Envia o pressionamento da tecla F se estiver pressionada
	}
	return

*$d:: ; Toda vez que a tecla D é pressionada
	d_held := 1
	
	if (q_scrip){ 
		q_scrip := 0
		Send {Blind}{q up} ; Solta a tecla Q se estiver pressionada
	}
	
	if (w_scrip){ 
		w_scrip := 0
		Send {Blind}{w up} ; Solta a tecla W se estiver pressionada
	}
	
	if (e_scrip){ 
		e_scrip := 0
		Send {Blind}{e up} ; Solta a tecla E se estiver pressionada
	}
	
	if (r_scrip){ 
		r_scrip := 0
		Send {Blind}{r up} ; Solta a tecla R se estiver pressionada
	}
	
	if (f_scrip){ 
		f_scrip := 0
		Send {Blind}{f up} ; Solta a tecla F se estiver pressionada
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
	
	if (q_held AND !q_scrip){
		q_scrip := 1
		Send {Blind}{q down} ; Envia o pressionamento da tecla Q se estiver pressionada
	}
	
	if (w_held AND !w_scrip){
		w_scrip := 1
		Send {Blind}{w down} ; Envia o pressionamento da tecla W se estiver pressionada
	}
	
	if (e_held AND !e_scrip){
		e_scrip := 1
		Send {Blind}{e down} ; Envia o pressionamento da tecla E se estiver pressionada
	}
	
	if (r_held AND !r_scrip){
		r_scrip := 1
		Send {Blind}{r down} ; Envia o pressionamento da tecla R se estiver pressionada
	}
	
	if (f_held AND !f_scrip){
		f_scrip := 1
		Send {Blind}{f down} ; Envia o pressionamento da tecla F se estiver pressionada
	}
	return

*$f:: ; Toda vez que a tecla F é pressionada
	f_held := 1
	
	if (q_scrip){ 
		q_scrip := 0
		Send {Blind}{q up} ; Solta a tecla Q se estiver pressionada
	}
	
	if (w_scrip){ 
		w_scrip := 0
		Send {Blind}{w up} ; Solta a tecla W se estiver pressionada
	}
	
	if (e_scrip){ 
		e_scrip := 0
		Send {Blind}{e up} ; Solta a tecla E se estiver pressionada
	}
	
	if (r_scrip){ 
		r_scrip := 0
		Send {Blind}{r up} ; Solta a tecla R se estiver pressionada
	}
	
	if (d_scrip){ 
		d_scrip := 0
		Send {Blind}{d up} ; Solta a tecla D se estiver pressionada
	}
	
	if (!f_scrip){
		f_scrip := 1
		Send {Blind}{f down} ; Envia o pressionamento da tecla F
	}
	return

*$f up:: ; Toda vez que a tecla F é liberada
	f_held := 0
	
	if (f_scrip){
		f_scrip := 0
		Send {Blind}{f up} ; Envia a liberação da tecla F
	}
	
	if (q_held AND !q_scrip){
		q_scrip := 1
		Send {Blind}{q down} ; Envia o pressionamento da tecla Q se estiver pressionada
	}
	
	if (w_held AND !w_scrip){
		w_scrip := 1
		Send {Blind}{w down} ; Envia o pressionamento da tecla W se estiver pressionada
	}
	
	if (e_held AND !e_scrip){
		e_scrip := 1
		Send {Blind}{e down} ; Envia o pressionamento da tecla E se estiver pressionada
	}
	
	if (r_held AND !r_scrip){
		r_scrip := 1
		Send {Blind}{r down} ; Envia o pressionamento da tecla R se estiver pressionada
	}
	
	if (d_held AND !d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Envia o pressionamento da tecla D se estiver pressionada
	}
	return
