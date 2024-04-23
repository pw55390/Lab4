#!/bin/bash

# Funkcja do tworzenia 100 plików log
create_log() {
   for ((i=1; i<=100; i++))
   do
      echo "plik: log$i.txt" >log$i.txt
      echo "Skrypt: BASH_L4.sh" >>log$i.txt
      echo "Data: $(date +'%Y-%m-%d')">>log$i.txt
   done
}

print_date() {
    echo "Dziś jest: $(date +'%Y-%m-%d')"
}
if [ "$1" == "--date" ]; then
    print_date
elif [ "$1" == "--logs" ]; then
    create_log
fi



