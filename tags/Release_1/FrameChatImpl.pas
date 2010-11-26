unit FrameChatImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TFrameChat = class(TFrame)
    FrameMsg: TRichEdit;
    Panel1: TPanel;
    FrameEdit: TEdit;
    FrameButton: TButton;
    procedure FrameButtonClick(Sender: TObject);
    procedure FrameEditKeyPress(Sender: TObject; var Key: Char);
    procedure FrameEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FFrom: string;
    FControl: TForm;
    procedure SetFrom(const Value: string);
  public
    { Public declarations }
    procedure AddMessage(AText: string; Color: TColor); overload;
    procedure AddMessage(AText: string); overload;
    procedure Envia();
    procedure Clear();
  published
    property ParentForm: TForm read FControl write FControl;
    property From: string read FFrom write SetFrom;
  protected
    constructor Create(AOwner:TComponent); reintroduce;
  end;

implementation

uses Unit1, UnitMain;

{$R *.dfm}

{ TFrame2 }

procedure TFrameChat.AddMessage(AText: string; Color: TColor);
var
  Cor: TColor;
begin
  Cor := FrameMsg.SelAttributes.Color;
//  FrameMsg.SelAttributes.Style := [fsBold];
  FrameMsg.SelAttributes.Color := Color;
  FrameMsg.Lines.Add(AText);
  FrameMsg.SelAttributes.Color := Cor;
end;

procedure TFrameChat.SetFrom(const Value: string);
begin
  if FFrom <> Value then
  begin
    FFrom := Value;
    Caption := 'Conversa com ' + FFrom;
  end;
end;

procedure TFrameChat.FrameButtonClick(Sender: TObject);
begin
  Envia();
end;

procedure TFrameChat.Envia;
begin
  TForm2(ParentForm).Say(FFrom, FrameEdit.Text);
  FrameEdit.Clear;
end;

{constructor TFrameChat.Create(From: string);
begin
  inherited Create(self);
  FFrom := From;
end;
}
procedure TFrameChat.Clear;
begin
{
  if Assigned(RichMsg) then
    RichMsg.Lines.Clear();
    }
end;

procedure TFrameChat.FrameEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    FrameEdit.clear();

  if key = #13 then
  begin
    FrameButton.Click();
    FrameEdit.clear();
    Key := #0;
  end;
end;

procedure TFrameChat.FrameEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{
  StatusBar1.Panels[0].Text :=
    Format('Resta: %d', [(length(EditSend.Lines.Text) - 255)*-1]);
}
  FrameButton.Enabled := (Length(FrameEdit.Text) >0);// and IdIRC1.Connected;
end;

constructor TFrameChat.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
//  FControl := Value;
  Align := alClient;
end;

procedure TFrameChat.AddMessage(AText: string);
begin
  AddMessage(AText, clBtnText);
end;

end.
