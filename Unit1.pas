unit Unit1;

{$DEFINE DEBUG}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,inifiles, Buttons, ComCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdCmdTCPClient, IdIRC,
  IdContext, Unit2, ExtCtrls, IdAntiFreezeBase, IdAntiFreeze;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    Button5: TButton;
    IdIRC1: TIdIRC;
    Edit1: TEdit;
    Memo2: TRichEdit;
    Timer1: TTimer;
    IdAntiFreeze1: TIdAntiFreeze;
    procedure ButtonEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure IdIRC1AdminInfoReceived(ASender: TIdContext;
      AAdminInfo: TStrings);
    procedure IdIRC1ServerError(ASender: TIdContext; AErrorCode: Integer;
      const AErrorMessage: String);
    procedure IdIRC1IsOnIRC(ASender: TIdContext; const ANickname,
      AHost: String);
    procedure IdIRC1MOTD(ASender: TIdContext; AMOTD: TStrings);
    procedure IdIRC1ServerStatsReceived(ASender: TIdContext;
      AStatus: TStrings);
    procedure IdIRC1UserInfoReceived(ASender: TIdContext;
      AUserInfo: TStrings);
    procedure IdIRC1ChannelMode(ASender: TIdContext);
    procedure IdIRC1CTCPReply(ASender: TIdContext; const ANicknameFrom,
      AHost, ANicknameTo, AChannel, ACommand, AParams: String);
    procedure IdIRC1KnownServersListReceived(ASender: TIdContext;
      AKnownServers: TStrings);
    procedure IdIRC1NicknameError(ASender: TIdContext; AError: Integer);
    procedure IdIRC1NicknameChange(ASender: TIdContext; const AOldNickname,
      AHost, ANewNickname: String);
    procedure IdIRC1NicknamesListReceived(ASender: TIdContext;
      const AChannel: String; ANicknameList: TStrings);
    procedure IdIRC1Notice(ASender: TIdContext; const ANicknameFrom, AHost,
      ANicknameTo, ANotice: String);
    procedure IdIRC1ServerListReceived(ASender: TIdContext;
      AServerList: TStrings);
    procedure IdIRC1UserMode(ASender: TIdContext; const ANickname, AHost,
      AUserMode: String);
    procedure IdIRC1Trace(ASender: TIdContext; ATraceInfo: TStrings);
    procedure IdIRC1Connected(Sender: TObject);
    procedure IdIRC1Join(ASender: TIdContext; const ANickname, AHost,
      AChannel: String);
    procedure IdIRC1Service(ASender: TIdContext);
    procedure IdIRC1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure IdIRC1ServerUsersListReceived(ASender: TIdContext;
      AUsers: TStrings);
    procedure IdIRC1Raw(ASender: TIdContext; AIn: Boolean;
      const AMessage: String);
    procedure IdIRC1PrivateMessage(ASender: TIdContext;
      const ANicknameFrom, AHost, ANicknameTo, AMessage: String);
    procedure IdIRC1Part(ASender: TIdContext; const ANickname, AHost,
      AChannel: String);
    procedure IdIRC1KillError(ASender: TIdContext);
    procedure IdIRC1Kill(ASender: TIdContext; const ANicknameFrom, AHost,
      ANicknameTo, AReason: String);
    procedure IdIRC1Kick(ASender: TIdContext; const ANickname, AHost,
      AChannel, ATarget, AReason: String);
    procedure IdIRC1Inviting(ASender: TIdContext; const ANickname,
      AHost: String);
    procedure IdIRC1Invite(ASender: TIdContext; const ANicknameFrom, AHost,
      ANicknameTo, AChannel: String);
    procedure IdIRC1InvitationListReceived(ASender: TIdContext;
      const AChannel: String; AInviteList: TStrings);
    procedure IdIRC1ExceptionListReceived(ASender: TIdContext;
      const AChannel: String; AExceptList: TStrings);
    procedure IdIRC1BeforeCommandHandler(ASender: TIdCmdTCPClient;
      var AData: String; AContext: TIdContext);
    procedure Button5Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure IdIRC1Disconnected(Sender: TObject);
  private
    IRCChannel: String;
    Users: TStrings;
    NickIdx: Integer;
    Nicked: Boolean;
    ListaJanelas: TList;
    procedure ConfiguraIRC;
    procedure Configura;
    procedure Connect();
    procedure Identify(Password: string);
    procedure Join(AChannel: string);
    procedure Part();
    procedure Nick(NickName: string);
    function GetFormChat(ANickFrom: string): TForm2;
    procedure ExibeConversa(ANickFrom, AMessage:string);
    procedure WaitFor(var BoolVar: Boolean);
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

