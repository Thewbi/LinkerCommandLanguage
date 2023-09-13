parser grammar LclParser;
options { tokenVocab=LclLexer; }





memory_layout : MEMORY OPENING_SQUIGGLY_BRACKET memory_layout_declaraction+ CLOSEING_SQUIGGLY_BRACKET ;

memory_layout_declaraction : name OPENING_BRACKET mem_attr CLOSEING_BRACKET COLON org_assignment COMMA length_assignment ;

org_assignment : ( ORIGIN | ORG | ORG_O ) EQUALS number ;

length_assignment : ( LENGTH | LEN | LEN_L ) EQUALS number ;

number : DECIMAL_NUMBER | OCTAL_NUMBER | HEX_NUMBER ;

name : SYMBOL_NAME | QUOTED_SYMBOL_NAME ;

mem_attr : ( EXCLAMATION_MARK? (SYMBOL_NAME | QUOTED_SYMBOL_NAME) )+ ;






section_command : SECTIONS OPENING_SQUIGGLY_BRACKET section_content+ CLOSEING_SQUIGGLY_BRACKET ;


section_content :
	entry_commmand // only the ENTRY ( symbol ) command is allowed here!
	| 
	output_section_description 
	| 
	symbol_assignment SEMICOLON?
//	|
//	overlay_description
	;
	
	
	
// https://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_chapter/ld_3.html#SEC16
output_section_description :
	name 
	( output_section_description_start )?
	( block_command )?
	( OPENING_BRACKET NOLOAD CLOSEING_BRACKET )?
	COLON
	// AT( ADDR(.text) + SIZEOF(.text) ) 
	( at_command )?
	OPENING_SQUIGGLY_BRACKET
		output_section_content_wrapped+
	CLOSEING_SQUIGGLY_BRACKET
	( EQUALS number SEMICOLON )?
	;
	
output_section_description_start :
	origin_command 
	| 
	expression
	;
	
output_section_content_wrapped :
	KEEP OPENING_BRACKET ( output_section_content | symbol_assignment ) CLOSEING_BRACKET SEMICOLON?
	|
	PROVIDE OPENING_BRACKET ( output_section_content | symbol_assignment ) CLOSEING_BRACKET SEMICOLON?
	|
	symbol_assignment SEMICOLON?
	|
	output_section_content
	;
	
output_section_content:
	filename_placement
	|
	section_placement
	;

filename_placement :
	name OPENING_BRACKET name CLOSEING_BRACKET
	;
	
section_placement :
	ASTERISK OPENING_BRACKET name ASTERISK? CLOSEING_BRACKET
	;
	
	
	
	
symbol_assignment :
	DOT EQUALS expression
	|
	name EQUALS DOT
	;
	
	
	
expression :
	align_command
	|
	addr_command
	|
	sizeof_commmand
	|
	expression PLUS expression
	|
	expression MINUS expression
	|
	expression FORWARD_SLASH expression
	|
	expression ASTERISK expression
	;

	


addr_command :
	ADDR OPENING_BRACKET name ASTERISK? CLOSEING_BRACKET
	;
	
align_command :
	ALIGN OPENING_BRACKET number CLOSEING_BRACKET
	;
	
at_command :
	AT OPENING_BRACKET expression CLOSEING_BRACKET
	;
	
block_command :
	BLOCK OPENING_BRACKET expression CLOSEING_BRACKET
	;
	
entry_commmand :
	ENTRY OPENING_BRACKET name CLOSEING_BRACKET
	;
	
origin_command :
	ORIGIN OPENING_BRACKET name CLOSEING_BRACKET
	;
	
sizeof_commmand :
	SIZEOF OPENING_BRACKET name CLOSEING_BRACKET
	;
