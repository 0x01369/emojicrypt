from art import *

emoji_map = {
    "a": "🍏",
    "b": "🍉",
    "c": "🍊",
    "d": "🍓",
    "e": "🍒",
    "f": "🍇",
    "g": "🍍",
    "h": "🥥",
    "i": "🥝",
    "j": "🍅",
    "k": "🍆",
    "l": "🥑",
    "m": "🥦",
    "n": "🥬",
    "o": "🥒",
    "p": "🍯",
    "q": "🌽",
    "r": "🥕",
    "s": "🧄",
    "t": "🧅",
    "u": "🥔",
    "v": "🍠",
    "w": "🥐",
    "x": "🥯",
    "y": "🍞",
    "z": "🥖",
    "A": "🥨",
    "B": "🧀",
    "C": "🥚",
    "D": "🍳",
    "E": "🥞",
    "F": "🧇",
    "G": "🥓",
    "H": "🥩",
    "İ": "🍗",
    "J": "🍖",
    "K": "🦴",
    "L": "🌭",
    "M": "🍔",
    "N": "🍟",
    "O": "🍕",
    "P": "🥪",
    "Q": "🥙",
    "R": "🧆",
    "S": "🌮",
    "T": "🌯",
    "U": "🥗",
    "V": "🥘",
    "W": "🥫",
    "X": "🍝",
    "Y": "🍜",
    "Z": "🍲",
    "1": "🍛",
    "2": "🍣",
    "3": "🍱",
    "4": "🥟",
    "5": "🦪",
    "6": "🍤",
    "7": "🍙",
    "8": "🍚",
    "9": "🍘",
    "0": "🍥",
    " ": "🥮",
    ".": "🍢",
    ",": "🍧",
    "!": "🍦",
    "?": "🥧",
    ":": "🍰",
    ";": "🎂",
    "/": "🍮",
    "]": "🍭",
    "[": "🍬",
    "(": "🍫",
    ")": "🍿",
    "<": "🥜",
    ">": "🌰",
    "'": "🥛",
    "+": "🍼",
    "*": "🍵",
    "&": "☕",
    "%": "🧃",
    "^": "🥤",
    "#": "🍶",
    "=": "🍺",
    "¾": "🍻",
    "{": "🥂",
    "}": "🍷",
    "|": "🥃",
    "@": "🍸",
    '"': "🍹",
    "_": "🧉",
    "-": "🍾"
}

def encrypt_emojis(text):
    encrypted_text = ""
    for character in text:
        if character in emoji_map:
            encrypted_text += emoji_map[character]
        else:
            encrypted_text += character
    return encrypted_text

def decrypt_cipher_text_with_emoji(encrypted_text):
    original_text = ""
    i = 0
    while i < len(encrypted_text):
        character = encrypted_text[i]
        if character == "🥮":
            original_text += " "
        else:
            found = False
            for emoticon, emoji in emoji_map.items():
                if emoji == character:
                    original_text += emoticon
                    found = True
                    break
            if not found:
                original_text += character
        i += 1
    return original_text

while True:
    text = text2art("Encrypted Messaging with Emoji", font="figlet", chr_ignore=True)
    print(text)
    print("========================================")
    print("Encrypted Messaging with Emoji")
    print("========================================")
    print("Tool for Encrypting and Decrypting Text with Emojis")
    print("========================================")
    print("1. Encrypt Text With Emojis")
    print("2. Decode Encrypted Emoji Text")
    print("3. Exit")
    choice = input("Make your choice: ")

    if choice == "1":
        text = input("Enter the text to be encrypted: ")
        encrypted_text = encrypt_emojis(text)
        print("Encrypted emoji text:", encrypted_text)
    elif choice == "2":
        encrypted_text = input("Enter text with scrambled emoji to decode: ")
        original_text = decrypt_cipher_text_with_emoji(encrypted_text)
        print("Decoded text:", original_text)
    elif choice == "3":
        print("Checking out...")
        break
    else:
        print("Invalid selection! Please try again.")

