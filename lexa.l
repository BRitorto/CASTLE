%{

#include <stdio.h>
#include "y.tab.h"

%}

letter 			[a-zA-z]
digit 			[0-9]
word			{letter}({letter}|digit)*
number 			{digit}+
delim			[ \t\n]
ws 				{delim}+


%%

#.* 			{/* comments, does nothing */}
{ws}			{/* no action */}
"si"			{return IF;}
"sino"			{return ELSE;}
"hacer"			{return DO;}
"mientras"		{return WHILE;}
"y"				{return AND;}
"o"				{return OR;}
"imprimir"		{return PRINT;}
"entero"		{return INT_T;}
"cadena"		{return STRING_T;}
"="				{return EQUALS;}
"=="			{return EQUALSCMP;}
"!="			{return DIFF;}
"!"				{return NOT;}
"<"				{return LTHAN;}
"<="			{return LETHAN;}
">"				{return GTHAN;}
">="			{return GETHAN;}
\(				{return LPAREN;}
\)				{return RPAREN;}
\{				{return LBRACK;}
\}				{return RBRACK;}
"+"				{return PLUS;}
"-"				{return MINUS;}
"*"				{return MULT;}
\/				{return DIV;}
\;         		{return ENDLINE;}

\".*\"			{char * text = malloc(strlen(yytext)+1);
					strcpy(text, yytext);
					yylval.string = text;
					return STRING;
				}

{number}		{yylval.integer = strtol(yytext, NULL, 10);
					return INT;
				}

{word}			{char * text = malloc(strlen(yytext)+1);
					strcpy(text, yytext);
					yylval.string = text;
					return ID;
				}
%%


/** yywrap is the function which allows that when EOF is reached in STDIN
*   another thing is processed. If 1 is returned, it indicates for the
*   program to finish
**/

int yywrap(void)
{
	return 1;
}
