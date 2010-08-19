unit Unit1;

{$DEFINE DEBUG}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,inifiles, Buttons, ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdCmdTCPClient, IdIRC,
  IdContext, ExtCtrls, IdAntiFreezeBase, IdAntiFreeze;

type

  TForm1 = class(TForm)
    ButtonConfigurar: TBitBtn;
    StatusBar1: TStatusBar;
    ButtonConectar: TButton;
    IdIRC1: TIdIRC;
    Timer1: TTimer;
    IdAntiFreeze1: TIdAntiFreeze;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    LogRecebidas: TRichEdit;
    ComboBoxNames: TComboBox;
    ButtonSend: TButton;
    EditSend: TMemo;
    procedure ButtonSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditSendKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonConfigurarClick(Sender: TObject);
    procedure IdIRC1ServerError(ASender: TIdContext; AErrorCode: Integer;
      const AErrorMessage: String);
    procedure IdIRC1IsOnIRC(ASender: TIdContext; const ANickname,
      AHost: String);
    procedure IdIRC1MOTD(ASender: TIdContext; AMOTD: TStrings);
    procedure IdIRC1UserInfoReceived(ASender: TIdContext;
      AUserInfo: TStrings);
    procedure IdIRC1NicknameChange(ASender: TIdContext; const AOldNickname,
      AHost, ANewNickname: String);
    procedure IdIRC1Notice(ASender: TIdContext; const ANicknameFrom, AHost,
      ANicknameTo, ANotice: String);
    procedure IdIRC1Connected(Sender: TObject);
    procedure IdIRC1Join(ASender: TIdContext; const ANickname, AHost,
      AChannel: String);
    procedure IdIRC1Service(ASender: TIdContext);
    procedure IdIRC1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure IdIRC1Raw(ASender: TIdContext; AIn: Boolean;
      const AMessage: String);
    procedure IdIRC1PrivateMessage(ASender: TIdContext;
      const ANicknameFrom, AHost, ANicknameTo, AMessage: String);
    procedure IdIRC1Part(ASender: TIdContext; const ANickname, AHost,
      AChannel: String);
    procedure TimerDisconect(Sender: TObject);
    procedure IdIRC1Disconnected(Sender: TObject);
    procedure LogRecebidasChange(Sender: TObject);
    procedure EditSendKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonConnect(Sender: TObject);
    procedure ButtonDisconnect(Sender: TObject);
  private
    IRCChannel: String;
    Users: TStrings;
    NickIdx: Integer;
    FInChannel: Boolean;

    procedure ConfiguraIRC();
    procedure Configura();
    procedure Connect();
    procedure Disconnect();
    procedure Identify(Password: string);
    procedure Join(AChannel: string);
    procedure Part();
    procedure Nick(NickName: string);
    procedure ExibeConversa(ANickFrom, AMessage:string);
    procedure WaitFor(var BoolVar: Boolean; Timeout: Cardinal = 5);

  public
    { Public declarations }
    procedure Say(ATarget, Texto: string);    
  end;

var
  Form1: TForm1;

implementation

uses UnitConfig;

{$R *.dfm}

procedure Log(s: string);
var
  APath, ALogFile: String;
  TLogFile: TextFile;
begin
  ALogFile := 'log.txt';
  APath := ExtractFilePath(ALogFile);

  if (APath <> '') then
    ForceDirectories(APath);

  AssignFile(TLogFile, ALogFile);
  try
    if FileExists(ALogFile) then
      Append(TLogFile)
    else
      Rewrite(TLogFile);

    Writeln(TLogFile, s);
  finally
    {$I-}CloseFile(TLogFile);{$I+}
  end;
end;

procedure TForm1.Disconnect();
begin
  Part();
  IdIRC1.Disconnect();
end;

procedure TForm1.Connect();
begin
  FInChannel := False;
  NickIdx := Users.Count-1;
  IdIrc1.Nickname := Users[NickIdx];
  IdIRC1.AltNickname := Users[NickIdx];

  try
    IdIRC1.Connect();
  except

    if not idIRC1.Connected then
    begin
      MessageDlg('Erro ao tentar conectar:' + idIRC1.Host, mtError, [mbOK], 0);
      Exit;
    end;
  end;
end;

procedure TForm1.Identify(Password: string);
begin
  IdIRC1.Say('NickServ', 'IDENTIFY ' + IdIRC1.Password);
end;

procedure TForm1.Join(AChannel: string);
begin
  if (AChannel = '') then
    AChannel := IRCChannel;

  if AChannel[1]<>'#' then
    AChannel := '#' + AChannel ;

  //  if not Identified then
  IdIRC1.Raw(Format('JOIN %s', [AChannel]));
end;

procedure TForm1.Say(ATarget, Texto: string);
var
  AMsg: string;
