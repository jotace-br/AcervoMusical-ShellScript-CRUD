#!/bin/bash

main(){
	while true
	do
		echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
		echo " ▓▓▓▒▒▒░░░ MÚSICAS ░░░▒▒▒▓▓▓"
		echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
		echo " [1]: Adicionar uma nova música."
		echo " [2]: Remover uma música existente."
		echo " [3]: Buscar uma música existente."
		echo " [4]: Listar todas as músicas existentes."
		echo " [5]: Aperte [CTRL+C] para fechar o programa."
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
			listarMusica
	   	;;
		*)
			echo "Opção inválida!"
			exit 1	
		;;
		esac
	done

}

adicionarMusica(){
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " ▓▓▓▒▒▒░░░ ADICIONAR ░░░▒▒▒▓▓▓"
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " "
	read -p "Digite o nome da música: " nomeMusica
	read -p "Digite o ano da música: " anoMusica
	read -p "Digite o album da música: " albumMusica
	read -p "Digite o artista da música: " artistaMusica

	echo "Música: $nomeMusica, Ano: $anoMusica, Álbum: $albumMusica, Artista: $artistaMusica" >> Musicas.txt
	#esse "Música: ..." está meio que bugando o search, ou vou ter que tirar ou vou ter que pesquisar uma forma melhor
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬" >> Musicas.txt
}	

removerMusica(){
	echo "removido"
}

buscarMusica(){
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " ▓▓▓▒▒▒░░░ BUSCAR ░░░▒▒▒▓▓▓"
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " "
	read -p "Digite a palavra-chave a ser buscada: " busca
	
	if [[ `cat  Musicas.txt | grep -i "$busca"` ]]
	then
		echo "`cat  Musicas.txt | grep -i "$busca"`"
	else 
		echo "Música não encontrada."
	fi

}

listarMusica(){
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " ▓▓▓▒▒▒░░░ LISTAR ░░░▒▒▒▓▓▓"
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " "
	cat Musicas.txt
}

#chamando a função main
if [ -e Musicas.txt ]
then
	>> Musicas.txt
	main
else
	> Musicas.txt
	main
fi
