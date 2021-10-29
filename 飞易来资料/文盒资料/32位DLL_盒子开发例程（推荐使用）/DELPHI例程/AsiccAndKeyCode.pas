unit AsiccAndKeyCode;

interface

type
    TMKKeyData = record
        Code : integer ; //¼üÂë
        Char : string; //¼üÂë¶ÔÓ¦µÄ×Ö·û
        KeyMemo:string;//¼üÂëÃèÊö
        NeedCap:Integer;
    end;
const
//µÚÒ»Ì×¼üÅÌÉ¨ÃèÂë£¬101¡¢102ºÍ104¼üµÄ¼üÅÌ£¬×¢£º¡°Pause¡±¼ü±»ºöÂÔ¡£       $1E
MKKeyCount = 157;
MKKeyData : array [0..MKKeyCount-1] of TMKKeyData = (  //¹¦ÄÜ¼ü
(Code : 1  ;     Char :  '';    KeyMemo :   'Êó±ê×ó¼ü       ';  NeedCap :  0),
(Code : 2  ;     Char :  '';    KeyMemo :    'Êó±êÓÒ¼ü      ';  NeedCap :  0),
(Code : 3  ;     Char :  '';    KeyMemo :    'CANCEL¼ü      ';  NeedCap :  0),
(Code : 4  ;     Char :  '';    KeyMemo :    'Êó±êÖÐ¼ü      ';  NeedCap :  0),
(Code : 8  ;     Char :  '';    KeyMemo :    'BACKSPACE¼ü   ';  NeedCap :  0),
(Code : 9  ;     Char :  '';    KeyMemo :    'TAB¼ü         ';  NeedCap :  0),
(Code : 12  ;    Char :  '';    KeyMemo :    'CLEAR¼ü       ';  NeedCap :  0),
(Code : 13  ;    Char :  '';    KeyMemo :    'ENTER¼ü(13)   ';  NeedCap :  0),
(Code : $10 ;    Char :  '';    KeyMemo :    'SHIFT¼ü       ';  NeedCap :  0),
(Code : $11 ;    Char :  '';    KeyMemo :    'CTRL¼ü        ';  NeedCap :  0),
(Code : $12 ;    Char :  '';    KeyMemo :    'MENU¼ü        ';  NeedCap :  0),
(Code : $13 ;    Char :  '';    KeyMemo :    'PAUSE¼ü       ';  NeedCap :  0),
(Code : $14 ;    Char :  '';    KeyMemo :    'CAPSLOCK¼ü    ';  NeedCap :  0),
(Code : $1B ;    Char :  '';    KeyMemo :    'ESC¼ü         ';  NeedCap :  0),
(Code : $20 ;    Char :  '';    KeyMemo :    'SPACEBAR¼ü(32)';  NeedCap :  0),
(Code : $21 ;    Char :  '';    KeyMemo :    'PAGEUP¼ü      ';  NeedCap :  0),
(Code : $22 ;    Char :  '';    KeyMemo :    'PAGEDOWN¼ü    ';  NeedCap :  0),
(Code : $23 ;    Char :  '';    KeyMemo :    'END¼ü         ';  NeedCap :  0),
(Code : $24 ;    Char :  '';    KeyMemo :    'HOME¼ü        ';  NeedCap :  0),
(Code : $25 ;    Char :  '';    KeyMemo :    'LEFTARROW¼ü   ';  NeedCap :  0),
(Code : $26 ;    Char :  '';    KeyMemo :    'UPARROW¼ü     ';  NeedCap :  0),
(Code : $27 ;    Char :  '';    KeyMemo :    'RIGHTARROW¼ü  ';  NeedCap :  0),
(Code : $28 ;    Char :  '';    KeyMemo :    'DOWNARROW¼ü   ';  NeedCap :  0),
(Code : $29 ;    Char :  '';    KeyMemo :    'SELECT¼ü      ';  NeedCap :  0),
(Code : $2A ;    Char :  '';    KeyMemo :    'PRINTSCREEN¼ü ';  NeedCap :  0),
(Code : $2B ;    Char :  '';    KeyMemo :    'EXECUTE¼ü     ';  NeedCap :  0),
(Code : $2C ;    Char :  '';    KeyMemo :    'SNAPSHOT¼ü    ';  NeedCap :  0),
(Code : $2D ;    Char :  '';    KeyMemo :    'INSERT¼ü      ';  NeedCap :  0),
(Code : $2E ;    Char :  '';    KeyMemo :    'DELETE¼ü      ';  NeedCap :  0),
(Code : $2F ;    Char :  '';    KeyMemo :    'HELP ¼ü       ';  NeedCap :  0),
(Code : $90 ;    Char :  '';    KeyMemo :    'NUM LOCK ¼ü   ';  NeedCap :  0),

//×Ö·û¼ü
(Code : 65   ;     Char : 'a';   KeyMemo :     'A  ¼ü        ';  NeedCap :  1),
(Code : 66   ;     Char : 'b';   KeyMemo :     'B  ¼ü        ';  NeedCap :  1),
(Code : 67   ;     Char : 'c';   KeyMemo :     'C  ¼ü        ';  NeedCap :  1),
(Code : 68   ;     Char : 'd';   KeyMemo :     'D  ¼ü        ';  NeedCap :  1),
(Code : 69   ;     Char : 'e';   KeyMemo :     'E  ¼ü        ';  NeedCap :  1),
(Code : 70   ;     Char : 'f';   KeyMemo :     'F  ¼ü        ';  NeedCap :  1),
(Code : 71   ;     Char : 'g';   KeyMemo :     'G  ¼ü        ';  NeedCap :  1),
(Code : 72   ;     Char : 'h';   KeyMemo :     'H  ¼ü        ';  NeedCap :  1),
(Code : 73   ;     Char : 'i';   KeyMemo :     'I  ¼ü        ';  NeedCap :  1),
(Code : 74   ;     Char : 'j';   KeyMemo :     'J  ¼ü        ';  NeedCap :  1),
(Code : 75   ;     Char : 'k';   KeyMemo :     'K  ¼ü        ';  NeedCap :  1),
(Code : 76   ;     Char : 'l';   KeyMemo :     'L  ¼ü        ';  NeedCap :  1),
(Code : 77   ;     Char : 'm';   KeyMemo :     'M  ¼ü        ';  NeedCap :  1),
(Code : 78   ;     Char : 'n';   KeyMemo :     'N  ¼ü        ';  NeedCap :  1),
(Code : 79   ;     Char : 'o';   KeyMemo :     'O  ¼ü        ';  NeedCap :  1),
(Code : 80   ;     Char : 'p';   KeyMemo :     'P  ¼ü        ';  NeedCap :  1),
(Code : 81   ;     Char : 'q';   KeyMemo :     'Q  ¼ü        ';  NeedCap :  1),
(Code : 82   ;     Char : 'r';   KeyMemo :     'R  ¼ü        ';  NeedCap :  1),
(Code : 83   ;     Char : 's';   KeyMemo :     'S  ¼ü        ';  NeedCap :  1),
(Code : 84   ;     Char : 't';   KeyMemo :     'T  ¼ü        ';  NeedCap :  1),
(Code : 85   ;     Char : 'u';   KeyMemo :     'U  ¼ü        ';  NeedCap :  1),
(Code : 86   ;     Char : 'v';   KeyMemo :     'V  ¼ü        ';  NeedCap :  1),
(Code : 87   ;     Char : 'w';   KeyMemo :     'W  ¼ü        ';  NeedCap :  1),
(Code : 88   ;     Char : 'x';   KeyMemo :     'X  ¼ü        ';  NeedCap :  1),
(Code : 89   ;     Char : 'y';   KeyMemo :     'Y  ¼ü        ';  NeedCap :  1),
(Code : 90   ;     Char : 'z';   KeyMemo :     'Z  ¼ü        ';  NeedCap :  1),
(Code : 48   ;     Char : '0';   KeyMemo :     '0  ¼ü        ';  NeedCap :  1),
(Code : 49   ;     Char : '1';   KeyMemo :     '1  ¼ü        ';  NeedCap :  1),
(Code : 50   ;     Char : '2';   KeyMemo :     '2  ¼ü        ';  NeedCap :  1),
(Code : 51   ;     Char : '3';   KeyMemo :     '3  ¼ü        ';  NeedCap :  1),
(Code : 52   ;     Char : '4';   KeyMemo :     '4  ¼ü        ';  NeedCap :  1),
(Code : 53   ;     Char : '5';   KeyMemo :     '5  ¼ü        ';  NeedCap :  1),
(Code : 54   ;     Char : '6';   KeyMemo :     '6  ¼ü        ';  NeedCap :  1),
(Code : 55   ;     Char : '7';   KeyMemo :     '7  ¼ü        ';  NeedCap :  1),
(Code : 56   ;     Char : '8';   KeyMemo :     '8  ¼ü        ';  NeedCap :  1),
(Code : 57   ;     Char : '9';   KeyMemo :     '9  ¼ü        ';  NeedCap :  1),

(Code : 192;      Char : '~';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 189;      Char : '_';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 187;      Char : '+';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 219;      Char : '{';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 221;      Char : '}';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 220;      Char : '|';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 186;      Char : ':';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 222;      Char : '"';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 188;      Char : '<';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 190;      Char : '>';    KeyMemo :     '             ';  NeedCap :  2),
(Code : 191;      Char : '?';    KeyMemo :     '             ';  NeedCap :  2),

(Code : 65   ;     Char : 'A';   KeyMemo :     'A  ¼ü        ';  NeedCap :  2),
(Code : 66   ;     Char : 'B';   KeyMemo :     'B  ¼ü        ';  NeedCap :  2),
(Code : 67   ;     Char : 'C';   KeyMemo :     'C  ¼ü        ';  NeedCap :  2),
(Code : 68   ;     Char : 'D';   KeyMemo :     'D  ¼ü        ';  NeedCap :  2),
(Code : 69   ;     Char : 'E';   KeyMemo :     'E  ¼ü        ';  NeedCap :  2),
(Code : 70   ;     Char : 'F';   KeyMemo :     'F  ¼ü        ';  NeedCap :  2),
(Code : 71   ;     Char : 'G';   KeyMemo :     'G  ¼ü        ';  NeedCap :  2),
(Code : 72   ;     Char : 'H';   KeyMemo :     'H  ¼ü        ';  NeedCap :  2),
(Code : 73   ;     Char : 'I';   KeyMemo :     'I  ¼ü        ';  NeedCap :  2),
(Code : 74   ;     Char : 'J';   KeyMemo :     'J  ¼ü        ';  NeedCap :  2),
(Code : 75   ;     Char : 'K';   KeyMemo :     'K  ¼ü        ';  NeedCap :  2),
(Code : 76   ;     Char : 'L';   KeyMemo :     'L  ¼ü        ';  NeedCap :  2),
(Code : 77   ;     Char : 'M';   KeyMemo :     'M  ¼ü        ';  NeedCap :  2),
(Code : 78   ;     Char : 'N';   KeyMemo :     'N  ¼ü        ';  NeedCap :  2),
(Code : 79   ;     Char : 'O';   KeyMemo :     'O  ¼ü        ';  NeedCap :  2),
(Code : 80   ;     Char : 'P';   KeyMemo :     'P  ¼ü        ';  NeedCap :  2),
(Code : 81   ;     Char : 'Q';   KeyMemo :     'Q  ¼ü        ';  NeedCap :  2),
(Code : 82   ;     Char : 'R';   KeyMemo :     'R  ¼ü        ';  NeedCap :  2),
(Code : 83   ;     Char : 'S';   KeyMemo :     'S  ¼ü        ';  NeedCap :  2),
(Code : 84   ;     Char : 'T';   KeyMemo :     'T  ¼ü        ';  NeedCap :  2),
(Code : 85   ;     Char : 'U';   KeyMemo :     'U  ¼ü        ';  NeedCap :  2),
(Code : 86   ;     Char : 'V';   KeyMemo :     'V  ¼ü        ';  NeedCap :  2),
(Code : 87   ;     Char : 'W';   KeyMemo :     'W  ¼ü        ';  NeedCap :  2),
(Code : 88   ;     Char : 'X';   KeyMemo :     'X  ¼ü        ';  NeedCap :  2),
(Code : 89   ;     Char : 'Y';   KeyMemo :     'Y  ¼ü        ';  NeedCap :  2),
(Code : 90   ;     Char : 'Z';   KeyMemo :     'Z  ¼ü        ';  NeedCap :  2),
(Code : 48   ;     Char : ')';   KeyMemo :     '0  ¼ü        ';  NeedCap :  2),
(Code : 49   ;     Char : '!';   KeyMemo :     '1  ¼ü        ';  NeedCap :  2),
(Code : 50   ;     Char : '@';   KeyMemo :     '2  ¼ü        ';  NeedCap :  2),
(Code : 51   ;     Char : '#';   KeyMemo :     '3  ¼ü        ';  NeedCap :  2),
(Code : 52   ;     Char : '$';   KeyMemo :     '4  ¼ü        ';  NeedCap :  2),
(Code : 53   ;     Char : '%';   KeyMemo :     '5  ¼ü        ';  NeedCap :  2),
(Code : 54   ;     Char : '^';   KeyMemo :     '6  ¼ü        ';  NeedCap :  2),
(Code : 55   ;     Char : '&';   KeyMemo :     '7  ¼ü        ';  NeedCap :  2),
(Code : 56   ;     Char : '*';   KeyMemo :     '8  ¼ü        ';  NeedCap :  2),
(Code : 57   ;     Char : '(';   KeyMemo :     '9  ¼ü        ';  NeedCap :  2),

(Code : 192;      Char : '`' ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 189;      Char : '-' ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 187;      Char : '=' ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 219;      Char : '[' ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 221;      Char : ']' ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 220;      Char : '\' ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 186;      Char : ';' ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 222;      Char : #39 ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 188;      Char : ',' ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 190;      Char : '.' ;   KeyMemo :     '             ';  NeedCap :  1),
(Code : 191;      Char : '/' ;   KeyMemo :     '             ';  NeedCap :  1),


//--Ð¡¼üÅÌ¼ü
(Code : $60 ;     Char : '0';   KeyMemo :     '0 ¼ü         ';  NeedCap :  0) ,
(Code : $61 ;     Char : '1';   KeyMemo :     '1 ¼ü         ';  NeedCap :  0) ,
(Code : $62 ;     Char : '2';   KeyMemo :     '2 ¼ü         ';  NeedCap :  0) ,
(Code : $63 ;     Char : '3';   KeyMemo :     '3 ¼ü         ';  NeedCap :  0) ,
(Code : $64 ;     Char : '4';   KeyMemo :     '4 ¼ü         ';  NeedCap :  0) ,
(Code : $65 ;     Char : '5';   KeyMemo :     '5 ¼ü         ';  NeedCap :  0) ,
(Code : $66 ;     Char : '6';   KeyMemo :     '6 ¼ü         ';  NeedCap :  0) ,
(Code : $67 ;     Char : '7';   KeyMemo :     '7 ¼ü         ';  NeedCap :  0) ,
(Code : $68 ;     Char : '8';   KeyMemo :     '8 ¼ü         ';  NeedCap :  0) ,
(Code : $69 ;     Char : '9';   KeyMemo :     '9 ¼ü         ';  NeedCap :  0) ,
(Code : $6A ;     Char : '*';   KeyMemo :     '* ¼ü         ';  NeedCap :  0) ,
(Code : $6B ;     Char : '+';   KeyMemo :     '+ ¼ü         ';  NeedCap :  0) ,
(Code : $6C ;     Char : '';    KeyMemo :     'ENTER¼ü      ';  NeedCap :  0) ,
(Code : $6D ;     Char : '-';   KeyMemo :     '-¼ü          ';  NeedCap :  0) ,
(Code : $6E ;     Char : '.';   KeyMemo :     '. ¼ü         ';  NeedCap :  0) ,
(Code : $6F ;     Char : '/';   KeyMemo :     '/ ¼ü         ';  NeedCap :  0) ,
//--------¸¨Öú¼üÅÌ                                               NeedCap :
(Code : $70 ;     Char : '';    KeyMemo :    'F1 ¼ü(112)    ';  NeedCap :  0) ,
(Code : $71 ;     Char : '';    KeyMemo :    'F2 ¼ü         ';  NeedCap :  0) ,
(Code : $72 ;     Char : '';    KeyMemo :    'F3 ¼ü         ';  NeedCap :  0) ,
(Code : $73 ;     Char : '';    KeyMemo :    'F4 ¼ü         ';  NeedCap :  0) ,
(Code : $74 ;     Char : '';    KeyMemo :    'F5 ¼ü         ';  NeedCap :  0) ,
(Code : $75 ;     Char : '';    KeyMemo :    'F6 ¼ü         ';  NeedCap :  0) ,
(Code : $76 ;     Char : '';    KeyMemo :    'F7 ¼ü         ';  NeedCap :  0) ,
(Code : $77 ;     Char : '';    KeyMemo :    'F8 ¼ü         ';  NeedCap :  0) ,
(Code : $78 ;     Char : '';    KeyMemo :    'F9 ¼ü         ';  NeedCap :  0) ,
(Code : $79 ;     Char : '';    KeyMemo :    'F10 ¼ü        ';  NeedCap :  0) ,
(Code : $7A ;     Char : '';    KeyMemo :    'F11 ¼ü        ';  NeedCap :  0) ,
(Code : $7B ;     Char : '';    KeyMemo :    'F12 ¼ü        ';  NeedCap :  0) ,
(Code : $7C ;     Char : '';    KeyMemo :    'F13 ¼ü        ';  NeedCap :  0) ,
(Code : $7D ;     Char : '';    KeyMemo :    'F14 ¼ü        ';  NeedCap :  0) ,
(Code : $7E ;     Char : '';    KeyMemo :    'F15 ¼ü        ';  NeedCap :  0) ,
(Code : $7F ;     Char : '';    KeyMemo :    'F16 ¼ü        ';  NeedCap :  0) )  ;

//¸ù¾Ý×Ö·û·µ»Ø ¼üÅÌÂë
function GetKeyCodeFromChar(tempchar: String) : TMKKeyData;

implementation

function GetKeyCodeFromChar(tempchar: String) : TMKKeyData;
var temp:TMKKeyData ;
    i : integer ;
begin

  if tempchar<>'' then
  begin
  for i := 0 to Length(MKKeyData)-1 do
      begin
        if tempchar = MKKeyData[i].Char then
        begin
           temp := MKKeyData[i] ;
           Break ;
        end;
      end;
  end
  else
  begin
       temp.code := -1    ;
  end;
  result := temp ;

end;

end.
