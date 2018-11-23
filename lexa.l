%{
// This code is copied directly 
#include <stdio.h>

}%

letter [a-zA-z]
digit [0-9]
word	{letter}({letter}|digit)*
number {digit}+

%%

#.* {/* comments, does nothing */}
[\t\n]		;
"if"		{return IF;}
"else"		{return ELSE;}
"while"		{return WHILE;}
"and"		{return AND;}
"or"		{return OR;}
"print"		{return PRINT;}
"="			{return EQUALS;} 
"=="		{return EQUALSCMP;}
"!="		{return DIFF;}
"<"			{return LTHAN;}
"<="		{return LETHAN;}
">"			{return GTHAN;}
">="		{return GETHAN;}
"("			{return LPAREN;}
")"			{return RPAREN;}
"{"			{return LBRACK;}
"}"			{return RBRACK;}
"."			{return DOT;}
","			{return COMMA;}
"+"			{return PLUS;}
"-"			{return MINUS;}
"*"			{return MULT;}
"/"			{return DIV;}
	

.			printf("Unkown token!\n"); yyterminate();
%%


/** yywrap is the function which allows that when EOF is reached in STDIN
*   another thing is processed. If 1 is returned, it indicates for the
*   program to finish
**/
int yywrap(void)
{
	return 1;
}