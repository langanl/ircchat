object Form1: TForm1
  Left = 257
  Top = 167
  Width = 555
  Height = 376
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
  OnDestroy = TimerDisconect
  DesignSize = (
    547
    342)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 504
    Top = 12
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = 'Label1'
    OnClick = Label1Click
  end
  object ButtonConfigurar: TBitBtn
    Left = 8
    Top = 8
    Width = 89
    Height = 25
    Hint = 'Configura'#231#227'o'
    Caption = 'Configurar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonConfigurarClick
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
    Top = 323
    Width = 547
    Height = 19
    Panels = <
      item
        Width = 60
      end
      item
        Width = 50
      end>
  end
  object ButtonConectar: TButton
    Left = 272
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Conectar'
    TabOrder = 2
    Visible = False
    OnClick = ButtonConnect
  end
  object Button1: TButton
    Left = 160
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Manual'
    TabOrder = 3
    OnClick = Button1Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 40
    Width = 529
    Height = 281
    ActivePage = TabControle
    Anchors = [akLeft, akTop, akRight, akBottom]
    PopupMenu = PopupMenu1
    TabOrder = 4
    object TabControle: TTabSheet
      Caption = 'TabControle'
      ImageIndex = 1
      object LogControle: TRichEdit
        Left = 0
        Top = 0
        Width = 521
        Height = 253
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = LogRecebidasChange
      end
    end
    object TabPublico: TTabSheet
      Caption = 'Publico'
      ImageIndex = 2
      object Splitter3: TSplitter
        Left = 397
        Top = 0
        Height = 253
        Align = alRight
      end
      object ListBox2: TListBox
        Left = 400
        Top = 0
        Width = 121
        Height = 253
        Align = alRight
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = ListBox2DblClick
      end
      inline FrameChat1: TFrameChat
        Left = 0
        Top = 0
        Width = 397
        Height = 253
        Align = alClient
        TabOrder = 1
        inherited FrameMsg: TRichEdit
          Width = 397
          Height = 224
        end
        inherited Panel1: TPanel
          Top = 224
          Width = 397
        end
      end
    end
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
    UserMode = []
    OnPrivateMessage = IdIRC1PrivateMessage
    OnNotice = IdIRC1Notice
    OnIsOnIRC = IdIRC1IsOnIRC
    OnJoin = IdIRC1Join
    OnPart = IdIRC1Part
    OnServerUsersListReceived = IdIRC1ServerUsersListReceived
    OnUserInfoReceived = IdIRC1UserInfoReceived
    OnServerError = IdIRC1ServerError
    OnNicknameChange = IdIRC1NicknameChange
    OnRaw = IdIRC1Raw
    Left = 368
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = TimerDisconect
    Left = 432
    Top = 8
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 400
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 172
    Top = 128
    object Add1: TMenuItem
      Caption = 'Add'
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
end
