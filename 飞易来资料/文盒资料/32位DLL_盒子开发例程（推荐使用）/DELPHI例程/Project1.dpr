program Project1;

uses
  Forms,
  HandKeyInput in 'HandKeyInput.pas',
  AsiccAndKeyCode in 'AsiccAndKeyCode.pas',
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