procedure TForm1.Connect();
begin
  NickIdx := Users.Count-1;
  Nicked := False;
  IdIrc1.Nickname := Users[NickIdx];
  IdIRC1.AltNickname := Users[NickIdx];

  try
    IdIRC1.Connect();
  except

    if not idIRC1.Connected then
    begin
      MessageDlg('Error connectiing to ' + idIRC1.Host, mtError, [mbOK], 0);
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

  AMsg := format('[%s] %s',[IdIRC1.RealName, Texto]);
  IdIRC1.Raw(Format('PRIVMSG %s :%s', [ATarget, AMsg]));
  Timer1.Enabled := False;
  Timer1.Enabled := True;  
end;

procedure TForm1.WaitFor(var BoolVar: Boolean);
var
  start: Cardinal;
begin
  start := GetTickCount();
  while (not BoolVar) and (GetTickCount() - start < 2000) do
  begin
    Application.ProcessMessages;
  end;
end;

procedure TForm1.ButtonEnviarClick(Sender: TObject);
var
  b:boolean;
begin
  if not IdIRC1.Connected then
  begin
    ConfiguraIRC();
    Connect();
    //after Connect
    //Identify(IdIRC1.Password);
    //after Identify
    Join(IRCChannel);
   end;

//  WaitFor(b);
  try
    Say('', Edit1.Text);
    Memo2.Lines.Add(Edit1.Text);    
    Edit1.Clear();
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
  memo2.lines.clear();
  Configura();
  ConfiguraIRC();
  ListaJanelas := TList.Create;
end;

procedure TForm1.Memo2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    memo2.Lines.clear();
    
  if key = #13 then
    ButtonEnviarClick(nil);
    
  StatusBar1.Panels[0].Text := format('Resta: %d', [(length(memo2.Text) - 255)*-1]);
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Configura();
  ConfiguraIRC();
end;

procedure TForm1.Part;
begin
  Timer1.Enabled := False;
  IdIRC1.Part('#'+IRCChannel);
  IdIRC1.Disconnect();
end;

procedure TForm1.Nick(NickName: string);
begin
  IdIRC1.Raw(format('NICK %s',[NickName]));
end;

procedure TForm1.IdIRC1AdminInfoReceived(ASender: TIdContext;
  AAdminInfo: TStrings);
begin
  Log('Info :');
end;

procedure TForm1.IdIRC1ServerError(ASender: TIdContext;
  AErrorCode: Integer; const AErrorMessage: String);
begin
  Log('ServerError');
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

procedure TForm1.IdIRC1ServerStatsReceived(ASender: TIdContext;
  AStatus: TStrings);
begin
  Log('ServerStatusreceive');
end;

procedure TForm1.IdIRC1UserInfoReceived(ASender: TIdContext;
  AUserInfo: TStrings);
begin
  Log('inforeceived');
end;

procedure TForm1.IdIRC1ChannelMode(ASender: TIdContext);
begin
  Log('ChannelMode');
end;

procedure TForm1.IdIRC1CTCPReply(ASender: TIdContext; const ANicknameFrom,
  AHost, ANicknameTo, AChannel, ACommand, AParams: String);
begin
  Log('CTCP Reply');
end;

procedure TForm1.IdIRC1KnownServersListReceived(ASender: TIdContext;
  AKnownServers: TStrings);
begin
Log('ServerList');
end;

procedure TForm1.IdIRC1NicknameError(ASender: TIdContext; AError: Integer);
begin
Log('OnNickNameError');
end;

procedure TForm1.IdIRC1NicknameChange(ASender: TIdContext;
  const AOldNickname, AHost, ANewNickname: String);
begin
 Log('OnNickNameChange');
end;

procedure TForm1.IdIRC1NicknamesListReceived(ASender: TIdContext;
  const AChannel: String; ANicknameList: TStrings);
begin
  Log('OnNickNamesListRcv');
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
  Memo2.Lines.Add(ANotice);
  Log('OnNotice nick:' + ANicknameFrom +' host:'+ AHost + ' to:'+ ANicknameTo +
    ' notice:' + ANotice);
{$ENDIF}

end;

procedure TForm1.IdIRC1ServerListReceived(ASender: TIdContext;
  AServerList: TStrings);
begin
  Log('OnServerListRcv');
end;

procedure TForm1.IdIRC1UserMode(ASender: TIdContext; const ANickname,
  AHost, AUserMode: String);
begin
  Log('OnUserMode ' + ANickname+ ' '+ AHost +' '+AUserMode);
end;

procedure TForm1.IdIRC1Trace(ASender: TIdContext; ATraceInfo: TStrings);
begin
Log('OnTrace');
end;

procedure TForm1.IdIRC1Connected(Sender: TObject);
begin
  Log('OnConnected');
  //conectado...
  //Identify('');
end;

procedure TForm1.IdIRC1Join(ASender: TIdContext; const ANickname, AHost,
  AChannel: String);
