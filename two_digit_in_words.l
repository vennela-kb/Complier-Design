%{
#include<stdio.h>
int twodigitsnum=0;
int onesdigit = 0, secondsdigit = 0;
%}
ones		[0-9]
seconds		[1-9]
num			{seconds}{ones}
%%
{num}		{onesdigit=(int)yytext[1];
			 secondsdigit=(int)yytext[0];
			 onesdigit -=48;
			 secondsdigit -=48;
			 return(onesdigit+secondsdigit*10);}  
%%

int yywrap()
{
return 1;
}

int main()
{
	int print_inwords(int);
	int temp;
	printf("Enter a two digit number:");
	twodigitsnum = yylex();
	temp = twodigitsnum;
	printf("\nInput Number = %d\n",twodigitsnum);
	onesdigit = twodigitsnum%10;
	twodigitsnum =twodigitsnum/10;
	secondsdigit = twodigitsnum%10;
	printf("In words : ");
	
	print_inwords(secondsdigit);
	print_inwords(onesdigit);
}
int print_inwords(int digit)
{		
	switch(digit)
    {
		case 0: printf(" Zero"); break;
		case 1: printf(" One");  break;
		case 2: printf(" Two"); break;
		case 3: printf(" Three"); break;
		case 4: printf(" Four"); break;
		case 5: printf(" Five"); break;
		case 6: printf(" Six"); break;
		case 7: printf(" Seven"); break;
		case 8: printf(" Eight"); break;
		case 9: printf(" Nine"); break;
    }

}
