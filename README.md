Compiler etymology (Bauer and Eickel): a program "compiled" subroutines [a link-loader]. In 1954, the combination "algebraic compiler" came into use (or misuse).

Goal: express the techniques, data structures, algorithms for translating programming languages into executable code.s

Tiger:
* Algol family
* nested scope
* heap-allocated records
* functional or object-oriented
* In this book, it's built using ML.

ML
* strict, statically typed funtional programming language with modular structure

Recommended ML books
* Paulson, 1996
* Ullman, 1994
* My recommendation: Real World OCaml, by Yaron Minsky

Breaking compiler into pieces allows reuse of components
A modern compiler is often organized into many phases, each operating on a different abstract "language"

Compiler designed to be as simple as possible, but no simpler.
Context-free grammars used in parsing
Regular expressions used in lexical analysis
Yacc: converts a grammar into a parsing program
Lex: converts a declarative specification into a lexical analysis program

Lex: break the source file into individual words, or tokens
Parse: analyze the phrase structure of the program
Semantic actions: build a piece of abstract syntax tree corresponding to each phrase
Semantic analysis: determine what each phrase means, relate uses of variables to their definitions, check types of expressions, request translations of each phrase
Frame Layout
Translate
Canonicalize
Instruction Selection
Control Flow Analysis
Dataflow Analysis
Register Allocation
Code Emission

straight-line program: program with no loops or if-statements
environment: symbol table mapping variable-names to information about the variables
abstract syntax: data structures representing the phrase structure of programs
recursion over tree data structures
functional style of programming

denotational semantics
attribute grammars
-> thes are methods for describing what programming languages do.

lexical: of or relating to words or the vocabulary of a langauge as distinguished from its grammar and construction.

Lexical analysis: breaking the input into individual words or "tokens".
Syntax analysis: parsing the phrase structure of the program.
Semantic analysis: calculating the program's meaning.

Next Step: 10/4: write maxargs and inter (maxargs prints max number of args in subexpression, interpret actually interprets program)