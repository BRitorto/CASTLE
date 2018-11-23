
/* Represents the many different ways we can access our data 
*/
%union {
	Node *node;
	int token;
	char* string;
}

/* Define our terminal symbols (tokens). This should match our lexa.l lex file. We also define the node type they represent.
*/

%token <string> 
%token <node> EQUALS EQUALSCMP DIFF LTHAN LETHAN GTHAN GETHAN LPAREN RPAREN LBRACK RBRACK COMMA DOT PLUS MINUS MULT DIV


/* Define the type of node our nonterminal symbols represent. The types refer to the %union declaration above. 
*/
