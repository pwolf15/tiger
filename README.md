## TODO

* Finished in-order print for exercises

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

Exercise

1.1
c)

                t
            s
        i       t
    f       p
b               s


d) Sedgewick's Algorithms in C => Balanced Search Trees

Balanced trees are an attempt to solve the problem introduced by worst-case quick-sort. If the case is a reversed list, then quicksort can perform very poorly (binary search case). To accomodate balanced search trees, 3-node and 4-node trees introduced which have 2- and 3- key node respectively. Traditional binary search tree is 2-node (2 links, 1 key)

See pg. 217
2-3-4 trees
red-black trees
B-tree vs. Avl tree vs. 2-3-4 tree

Front-end compiler: pull apart a program and understand its structure and meaning => analysis

Analysis
* lexical: breaking the input into individual words or "tokens"
* syntax: parsing the phrase structure of of the program
* semantic: calculating the program's meaning

lexical analyzer
* stream of characters => names, keywords, puncutaiton

Specify lexical tokens using formal language of regular expressions
Implement lexers using deterministic finite automata

Language = set of strings
string = finite sequence of symbols
symbols = emerge from fintie alphabet
Kleene closuerS