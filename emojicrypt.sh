#!/bin/bash
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'

declare -A emoji_map
emoji_map=(
  ["a"]="🍏"
  ["b"]="🍉"
  ["c"]="🍊"
  ["d"]="🍓"
  ["e"]="🍒"
  ["f"]="🍇"
  ["g"]="🍍"
  ["h"]="🥥"
  ["i"]="🥝"
  ["j"]="🍅"
  ["k"]="🍆"
  ["l"]="🥑"
  ["m"]="🥦"
  ["n"]="🥬"
  ["o"]="🥒"
  ["p"]="🍯"
  ["q"]="🌽"
  ["r"]="🥕"
  ["s"]="🧄"
  ["t"]="🧅"
  ["u"]="🥔"
  ["v"]="🍠"
  ["w"]="🥐"
  ["x"]="🥯"
  ["y"]="🍞"
  ["z"]="🥖"
  ["A"]="🥨"
  ["B"]="🧀"
  ["C"]="🥚"
  ["D"]="🍳"
  ["E"]="🥞"
  ["F"]="🧇"
  ["G"]="🥓"
  ["H"]="🥩"
  ["İ"]="🍗"
  ["J"]="🍖"
  ["K"]="🦴"
  ["L"]="🌭"
  ["M"]="🍔"
  ["N"]="🍟"
  ["O"]="🍕"
  ["P"]="🥪"
  ["Q"]="🥙"
  ["R"]="🧆"
  ["S"]="🌮"
  ["T"]="🌯"
  ["U"]="🥗"
  ["V"]="🥘"
  ["W"]="🥫"
  ["X"]="🍝"
  ["Y"]="🍜"
  ["Z"]="🍲"
  ["1"]="🍛"
  ["2"]="🍣"
  ["3"]="🍱"
  ["4"]="🥟"
  ["5"]="🦪"
  ["6"]="🍤"
  ["7"]="🍙"
  ["8"]="🍚"
  ["9"]="🍘"
  ["0"]="🍥"
  [" "]="🥮"
  ["."]="🍢"
  [","]="🍧"
  ["!"]="🍦"
  ["?"]="🥧"
  [":"]="🍰"
  [";"]="🎂"
  ["/"]="🍮"
  ["]"]="🍭"
  ["["]="🍬"
  ["("]="🍫"
  [")"]="🍿"
  ["<"]="🥜"
  [">"]="🌰"
  ["'"]="🥛"
  ["+"]="🍼"
  ["*"]="🍵"
  ["&"]="☕"
  ["%"]="🧃"
  ["^"]="🥤"
  ["#"]="🍶"
  ["="]="🍺"
  ["¾"]="🍻"
  ["{"]="🥂"
  ["}"]="🍷"
  ["|"]="🥃"
  ["@"]="🍸"
  ['"']="🍹"
  ["_"]="🧉"
  ["-"]="🍾"

)

function encrypt_emojis {
  text=$1
  encrypted_text=""
  for (( i=0; i<${#text}; i++ )); do
    character="${text:i:1}"
    if [[ -n ${emoji_map[$character]} ]]; then
      encrypted_text+="${emoji_map[$character]}"
    else
      encrypted_text+="$character"
    fi
  done
  echo "$encrypted_text"
}

function decrypt_cipher_text_with_emoji {
  encrypted_text=$1
  original_text=""
  for (( i=0; i<${#encrypted_text}; i++ )); do
    character="${encrypted_text:i:1}"
    if [[ $character == "🥮" ]]; then
      original_text+=" "
    else
      found=false
      for emoticon in "${!emoji_map[@]}"; do
        if [[ ${emoji_map[$emoticon]} == $character ]]; then
          original_text+="$emoticon"
          found=true
          break
        fi
      done
      if [[ $found == false ]]; then
        original_text+="$character"
      fi
    fi
  done
  echo "$original_text"
}

while true; do
  toilet -f bubble -F metal --gay "Encrypted Messaging with Emoji"
echo -e "${LIGHTCYAN}   ========================================"
echo -e "${LIGHTYELLOW}   Tool for Encrypting and Decrypting Text with Emojis"
echo -e "${LIGHTCYAN}   ========================================"
echo -e "${YELLOW} [1] ${RED}Encrypt Text With Emojis"
echo -e "${YELLOW} [2] ${RED}Decode Encrypted Emoji Text"
echo -e "${YELLOW} [3] ${LIGHTCYAN}Exit"
read -p "Make your choice: " choice

  case $choice in
    1)
      read -p "Enter the text to be encrypted: " text
      encrypted_text=$(encrypt_emojis "$text")
      echo "Encrypted emoji text: $encrypted_text"
      ;;
    2)
      read -p "Enter text with scrambled emoji to decode: " encrypted_text
      original_text=$(decrypt_cipher_text_with_emoji "$encrypted_text")
      echo "Decoded text: $original_text"
      ;;
    3)
      echo -e "${YELLOW} Checking out..."
      exit 0
      ;;
    *)
      echo -e "${YELLOW} Invalid selection! Please try again."
      ;;
  esac
done

