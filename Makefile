
all: npm-install build test

npm-install:
	npm install

build:
	./node_modules/.bin/jison bnf.y bnf.l
	mv bnf.js parser.js

	./node_modules/.bin/jison ebnf.y
	mv ebnf.js transform-parser.js

test:
	node tests/all-tests.js




clean:
	-rm -f parser.js
	-rm -f transform-parser.js
	-rm -rf node_modules/

superclean: clean
	-find . -type d -name 'node_modules' -exec rm -rf "{}" \;



.PHONY: all npm-install build test clean superclean