begin
  if ATarget='' then
    ATarget := '#'+IRCChannel;

  ATarget := StringReplace(ATarget,'@','',[rfReplaceAll]);
  ATarget := StringReplace(ATarget,'+','',[rfReplaceAll]);
  
  AMsg := Format('[%s] %s',[IdIRC1.RealName, Texto]);
  IdIRC1.Raw(Format('PRIVMSG %s :%s', [ATarget, AMsg]));

  if ATarget = '#'+IRCChannel then
    LogRecebidas.Lines.Add(AMsg)
  else
  begin
    LogRecebidas.Lines.Add(Format('[%s] <%s>: %s',[IdIRC1.RealName, ATarget, Texto]));

  end;

  Timer1.Enabled := False;
  Timer1.Enabled := True;  
end;

procedure TForm1.WaitFor(var BoolVar: Boolean; Timeout: Cardinal = 5);
var
  start: Cardinal;
begin
  start := GetTickCount();
  while (not BoolVar) and (GetTickCount() - start < (Timeout*1000)) do
    Application.ProcessMessages;
end;

procedure TForm1.ButtonSendClick(Sender: TObject);
begin
  if not IdIRC1.Connected then
  begin
    ConfiguraIRC();
    Connect();
    Join(IRCChannel);
   end;

  WaitFor(FInChannel);
  try
    Say(ComboBoxNames.Text, EditSend.Text);
    EditSend.Clear();
  except
    MessageDlg('Erro ao tentar entrar no canal: ' + idIRC1.Host, mtError, [mbOK], 0);
    Exit;
  end;
end;

procedure TForm1.ConfiguraIRC();
var
  Ini: TCustomIniFile;
