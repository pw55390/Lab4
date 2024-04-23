#!/bin/bash
# Funkcja pomocy
show_help() {
    echo "Użycie: ./nazwa_skryptu.sh --date | --logs | --logs <liczba> | --help"
    echo "--date: Wyświetla dzisiejszą datę."
    echo "--logs: Tworzy 100 plików log."
    echo "--logs <liczba>: Tworzy określoną liczbę plików log."
    echo "--help: Wyświetla pomoc."
}

# Funkcja do tworzenia określonej liczby plików log
create_n_log() {
    local count=$1
    for ((i=1; i<=$count; i++))
    do
        echo "Nazwa pliku: log$i.txt" > log$i.txt
        echo "Nazwa skryptu: $0" >> log$i.txt
        echo "Data: $(date +'%Y-%m-%d')" >> log$i.txt
    done
}

# Funkcja do tworzenia 100 plików log
create_log() {
   for ((i=1; i<=100; i++))
   do
      echo "plik: log$i.txt" >log$i.txt
      echo "Skrypt: $0" >>log$i.txt
      echo "Data: $(date +'%Y-%m-%d')">>log$i.txt
   done
}
# Funkcja do wyswietlania daty
print_date() {
    echo "Dziś jest: $(date +'%Y-%m-%d')"
}

if [ "$1" == "--date" ]; then
    print_date
elif [ "$1" == "--logs" ]; then
	if [ -n "$2" ]; then 
		create_n_log "$2"
        else
        create_log
	fi
elif [ "$1" == "--help" ]; then
show_help
else
    echo "Niepoprawne użycie. Użyj --help, aby zobaczyć dostępne opcje."
    exit 1
fi