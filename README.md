# LEX-YACC
lexical analyzer and syntax analyzer for the language specified

[![N|Solid](https://raw.githubusercontent.com/dulajdilshan/lex-yacc/master/docs/chart.png)](https://github.com/dulajdilshan/lex-yacc)



  - Keywords
  - Operators
  - Identifiers
  - Constants
  - Literal Strings
  - Punctuation symbols

Above are used as tokens for this application 

# Software tools used
* [Flex](https://github.com/westes/flex) - Tool for generating scanners: programs which recognize lexical patterns in text.
* [Bison](https://www.gnu.org/software/bison/) - A parser generator that is part of the GNU Project
* [GCC](https://gcc.gnu.org/) - "C" Compiler

# Pre-requisites
-  GCC

        $ sudo apt-get install gcc
        
-  Flex

        $ sudo apt-get install flex
- Bison

        $ sudo apt-get install bison

# Install
Create "simple" executable file

    $ make -f Makefile 		
    
Run sample files (eg: example1.cmin ,example2.cmin)

    $ ./simple < example1.cmin
    $ ./simple < example2.cmin

clean

    $ make clean

