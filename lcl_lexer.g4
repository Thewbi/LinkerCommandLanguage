lexer grammar LclLexer;

/*
fragment A:[aA];
fragment B:[bB];
fragment C:[cC];
fragment D:[dD];
fragment E:[eE];
fragment F:[fF];
fragment G:[gG];
fragment H:[hH];
fragment I:[iI];
fragment J:[jJ];
fragment K:[kK];
fragment L:[lL];
fragment M:[mM];
fragment N:[nN];
fragment O:[oO];
fragment P:[pP];
fragment Q:[qQ];
fragment R:[rR];
fragment S:[sS];
fragment T:[tT];
fragment U:[uU];
fragment V:[vV];
fragment W:[wW];
fragment X:[xX];
fragment Y:[yY];
fragment Z:[zZ];
*/

ADDR : 'ADDR' ;
ALIGN : 'ALIGN' ;
ASTERISK : '*' ;
AT : 'AT' ;

BACK_SLASH : '\\' ;
BLOCK : 'BLOCK' ;



CLOSEING_BRACKET : ')' ;
CLOSEING_SQUIGGLY_BRACKET : '}' ;
COLON : ':' ;
COMMA : ',' ;

DOT : '.' ;

ENTRY : 'ENTRY' ;
EQUALS : '=' ;
EXCLAMATION_MARK : '!' ;

// Cannot be a fragment now, because we're changing the `type` in certain cases. And because it is
// no fragment any more, it has to come before the `ControlString` rule.
//CONTROL_CHAR
// : '^' ( // Execute the predicate, which looks ahead 2 chars and passes if 
//        // these 2 chars are a word and a non-word
//         {((char)input.LA(1) + "" + (char)input.LA(2)).matches("\\w\\W")}?=> 
//         // If the predicate is true, match a single `Alpha`
//         Alpha
//      |  // If the predicate failed, change the type of this token to a `Pointer`
//         {$type=Pointer;}
//       )
// | '#' Digitseq
// | '#' '$' Hexdigitseq
// ;
//
//CONTROL_STRING
// : CONTROL_CHAR+
// ;

FORWARD_SLASH : '/' ;

KEEP : 'KEEP' ;

LENGTH : 'LENGTH' ;
LEN : 'len' ;
LEN_L : 'l' ;

//MEM_ATTR : EXCLAMATION_MARK ;
MEMORY : 'MEMORY' ;
MINUS : '-' ;

NOLOAD : 'NOLOAD' ;

OPENING_BRACKET : '(' ;
OPENING_SQUIGGLY_BRACKET : '{' ;
ORIGIN : 'ORIGIN' ;
ORG : 'org' ;
ORG_O : 'o' ;

PLUS : '+' ;
PROVIDE : 'PROVIDE' ;

SECTIONS : 'SECTIONS' ;
SEMICOLON : ';' ;
SIZEOF : 'SIZEOF' ;

BLOCK_COMMENT : '/*' (BLOCK_COMMENT|.)*? '*/' -> channel(HIDDEN) ;
DOUBLE_SLASH_LINE_COMMENT : '//' .*? '\n' -> channel(HIDDEN) ;

DECIMAL_NUMBER : MINUS? [0-9]+ 'K'? ;
OCTAL_NUMBER : MINUS? [0] [0-9]+ 'K'? ;
HEX_NUMBER : MINUS? ('0' 'x' | '$') [a-fA-F0-9]+ 'K'? ;

//BINARY_NUMBER : '0' 'b' [0,1]+ ;

SYMBOL_NAME: [.a-zA-Z_][a-zA-Z_0-9]* ;
QUOTED_SYMBOL_NAME : '"' ( '""' | ~'"' )* '"' ; // quote-quote is an escaped quote

WS : [ \t\n\r\f]+ -> skip  ;

//LETTER_A : A ;
//LETTER_L : L ;
//LETTER_I : I ;
//LETTER_R : R ;
//LETTER_W : W ;
//LETTER_X : X ;

//MEM_ATTR : EXCLAMATION_MARK LETTER_A? EXCLAMATION_MARK LETTER_L? EXCLAMATION_MARK LETTER_I? EXCLAMATION_MARK LETTER_R? EXCLAMATION_MARK LETTER_W? EXCLAMATION_MARK LETTER_X?

//MEM_ATTR : EXCLAMATION_MARK ;