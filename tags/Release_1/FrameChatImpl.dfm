object FrameChat: TFrameChat
  Left = 0
  Top = 0
  Width = 443
  Height = 270
  Align = alClient
  TabOrder = 0
  object FrameMsg: TRichEdit
    Left = 0
    Top = 0
    Width = 443
    Height = 241
    TabStop = False
    Align = alClient
    Enabled = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantReturns = False
    OnChange = FrameMsgChange
  end
  object Panel1: TPanel
    Left = 0
    Top = 241
    Width = 443
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      443
      29)
    object FrameEdit: TEdit
      Left = 0
      Top = 3
      Width = 358
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      OnKeyPress = FrameEditKeyPress
      OnKeyUp = FrameEditKeyUp
    end
    object FrameButton: TButton
      Left = 364
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Enviar'
      TabOrder = 1
      OnClick = FrameButtonClick
    end
  end
end
