parser grammar LclParser;
options { tokenVocab=LclLexer; }

memory_layout : MEMORY OPENING_SQUIGGLY_BRACKET memory_layout_declaraction+ CLOSEING_SQUIGGLY_BRACKET ;

memory_layout_declaraction : name OPENING_BRACKET mem_attr CLOSEING_BRACKET COLON org_assignment COMMA length_assignment ;

org_assignment : ( ORIGIN | ORG | ORG_O ) EQUALS number ;

length_assignment : ( LENGTH | LEN | LEN_L ) EQUALS number ;

number : DECIMAL_NUMBER | OCTAL_NUMBER | HEX_NUMBER ;

name : SYMBOL_NAME | QUOTED_SYMBOL_NAME ;

mem_attr : SYMBOL_NAME | QUOTED_SYMBOL_NAME ;
