#!/bin/bash
# Funkcja pomocy
show_help() {
    echo "Użycie: ./nazwa_skryptu.sh --date |-d| --logs |-l| --logs <liczba> | --help |-h| "
    echo "--date (-d): Wyświetla dzisiejszą datę."
    echo "--logs (-l): Tworzy 100 plików log."
    echo "--logs <liczba> (-l <liczba>): Tworzy określoną liczbę plików log."
    echo "--help (-h): Wyświetla pomoc."
    echo "--init (-i): Klonowanie repozytorium oraz dodanie ścieżki do PATH"
    echo "--error (-e): Tworzy 100 plików error w folderach error, z argumentem liczbowym - dowolną ilość"
}
# Funkcja do tworzenia plików error w osobnych folderach
create_error_logs() {
    for ((i=1; i<=100; i++))
    do
        dir="error$i"
        mkdir -p "$dir"
        echo "plik: $dir/error$i.txt" > "$dir/error$i.txt"
        echo "Skrypt: $0" >> "$dir/error$i.txt"
        echo "Data: $(date +'%Y-%m-%d')" >> "$dir/error$i.txt"
    done
}
create_n_error_logs() {
    local count=$1
    for ((i=1; i<=$count; i++))
    do
        dir="error$i"
        mkdir -p "$dir"
        echo "plik: $dir/error$i.txt" > "$dir/error$i.txt"
        echo "Skrypt: $0" >> "$dir/error$i.txt"
        echo "Data: $(date +'%Y-%m-%d')" >> "$dir/error$i.txt"
    done
}

# Funkcja inicjująca skrypt
initialize() {
    local scripts_dir="$PWD/55390_repo"
    if [ ! -d "$scripts_dir" ]; then
        mkdir -p "$scripts_dir"
        git clone https://github.com/pw55390/Lab4.git "$scripts_dir"
        echo "Repozytorium zostało sklonowane do $scripts_dir"
        export PATH="$PATH:$scripts_dir"
        echo "Dodano ścieżkę do $scripts_dir do zmiennej PATH"
    else
        echo "Katalog $scripts_dir już istnieje. Nie wykonano klonowania repozytorium."
    fi
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

if [[ "$1" == "--date" || "$1" == "-d"  ]]; then
    print_date
elif [[ "$1" == "--logs" || "$1" == "-l"  ]]; then
	if [ -n "$2" ]; then 
		create_n_log "$2"
        else
        create_log
	fi
elif [[ "$1" == "--help" || "$1" == "-h"  ]]; then
show_help
elif [[ "$1" == "--init" || "$1" == "-i"  ]]; then
initialize
elif [[ "$1" == "--error" || "$1" == "-e"  ]]; then
	if [ -n "$2" ]; then 
		create_n_error_logs "$2"
        else
        create_error_logs
	fi
else
echo "Niepoprawne użycie. Użyj --help, aby zobaczyć dostępne opcje."
    exit 1
fi