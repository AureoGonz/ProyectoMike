/*Importación del Runtime de CUP*/
package fesa.ico.compi;
import java_cup.runtime.*;
/*Declaración de directivas Jflex*/
%%
%class LexicoSQL
%line
%column
%cup
%unicode
/*Código de usuario, métodos para obtener tipo, posición y valor*/
%{
private Symbol simbolo(int type){
return new Symbol(type, yyline, yycolumn);
}
private Symbol simbolo(int type, Object value){
return new Symbol(type, yyline, yycolumn, value);
}
%}
/*Macros usadas por las reglas JFlex*/
L = [a-zA-Z_]
D = 0 | [1-9][0-9]*
ESPACIO=[ \t\r\n]
%%
/*Declaración de reglas léxicas en estado inicial*/
<YYINITIAL> {
";" { return simbolo(sym.PYC); }
"," { return simbolo(sym.COMA); }
"'" { return simbolo(sym.CS); }
"(" { return simbolo(sym.PA); }
")" { return simbolo(sym.PC); }
"SELECCIONAR" { return simbolo(sym.SELECT); }
"DE" { return simbolo(sym.FROM); }
"DONDE" { return simbolo(sym.WHERE); }
"CONTAR" { return simbolo(sym.COUNT); }
"ELIMINAR" { return simbolo(sym.DELETE); }
"INSERTAR" { return simbolo(sym.INSERT); }
"EN" { return simbolo(sym.INTO); }
"VALORES" { return simbolo(sym.VALUES); }
"DISTINTO" { return simbolo(sym.DISTINCT); }
"=" { return simbolo(sym.IGUAL); }
"<" { return simbolo(sym.MEN); }
">" { return simbolo(sym.MAY); }
"*" { return simbolo(sym.ALL); }
{L}({L}|{D})* {return simbolo(sym.ID, new String (yytext()));}
"-"*({D}) {return simbolo(sym.DIG, new String(yytext()));}
{ESPACIO} {/*Ignore*/}
}
/*Código de Error*/
[^] {throw new Error("Error: <"+yytext()+">no es un token válido." ); }