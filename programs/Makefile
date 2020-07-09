# Makefile
main: Lexer.x Parser.y
	alex Lexer.x -o Lexer.hs
	happy Parser.y -o Parser.hs

lex: Lexer.x
	alex Lexer.x -o Lexer.hs

parse: Parser.y
	happy Parser.y -o Parser.hs

clean:
	rm -f Lexer.hs Parser.hs