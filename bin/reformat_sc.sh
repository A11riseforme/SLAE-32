#!/bin/bash
# One-liner's multi-line shellcode, painlessly, heredoc-style
# Written by Chase Hatch
# Very similar to the following, but with bytecount:
# cat <<'EOF' | tr -d '\n' | sed -e 's/EOF//g' -e 's/["; ]//g' -e "s/[']//g" -e 's/.*/\#\ \"&\"/' && echo -e "\n"

temp=''
declare -a the_array
bytecount=0
helptxt="One-liner's multi-line shellcode, painlessly, heredoc-style\n[!] USAGE: $0\n"
took_pipe=0
if [[ -p /dev/stdin ]]; then
        echo "[!] Receiving pipe."
        while IFS= read line
        do
                if [[ $(echo $line |grep -E "\\x") ]]; then
                        the_array[j]="$line"
                        let j=$(( $j + 1 ))
                fi
        done
	let took_pipe=$(( $took_pipe + 1))
else
	if [[ $# -ge 1 ]]; then echo -e "$helptxt"; exit 1; fi
	echo -e "[!] Enter quoted, multi-line shellcode (sans variable, '=', etc)."
	echo -e "[!] Heredoc-stye. Stop input with line having only 'EOF', no quotes:"
	while [[ "$temp" != "EOF" ]];
	do
		read -r temp
		the_array+=("$temp")
	done
fi


shellcode=$(echo "${the_array[@]}" |\
		tr -d '\n' |\
		sed -e 's/EOF//g' \
		-e 's/\bunsigned\b//g' \
		-e 's/\bchar\b//g' \
		-e 's/\bbuf\b//g' \
		-e 's/\[\]//g' \
		-e 's/["; =*]//g' \
		-e "s/[']//g" \
		-e 's/.*/\"&\"/')

if [[ $took_pipe -eq 1 ]]; then
	tmp="$(echo $shellcode |sed 's/x/\\x/g')"
	shellcode=$tmp
fi

bytecount=$(perl -e "printf($shellcode);" |wc -c)


echo -e "\n###"
echo -ne "#  "
printf "%s" $shellcode
echo -e "  # $bytecount bytes"
echo -e "###"

