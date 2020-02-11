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
		echo -e " [5]: Aperte [CTRL+C] para fechar o programa.\n"
		read -p "Digite a opção desejada: " opcaoDesejada

		case "$opcaoDesejada" in
	   	"1") adicionarMusica;;
	   	"2") removerMusica;;
	   	"3") buscarMusica;;
		"4") listarMusica;;
		*)
		echo "Opção inválida!"
		exit 1;;
		esac
	done

}

adicionarMusica(){
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " ▓▓▓▒▒▒░░░ ADICIONAR ░░░▒▒▒▓▓▓"
	echo -e "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬\n"
	read -p "Digite o nome da música: " nomeMusica
	read -p "Digite o ano da música: " anoMusica
	read -p "Digite o album da música: " albumMusica
	read -p "Digite o artista da música: " artistaMusica

	echo "Música: $nomeMusica, Ano: $anoMusica, Álbum: $albumMusica, Artista: $artistaMusica" >> Musicas.txt
	echo -e "\nMúsica adicionada com sucesso."

	read -p "Deseja adicionar outra música?[S/N]: " escolha
	if [[ $escolha =~ ^([yY]|[sS])$ ]]
	then
		adicionarMusica
	else
		main
	fi	
}	

removerMusica(){
	echo "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬"
	echo " ▓▓▓▒▒▒░░░ REMOVER ░░░▒▒▒▓▓▓"
	echo -e "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬\n"
	read -p "Digite a palavra-chave a ser removida: " busca
	
	if [[ `cat Musicas.txt | grep -i "$busca"` ]]
	then
		read -p "Deseja remover apenas uma ou todas as referências com esse nome?[1/n]: " escolhaRemover
		if [[ $escolhaRemover -eq 1 ]]
		then
			sed -i "/$busca/{H;x;/^\n/d;g;}" Musicas.txt
			echo -e "\nReferência removida com sucesso."
		elif [[ $escolhaRemover = "n" ]]
        then
			read -p "Deseja realmente remover? Isso pode ser letal. [S/N]: " escolhaReal
			if [[ $escolhaReal =~ ^([yY]|[sS])$ ]]
			then
            	sed -i "/$busca/d" Musicas.txt
				echo -e "\nReferência(s) removida(s) com sucesso."
			else
			echo "Música não removida."
			fi
        else
            echo "Musica não removida."
		fi
	else
		echo "Música não encontrada."
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
	echo -e "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬\n"
	read -p "Digite a palavra-chave a ser buscada: " busca
	
	if [[ `cat Musicas.txt | grep -i "$busca"` ]]
	then
		echo "Itens encontrados:"
		echo "`cat -n Musicas.txt | grep -i "$busca"`"
		echo -e "\nBusca concluída."
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
	echo -e "▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬\n"
	cat -n Musicas.txt
	echo -e "\nListagem concluída."
}

if [ -e Musicas.txt ]
then
	>> Musicas.txt
	main
else
	> Musicas.txt
	main
fi
