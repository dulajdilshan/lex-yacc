%{                      
                                                                 
#include "simple.tab.h"                                                                     
extern int line_number;   
// void yyerror (char const *s) {
//    fprintf (stderr, "%s\n", s);
// } 

void yyerror(char *s) {
    fprintf(stderr, "line %d: %s\n", line_number, s);
}  

%}                                                                                          
%option noyywrap                                                                            
 
%%   

[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] {}


"int"               {return INT; }                       
"else"         		{return ELSE; }                  
"if"           		{return IF; }     
"return"       		{return RETURN; }   
"void"         		{return VOID; }   
"while"        		{return WHILE; }

"+"	            	{return PLUS;}
"-"            		{return MINUS;}
"*"            		{return STAR;}
"/"            		{return DIV;}
"<"            		{return LT;}
"<="            	{return LTE;}
">"            		{return GT;}
">="            	{return GTE;}
"=="            	{return EQ;}
"!="            	{return NE;}
"="            		{return ASSIGN;}
";"            		{return SC;}
","            		{return COMMA;}
"{"            		{return OCB;}
"}"            		{return CCB;}
"("            		{return OP;}
")"            		{return CP;}
"["            		{return OSB;}
"]"            		{return CSB;}



                                                                  
[_a-zA-Z][_a-zA-Z]* { printf("FROM FLEX ID: %s\n", yytext); return ID; } 
[ \t\r]+  ;        /* eat up whitespace */                                                   
[\n] { line_number++; }       
[0-9][0-9]* { printf("FROM FLEX NUM: %s\n", yytext); return NUM;}       
. { yyerror("SYNTAX ERROR"); return 1;}        

%%