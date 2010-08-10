unit UnitConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  TFormConfig = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    Label5: TLabel;
    Edit4: TEdit;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Edit7: TEdit;
    BitBtn5: TBitBtn;
    Edit5: TEdit;
    Edit6: TEdit;
    BitBtn6: TBitBtn;
    Label4: TLabel;
    Edit8: TEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    Started: Boolean;
    procedure Carregar;
    procedure CarregarConfig(ConfigFile: string);
    procedure Salvar;
    procedure SalvarConfig;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConfig: TFormConfig;

implementation

{$R *.dfm}

procedure TFormConfig.CarregarConfig(ConfigFile: string);
var
  Ini: TIniFile;
begin
  ini := TIniFile.Create(ConfigFile);
  try
    Edit1.Text := ini.readstring('irc', 'host', '200.142.160.127');
    Edit2.Text := IntToStr(ini.ReadInteger('irc', 'port', 8000));
    Edit3.Text := ini.readstring('irc', 'nick', '');
    Edit4.Text := ini.readstring('irc', 'password', 'sesc');
    Edit5.Text := ini.readstring('irc', 'altnick', 'DR-Unidade');
    Edit6.Text := ini.readstring('irc', 'username', 'DR-Unidade');
    Edit7.Text := ini.readstring('irc', 'realname', 'DR-Unidade');
    Edit8.Text := ini.readstring('irc', 'channel', 'ip-sesc');
    Ini.ReadSection('Usuarios', ListBox1.Items);
    if Listbox1.Items.Count = 0 then
    begin
      Listbox1.Items.Add('Antena01');
      Listbox1.Items.Add('Antena02');
      Listbox1.Items.Add('Antena03');
      Listbox1.Items.Add('Antena04');
      Listbox1.Items.Add('Antena05');
    end;
  finally
    Ini.Free();
  end;
end;

procedure TFormConfig.SalvarConfig();
var
  Ini: TMemIniFile;
  i: Integer;
begin
  Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + '\config.ini');
  try
    Ini.WriteString('irc', 'host', Edit1.Text);
    Ini.WriteString('irc', 'port', Edit2.Text);
    Ini.WriteString('irc', 'nick', Edit3.Text);
    Ini.WriteString('irc', 'password', Edit4.Text);
    Ini.WriteString('irc', 'altnick', Edit5.Text);
    Ini.WriteString('irc', 'username', Edit6.Text);
    Ini.WriteString('irc', 'realname', Edit7.Text);
    Ini.WriteString('irc', 'channel', Edit8.Text);    
    for i := 0 to ListBox1.Items.Count - 1 do
      Ini.WriteString('Usuarios', ListBox1.Items[i], '');
    Ini.UpdateFile();
  finally
    Ini.Free();
  end;
end;


procedure TFormConfig.Salvar();
begin
  SalvarConfig();
  Close();
end;

procedure TFormConfig.Carregar();
begin
  CarregarConfig(ExtractFilePath(ParamStr(0)) + '\config.ini');
end;


procedure TFormConfig.BitBtn4Click(Sender: TObject);
begin
  Carregar();
end;

procedure TFormConfig.BitBtn1Click(Sender: TObject);
begin
  Salvar();
end;

procedure TFormConfig.FormCreate(Sender: TObject);
begin
  Started := False;
  Carregar();
  Started := True;
end;

procedure TFormConfig.BitBtn6Click(Sender: TObject);
begin
  CarregarConfig('');
end;

procedure TFormConfig.BitBtn5Click(Sender: TObject);
begin
  ListBox1.DeleteSelected();
  BitBtn5.Enabled := False;
end;

procedure TFormConfig.Edit1Change(Sender: TObject);
begin
  if Started then
    BitBtn4.Enabled := True;
end;

procedure TFormConfig.ListBox1Click(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to ListBox1.Items.Count-1 do
  begin
    BitBtn5.Enabled := ListBox1.Selected[i];
    if BitBtn5.Enabled then
      Break;
  end;
end;

procedure TFormConfig.BitBtn3Click(Sender: TObject);
var
  newUser: string;
begin
  newUser := InputBox('Novo Usuario', 'Usuario', '');
  if newUser <> '' then
    ListBox1.Items.Add(newUser);
end;

end.


