object Form2: TForm2
  Left = 201
  Top = 116
  Width = 620
  Height = 374
  Caption = 'Envio de Mensagens'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    612
    340)
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 36
    Width = 612
    Height = 285
    ActivePage = TabPublico
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    object TabControle: TTabSheet
      Caption = 'TabControle'
      object LogMsgControle: TRichEdit
        Left = 0
        Top = 0
        Width = 604
        Height = 257
        Align = alClient
        Lines.Strings = (
          'RichEdit1')
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabPublico: TTabSheet
      Caption = 'Publico'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 480
        Top = 0
        Height = 257
        Align = alRight
      end
      inline FrameChat1: TFrameChat
        Left = 0
        Top = 0
        Width = 480
        Height = 257
        Align = alClient
        TabOrder = 0
        inherited FrameMsg: TRichEdit
          Width = 480
          Height = 228
        end
        inherited Panel1: TPanel
          Top = 228
          Width = 480
          inherited FrameEdit: TEdit
            Width = 396
          end
          inherited FrameButton: TButton
            Left = 400
          end
        end
      end
      object ListBox1: TListBox
        Left = 483
        Top = 0
        Width = 121
        Height = 257
        Align = alRight
        ItemHeight = 13
        TabOrder = 1
        OnDblClick = ListBox1DblClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 321
    Width = 612
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 612
    Height = 36
    BandBorderStyle = bsNone
    Bands = <
      item
        Control = ToolBar2
        ImageIndex = -1
        MinHeight = 29
        Width = 608
      end>
    object ToolBar2: TToolBar
      Left = 9
      Top = 0
      Width = 595
      Height = 29
      Caption = 'ToolBar1'
      Images = ImageList1
      TabOrder = 0
      object ToolButton10: TToolButton
        Left = 0
        Top = 2
        Action = ActConectar
      end
      object ToolButton11: TToolButton
        Left = 23
        Top = 2
        Action = ActDisconectar
      end
      object ToolButton12: TToolButton
        Left = 46
        Top = 2
        Action = ActConfigurar
      end
      object ToolButton13: TToolButton
        Left = 69
        Top = 2
        Action = ActManual
      end
      object ToolButton14: TToolButton
        Left = 92
        Top = 2
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton15: TToolButton
        Left = 100
        Top = 2
        Action = ActSair
      end
      object ToolButton16: TToolButton
        Left = 123
        Top = 2
        Action = Action1
      end
    end
  end
  object IdIRC1: TIdIRC
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
    OnJoin = IdIRC1Join
    OnQuit = IdIRC1Quit
    OnRaw = IdIRC1Raw
    Left = 368
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 440
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 252
    Top = 72
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 472
    Top = 8
  end
  object ImageList1: TImageList
    Height = 15
    Width = 15
    Left = 224
    Top = 72
    Bitmap = {
      494C01010500090004000F000F00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000003C0000002D0000000100200000000000302A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF007F7F7F00000000007F7F7F000000000000000000000000000000
      00000000000000000000000000007F7F7F00000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF00BFBFBF007F7F7F0000000000000000007F7F7F00000000000000
      00000000000000000000000000007F7F7F0000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F0000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000007F7F7F00000000007F7F7F00000000000000
      00000000000000000000000000000000000000000000BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F00BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      00007F7F7F0000000000000000007F7F7F00000000007F7F7F00000000000000
      0000000000007F7F7F00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000007F7F7F0000000000000000000000
      00007F7F7F0000000000000000007F7F7F0000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F7F00000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F
      7F000000000000000000000000007F7F7F00000000007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00000000007F7F
      7F007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00BFBFBF0000000000BFBFBF00000000007F7F7F00000000007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00000000007F7F
      7F00BFBFBF007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00BFBFBF000000000000000000000000007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00000000FF000000800000008000000080000000800000008000000080000000
      8000000080000000000000FFFF00000000000000000000000000000000000000
      FF00000080000000800000008000000080000000800000008000000080000000
      80000000000000000000000000000000000000FFFF0000FFFF00000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FF000000FF000000FF000000FF000000FF000000FF000000BFBF
      BF0000000000BFBFBF00FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000800000008000000000000000FF00BFBFBF0000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF00000080000000000000FFFF000000
      00000000800000008000000000000000FF00BFBFBF0000000000BFBFBF000000
      0000BFBFBF0000000000BFBFBF00000080000000000000000000000000000000
      000000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF00000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000007F7F7F0000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000000000800000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000080000000000000000000000080000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      80000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000000000FF
      FF000000000000000000FFFFFF00000000007F7F7F007F7F7F0000000000FFFF
      FF007F7F7F00FFFFFF00000000007F7F7F007F7F7F0000000000FFFFFF000000
      000000008000000000000000000000000000000000000000FF00BFBFBF000000
      0000BFBFBF0000000000BFBFBF000000FF000000000000000000000000000000
      8000000000000000000000000000000000000000FF00BFBFBF0000000000BFBF
      BF0000000000BFBFBF000000FF00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF000000
      00000000000000FFFF0000FFFF0000FFFF00000000007F7F7F0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000007F7F7F000000800000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000080000000000000000000000000000000
      8000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      80000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00000000007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF0000FFFF000000
      FF000000FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000007F7F
      7F0000FFFF0000000000000080000000800000FFFF0000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF007F7F
      7F00000000000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000080000000800000008000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000FFFF
      FF00FFFFFF0000FFFF00FFFFFF000000FF000000FF0000FFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF00000000000000000000FFFF0000000000000080000000
      8000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000FFFF0000000000000000000000FF000000FF000000
      FF00000000000000800000008000000080000000800000008000000000000000
      FF000000FF000000FF000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      000000000000000000007F7F7F000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF007F7F7F00FFFFFF0000FFFF00FFFFFF0000FFFF00000000007F7F7F000000
      0000000000000000000000008000000080000000800000000000BFBFBF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000FFFF0000FFFF000000000000FFFF0000BFBFBF0000000000000000000000
      000000000000FFFF0000FFFF0000FFFF000000000000000000007F7F7F000000
      0000FFFFFF0000FFFF00FFFFFF000000FF00BFBFBF0000FFFF00FFFFFF0000FF
      FF00FFFFFF00000000007F7F7F000000000000000000000000000000FF000000
      FF0000008000000080000000800000FFFF0000FFFF0000000000000000000000
      8000000000000000000000000000000000000000000000000000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      0000BFBFBF000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000FFFF000000000000FFFF00FFFFFF0000FFFF000000
      FF000000FF000000000000FFFF00FFFFFF0000FFFF0000000000000000000000
      00000000000000000000000080000000FF000000FF000000FF00000080000000
      0000000000000000800000000000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFFFF0000FF
      FF0000000000000000000000000000FFFF000000FF000000FF00000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000080000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000FF000000FF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000000000000000000000FFFF0000FFFF007F7F7F00000080000000
      000000000000000080000000FF000000FF000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFFFF0000FF
      FF00FFFFFF000000FF000000FF0000FFFF00FFFFFF000000FF000000FF0000FF
      FF00FFFFFF0000FFFF000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF007F7F7F00000000000000
      80000000800000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000FFFFFF0000FFFF000000FF000000FF00FFFF
      FF0000FFFF000000FF000000FF00FFFFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000FFFFFF0000FFFF000000FF000000FF000000FF000000FF00FFFFFF0000FF
      FF000000000000000000000000000000000000FFFF0000FFFF00000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000424D3E000000000000003E000000280000003C0000002D00000001000100
      00000000680100000000000000000000000000000000000000000000FFFFFF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000001E2000000000000
      07E000000000000003E000000000000003F000000000000023C0000000000000
      3FC0000000000000E3C000000000000022300000000000000020000000000000
      00200000000000000062000000000000001E000000000000001E000000000000
      001E000000000000007E0000000000008001C007000800008001000700080000
      6002C007000800007006E00F00080000780E00030008000000000003000C0010
      00010003000C0010807F8003000C00108043C007000C0030C001FFFF000C0030
      E001FFFF000C0030E003FFFF000C0030CE03FFFF000E00709E79FFFF000F00F0
      3E7DFFFF000F81F000000000000000000000000000000000000000000000}
  end
  object XPManifest1: TXPManifest
    Left = 504
    Top = 8
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 192
    Top = 72
    object ActConfigurar: TAction
      Caption = 'Configurar'
      Hint = 'Configurar'
      ImageIndex = 4
      OnExecute = ActConfigurarExecute
    end
    object ActConectar: TAction
      Caption = 'Conectar'
      Hint = 'Conectar'
      ImageIndex = 0
      OnExecute = ActConectarExecute
    end
    object ActManual: TAction
      Caption = 'Manual'
      Hint = 'Abrir Manual'
      ImageIndex = 3
    end
    object ActSair: TAction
      Caption = 'Sair'
      Hint = 'Sair'
      ImageIndex = 2
      OnExecute = ActSairExecute
    end
    object ActDisconectar: TAction
      Caption = 'Desconectar'
      Hint = 'Desconectar'
      ImageIndex = 1
      OnExecute = ActDisconectarExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      OnExecute = Action1Execute
    end
  end
end
