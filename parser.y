/* Declarations */
%{

#include <stdio.h>
#include <stdlib.h>
#include "node.h"

extern int yylex();
static Node * root;

%}

/* Represents the many different ways we can access our data 
*/

%union {
	struct Node_t * node;
	int integer;
	char * string;
}

/* Define our terminal symbols (tokens). This should
   match our tokens.l lex file. We also define the node type
   they represent.
 */

%token <integer> INT
%token <string> ID STRING
%token <node> 	IF ELSE DO WHILE 
				AND OR TRUE FALSE NOT
				PRINT 
				EQUALS EQUALSCMP DIFF LTHAN LETHAN GTHAN GETHAN 
				LPAREN RPAREN LBRACK RBRACK ENDLINE 
				PLUS MINUS MULT DIV
				INT_T STRING_T

/* Define the type of node our nonterminal symbols represent.
   The types refer to the %union declaration above.
 */

%type <node> statement expression definition assignment print operand comparator arguments operator


/* Operator precedence for mathematical operators */

%right EQUALS LETHAN GTHAN GETHAN LTHAN
%left PLUS MINUS
%left MULT DIV
%left AND OR EQUALSCMP DIFF

%start program

%%

program 	: statement 
				{
					root = $1;
					print_program(root);
				}
			;

statement 	: statement statement
				{
					$$ = new_tree();
					add_node($$, $1);
					add_node($$, $2);
				}
			;
statement	: ENDLINE
				{
					$$ = new_tree();
					add_terminal_node($$, endline_);
				}

			| IF LPAREN expression RPAREN LBRACK statement RBRACK
				{
					$$ = new_tree();
					add_terminal_node($$, if_);
					add_terminal_node($$, lparen_);
					add_node($$, $3);
					add_terminal_node($$, rparen_);
					add_terminal_node($$, lbrack_);
					add_node($$, $6);
					add_terminal_node($$, rbrack_);
				}
			| IF LPAREN expression RPAREN LBRACK statement RBRACK ELSE LBRACK statement RBRACK
				{
					$$ = new_tree();
					add_terminal_node($$, if_);
					add_terminal_node($$, lparen_);
					add_node($$, $3);
					add_terminal_node($$, rparen_);
					add_terminal_node($$, lbrack_);
					add_node($$, $6);
					add_terminal_node($$, rbrack_);
					add_terminal_node($$, else_);
					add_terminal_node($$, lbrack_);
					add_node($$, $10);
					add_terminal_node($$, rbrack_);
				}
			| WHILE LPAREN expression RPAREN LBRACK statement RBRACK
				{
					$$=new_tree();
					add_terminal_node($$, while_);
					add_terminal_node($$, lparen_);
					add_node($$, $3);
					add_terminal_node($$, rparen_);
					add_terminal_node($$, lbrack_);
					add_node($$, $6);
					add_terminal_node($$, rbrack_);
				}
			| DO LBRACK statement RBRACK WHILE LPAREN expression RPAREN
				{
					$$=new_tree();
					add_terminal_node($$, do_);
					add_terminal_node($$, lbrack_);
					add_node($$, $3);
					add_terminal_node($$, rbrack_);
					add_terminal_node($$, while_);
					add_terminal_node($$, lparen_);
					add_node($$, $7);
					add_terminal_node($$, rparen_);
				}
			| definition ENDLINE
				{
					$$ = new_tree();
					add_node($$, $1);
					add_terminal_node($$, endline_);
				}
			| assignment ENDLINE
				{
					$$ = new_tree();
					add_node($$, $1);
					add_terminal_node($$, endline_);
				}
			| print ENDLINE
				{
					$$ = new_tree();
					add_node($$, $1);
					add_terminal_node($$, endline_);
				}
			| expression ENDLINE
				{
					$$ = new_tree();
					add_node($$, $1);
					add_terminal_node($$, endline_);
				}
			;

