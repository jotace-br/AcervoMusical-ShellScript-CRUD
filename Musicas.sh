#!/bin/bash

main(){
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " ▓▓▓▒▒▒░░░ MÚSICAS ░░░▒▒▒▓▓▓"
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " [1]: Adicionar uma nova música."
	echo " [2]: Remover uma música existente."
	echo " [3]: Buscar uma música existente."
	echo " [4]: Listar todas as músicas existentes."
	echo " "
	read -p "Digite a opção desejada: " opcaoDesejada

	case "$opcaoDesejada" in
   	"1") 
		adicionarMusica
   	;;
   	"2") 
		removerMusica
   	;;
   	"3") 
		buscarMusica
   	;;
	"4") 
		buscarMusica
   	;;
	*)
		echo "Opção inválida!"
		exit 1	
	;;
	esac

}

adicionarMusica(){
	echo "adicionado"
}

removerMusica(){
	echo "removido"
}

buscarMusica(){
	echo "buscado"
}

listarMusica(){
	echo "listando"
}

#chamando a função main aqui em baixo
main
