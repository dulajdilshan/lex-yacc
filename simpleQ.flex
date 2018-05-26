%{                                                                                          
#include "simple.tab.h"                                                                     
extern int line_number;   
// void yyerror (char const *s) {
//    fprintf (stderr, "%s\n", s);
// } 

void yyerror(char *s) {
    fprintf(stderr, "line %d: %s\n", yylineno, s);
}  

%}                                                                                          
%option noyywrap                                                                            
 
%%     
"/*"(.|\n)*"*/" ;
"(?:/\\*(?:[^*]|(?:\\*+[^*/]))*\\*+/)|(?://.*)" ;  

                                                                                           
"int"               { printf("FROM FLEX INT %s\n", yytext); return INT; }                       
"else"         		{ printf("FROM FLEX ELSE %s\n", yytext); return ELSE; }                  
"if"           		{ printf("FROM FLEX IF %s\n", yytext); return IF; }     
"return"       		{ printf("FROM FLEX RETURN %s\n", yytext); return RETURN; }   
"void"         		{ printf("FROM FLEX VOID %s\n", yytext); return VOID; }   
"while"        		{ printf("FROM FLEX WHILE %s\n", yytext); return WHILE; }

"+"	            	{printf("FROM FLEX SYMBOL %s\n", yytext);return PLUS;}
"-"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return MINUS;}
"*"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return STAR;}
"/"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return DIV;}
"<"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return LT;}
"<="            	{printf("FROM FLEX SYMBOL %s\n", yytext);return LTE;}
">"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return GT;}
">="            	{printf("FROM FLEX SYMBOL %s\n", yytext);return GTE;}
"=="            	{printf("FROM FLEX SYMBOL %s\n", yytext);return EQ;}
"!="            	{printf("FROM FLEX SYMBOL %s\n", yytext);return NE;}
"="            		{printf("FROM FLEX SYMBOL %s\n", yytext);return ASSIGN;}
";"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return SC;}
","            		{printf("FROM FLEX SYMBOL %s\n", yytext);return COMMA;}
"{"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return OCB;}
"}"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return CCB;}
"("            		{printf("FROM FLEX SYMBOL %s\n", yytext);return OP;}
")"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return CP;}
"["            		{printf("FROM FLEX SYMBOL %s\n", yytext);return OSB;}
"]"            		{printf("FROM FLEX SYMBOL %s\n", yytext);return CSB;}



[;] {  return *yytext; }                                                                    
[_a-zA-Z][_a-zA-Z]* { printf("FROM FLEX ID: %s\n", yytext); return ID; } 
[ \t\r]+  ;        /* eat up whitespace */                                                   
[\n] { line_number++; }       
[0-9][0-9]* { printf("FROM FLEX NUM: %s\n", yytext); return NUM;}       
. { yyerror("SYNTAX ERROR"); return 1;}        

%%
