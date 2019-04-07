This Makefile (and perl script) implement two very simple solutions to provide a baseline (and submission size limit) for the [http://golf.horse](http://golf.horse) charts.
Neither is intended to be great, but they at least provide a reasonable first-cut size limit.

## Basic

To translate a wordlist ```ten-hundred``` to a javascript file containing that wordlist as a string, use:
```
	make ten-hundred-basic.js
```

This strategy is included because it's quite good for short wordlists.

## Zlib

To translate a wordlist ```wordlist.asc``` into a javascript package containing a gzip-compressed version along with a decompressor, use:
```
	make wordlist.asc-zlib.js
```

Note that you must have also installed the ```browserify``` and ```uglify-js``` modules with npm.

This strategy is included because it's the dumbest compression-based strategy I could come up with, and there's lots of room to improve (there's about ~60k of code in there).