begin
  Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + '\config.ini');
  try
    IdIRC1.Host := ini.readstring('irc', 'host', '200.142.160.127');
    IdIRC1.Port := ini.ReadInteger('irc', 'port', 8000);
    IdIRC1.Username := ini.readstring('irc', 'username', '');
    IdIRC1.Password := ini.readstring('irc', 'password', '');
    IdIRC1.AltNickname := ini.readstring('irc', 'altnick', '');
    IdIRC1.RealName := ini.readstring('irc', 'realname', '');
    IRCChannel := ini.readstring('irc', 'channel', '');
    Ini.ReadSection('Usuarios', Users);
  finally
    Ini.Free();
  end;
  StatusBar1.Panels[1].Text := format('%s : %d - [%s]', [IdIRC1.Host, IdIRC1.Port, IdIRC1.RealName]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Users := TStringList.Create();
  LogRecebidas.lines.clear();
  Configura();
  ConfiguraIRC();
  FInChannel := False;
  ComboBoxNames.Items.Text := '#'+IRCChannel;
  ComboBoxNames.ItemIndex := 0;  
end;

procedure TForm1.EditSendKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    LogRecebidas.Lines.clear();
    
  if key = #13 then
    ButtonSendClick(nil);
 
end;

procedure TForm1.Configura();
begin
  with TFormConfig.Create(self) do
  try
    ShowModal();
  finally
    Free();
  end;
end;

procedure TForm1.ButtonConfigurarClick(Sender: TObject);
begin
  Configura();
  ConfiguraIRC();
end;

procedure TForm1.Part;
begin
  Timer1.Enabled := False;
  IdIRC1.Part('#'+IRCChannel);
end;

procedure TForm1.Nick(NickName: string);
begin
  IdIRC1.Raw(format('NICK %s',[NickName]));
end;

procedure TForm1.IdIRC1ServerError(ASender: TIdContext;
  AErrorCode: Integer; const AErrorMessage: String);
begin
  Log('ServerError:'+AErrorMessage);
  ShowMessage('ServerError:'+AErrorMessage);
end;

procedure TForm1.IdIRC1IsOnIRC(ASender: TIdContext; const ANickname,
  AHost: String);
begin
  Log('isonIRC');
end;

procedure TForm1.IdIRC1MOTD(ASender: TIdContext; AMOTD: TStrings);
begin
  Log('MOTD');
end;

procedure TForm1.IdIRC1UserInfoReceived(ASender: TIdContext;
  AUserInfo: TStrings);
begin
{$IFDEF DEBUG}
  Log('inforeceived'+AUserInfo.Text);
  LogRecebidas.Lines.Add('inforeceived:'+#13+AUserInfo.Text);
{$ENDIF}
end;

procedure TForm1.IdIRC1NicknameChange(ASender: TIdContext;
  const AOldNickname, AHost, ANewNickname: String);
begin
  {$IFDEF DEBUG}
  Log(Format('NickNameChange'+#10+'OLD=%s NEW=%s Host=%s',
    [AOldNickname+#10, ANewNickname+#10, AHost+#10]));
  {$ENDIF}
end;

procedure TForm1.IdIRC1Notice(ASender: TIdContext; const ANicknameFrom,
  AHost, ANicknameTo, ANotice: String);
begin
  //need Identify
  if Pos('IDENTIFY_REQUEST', ANotice)>0 then
    Identify(IdIRC1.Password);

  //Do Join
  if Pos('IDENTIFY Password accepted', ANotice)>0 then
    Join(IRCChannel);

{$IFDEF DEBUG}
  Log('OnNotice'+#13+'nick:' + ANicknameFrom +' host:'+ AHost +
  ' to:'+ ANicknameTo + ' notice:' + ANotice);
{$ENDIF}

end;

procedure TForm1.IdIRC1Connected(Sender: TObject);
begin
{$IFDEF DEBUG}
  Log('Conectado.');
{$ENDIF}

  ButtonConectar.Caption := 'Desconectar';
  ButtonConectar.OnClick := ButtonDisconnect;
  Timer1.Enabled := True;
end;

procedure TForm1.IdIRC1Join(ASender: TIdContext; const ANickname, AHost,
  AChannel: String);
begin
  LogRecebidas.Lines.Add('Voce est� no canal: '+ AChannel);
  FInChannel := True;  
end;

procedure TForm1.IdIRC1Service(ASender: TIdContext);
begin
  Log('Service');
end;

procedure TForm1.IdIRC1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: String);
begin
  {$IFDEF DEBUG}
  Log('Status:'+AStatusText);
  {$ENDIF}
  StatusBar1.Panels[0].Text := AStatusText;
end;

function ParseNames(s:string):string;
var
  Lista:TStrings;
begin
  Lista := TStringList.Create();
  Lista.Delimiter := ' ';
  Lista.CommaText := Copy(s, pos(':', s) + 1, Length(s));
  Result := Lista.Text;
end;


procedure TForm1.IdIRC1Raw(ASender: TIdContext; AIn: Boolean;
  const AMessage: String);
begin
  {$IFDEF DEBUG}
  Log('OnRaw: ' + AMessage);
  {$ENDIF}

  //User in uso, tenta alterar nick
  if Copy(AMessage, 1, 3) ='433' then
  begin
    Dec(NickIdx);
    if NickIdx<0 then
      IdIRC1.Disconnect();
    Nick(Users[NickIdx]);
  end;

  //lista de usuarios
  if Copy(AMessage, 1, 3) ='353' then
  begin
  //353 Antena04 = #ip-sesc :@SescApoio SescADM @SescDN Antena05 @carlos DNAndre Antena04
    ComboBoxNames.Enabled := True;
    ComboBoxNames.Items.Text := ParseNames(AMessage);
    ComboBoxNames.Items.Insert(0, '#'+IRCChannel);
    ComboBoxNames.ItemIndex := 0;
  end;

  if copy(AMessage, 1,3) = '401' then
    ShowMessage('Usuario n�o est� mais conectado'+#10+
      'Tente enviar a mensagem para o chat p�blico: #' + IRCChannel );
end;

procedure TForm1.IdIRC1PrivateMessage(ASender: TIdContext;
  const ANicknameFrom, AHost, ANicknameTo, AMessage: String);
begin
  if SameText(ANicknameTo, '#ip-sesc') then
  begin
    LogRecebidas.Lines.Add(Format('<%s> %s',[ANicknameFrom, AMessage]));
  end
  else
    ExibeConversa(ANicknameFrom, AMessage);
end;

procedure TForm1.IdIRC1Part(ASender: TIdContext; const ANickname, AHost,
  AChannel: String);
begin
  Log('OnPart');
  FInChannel := False;
end;

procedure TForm1.ExibeConversa(ANickFrom, AMessage: string);
begin
  LogRecebidas.SelAttributes.Style := [fsBold];
  LogRecebidas.Lines.Add(Format('<%s> [%s]: %s',[IdIRC1.RealName,ANickFrom, AMessage]));
  LogRecebidas.SelAttributes.Color := clBtnText;
end;

procedure TForm1.TimerDisconect(Sender: TObject);
begin
  Disconnect();
end;

procedure TForm1.IdIRC1Disconnected(Sender: TObject);
begin
  Timer1.Enabled := False;
  LogRecebidas.SelAttributes.Color := clRed;
  LogRecebidas.SelAttributes.Style := [fsBold];
  LogRecebidas.Lines.Add('> Desconectado automaticamente.');
  LogRecebidas.SelAttributes.Color := clBtnText;

  ButtonConectar.Caption := 'Conectar';
  ButtonConectar.OnClick := ButtonConnect;
  ComboBoxNames.Items.Text := '#' + IRCChannel;
  ComboBoxNames.ItemIndex := 0;
end;

procedure TForm1.LogRecebidasChange(Sender: TObject);
begin
  SendMessage(LogRecebidas.Handle, WM_VSCROLL, SB_PAGEDOWN, 0);
end;

procedure TForm1.EditSendKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  StatusBar1.Panels[0].Text :=
    format('Resta: %d', [(length(EditSend.Text) - 255)*-1]);

  ButtonSend.Enabled := (Length(EditSend.Text) >0);// and IdIRC1.Connected;
end;

procedure TForm1.ButtonConnect(Sender: TObject);
begin
  Connect();
end;

procedure TForm1.ButtonDisconnect(Sender: TObject);
begin
  Disconnect();
end;

end.

{procedure TForm1.Flashing(bValue: boolean);
begin
  FlashWindow(Handle, bValue); // The current form
  FlashWindow(Application.Handle, bValue); // The app button on the taskbar
end;}
