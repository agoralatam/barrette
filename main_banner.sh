#!/bin/bash
clear

# Colores
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

       # -----------------| Ajuste normal en caso de que no haya espacio para centrar el banner
	 else
            spaces=$(( (terminal_width - line_length) / 2 ))
             printf "%*b%b\n" $spaces "" "$line"
        fi
    done <<< "$text"
}

# -------------| Banner principal
agora_logo="
$YELLOW
   .S_SSSs     .S_SSSs     .S_sSSs     .S_sSSs      sSSs  sdSS_SSSSSSbs  sdSS_SSSSSSbs    sSSs
  .SS~SSSSS   .SS~SSSSS   .SS~YS%%b   .SS~YS%%b    d%%SP  YSSS~S%SSSSSP  YSSS~S%SSSSSP   d%%Ss
  S%S   SSSS  S%S   SSSS  S%S    S%b  S%S    S%b  d%S          S%S            S%S       d%S
  S%S    S%S  S%S    S%S  S%S    S%S  S%S    S%S  S%S          S%S            S%S       S%S
  S%S SSSS%P  S%S SSSS%S  S%S    d*S  S%S    d*S  S&S          S&S            S&S       S&S
    S&S  SSSY   S&S  SSS%S  S&S   .S*S  S&S   .S*S  S&S_Ss       S&S            S&S       S&S_Ss
$MAGENTA     S&S    S&S  S&S    S&S  S&S_sdSSS   S&S_sdSSS   S&S~SP       S&S            S&S       S&S~SP
  S&S    S&S  S&S    S&S  S&S~YSY%b   S&S~YSY%b   S&S          S&S            S&S       S&S
 $YELLOW S*S    S&S  S*S    S&S  S*S    S%b  S*S    S%b  S*b          S*S            S*S       S*b
  S*S    S*S  S*S    S*S  S*S    S%S  S*S    S%S  S*S.         S*S            S*S       S*S.
    S*S SSSSP   S*S    S*S  S*S    S&S  S*S    S&S   SSSbs       S*S            S*S        SSSbs
    S*S  SSY    SSS    S*S  S*S    SSS  S*S    SSS    YSSP       S*S            S*S         YSSP

╔═══════════════════════════════════════════════╗
      ║     $YELLOW Created by$MAGENTA n4ss4u$YELLOW from AGORA$YELLOW with$RED ❤ $YELLOW     ║
    ║       $YELLOW       2024$MAGENTA -$YELLOW barrette$MAGENTA v1 $YELLOW              ║
 ║      Telegram: $MAGENTA https://t.me/agoralatamc $YELLOW     ║
 ║   Disclaimer: $MAGENTA for educational purposes only $YELLOW ║
╚═══════════════════════════════════════════════╝
$NC"

# -----------------| Obtener tabla de IPs y MACs para mostrar
result="$MAGENTA$(sudo arp-scan --localnet 2>/dev/null | grep -Po '(?<!: )(.{2}:.{2}:.{2}:.{2}:.{2}:.{2})|^\b\d+\.\d+\.\d+\.\d+\b' | paste -d ' ' - -)"


center_text "$agora_logo"
center_text "
$result"

