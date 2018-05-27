%{                                                                                   
   #include <stdarg.h> 
   #include <stdio.h>
   #include "src/simple_shared.h"                                                        
   #define YYSTYPE char *                                                            
   int yydebug=1;     
   void yyerror (char const *); 
   int yylex();                           
   int indent=0;                                                                     
   char *iden_dum;                                                                   
%}                                                                                   
%token INT                                                                        
%token ELSE                                                                           
%token IF  
%token RETURN                                                                         
%token VOID                                                                           
%token WHILE   
%token PLUS                                                                        
%token MINUS                                                                           
%token STAR 
%token DIV                                                                      
%token LT                                                                      
%token LTE 
%token GT                                                                        
%token GTE                                                                           
%token EQ 
%token NE                                                                         
%token ASSIGN                                                                           
%token SC
%token COMMA                                                                        
%token OCB                                                                           
%token CCB 
%token OP                                                                         
%token CP                                                                           
%token OSB
%token CSB                                                                        
%token ID                                                                     
%token NUM 
                                                             
 /* Grammar rules and actions follow */ 
%%                                 
program:
      declaration-list
            { printf("%3d: FROM BISON DECLARATION-LIST\n", line_number); } 
;
declaration-list:
      declaration-list declaration
            { printf("%3d: FROM BISON DECLARATION-LIST DECLARATION\n", line_number); } 
      | declaration
            { printf("%3d: FROM BISON DECLARATION\n", line_number); }
;                                            
declaration:                                                                         
      var-declaration                                              
        { printf("%3d: FROM BISON VAR-DECLARATION\n", line_number); }   
      | fun-declaration                                              
        { printf("%3d: FROM BISON FUN-DECLARATION\n", line_number); }                   
;    
var-declaration:
      type_specifier ID SC
      | type_specifier ID OSB NUM CSB SC 
;                                                                             
type_specifier:                                                                      
      VOID                                                                          
         { printf("%3d: FROM BISON VOID\n", line_number); }                         
   |  INT                                                                            
         { printf("%3d: FROM BISON INT\n", line_number); }                           
;   
fun-declaration:
      type_specifier ID OP params CP compound-stmt
;
params:
      param_list 
      | VOID
;
param_list:
      param_list COMMA param 
      | param
;
param:
      type_specifier ID 
      | type_specifier ID OSB CSB
;
compound-stmt:
      OCB local-declarations statement-list CCB
;
local-declarations:
      local-declarations var-declaration 
      | %empty
;
statement-list:
      statement-list statement 
      | %empty
;
statement:
      expression-stmt 
      | compound-stmt 
      | selection-stmt 
      | iteration-stmt 
      | return-stmt
;
expression-stmt: 
      expression SC
      | SC
;
selection-stmt:
      IF OP expression CP statement 
      | IF OP expression CP statement ELSE statement
;
iteration-stmt:
      WHILE OP expression CP statement
;
return-stmt: 
      RETURN SC 
      | RETURN expression SC
;
expression:
      var ASSIGN expression 
      | simple-expression
;
var: 
      ID 
      | ID OSB expression CSB
;
simple-expression:     
      additive-expression relop additive-expression 
      | additive-expression
;
relop:
      LT
      | LTE 
      | GT 
      | GTE 
      | EQ 
      | NE 
;   
additive-expression: 
      additive-expression addop term 
      | term 
;
addop: 
      PLUS
      | MINUS
;
term: 
      term mulop factor 
      | factor
;
mulop: 
      STAR
      | DIV
;
factor:
      OP expression CP 
      | var 
      | call 
      | NUM
;
call: 
      ID OP args CP
;
args: 
      arg-list 
      | %empty 
;
arg-list: 
      arg-list COMMA expression 
      | expression
;
%%                                                                                   
int main ()                                                                              
{             
      if (yyparse ()==0){
            printf("Valid Syntax \n");
      }else{
            printf("Invalid Syntax \n");
      };                                                                       
                                                                        
}