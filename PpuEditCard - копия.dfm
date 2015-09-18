object PPUEditCardForm: TPPUEditCardForm
  Left = 283
  Top = 174
  Width = 591
  Height = 675
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1087#1086#1076#1072#1095#1080' '#1055#1055#1059'('#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077')'
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
  object Label1: TLabel
    Left = 128
    Top = 8
    Width = 347
    Height = 29
    Caption = #1055#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077' '#1087#1086' '#1091#1083#1091#1095#1096#1077#1085#1080#1102
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 87
    Height = 24
    Caption = #1058#1080#1087' '#1055#1055#1059
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 312
    Top = 64
    Width = 79
    Height = 24
    Caption = #1057#1083#1091#1078#1073#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 104
    Width = 105
    Height = 24
    Caption = #1055#1088#1086#1073#1083#1077#1084#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 352
    Width = 222
    Height = 24
    Caption = #1055#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077' '#1072#1074#1090#1086#1088#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CancelButton: TBitBtn
    Left = 440
    Top = 600
    Width = 115
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    Kind = bkCancel
  end
  object OKButton: TBitBtn
    Left = 312
    Top = 600
    Width = 115
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object PPUTypeBox: TDBComboBox
    Left = 112
    Top = 64
    Width = 145
    Height = 21
    DataField = 'c48'
    DataSource = DataModule1.ListDataSource
    ItemHeight = 13
    TabOrder = 2
  end
  object ServiceBox: TDBComboBox
    Left = 400
    Top = 64
    Width = 161
    Height = 21
    DataField = 'c15'
    DataSource = DataModule1.ListDataSource
    ItemHeight = 13
    TabOrder = 3
  end
  object ProblemMemo: TDBMemo
    Left = 8
    Top = 128
    Width = 553
    Height = 225
    DataField = 'c219'
    DataSource = DataModule1.ListDataSource
    TabOrder = 4
  end
  object OfferMemo: TDBMemo
    Left = 8
    Top = 384
    Width = 553
    Height = 209
    DataField = 'c27'
    DataSource = DataModule1.ListDataSource
    TabOrder = 5
  end
end
