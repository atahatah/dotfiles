#!/bin/bash

ESC=$(printf '\033') # \e や \x1b または $'\e' は使用しない
printf "${ESC}[30m%s${ESC}[m\n" 'STRINGSTRING \033[30m...\033[m'
printf "${ESC}[31m%s${ESC}[m\n" 'STRINGSTRING \033[31m...\033[m'
printf "${ESC}[32m%s${ESC}[m\n" 'STRINGSTRING \033[32m...\033[m'
printf "${ESC}[33m%s${ESC}[m\n" 'STRINGSTRING \033[33m...\033[m'
printf "${ESC}[34m%s${ESC}[m\n" 'STRINGSTRING \033[34m...\033[m'
printf "${ESC}[35m%s${ESC}[m\n" 'STRINGSTRING \033[35m...\033[m'
printf "${ESC}[36m%s${ESC}[m\n" 'STRINGSTRING \033[36m...\033[m'
printf "${ESC}[37m%s${ESC}[m\n" 'STRINGSTRING \033[37m...\033[m'
printf "${ESC}[40m%s${ESC}[m\n" 'STRINGSTRING \033[40m...\033[m'
printf "${ESC}[41m%s${ESC}[m\n" 'STRINGSTRING \033[41m...\033[m'
printf "${ESC}[42m%s${ESC}[m\n" 'STRINGSTRING \033[42m...\033[m'
printf "${ESC}[43m%s${ESC}[m\n" 'STRINGSTRING \033[43m...\033[m'
printf "${ESC}[44m%s${ESC}[m\n" 'STRINGSTRING \033[44m...\033[m'
printf "${ESC}[45m%s${ESC}[m\n" 'STRINGSTRING \033[45m...\033[m'
printf "${ESC}[46m%s${ESC}[m\n" 'STRINGSTRING \033[46m...\033[m'
printf "${ESC}[47m%s${ESC}[m\n" 'STRINGSTRING \033[47m...\033[m'
printf "${ESC}[1m%s${ESC}[m\n" 'STRINGSTRING bold'
printf "${ESC}[2m%s${ESC}[m\n" 'STRINGSTRING dim'
printf "${ESC}[3m%s${ESC}[m\n" 'STRINGSTRING ?'
printf "${ESC}[4m%s${ESC}[m\n" 'STRINGSTRING underline'
printf "${ESC}[5m%s${ESC}[m\n" 'STRINGSTRING blink'
printf "${ESC}[6m%s${ESC}[m\n" 'STRINGSTRING ?'
printf "${ESC}[7m%s${ESC}[m\n" 'STRINGSTRING reversal'
printf "${ESC}[8m%s${ESC}[m\n" 'STRINGSTRING not show'

cyan=$(printf '\033[36m')
reset_color=$(printf '\033[m')
printf "normal${cyan}cyan${reset_color}nomal\n"