#!/bin/bash
root="."
echo "<html>"
echo "<body>"
echo "<ul>"
for file in "$root"/*/*/*; do
    parentpath="${file#*/}"
    parent="${parentpath%/*}"
    filename="${file##*/}"
    if [[ -z $oldparent ]]; then
        echo "  <li> $parent </li>" && oldparent="$parent"
        echo "  <ul>"
    elif [[ $oldparent != $parent ]]; then
        echo "  </ul>"
        echo "  <li> $parent </li>" && oldparent="$parent"
        echo "  <ul>"
    fi
    echo "    <li><a href=\"$parentpath\" target=\"_blank\">$filename</a></li>"
done
echo "  </ul>"
echo "</ul>"
echo "</body>"
echo "</html>"
