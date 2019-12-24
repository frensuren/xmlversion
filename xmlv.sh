#!/bin/bash
file="$@"

xmlv() {
    local f="$1"
    for i in $f; do
        [ -f "$i" ] || break
        if ! grep -qxF '<?xml version="1.0" encoding="utf-8"?>' $i; then
            cat $i | pbcopy && echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > $i && pbpaste >> $i
            echo "[$i] xml version appended"
            else
            echo "[$i] Already Processed"
        fi
    done;

}

# make sure filename supplied as command line arg else die
[ $# -eq 0 ] && { echo "Invalid Arguments. Usage: $0 filename";  }

#invoke function
xmlv "$file"
