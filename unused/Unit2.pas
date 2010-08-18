unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    FNickFrom: String;
    procedure SetNickFrom(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property NickFrom: String read FNickFrom write SetNickFrom;
    procedure AddMensagem(Texto:string);
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

{ TForm2 }

procedure TForm2.AddMensagem(Texto: string);
begin
  Memo1.Lines.Add(Texto);
end;

procedure TForm2.SetNickFrom(const Value: String);
begin
  FNickFrom := Value;
  Text := Value;
  Memo1.Lines.Clear();
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Add(Edit1.Text);
  Form1.Say(Text, Edit1.Text);
end;

end.
