#!/bin/bash

# Percorso della vault Obsidian
VAULT_PATH="/mnt/c/Users/TRZLCU97E/home/obsidian-vault"

# Ottieni data e ora attuali
DATE=$(date +"%d-%m-%Y")
DATETIME_FILE=$(date +"%Y-%m-%d_%H-%M-%S")
TIME=$(date +"%H:%M")

# Nome del file
FILENAME="${DATETIME_FILE}.md"
FILEPATH="${VAULT_PATH}/${FILENAME}"

# Crea il frontmatter e il template
cat > "$FILEPATH" << EOF
---
date: $DATE
tags:
  - quicknotes
links:
  - "[[cheatsheet]]"
---
# Quick note $DATE

\`\`\`
EOF

# Leggi input da stdin (da pipe o cat) se disponibile
if [ ! -t 0 ]; then
    cat >> "$FILEPATH"
else
    echo "Insert text from other programs here inside backticks." >> "$FILEPATH"
fi

# Chiudi il blocco di codice
echo '```' >> "$FILEPATH"

echo "Nota creata: $FILEPATH"
