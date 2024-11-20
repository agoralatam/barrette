#!bin/bash

# Creador: n4ss4u
# Fecha: 19-11-24
# version: barrette v1
# Comunidad: https://t.me/agoralatamc

bash main_banner.sh

# ---------------| Colores
RED='\033[0;31m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# ---------------| Eliminar caracteres ANSI para obtener un buen centrado
strip_colors() {
    echo "$1" | sed 's/\033\[[0-9;]*m//g'
}


# ---------------| Centrar contenido del banner en la terminal en dependencia del tamano
center_text() {
    local text="$1"
    local terminal_width=$(tput cols)
    while IFS= read -r line; do

        stripped_line=$(strip_colors "$line")
        line_length=${#stripped_line}

        # -----------------| Ajuste normal en caso de que no haya espacio para centrar el banner
        if (( line_length >= terminal_width )); then
            printf "%b\n" "$line"

	# -----------------| Ajuste centrado en caso de que haya espacio para centrar banner
        else
            spaces=$(( (terminal_width - line_length) / 2 ))
            printf "%*b%b\n" $spaces "" "$line"
        fi
    done <<< "$text"
}



# ---------------| Menu de opciones disponible para el usuario
center_text "$YELLOW
   ═══════════════════════════════════════════════════════$YELLOW

         Usage:$MAGENTA bash barrette.sh$YELLOW -a$MAGENTA <address>$YELLOW -t$MAGENTA <threads>$YELLOW -p$MAGENTA <port> [--flag-attack] 

--icmp-land-attack  --syn-land-attack  --tcp-land-attack
--udp-land-attack  --syn-flood-attack  --icmp-smurf-attack
--tcp-smurf-attack  --udp-smurf-attack  --ping-death-attack
      $YELLOW-a $MAGENTA(address)  $YELLOW-t $MAGENTA(threads)  $YELLOW-p $MAGENTA(port)$NC"


echo -e "\n"


address=''
threads=''
port=''


# -----------------| Filtrar la entrada de los parametros
# -------| Verificar que tipo de ataque se selecciono
# -------| Guardar los argumentos de los paramtros cortos
while [[ $# -gt 0 ]]; do
    case "$1" in
        --icmp-land-attack|--syn-land-attack|--tcp-land-attack|--udp-land-attack|--icmp-smurf-attack|--tcp-smurf-attack|--udp-smurf-attack|--syn-flood-attack|--icmp-death-attack)
            attack_type="$1"
            shift
            ;;
        -a) shift; address="$1"; shift ;;
        -t) shift; threads="$1"; shift ;;
        -p) shift; port="$1"; shift ;;
        *)
            echo -e "${RED} Unknown option: $1 ${NC}"
	    echo -e "${YELLOW}Usage:${MAGENTA} bash barrette.sh${YELLOW} -a${MAGENTA} <address>${YELLOW} -t${MAGENTA} <threads>${YELLOW} -p${MAGENTA} <port> [--flag-attack]"
            exit 1
            ;;
    esac
done


# -----------------| Comprobar de que todos los parametros fuereon especificados
if [ -z "$address" ] || [ -z "$threads" ] || [ -z "$port" ]; then
    echo -e "${RED}Error: Missing required parameters.${NC}"
    echo -e "${YELLOW}Usage:${MAGENTA} bash barrette.sh${YELLOW} -a${MAGENTA} <address>${YELLOW} -t${MAGENTA} <threads>${YELLOW} -p${MAGENTA} <port> [--flag-attack]${NC}"
    exit 1
fi


# -----------------| Ejecutar el script vinculado al ataque especificado
if [ -n "$attack_type" ]; then
    case "$attack_type" in
        --icmp-land-attack)
            echo -e "${YELLOW}Running ${RED}ICMP Land Attack ${YELLOW}with Address: $address, Threads: $threads, Port: $port\n${NC}"
            bash ./modules_attack/icmp_land_attack.sh "$address" "$threads" "$port"
            ;;
        --syn-land-attack)
            echo -e "${YELLOW}Running ${RED}SYN Land Attack ${YELLOW}with Address: $address, Threads: $threads, Port: $port\n${NC}"
            bash ./modules_attack/syn_land_attack.sh "$address" "$threads" "$port"
            ;;
        --tcp-land-attack)
            echo -e "${YELLOW}Running ${RED}TCP Land Attack ${YELLOW}with Address: $address, Threads: $threads, Port: $port\n${NC}"
            bash ./modules_attack/tcp_land__attack.sh "$address" "$threads" "$port"
            ;;
        --udp-land-attack)
            echo -e "${YELLOW}Running ${RED}UDP Land Attack ${YELLOW}with Address: $address, Threads: $threads, Port: $port\n${NC}"
            bash ./modules_attack/udp_land_attack.sh "$address" "$threads" "$port"
            ;;
        --icmp-smurf-attack)
            echo -e "${YELLOW}Running ${RED}ICMP Smurf Attack ${YELLOW}with Address: $address, Threads: $threads, Port: $port\n${NC}"
            bash ./modules_attack/icmp_smurf_attack.sh "$address" "$threads" "$port"
            ;;
        --tcp-smurf-attack)
            echo -e "${YELLOW}Running ${RED}TCP Smurf Attack ${YELLOW}with Address: $address, Threads: $threads, Port: $port\n${NC}"
            bash ./modules_attack/tcp_smurf_attack.sh "$address" "$threads" "$port"
            ;;
        --udp-smurf-attack)
            echo -e "${YELLOW}Running ${RED}UDP Smurf Attack ${YELLOW}with Address: $address, Threads: $threads, Port: $port\n${NC}"
            bash ./modules_attack/udp_smurf_attack.sh "$address" "$threads" "$port"
            ;;
        --syn-flood-attack)
            echo -e "${YELLOW}Running ${RED}SYN Flood Attack ${YELLOW}with Address: $address, Threads: $threads, Port: $port\n${NC}"
            bash ./modules_attack/syn_flood_attack.sh "$address" "$threads" "$port"
            ;;
        --icmp-death-attack)
            echo -e "${YELLOW}Running ${RED}ICMP of Death Attack ${YELLOW}with Address: $address, Threads: $threads, Port: $port\n${NC}"
            bash ./modules_attack/icmp_death_attack.sh "$address" "$threads" "$port"
            ;;
        *)
            echo "${RED}Unknown attack type: $attack_type${NC}"
            exit 1
            ;;
    esac
fi
