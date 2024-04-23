#!/bin/bash


print_date() {
    echo "Dziś jest: $(date +'%Y-%m-%d')"
}
if [ "$1" == "--date" ]; then
    print_date
fi