
program Interagil;

uses
  Forms,
  UnitConfig in 'UnitConfig.pas' {FormConfig},
  ProcessUtil in 'ProcessUtil.pas',
  FrameChatImpl in 'FrameChatImpl.pas' {FrameChat: TFrame},
  UnitMain in 'UnitMain.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.