expression	: operand comparator operand
				{
					$$ = new_tree();
					$$->token = $2->token;
					add_node($$, $1);
					add_node($$, $2);
					add_node($$, $3);
				}
			| NOT expression
				{
					$$ = new_tree();
					add_terminal_node($$, not_);
					add_node($$, $2);
				}	
			| LPAREN expression RPAREN AND LPAREN expression RPAREN
				{
					$$ = new_tree();
					add_terminal_node($$, lparen_);
					add_node($$, $2);
					add_terminal_node($$, rparen_);
					add_terminal_node($$, and_);
					add_terminal_node($$, lparen_);
					add_node($$, $6);
					add_terminal_node($$, rparen_);
				}
			| LPAREN expression RPAREN OR LPAREN expression RPAREN
				{
					$$ = new_tree();
					add_terminal_node($$, lparen_);
					add_node($$, $2);
					add_terminal_node($$, rparen_);
					add_terminal_node($$, or_);
					add_terminal_node($$, lparen_);
					add_node($$, $6);
					add_terminal_node($$, rparen_);
				}
			| TRUE
				{
					$$ = new_tree();
					add_terminal_node($$, true_);
				}
			| FALSE
				{
					$$ = new_tree();
					add_terminal_node($$, false_);
				}
			;

definition : INT_T assignment
				{
					$$ = new_tree();
					add_terminal_node($$, int_t_);
					add_node($$, $2);
				}
			| STRING_T assignment
				{
					$$ = new_tree();
					add_terminal_node($$, string_t_);
					add_node($$, $2);
				}
			;

print 		: PRINT arguments
				{
					$$ = new_tree();
					add_terminal_node($$, print_);
					add_node($$, $2);
					$$->token = print_;
				}
			;

operand		: INT
				{
					$$ = new_tree();
					char * aux = malloc(33);
					sprintf(aux, "%d", $1);
					add_terminal_node_with_value($$, int_, aux);
				}
			| STRING
				{
					$$ = new_tree();
					add_terminal_node_with_value($$, string_, $1);
				}
			| ID
				{
					$$ = new_tree();
					add_terminal_node_with_value($$, id_, $1);
				}
			| operand operator operand
				{
					$$ = new_tree();
					add_node($$, $1);
					add_node($$, $2);
					add_node($$, $3);
					$$->token = $2->token;
				}
			| LPAREN operand RPAREN
				{
					$$ = new_tree();
					add_terminal_node($$, lparen_);
					add_node($$, $2);
					add_terminal_node($$, rparen_);
				}
			;

comparator	: EQUALSCMP
				{
					$$ = new_tree();
					add_terminal_node($$, equalscmp_);
					$$->token = equalscmp_;
				}
			| DIFF
				{
					$$ = new_tree();
					add_terminal_node($$, diff_);
					$$->token = diff_;
				}
			| LTHAN
				{
					$$ = new_tree();
					add_terminal_node($$, lthan_);
				}
			| LETHAN
				{
					$$ = new_tree();
					add_terminal_node($$, lethan_);
				}
			| GTHAN
				{
					$$ = new_tree();
					add_terminal_node($$, gthan_);
				}
			| GETHAN
				{
					$$ = new_tree();
					add_terminal_node($$, gethan_);
				}
			;

assignment : ID EQUALS operand
				{
					$$ = new_tree();
					add_terminal_node_with_value($$, id_, $1);
					add_terminal_node($$, equals_);
					add_node($$, $3);
				}
			;

arguments 	: expression
				{
					$$ = new_tree();
					add_node($$, $1);
				}
			| operand
				{
					$$ = new_tree();
					add_node($$, $1);
				}	
			;

operator 	: PLUS
				{
					$$ = new_tree();
					add_terminal_node($$, plus_);
				} 
			| MINUS 
				{
					$$ = new_tree();
					add_terminal_node($$, minus_);
				} 
			| AND 
				{
					$$ = new_tree();
					add_terminal_node($$, and_);
					$$->token = and_;
				} 
			| OR 
				{
					$$ = new_tree();
					add_terminal_node($$, or_);
					$$->token = or_;
				} 
			| MULT 
				{
					$$ = new_tree();
					add_terminal_node($$, mult_);
				} 
			| DIV 
				{
					$$ = new_tree();
					add_terminal_node($$, div_);
				}
			;
%%

int main()
{
	yyparse();
	return 0;
}

int yyerror(const char * s) 
{
	fprintf(stderr, "%s\n", s);
	return 0;
}
