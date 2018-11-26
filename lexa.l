%{
// This code is copied directly 
#include <stdio.h>

}%

delim	[ \t\n]
ws 		{delim}+
letter 	[a-zA-z]
digit 	[0-9]
word	{letter}({letter}|digit)*
number 	{digit}+

%%

#.* {/* comments, does nothing */}
[\t\n]		;
"si"			{return IF;}
"sino"			{return ELSE;}
"hacer"			{return DO;}
"mientras"		{return WHILE;}
"y"				{return AND;}
"o"				{return OR;}
"imprimir"		{return PRINT;}
"verdadero"		{return TRUE;}
"falso"			{return FALSE;}
"entero"		{return INT;}
"cadena"		{return STRING;}
"="				{return EQUALS;} 
"=="			{return EQUALSCMP;}
"!="			{return DIFF;}
"<"				{return LTHAN;}
"<="			{return LETHAN;}
">"				{return GTHAN;}
">="			{return GETHAN;}
"("				{return LPAREN;}
")"				{return RPAREN;}
"{"				{return LBRACK;}
"}"				{return RBRACK;}
"."				{return DOT;}
","				{return COMMA;}
"+"				{return PLUS;}
"-"				{return MINUS;}
"*"				{return MULT;}
"/"				{return DIV;}
";"         	{return END_LINE;}
.				printf("Unkown token!\n"); 
				yyterminate();
%%


/** yywrap is the function which allows that when EOF is reached in STDIN
*   another thing is processed. If 1 is returned, it indicates for the
*   program to finish
**/
int yywrap(void)
{
	return 1;
}