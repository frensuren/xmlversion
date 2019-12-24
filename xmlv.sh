#!/bin/bash

xmlv() {
    for i in *.svg; do
        [ -f "$i" ] || break
        if ! grep -qxF '<?xml version="1.0" encoding="utf-8"?>' "$i"; then
            cat "$i" | pbcopy && echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "$i" && pbpaste >> "$i"
            echo "[$i] xml version appended"
            else
            echo "[$i] Already Processed"
        fi
    done;

}

#invoke function
xmlv
