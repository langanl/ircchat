object Form2: TForm2
  Left = 192
  Top = 157
  Width = 364
  Height = 194
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 337
    Height = 105
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 8
    Top = 128
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 272
    Top = 126
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = Button1Click
  end
end
