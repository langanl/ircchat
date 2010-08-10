object FormConfig: TFormConfig
  Left = 277
  Top = 237
  ActiveControl = BitBtn1
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 191
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 145
    Caption = ' Servidor '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Servidor'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 25
      Height = 13
      Caption = 'Porta'
    end
    object Label3: TLabel
      Left = 32
      Top = 88
      Width = 16
      Height = 13
      Caption = 'DR'
    end
    object Label4: TLabel
      Left = 32
      Top = 117
      Width = 27
      Height = 13
      Caption = 'Canal'
    end
    object Edit1: TEdit
      Left = 72
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 72
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
      OnChange = Edit1Change
    end
    object Edit7: TEdit
      Left = 72
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit7'
      OnChange = Edit1Change
    end
    object Edit8: TEdit
      Left = 72
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit8'
      OnChange = Edit1Change
    end
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 160
    Width = 80
    Height = 23
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 344
    Top = 160
    Width = 80
    Height = 23
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 2
    NumGlyphs = 2
  end
  object BitBtn4: TBitBtn
    Left = 144
    Top = 160
    Width = 80
    Height = 23
    Caption = 'Recarregar'
    Enabled = False
    TabOrder = 3
    OnClick = BitBtn4Click
    NumGlyphs = 2
  end
  object GroupBox2: TGroupBox
    Left = 232
    Top = 8
    Width = 193
    Height = 145
    Caption = ' Usu'#225'rios '
    TabOrder = 4
    object Label5: TLabel
      Left = 24
      Top = 112
      Width = 31
      Height = 13
      Caption = 'Senha'
    end
    object ListBox1: TListBox
      Left = 72
      Top = 16
      Width = 113
      Height = 89
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object Edit4: TEdit
      Left = 72
      Top = 112
      Width = 113
      Height = 21
      PasswordChar = '#'
      TabOrder = 1
      Text = 'Edit4'
      OnChange = Edit1Change
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 16
      Width = 57
      Height = 25
      Hint = 'Adiciona Usu'#225'rio'
      Caption = 'Adicionar'
      TabOrder = 2
      OnClick = BitBtn3Click
      NumGlyphs = 2
    end
    object BitBtn5: TBitBtn
      Left = 8
      Top = 48
      Width = 57
      Height = 25
      Hint = 'Retirar Usu'#225'rio'
      Caption = 'Remover'
      Enabled = False
      TabOrder = 3
      OnClick = BitBtn5Click
    end
  end
  object Edit3: TEdit
    Left = 8
    Top = 160
    Width = 25
    Height = 21
    TabOrder = 5
    Text = 'Edit3'
    Visible = False
  end
  object Edit5: TEdit
    Left = 40
    Top = 160
    Width = 25
    Height = 21
    TabOrder = 6
    Text = 'Edit5'
    Visible = False
  end
  object Edit6: TEdit
    Left = 72
    Top = 160
    Width = 25
    Height = 21
    TabOrder = 7
    Text = 'Edit6'
    Visible = False
  end
  object BitBtn6: TBitBtn
    Left = 56
    Top = 160
    Width = 80
    Height = 23
    Caption = 'Padr'#227'o'
    TabOrder = 8
    OnClick = BitBtn6Click
    NumGlyphs = 2
  end
end
