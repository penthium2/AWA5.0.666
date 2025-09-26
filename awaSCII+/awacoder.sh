#!/usr/bin/env bash
################# fonction area #################
## awalogo function
awalogo() {
echo "             █████╗ ██╗    ██╗ █████╗
            ██╔══██╗██║    ██║██╔══██╗
            ███████║██║ █╗ ██║███████║
            ██╔══██║██║███╗██║██╔══██║
            ██║  ██║╚███╔███╔╝██║  ██║
            ╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝

███████╗    ██████╗     ██████╗  ██████╗  ██████╗
██╔════╝   ██╔═████╗   ██╔════╝ ██╔════╝ ██╔════╝
███████╗   ██║██╔██║   ███████╗ ███████╗ ███████╗
╚════██║   ████╔╝██║   ██╔═══██╗██╔═══██╗██╔═══██╗
███████║██╗╚██████╔╝██╗╚██████╔╝╚██████╔╝╚██████╔╝
╚══════╝╚═╝ ╚═════╝ ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝
                By Penthium2 BZHack
"
}
## awacode function
awacode() {
  declare -A awascii=(
      [0]='A'   [1]='W'  [2]='a'   [3]='w'   [4]='J'  [5]='E'  [6]='L'  [7]='Y'   [8]='H'  [9]='O'
      [10]='S'  [11]='I' [12]='U'  [13]='M'  [14]='j' [15]='e' [16]='l' [17]='y'  [18]='h' [19]='o'
      [20]='s'  [21]='i' [22]='u'  [23]='m'  [24]='P' [25]='C' [26]='N' [27]='T'  [28]='p' [29]='c'
      [30]='n'  [31]='t' [32]='B'  [33]='D'  [34]='F' [35]='G' [36]='R' [37]='b'  [38]='d' [39]='f'
      [40]='g'  [41]='r' [42]='0'  [43]='1'  [44]='2' [45]='3' [46]='4' [47]='5'  [48]='6' [49]='7'
      [50]='8'  [51]='9' [52]='💩' [53]='.'  [54]=',' [55]='!' [56]='~' [57]=')'  [58]='(' [59]='-'
      [60]=':'  [61]='=' [62]=';'  [63]='🍆' [64]='"' [65]='#' [66]='$' [67]='%'  [68]='&' [69]="'"
      [70]='\*' [71]='+' [72]='/'  [73]='<'  [74]='>' [75]='?' [76]='@' [77]='K'  [78]='Q' [79]='V'
      [80]='X'  [81]='Z' [82]='['  [83]='\'  [84]=']' [85]='^' [86]='_' [87]='\`' [88]='{' [89]='|'
      [90]='}'  [91]='k' [92]='q'  [93]='v'  [94]='x' [95]='z' [96]='💨'
  )
  awa="$(echo "$awa" | awk '{ORS="🍆"}1' | sed -E 's/ /💩/g;s/(.)/\1 /g;s/\t/💨/g;s/\*/\\*/g;s/`/\\`/g')"
  for awawawa in $awa ; do
    for awanum in "${!awascii[@]}"; do
      if [[ "${awascii[$awanum]}" == "$awawawa" ]]; then
        printf "%08d\n" "$(echo "obase=2; $awanum" | bc)" | sed -E 's/0/ awa /g;s/1/wa/g;s/ +/ /g;s/((^| )awa) (wa)/\1\3/g'
      fi
    done
  done | tr '\n' ',' | sed 's/,$//'
  echo
}
## awahelp function
awahelp() {
  awalogo
  cat <<EOF
Usage: $0 [options] [text]

Encode text to awaSCII+.

Options:
  -i, --input <file>      Read text to encode from a file
  -o, --output <file>     Write output to a file
  -h, --help              Show this help message

Examples:
  $0 'penthium2'
  $0 -i myawafile.txt
  $0 -i myawafile.txt -o output.awa
  $0 -h

If no text or file is provided, nothing will be encoded.
EOF
}
## awaoption function
awaoption() {
  if [[ -z "$1" ]]; then
      awahelp
      exit 0
  fi
  while [[ $# -gt 0 ]]; do
      case "$1" in
          -i|--input)
              awainput="$2"
              if [[ -n "$awainput" ]]; then
                  if [[ -f "$awainput" ]]; then
                      awa="$(cat "$awainput")"
                  else
                      echo "Fichier d'entrée introuvable: $awainput" >&2
                      exit 1
                  fi
              fi
              shift 2
              ;;
          -o|--output)
              awaoutput="$2"
              shift 2
              ;;
          -h|--help)
              awahelp
              exit 0
              ;;
          *)
              if [[ -z "$awa" ]]; then
                  awa="$1"
              fi
              shift
              ;;
      esac
  done
}
## awamain function
awamain() {
  if [[ -n "$awaoutput" ]]; then
      awacode > "$awaoutput"
  else
      awacode
  fi
}
################# Script area #################
awaoption "$@"
awamain