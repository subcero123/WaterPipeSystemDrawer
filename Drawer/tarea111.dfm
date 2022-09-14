object Form1: TForm1
  Left = 292
  Top = 312
  Width = 961
  Height = 639
  Caption = 'Graficador de circuitos de agua'
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
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 72
    Width = 1258
    Height = 909
    Color = cl3DLight
    ParentColor = False
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 2000
      Height = 2000
      OnMouseDown = Image1MouseDown
      OnMouseMove = Image1MouseMove
      OnMouseUp = Image1MouseUp
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 809
    Height = 65
    Color = cl3DLight
    TabOrder = 1
    object Button1: TButton
      Left = 80
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Manguera'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Tubo'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Casa'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Edificio'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 520
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Valvula'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Medidor'
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 608
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Bomba'
      TabOrder = 6
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 696
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Distribudor'
      TabOrder = 7
      OnClick = Button8Click
    end
    object Button13: TButton
      Left = 8
      Top = 8
      Width = 65
      Height = 49
      Caption = 'Archivo'
      PopupMenu = PopupMenu1
      TabOrder = 8
      OnClick = Button13Click
    end
    object StaticText2: TStaticText
      Left = 424
      Top = 48
      Width = 63
      Height = 17
      Caption = 'Heramientas'
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 992
    Top = 8
    Width = 257
    Height = 65
    Color = cl3DLight
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 33
      Height = 13
      Caption = 'Angulo'
    end
    object Label2: TLabel
      Left = 136
      Top = 32
      Width = 10
      Height = 13
      Caption = 'X:'
    end
    object Label3: TLabel
      Left = 192
      Top = 32
      Width = 10
      Height = 13
      Caption = 'Y:'
    end
    object Edit1: TEdit
      Left = 48
      Top = 4
      Width = 33
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object Button11: TButton
      Left = 88
      Top = 8
      Width = 33
      Height = 17
      Caption = '0*'
      TabOrder = 1
      OnClick = Button11Click
    end
    object Button9: TButton
      Left = 128
      Top = 8
      Width = 33
      Height = 17
      Caption = '90*'
      TabOrder = 2
      OnClick = Button9Click
    end
    object Button12: TButton
      Left = 168
      Top = 8
      Width = 33
      Height = 17
      Caption = '180*'
      TabOrder = 3
      OnClick = Button12Click
    end
    object Button10: TButton
      Left = 208
      Top = 8
      Width = 33
      Height = 17
      Caption = '270*'
      TabOrder = 4
      OnClick = Button10Click
    end
    object StaticText1: TStaticText
      Left = 112
      Top = 48
      Width = 31
      Height = 17
      Caption = 'Editor'
      TabOrder = 5
    end
    object Edit2: TEdit
      Left = 152
      Top = 32
      Width = 33
      Height = 21
      TabOrder = 6
    end
    object Edit3: TEdit
      Left = 208
      Top = 32
      Width = 33
      Height = 21
      TabOrder = 7
    end
  end
  object Panel3: TPanel
    Left = 848
    Top = 8
    Width = 113
    Height = 65
    Color = cl3DLight
    TabOrder = 3
    object Button14: TButton
      Left = 16
      Top = 32
      Width = 73
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 0
      OnClick = Button14Click
    end
    object Button15: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 17
      Caption = 'Borrar'
      TabOrder = 1
      OnClick = Button15Click
    end
  end
  object PopupMenu1: TPopupMenu
    Alignment = paCenter
    Left = 8
    Top = 48
    object abrir1: TMenuItem
      Caption = 'Abrir'
      OnClick = abrir1Click
    end
    object Guardar1: TMenuItem
      Caption = 'Guardar'
      OnClick = Guardar1Click
    end
    object Salir1: TMenuItem
      Caption = 'Salir'
      OnClick = Salir1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 40
    Top = 64
  end
  object SaveDialog1: TSaveDialog
    Left = 80
    Top = 72
  end
end
