show_help() {
    echo "Dostępne opcje:"
    echo "    --logs, -l - utworzenie plików log"
    echo "    --logs [liczba], -l [liczba] - utworzenie określonej liczby plików log"
    echo "    --date, -d - wyświetlenie dzisiejszej daty"
    echo "    --help, -h - wyświetlenie dostępnych opcji"
    echo "    --init - klonuje całe repozytorium i ustawia ścieżkę w PATH"
    echo "    -a - dodatkowe flagi"
}

if [[ "$1" = "--logs" ]] || [[ "$1" = "-l" ]]; then
    if [ -n "$2" ]; then
        for ((i=1; i<=$2; i++)); do
            mkdir log$i
            echo "Nazwa pliku: log$i.txt" > log$i/log$i.txt
            echo "Skrypt: skrypt.sh" >> log$i/log$i.txt
            echo "Data: $(date)" >> log$i/log$i.txt
        done
    else
        for ((i=1; i<=100; i++)); do
            mkdir log$i
            echo "Nazwa pliku: log$i.txt" > log$i/log$i.txt
            echo "Skrypt: skrypt.sh" >> log$i/log$i.txt
            echo "Data: $(date)" >> log$i/log$i.txt
        done
    fi
elif [[ "$1" = "--error" ]] || [[ "$1" = "-e" ]]; then
    if [ -n "$2" ]; then
        for ((i=1; i<=$2; i++)); do
            mkdir error$i
            echo "Nazwa pliku: error$i.txt" > error$i/error$i.txt
            echo "Skrypt: skrypt.sh" >> error$i/error$i.txt
            echo "Data: $(date)" >> error$i/error$i.txt
        done
    else
        for ((i=1; i<=100; i++)); do
            mkdir error$i
            echo "Nazwa pliku: error$i.txt" > error$i/error$i.txt
            echo "Skrypt: skrypt.sh" >> error$i/error$i.txt
            echo "Data: $(date)" >> error$i/error$i.txt
        done
    fi
elif [[ "$1" = "--help" ]] || [[ "$1" = "-h" ]]; then
    if [[ "$2" = "-a" ]]; then
        show_help
        echo "Dodatkowe flagi:"
        echo "    -f - flaga F"
        echo "    -g - flaga G"
    else
        show_help
    fi
elif [[ "$1" = "--date" ]] || [[ "$1" = "-d" ]]; then
    echo "Dzisiejsza data: $(date)"
elif [[ "$1" = "--init" ]]; then
    git clone <repozytorium> .
    export PATH=$(pwd):$PATH
    echo "Repozytorium zostało sklonowane i ścieżka została ustawiona w PATH."
elif [[ "$1" = "skrypt.sh" ]] && [[ "$2" = "-e" ]] && [[ -n "$3" ]]; then
    for ((i=1; i<=$3; i++)); do
        mkdir error$i
        echo "Nazwa pliku: error$i.txt" > error$i/error$i.txt
        echo "Skrypt: skrypt.sh" >> error$i/error$i.txt
        echo "Data: $(date)" >> error$i/error$i.txt
    done
else
    echo "Nieznana opcja. Użyj --help, aby wyświetlić dostępne opcje."
fi
