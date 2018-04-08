section .text           ; On écrit le code dans la section .text, comme tjrs
	global _ft_strlen2  ; On exporte la fonction en global pour pouvoir l'appeler
                        ; Sinon c'est une static void function();

_ft_strlen2:            ; Début de la fonction
	mov rsi, rdi        ; Sauvegarde du ptr rdi pour la soustraction à la fin

debut:                  ; Un label au début pour la boucle
	mov al, byte [rsi]  ; On récupère l'octet de rsi : char a = *rsi;
	test al, al         ; if (0 == a) {
	jz fin              ; fin(); }
	inc rsi             ; ++rsi;
	jmp debut           ; debut();

fin:                    ; Fonction qui est appelée une fois un \0 rencontré
	mov rax, rsi        ; On place l'addr de fin dans rax
	sub rax, rdi        ; On soustrait l'addr de début
	ret                 ; On retourne rax, qui est la taille de la chaine
