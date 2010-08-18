object Form1: TForm1
  Left = 152
  Top = 142
  Width = 515
  Height = 256
  BorderIcons = [biSystemMenu]
  Caption = 'Envio de mensagens'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  DesignSize = (
    507
    222)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 104
    Top = 5
    Width = 89
    Height = 25
    Hint = 'Configura'#231#227'o'
    Anchors = [akLeft, akBottom]
    Caption = 'Configurar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
      3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
      700077337F3333373777887007333337007733F773F333337733700070333333
      077037773733333F7F37703707333300080737F373333377737F003333333307
      78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
      078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
      70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
      3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
      33337F73FF737773333307800077033333337337773373333333}
    NumGlyphs = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 203
    Width = 507
    Height = 19
    Panels = <
      item
        Width = 60
      end
      item
        Width = 50
      end>
  end
  object Button5: TButton
    Left = 8
    Top = 5
    Width = 89
    Height = 25
    Hint = 'Conectar'
    Anchors = [akLeft, akBottom]
    Caption = 'Conectar'
    TabOrder = 2
    OnClick = Button5Click
  end
  object Edit1: TEdit
    Left = 96
    Top = 176
    Width = 321
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    Enabled = False
    TabOrder = 3
    OnKeyPress = Memo2KeyPress
  end
  object Memo2: TRichEdit
    Left = 7
    Top = 40
    Width = 490
    Height = 127
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
    OnChange = Memo2Change
  end
  object ComboBox1: TComboBox
    Left = 6
    Top = 176
    Width = 83
    Height = 19
    AutoComplete = False
    Style = csOwnerDrawFixed
    Anchors = [akRight, akBottom]
    Enabled = False
    ItemHeight = 13
    TabOrder = 5
  end
  object Button1: TButton
    Left = 424
    Top = 174
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Enviar'
    Enabled = False
    TabOrder = 6
    OnClick = ButtonEnviarClick
  end
  object IdIRC1: TIdIRC
    OnStatus = IdIRC1Status
    OnDisconnected = IdIRC1Disconnected
    OnConnected = IdIRC1Connected
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    ReadTimeout = 0
    CommandHandlers = <>
    ExceptionReply.Code = '500'
    ExceptionReply.Text.Strings = (
      'Unknown Internal Error')
    OnBeforeCommandHandler = IdIRC1BeforeCommandHandler
    UserMode = []
    OnPrivateMessage = IdIRC1PrivateMessage
    OnNotice = IdIRC1Notice
    OnIsOnIRC = IdIRC1IsOnIRC
    OnJoin = IdIRC1Join
    OnPart = IdIRC1Part
    OnKick = IdIRC1Kick
    OnMOTD = IdIRC1MOTD
    OnTrace = IdIRC1Trace
    OnInviting = IdIRC1Inviting
    OnInvite = IdIRC1Invite
    OnExceptionListReceived = IdIRC1ExceptionListReceived
    OnInvitationListReceived = IdIRC1InvitationListReceived
    OnServerListReceived = IdIRC1ServerListReceived
    OnServerUsersListReceived = IdIRC1ServerUsersListReceived
    OnServerStatsReceived = IdIRC1ServerStatsReceived
    OnKnownServersListReceived = IdIRC1KnownServersListReceived
    OnAdminInfoReceived = IdIRC1AdminInfoReceived
    OnUserInfoReceived = IdIRC1UserInfoReceived
    OnChannelMode = IdIRC1ChannelMode
    OnUserMode = IdIRC1UserMode
    OnCTCPReply = IdIRC1CTCPReply
    OnServerError = IdIRC1ServerError
    OnNicknameError = IdIRC1NicknameError
    OnKillError = IdIRC1KillError
    OnNicknameChange = IdIRC1NicknameChange
    OnKill = IdIRC1Kill
    OnService = IdIRC1Service
    OnRaw = IdIRC1Raw
    Left = 88
    Top = 32
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 152
    Top = 32
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 120
    Top = 32
  end
  object Timer2: TTimer
    Interval = 5000
    Left = 200
    Top = 32
  end
end
