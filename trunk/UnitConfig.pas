unit UnitConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles, ExtCtrls;

type
  TFormConfig = class(TForm)
    GroupBox1: TGroupBox;
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
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit8: TEdit;
    CheckBox1: TCheckBox;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    Started: Boolean;
    Closing: Boolean;
    procedure Carregar;
    procedure CarregarConfig(ConfigFile: string);
    function Salvar: boolean;
    procedure SalvarConfig;
    procedure Cancelar;
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
    Edit5.Text := ini.readstring('irc', 'altnick', '');
    Edit6.Text := ini.readstring('irc', 'username', 'Dummy');
    Edit7.Text := ini.readstring('irc', 'realname', 'Dummy');
    Edit8.Text := ini.readstring('irc', 'channel', 'ip-sesc');
    Ini.ReadSection('Usuarios', ListBox1.Items);
    if Listbox1.Items.Count = 0 then
    begin
      Listbox1.Items.Add('Antena01');
      Listbox1.Items.Add('Antena02');
      Listbox1.Items.Add('Antena03');
      Listbox1.Items.Add('Antena04');
      Listbox1.Items.Add('Antena05');
     {Listbox1.Items.Add('Antena06');
      Listbox1.Items.Add('Antena07');
      Listbox1.Items.Add('Antena08');
      Listbox1.Items.Add('Antena09');
      Listbox1.Items.Add('Antena10');}
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


function TFormConfig.Salvar(): boolean;
begin
  Result := False;
  if Length(Edit7.Text)<5 then
  begin
    ShowMessage('O usuário deve conter mais que 4 letras');
    Exit;
  end
  else
  begin
    Result := true;
    SalvarConfig();
  end;
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
  if Salvar() then
    ModalResult := mrOk;
end;

procedure TFormConfig.FormCreate(Sender: TObject);
begin
  Closing := False;
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

procedure TFormConfig.CheckBox1Click(Sender: TObject);
begin
  Panel1.Enabled := CheckBox1.Checked;
end;

procedure TFormConfig.BitBtn2Click(Sender: TObject);
begin
  Cancelar();
end;

procedure TFormConfig.Cancelar;
begin
  //teve ateração?
  if not BitBtn4.Enabled then
    ModalResult := mrCancel
  else
    //confirma se descarta
    if MessageDlg('Descarta alterações e fecha?',
       mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      ModalResult := mrCancel
    else
      Exit;
end;

end.


