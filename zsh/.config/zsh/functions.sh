mkcd() { mkdir -p "$@" && cd "$@"; }    # mkdir and cd in one


# Create a new helper script in ~/utilities
newutil() {
  local script="$HOME/utilities/$1"
  if [ -z "$1" ]; then
    echo "Usage: newutil <scriptname>"
    return 1
  fi
  if [ -e "$script" ]; then
    echo "Error: $script already exists"
    return 1
  fi

  cat <<'EOF' > "$script"
#!/usr/bin/env zsh

# your code here
EOF

  chmod +x "$script"
  echo "Created $script"
}

# Get an access token and store it as $TOKEN in current shell
get_token() {
  source ~/utilities/get_token.sh
}

# Get an access token and store it as $TOKEN in current shell
get_bill_token() {
  source ~/utilities/get_bill_token.sh
}

sensai() {
  local BASE="${SENSAI_BASE:-http://localhost:8000/api/v1}"
  local endpoint="${1:-}"; shift || true
  local url

  # If first arg looks like a full URL (has scheme), use it as-is.
  if [[ "$endpoint" =~ ^https?:// ]]; then
    url="$endpoint"
  else
    # Treat it as an endpoint like "payments" or "payments/123"
    endpoint="${endpoint#/}"  # strip leading slash
    # Add trailing slash for single-segment endpoints like "payments"
    if [[ "$endpoint" != */* && "$endpoint" != */ && "$endpoint" != *\?* ]]; then
      endpoint="$endpoint/"
    fi
    url="$BASE/$endpoint"
  fi

  curl -fsS -H "Authorization: Bearer $TOKEN" "$@" "$url" | jq .
}

# NOTE: This will include symlinks
zetlist() {
    cd $ZETDIR
    for d in */ ; do
        if [[ $d =~ ^[[:digit:]] ]]; then
            echo "${d%/} - $(head -1 $d/Readme.md | cut -c 3-)"
        fi
    done
}


zet() {
    note=$(date -u +%Y%m%d%H%M%S)
    mkdir -p $ZETDIR$note

    # concat each arg to create the title
    title=""
    for arg in "$@"
    do
        title+="$arg "
    done
    title=${title%?}     # remove the extra space at the end of title

    # send the title to a new Readme in the note folder
    echo "# $title\n" >> $ZETDIR$note/Readme.md

    # Open file, go to last line and enter insert mode
    vim -c "norm Go" -c "startinsert" "$ZETDIR$note/Readme.md"

    # Grab the title from the vim file since I may have changed it when writing the note
    # Be sure to strip off the '#' and the leading space
    newTitle=$(head -1 $ZETDIR$note/Readme.md | sed 's/#//g' | sed 's/^[[:space:]]*//')
    echo "\nKey:\n**$note**" >> $ZETDIR$note/Readme.md

    # push the new note to git
    git -C $ZETDIR add $ZETDIR$note 
    git -C $ZETDIR ci -m "$newTitle"
    git -C $ZETDIR push
}

zetgrab () {
    cd $ZETDIR
    if [[ $# -eq 0 ]]; then
        grepTerm=""
    else
        grepTerm="\"$@\""
        notes=$(zetlist | grep -i "$@" | awk '{print $1}')

        # what if theres multiple results?
        vim $notes/Readme.md
    fi
}

savenotes() {
    cd $ZETDIR
    git aa
    git ci -m "save notes"
    git push
}

