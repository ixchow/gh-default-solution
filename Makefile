all : \
	ten-hundred-basic.js \
	wordlist.asc-zlib.js \

ECHO = /bin/echo

%-zlib.js : % Makefile
	rm -f '$@'
	$(ECHO) -n 'console.log(require("pako").inflate(Buffer.from("' >> '$@'
	#NOTE: thanks to https://stackoverflow.com/questions/1654021/how-can-i-delete-a-newline-if-it-is-the-last-character-in-a-file/40569742
	awk 'NR > 1 { print prev } { prev=$$0 } END { ORS=""; print }' '$<' | gzip --best | base64 -w0 >> '$@'
	$(ECHO) -n '", "base64"), {to:"string"}))' >> '$@'
	node_modules/browserify/bin/cmd.js '$@' --outfile '$@'
	node_modules/uglify-js/bin/uglifyjs '$@' --compress --mangle --output '$@'

%-basic.js : % Makefile
	rm -f '$@'
	perl basic.pl < '$<' > '$@'
