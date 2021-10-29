object Form2: TForm2
  Left = 417
  Top = 313
  BorderIcons = [biSystemMenu]
  Caption = #30828#20214#27169#25311#38190#30424#40736#26631#27169#22359#27979#35797#20363#31243
  ClientHeight = 291
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  PixelsPerInch = 96
  TextHeight = 12
  object BitBtn1: TBitBtn
    Left = 24
    Top = 16
    Width = 97
    Height = 33
    Caption = #25171#24320#31471#21475
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 16
    Width = 97
    Height = 33
    Caption = #20851#38381#31471#21475
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 280
    Top = 16
    Width = 97
    Height = 33
    Caption = #35835#21462#24207#21015#21495
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn5: TBitBtn
    Left = 24
    Top = 82
    Width = 97
    Height = 33
    Caption = #38190#30424#25353#38190#27979#35797
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 152
    Top = 82
    Width = 97
    Height = 33
    Caption = #35835#21462#25353#38190#29366#24577
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 280
    Top = 82
    Width = 113
    Height = 33
    Caption = #35835#21462#23567#38190#30424'LED'#29366#24577
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 408
    Top = 82
    Width = 113
    Height = 33
    Caption = #35835#21462'CapsLock'#29366#24577
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 24
    Top = 149
    Width = 97
    Height = 33
    Caption = #21333#20987#24038#38190#20004#27425
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 7
    OnClick = BitBtn9Click
  end
  object BitBtn10: TBitBtn
    Left = 152
    Top = 149
    Width = 97
    Height = 33
    Caption = #21333#20987#21491#38190'1'#27425
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = BitBtn10Click
  end
  object BitBtn11: TBitBtn
    Left = 280
    Top = 149
    Width = 97
    Height = 33
    Caption = #28378#36718#28378#21160#27979#35797
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 9
    OnClick = BitBtn11Click
  end
  object BitBtn13: TBitBtn
    Left = 24
    Top = 216
    Width = 97
    Height = 33
    Caption = #30456#23545#31227#21160#40736#26631
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 10
    OnClick = BitBtn13Click
  end
  object BitBtn14: TBitBtn
    Left = 152
    Top = 216
    Width = 129
    Height = 33
    Caption = #31227#21160#40736#26631#21040#25351#23450#22352#26631
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 11
    OnClick = BitBtn14Click
  end
  object BitBtn15: TBitBtn
    Left = 305
    Top = 216
    Width = 97
    Height = 33
    Caption = #21462#24403#21069#40736#26631#22352#26631
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 12
    OnClick = BitBtn15Click
  end
  object edtKey: TEdit
    Left = 24
    Top = 120
    Width = 97
    Height = 20
    TabOrder = 13
  end
  object Memo1: TMemo
    Left = 408
    Top = 152
    Width = 123
    Height = 89
    Lines.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      #28378#36718#27979#35797)
    ScrollBars = ssVertical
    TabOrder = 14
    OnClick = Memo1Click
    OnDblClick = Memo1DblClick
  end
  object PopupMenu1: TPopupMenu
    Left = 432
    Top = 24
    object N1: TMenuItem
      Caption = #35302#21457#20102#21491#38190
    end
  end
end
