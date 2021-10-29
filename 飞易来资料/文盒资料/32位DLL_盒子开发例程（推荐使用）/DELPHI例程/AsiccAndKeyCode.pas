unit AsiccAndKeyCode;

interface

type
    TMKKeyData = record
        Code : integer ; //����
        Char : string; //�����Ӧ���ַ�
        KeyMemo:string;//��������
        NeedCap:Integer;
    end;
const
//��һ�׼���ɨ���룬101��102��104���ļ��̣�ע����Pause���������ԡ�       $1E
MKKeyCount = 157;
MKKeyData : array [0..MKKeyCount-1] of TMKKeyData = (  //���ܼ�
(Code : 1  ;     Char :  '';    KeyMemo :   '������       ';  NeedCap :  0),
(Code : 2  ;     Char :  '';    KeyMemo :    '����Ҽ�      ';  NeedCap :  0),
(Code : 3  ;     Char :  '';    KeyMemo :    'CANCEL��      ';  NeedCap :  0),
(Code : 4  ;     Char :  '';    KeyMemo :    '����м�      ';  NeedCap :  0),
(Code : 8  ;     Char :  '';    KeyMemo :    'BACKSPACE��   ';  NeedCap :  0),
(Code : 9  ;     Char :  '';    KeyMemo :    'TAB��         ';  NeedCap :  0),
(Code : 12  ;    Char :  '';    KeyMemo :    'CLEAR��       ';  NeedCap :  0),
(Code : 13  ;    Char :  '';    KeyMemo :    'ENTER��(13)   ';  NeedCap :  0),
(Code : $10 ;    Char :  '';    KeyMemo :    'SHIFT��       ';  NeedCap :  0),
(Code : $11 ;    Char :  '';    KeyMemo :    'CTRL��        ';  NeedCap :  0),
(Code : $12 ;    Char :  '';    KeyMemo :    'MENU��        ';  NeedCap :  0),
(Code : $13 ;    Char :  '';    KeyMemo :    'PAUSE��       ';  NeedCap :  0),
(Code : $14 ;    Char :  '';    KeyMemo :    'CAPSLOCK��    ';  NeedCap :  0),
(Code : $1B ;    Char :  '';    KeyMemo :    'ESC��         ';  NeedCap :  0),
(Code : $20 ;    Char :  '';    KeyMemo :    'SPACEBAR��(32)';  NeedCap :  0),
(Code : $21 ;    Char :  '';    KeyMemo :    'PAGEUP��      ';  NeedCap :  0),
(Code : $22 ;    Char :  '';    KeyMemo :    'PAGEDOWN��    ';  NeedCap :  0),
(Code : $23 ;    Char :  '';    KeyMemo :    'END��         ';  NeedCap :  0),
(Code : $24 ;    Char :  '';    KeyMemo :    'HOME��        ';  NeedCap :  0),
(Code : $25 ;    Char :  '';    KeyMemo :    'LEFTARROW��   ';  NeedCap :  0),
(Code : $26 ;    Char :  '';    KeyMemo :    'UPARROW��     ';  NeedCap :  0),
(Code : $27 ;    Char :  '';    KeyMemo :    'RIGHTARROW��  ';  NeedCap :  0),
(Code : $28 ;    Char :  '';    KeyMemo :    'DOWNARROW��   ';  NeedCap :  0),
(Code : $29 ;    Char :  '';    KeyMemo :    'SELECT��      ';  NeedCap :  0),
(Code : $2A ;    Char :  '';    KeyMemo :    'PRINTSCREEN�� ';  NeedCap :  0),
(Code : $2B ;    Char :  '';    KeyMemo :    'EXECUTE��     ';  NeedCap :  0),
(Code : $2C ;    Char :  '';    KeyMemo :    'SNAPSHOT��    ';  NeedCap :  0),
(Code : $2D ;    Char :  '';    KeyMemo :    'INSERT��      ';  NeedCap :  0),
(Code : $2E ;    Char :  '';    KeyMemo :    'DELETE��      ';  NeedCap :  0),
(Code : $2F ;    Char :  '';    KeyMemo :    'HELP ��       ';  NeedCap :  0),
(Code : $90 ;    Char :  '';    KeyMemo :    'NUM LOCK ��   ';  NeedCap :  0),

//�ַ���
(Code : 65   ;     Char : 'a';   KeyMemo :     'A  ��        ';  NeedCap :  1),
(Code : 66   ;     Char : 'b';   KeyMemo :     'B  ��        ';  NeedCap :  1),
(Code : 67   ;     Char : 'c';   KeyMemo :     'C  ��        ';  NeedCap :  1),
(Code : 68   ;     Char : 'd';   KeyMemo :     'D  ��        ';  NeedCap :  1),
(Code : 69   ;     Char : 'e';   KeyMemo :     'E  ��        ';  NeedCap :  1),
(Code : 70   ;     Char : 'f';   KeyMemo :     'F  ��        ';  NeedCap :  1),
(Code : 71   ;     Char : 'g';   KeyMemo :     'G  ��        ';  NeedCap :  1),
(Code : 72   ;     Char : 'h';   KeyMemo :     'H  ��        ';  NeedCap :  1),
(Code : 73   ;     Char : 'i';   KeyMemo :     'I  ��        ';  NeedCap :  1),
(Code : 74   ;     Char : 'j';   KeyMemo :     'J  ��        ';  NeedCap :  1),
(Code : 75   ;     Char : 'k';   KeyMemo :     'K  ��        ';  NeedCap :  1),
(Code : 76   ;     Char : 'l';   KeyMemo :     'L  ��        ';  NeedCap :  1),
(Code : 77   ;     Char : 'm';   KeyMemo :     'M  ��        ';  NeedCap :  1),
(Code : 78   ;     Char : 'n';   KeyMemo :     'N  ��        ';  NeedCap :  1),
(Code : 79   ;     Char : 'o';   KeyMemo :     'O  ��        ';  NeedCap :  1),
(Code : 80   ;     Char : 'p';   KeyMemo :     'P  ��        ';  NeedCap :  1),
(Code : 81   ;     Char : 'q';   KeyMemo :     'Q  ��        ';  NeedCap :  1),
(Code : 82   ;     Char : 'r';   KeyMemo :     'R  ��        ';  NeedCap :  1),
(Code : 83   ;     Char : 's';   KeyMemo :     'S  ��        ';  NeedCap :  1),
(Code : 84   ;     Char : 't';   KeyMemo :     'T  ��        ';  NeedCap :  1),
(Code : 85   ;     Char : 'u';   KeyMemo :     'U  ��        ';  NeedCap :  1),
(Code : 86   ;     Char : 'v';   KeyMemo :     'V  ��        ';  NeedCap :  1),
(Code : 87   ;     Char : 'w';   KeyMemo :     'W  ��        ';  NeedCap :  1),
(Code : 88   ;     Char : 'x';   KeyMemo :     'X  ��        ';  NeedCap :  1),
(Code : 89   ;     Char : 'y';   KeyMemo :     'Y  ��        ';  NeedCap :  1),
(Code : 90   ;     Char : 'z';   KeyMemo :     'Z  ��        ';  NeedCap :  1),
(Code : 48   ;     Char : '0';   KeyMemo :     '0  ��        ';  NeedCap :  1),
(Code : 49   ;     Char : '1';   KeyMemo :     '1  ��        ';  NeedCap :  1),
(Code : 50   ;     Char : '2';   KeyMemo :     '2  ��        ';  NeedCap :  1),
(Code : 51   ;     Char : '3';   KeyMemo :     '3  ��        ';  NeedCap :  1),
(Code : 52   ;     Char : '4';   KeyMemo :     '4  ��        ';  NeedCap :  1),
(Code : 53   ;     Char : '5';   KeyMemo :     '5  ��        ';  NeedCap :  1),
(Code : 54   ;     Char : '6';   KeyMemo :     '6  ��        ';  NeedCap :  1),
(Code : 55   ;     Char : '7';   KeyMemo :     '7  ��        ';  NeedCap :  1),
(Code : 56   ;     Char : '8';   KeyMemo :     '8  ��        ';  NeedCap :  1),
(Code : 57   ;     Char : '9';   KeyMemo :     '9  ��        ';  NeedCap :  1),

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

(Code : 65   ;     Char : 'A';   KeyMemo :     'A  ��        ';  NeedCap :  2),
(Code : 66   ;     Char : 'B';   KeyMemo :     'B  ��        ';  NeedCap :  2),
(Code : 67   ;     Char : 'C';   KeyMemo :     'C  ��        ';  NeedCap :  2),
(Code : 68   ;     Char : 'D';   KeyMemo :     'D  ��        ';  NeedCap :  2),
(Code : 69   ;     Char : 'E';   KeyMemo :     'E  ��        ';  NeedCap :  2),
(Code : 70   ;     Char : 'F';   KeyMemo :     'F  ��        ';  NeedCap :  2),
(Code : 71   ;     Char : 'G';   KeyMemo :     'G  ��        ';  NeedCap :  2),
(Code : 72   ;     Char : 'H';   KeyMemo :     'H  ��        ';  NeedCap :  2),
(Code : 73   ;     Char : 'I';   KeyMemo :     'I  ��        ';  NeedCap :  2),
(Code : 74   ;     Char : 'J';   KeyMemo :     'J  ��        ';  NeedCap :  2),
(Code : 75   ;     Char : 'K';   KeyMemo :     'K  ��        ';  NeedCap :  2),
(Code : 76   ;     Char : 'L';   KeyMemo :     'L  ��        ';  NeedCap :  2),
(Code : 77   ;     Char : 'M';   KeyMemo :     'M  ��        ';  NeedCap :  2),
(Code : 78   ;     Char : 'N';   KeyMemo :     'N  ��        ';  NeedCap :  2),
(Code : 79   ;     Char : 'O';   KeyMemo :     'O  ��        ';  NeedCap :  2),
(Code : 80   ;     Char : 'P';   KeyMemo :     'P  ��        ';  NeedCap :  2),
(Code : 81   ;     Char : 'Q';   KeyMemo :     'Q  ��        ';  NeedCap :  2),
(Code : 82   ;     Char : 'R';   KeyMemo :     'R  ��        ';  NeedCap :  2),
(Code : 83   ;     Char : 'S';   KeyMemo :     'S  ��        ';  NeedCap :  2),
(Code : 84   ;     Char : 'T';   KeyMemo :     'T  ��        ';  NeedCap :  2),
(Code : 85   ;     Char : 'U';   KeyMemo :     'U  ��        ';  NeedCap :  2),
(Code : 86   ;     Char : 'V';   KeyMemo :     'V  ��        ';  NeedCap :  2),
(Code : 87   ;     Char : 'W';   KeyMemo :     'W  ��        ';  NeedCap :  2),
(Code : 88   ;     Char : 'X';   KeyMemo :     'X  ��        ';  NeedCap :  2),
(Code : 89   ;     Char : 'Y';   KeyMemo :     'Y  ��        ';  NeedCap :  2),
(Code : 90   ;     Char : 'Z';   KeyMemo :     'Z  ��        ';  NeedCap :  2),
(Code : 48   ;     Char : ')';   KeyMemo :     '0  ��        ';  NeedCap :  2),
(Code : 49   ;     Char : '!';   KeyMemo :     '1  ��        ';  NeedCap :  2),
(Code : 50   ;     Char : '@';   KeyMemo :     '2  ��        ';  NeedCap :  2),
(Code : 51   ;     Char : '#';   KeyMemo :     '3  ��        ';  NeedCap :  2),
(Code : 52   ;     Char : '$';   KeyMemo :     '4  ��        ';  NeedCap :  2),
(Code : 53   ;     Char : '%';   KeyMemo :     '5  ��        ';  NeedCap :  2),
(Code : 54   ;     Char : '^';   KeyMemo :     '6  ��        ';  NeedCap :  2),
(Code : 55   ;     Char : '&';   KeyMemo :     '7  ��        ';  NeedCap :  2),
(Code : 56   ;     Char : '*';   KeyMemo :     '8  ��        ';  NeedCap :  2),
(Code : 57   ;     Char : '(';   KeyMemo :     '9  ��        ';  NeedCap :  2),

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


//--С���̼�
(Code : $60 ;     Char : '0';   KeyMemo :     '0 ��         ';  NeedCap :  0) ,
(Code : $61 ;     Char : '1';   KeyMemo :     '1 ��         ';  NeedCap :  0) ,
(Code : $62 ;     Char : '2';   KeyMemo :     '2 ��         ';  NeedCap :  0) ,
(Code : $63 ;     Char : '3';   KeyMemo :     '3 ��         ';  NeedCap :  0) ,
(Code : $64 ;     Char : '4';   KeyMemo :     '4 ��         ';  NeedCap :  0) ,
(Code : $65 ;     Char : '5';   KeyMemo :     '5 ��         ';  NeedCap :  0) ,
(Code : $66 ;     Char : '6';   KeyMemo :     '6 ��         ';  NeedCap :  0) ,
(Code : $67 ;     Char : '7';   KeyMemo :     '7 ��         ';  NeedCap :  0) ,
(Code : $68 ;     Char : '8';   KeyMemo :     '8 ��         ';  NeedCap :  0) ,
(Code : $69 ;     Char : '9';   KeyMemo :     '9 ��         ';  NeedCap :  0) ,
(Code : $6A ;     Char : '*';   KeyMemo :     '* ��         ';  NeedCap :  0) ,
(Code : $6B ;     Char : '+';   KeyMemo :     '+ ��         ';  NeedCap :  0) ,
(Code : $6C ;     Char : '';    KeyMemo :     'ENTER��      ';  NeedCap :  0) ,
(Code : $6D ;     Char : '-';   KeyMemo :     '-��          ';  NeedCap :  0) ,
(Code : $6E ;     Char : '.';   KeyMemo :     '. ��         ';  NeedCap :  0) ,
(Code : $6F ;     Char : '/';   KeyMemo :     '/ ��         ';  NeedCap :  0) ,
//--------��������                                               NeedCap :
(Code : $70 ;     Char : '';    KeyMemo :    'F1 ��(112)    ';  NeedCap :  0) ,
(Code : $71 ;     Char : '';    KeyMemo :    'F2 ��         ';  NeedCap :  0) ,
(Code : $72 ;     Char : '';    KeyMemo :    'F3 ��         ';  NeedCap :  0) ,
(Code : $73 ;     Char : '';    KeyMemo :    'F4 ��         ';  NeedCap :  0) ,
(Code : $74 ;     Char : '';    KeyMemo :    'F5 ��         ';  NeedCap :  0) ,
(Code : $75 ;     Char : '';    KeyMemo :    'F6 ��         ';  NeedCap :  0) ,
(Code : $76 ;     Char : '';    KeyMemo :    'F7 ��         ';  NeedCap :  0) ,
(Code : $77 ;     Char : '';    KeyMemo :    'F8 ��         ';  NeedCap :  0) ,
(Code : $78 ;     Char : '';    KeyMemo :    'F9 ��         ';  NeedCap :  0) ,
(Code : $79 ;     Char : '';    KeyMemo :    'F10 ��        ';  NeedCap :  0) ,
(Code : $7A ;     Char : '';    KeyMemo :    'F11 ��        ';  NeedCap :  0) ,
(Code : $7B ;     Char : '';    KeyMemo :    'F12 ��        ';  NeedCap :  0) ,
(Code : $7C ;     Char : '';    KeyMemo :    'F13 ��        ';  NeedCap :  0) ,
(Code : $7D ;     Char : '';    KeyMemo :    'F14 ��        ';  NeedCap :  0) ,
(Code : $7E ;     Char : '';    KeyMemo :    'F15 ��        ';  NeedCap :  0) ,
(Code : $7F ;     Char : '';    KeyMemo :    'F16 ��        ';  NeedCap :  0) )  ;

//�����ַ����� ������
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
