object Form1: TForm1
  Left = 192
  Top = 125
  Width = 696
  Height = 479
  Caption = 'EL JUEGO DE LA VIDA... ANTONIO MORENO JAUREGUI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 536
    Top = 32
    Width = 121
    Height = 13
    Caption = 'Tama'#241'o de la matriz (5x5)'
  end
  object Label2: TLabel
    Left = 536
    Top = 48
    Width = 35
    Height = 13
    Caption = 'tama'#241'o'
  end
  object Button1: TButton
    Left = 536
    Top = 72
    Width = 129
    Height = 25
    Caption = 'Cambiar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 496
    Top = 104
    Width = 169
    Height = 25
    Hint = 'Random'
    Caption = 'Llenar celdas aleatoria'
    TabOrder = 1
    OnClick = Button3Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 425
    Height = 425
    DefaultColWidth = 10
    DefaultRowHeight = 10
    FixedCols = 0
    FixedRows = 0
    TabOrder = 2
    OnClick = StringGrid1Click
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
    OnKeyPress = StringGrid1KeyPress
  end
  object Edit1: TEdit
    Left = 608
    Top = 48
    Width = 41
    Height = 21
    TabOrder = 3
    Text = '5'
  end
  object Button4: TButton
    Left = 496
    Top = 128
    Width = 169
    Height = 25
    Caption = 'Ejecutar manual'
    TabOrder = 4
    OnClick = Button4Click
  end
end