begin
  //Log('OnJoin');
  Memo2.Lines.Add('Entrando no canal: '+ AChannel);
end;

procedure TForm1.IdIRC1Service(ASender: TIdContext);
begin
  Log('Service');
end;

procedure TForm1.IdIRC1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: String);
begin
  Log('Status:'+AStatusText);
  StatusBar1.Panels[0].Text := AStatusText;
end;

procedure TForm1.IdIRC1ServerUsersListReceived(ASender: TIdContext;
  AUsers: TStrings);
begin
  Log('OnServerUserListReceived');
end;

procedure TForm1.IdIRC1Raw(ASender: TIdContext; AIn: Boolean;
  const AMessage: String);
begin
  Log('OnRaw: '+AMessage);
  //User in uso, tenta alterar nick
  if Copy(AMessage, 1, 3) ='433' then
  begin
    //Nick();
    //IdIRC1.Disconnect('433');
    //ShowMessage('usuário em uso');

    Dec(NickIdx);
    if NickIdx<0 then IdIRC1.Disconnect();
    Nick(Users[NickIdx]);
  end;
{
  //connected
  if Copy(AMessage, 1, 3) ='001' then
  begin
    Nicked := True;
    Identify(IdIRC1.Password);
  end;}
end;

procedure TForm1.IdIRC1PrivateMessage(ASender: TIdContext;
  const ANicknameFrom, AHost, ANicknameTo, AMessage: String);
begin
  if SameText(ANicknameTo, '#ip-sesc') then
  begin
    Memo2.Lines.Add(Format('<%s> %s',[ANicknameFrom, AMessage]));
  end
  else
    ExibeConversa(ANicknameFrom, AMessage);
end;

procedure TForm1.IdIRC1Part(ASender: TIdContext; const ANickname, AHost,
  AChannel: String);
begin
  Log('OnPart');
end;

procedure TForm1.IdIRC1KillError(ASender: TIdContext);
begin
  Log('OnKillError');
end;

procedure TForm1.IdIRC1Kill(ASender: TIdContext; const ANicknameFrom,
  AHost, ANicknameTo, AReason: String);
begin
  Log('OnKill');
end;

procedure TForm1.IdIRC1Kick(ASender: TIdContext; const ANickname, AHost,
  AChannel, ATarget, AReason: String);
begin
  Log('OnKick');
end;

procedure TForm1.IdIRC1Inviting(ASender: TIdContext; const ANickname,
  AHost: String);
begin
  Log('OnInviting');
end;

procedure TForm1.IdIRC1Invite(ASender: TIdContext; const ANicknameFrom,
  AHost, ANicknameTo, AChannel: String);
begin
  Log('OnInvite');
end;

procedure TForm1.IdIRC1InvitationListReceived(ASender: TIdContext;
  const AChannel: String; AInviteList: TStrings);
begin
  Log('OnInvitationListReceived');
end;

procedure TForm1.IdIRC1ExceptionListReceived(ASender: TIdContext;
  const AChannel: String; AExceptList: TStrings);
begin
  Log('OnExceptionListRcv');
end;

procedure TForm1.IdIRC1BeforeCommandHandler(ASender: TIdCmdTCPClient;
  var AData: String; AContext: TIdContext);
begin
  Log('OnBforeCommandHandler '+ AData);
end;

function TForm1.GetFormChat(ANickFrom: string): TForm2;
var
  x: integer;
  encontrada: boolean;
begin
  Result := nil;
  Encontrada := false;

  for x := 0 to ListaJanelas.Count - 1 do
  begin
    if SameText(TForm2(ListaJanelas.Items[x]).NickFrom, ANickFrom) then
    begin
      Encontrada := true;
      Result := TForm2(ListaJanelas.Items[x]);
      Break;
    end;
  end;

  if not encontrada then
  begin
    Result := TForm2.Create(self);
    Result.NickFrom := ANickFrom;
    ListaJanelas.Add(Result);
    Result.Show();
    Application.ProcessMessages();
  end;

end;

procedure TForm1.ExibeConversa(ANickFrom, AMessage: string);
var
  FormChat: TForm2;
begin
  FormChat := GetFormChat(ANickFrom);
  Application.ProcessMessages;
  //Local Echo
  FormChat.AddMensagem(Format('<%s> %s',[ANickFrom, AMessage] ));

//  if not FormChat.Showing then
//    FormChat.Show();
  Application.ProcessMessages;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ExibeConversa('Antena05','Teste');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Part();
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Part();
end;

procedure TForm1.IdIRC1Disconnected(Sender: TObject);
begin
  Memo2.SelAttributes.Color := clRed;
  Memo2.SelAttributes.Style := [fsBold];  
  Memo2.Lines.Add('> Desconectado.');
  Memo2.SelAttributes.Color := clBtnText;
end;

end.
