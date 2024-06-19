%{
#include<stdio.h>
%}
digit	[0-9]
letter	[a-zA-Z]
id		{letter}({letter}|{digit})*
num		{digit}+
keyword	begin|end|int|if|while
relop	<|<=|>|>=|==|!=
arithop \-|\+|\*|\/
assign	=
%%
{keyword}	{printf("It is a keyword:%s\n", yytext);}
{digit} 	{printf("It is a digit :%s\n",yytext);} 
{num}		{printf("It is a number: %s\n", yytext);} 
{id}		{printf("It is a identifier:%s\n", yytext);} 
{relop}		{printf("It is a relational op: %s\n", yytext);}
{arithop}	{printf("It is a arith op: %s\n", yytext);}
{assign}	{printf("It is a assignment op: %s\n", yytext);}
%%
int main(int argc, char *argv[])
{
	printf("Enter Something:");
	yylex();
}
int yywrap()
{
return 1;
}
