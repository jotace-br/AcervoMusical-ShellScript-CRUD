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
	echo " "
	echo "Música adicionada com sucesso."

	read -p "Deseja adicionar outra música?[S/N]: " escolha
	if [[ $escolha =~ ^([yY]|[sS])$ ]]
	then
		adicionarMusica
	else
		main
	fi
	
}	

removerMusica(){
	#está apagando todas as ocorrências, ao invés de apenas a primeira
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " ▓▓▓▒▒▒░░░ REMOVER ░░░▒▒▒▓▓▓"
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " "
	read -p "Digite a palavra-chave a ser buscada: " busca
	
	if [[ `cat  Musicas.txt | grep -i "$busca"` ]]
	then
		read -p "Deseja realmente remover?[S/N]: " escolhaRemover
		if [[ $escolhaRemover =~ ^([yY]|[sS])$ ]]
		then
			sed -i "/$busca/{H;x;/^\n/d;g;}" Musicas.txt
			#sed -i "/$busca/d" Musicas.txt
			echo " "
			echo "Música removida com sucesso."
		else
			echo "Música não removida."
		fi
	else
		echo "Música não removida/não encontrada."
	fi

	read -p "Deseja remover outra música?[S/N]: " escolha
	if [[ $escolha =~ ^([yY]|[sS])$ ]]
	then
		removerMusica
	else
		main
	fi
}

buscarMusica(){
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " ▓▓▓▒▒▒░░░ BUSCAR ░░░▒▒▒▓▓▓"
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " "
	read -p "Digite a palavra-chave a ser buscada: " busca
	echo " "
	
	if [[ `cat  Musicas.txt | grep -i "$busca"` ]]
	then
		echo "Itens encontrados:"
		echo "`cat  Musicas.txt | grep -i "$busca"`"
		echo " "
		echo "Busca concluída."
	else 
		echo "Música não encontrada."
	fi

	read -p "Deseja buscar outra música?[S/N]: " escolha
	if [[ $escolha =~ ^([yY]|[sS])$ ]]
	then
		buscarMusica
	else
		main
	fi

}

listarMusica(){
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " ▓▓▓▒▒▒░░░ LISTAR ░░░▒▒▒▓▓▓"
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " "
	cat -n Musicas.txt
	echo " "
	echo "Listagem concluída."
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
