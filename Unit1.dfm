object Form1: TForm1
  Left = 284
  Top = 222
  Width = 351
  Height = 186
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
  DesignSize = (
    343
    152)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 8
    Top = 106
    Width = 25
    Height = 25
    Hint = 'Configura'#231#227'o'
    Anchors = [akLeft, akBottom]
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
    Top = 133
    Width = 343
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
    Left = 40
    Top = 106
    Width = 25
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'T'
    TabOrder = 2
    OnClick = Button5Click
  end
  object Edit1: TEdit
    Left = 72
    Top = 106
    Width = 259
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    OnKeyPress = Memo2KeyPress
  end
  object Memo2: TRichEdit
    Left = 7
    Top = 8
    Width = 325
    Height = 89
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssVertical
    TabOrder = 4
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
    OnNicknamesListReceived = IdIRC1NicknamesListReceived
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
    Left = 72
    Top = 104
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 288
    Top = 16
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 104
    Top = 104
  end
end
