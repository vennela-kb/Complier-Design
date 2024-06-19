/**/
%{
#include<stdio.h>
int i, dd,mm,year,valid=1;
%}

slash	[/]
ddmm30	([0-2][0-9]|30){slash}([0][4|6|9]|11)
ddmm31	([0-2][0-9]|[3][0-1]){slash}([0][1|3|5|7|8]|10|12)
ddmm29	([0-2][1-9]){slash}02
yyyy	[0-2][0-9][0-9][0-9]
date	{ddmm31}{slash}{yyyy}|{ddmm30}{slash}{yyyy}|{ddmm29}{slash}{yyyy}
%%
{date}	{
			 printf("Input date:%s\n", yytext);
			 dd=(int)(yytext[0]-'0');
			 dd = dd * 10 + (int)(yytext[1]-'0');
			 mm=(int)(yytext[3]-'0');
			 mm = mm * 10 + (int)(yytext[4]-'0');
			 i=6;
			 year=0;
			 while(i<=9)
				year = year * 10 + (int)(yytext[i++]-'0');
			 if(mm==2)
			 {
				if( (year % 4 ==0 && year %100 !=0)|| year % 400 == 0 )
				{	
					if(dd <= 29) 
					return(valid);
				}
				else 
				{
					if(dd <= 28) 
					return(valid);
					else return(0);
				}
			}
			else return(valid);			
		}
%%
int main()
{
	int date_valid=0;
	printf("Enter Something:");
	date_valid = yylex();
	if(date_valid == 1)
	 printf("\nValid Date Format\n");
	else
	printf("\nInvalid Date Format\n");
	
}
int yywrap()
{
return 1;
}
