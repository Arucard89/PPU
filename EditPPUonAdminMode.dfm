object AdminModePPUForm: TAdminModePPUForm
  Left = 231
  Top = 120
  BorderStyle = bsDialog
  Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1082#1072#1088#1090#1086#1095#1082#1080' '#1055#1055#1059
  ClientHeight = 677
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TBitBtn
    Left = 360
    Top = 640
    Width = 115
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = OKButtonClick
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
  object CancelButton: TBitBtn
    Left = 496
    Top = 640
    Width = 115
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    Kind = bkCancel
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 609
    Height = 625
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      object Label2: TLabel
        Left = 8
        Top = 56
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
        Left = 280
        Top = 48
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
        Top = 144
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
        Left = 0
        Top = 368
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
      object Label17: TLabel
        Left = 8
        Top = 104
        Width = 63
        Height = 24
        Caption = #1040#1074#1090#1086#1088
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 72
        Height = 24
        Caption = #8470' '#1055#1055#1059
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ProblemMemo: TDBMemo
        Left = 0
        Top = 176
        Width = 601
        Height = 185
        DataField = 'c219'
        DataSource = DataModule1.ListDataSource
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object OfferMemo: TDBMemo
        Left = 0
        Top = 400
        Width = 601
        Height = 197
        DataField = 'c27'
        DataSource = DataModule1.ListDataSource
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object PpuTypeBox: TDBListBox
        Left = 104
        Top = 40
        Width = 145
        Height = 49
        DataField = 'c48'
        DataSource = DataModule1.ListDataSource
        ItemHeight = 13
        ReadOnly = True
        TabOrder = 2
      end
      object ServiceBox: TDBListBox
        Left = 360
        Top = 40
        Width = 241
        Height = 49
        DataField = 'c15'
        DataSource = DataModule1.ListDataSource
        ItemHeight = 13
        ReadOnly = True
        TabOrder = 3
      end
      object PPUAuthorEdit: TDBEdit
        Left = 104
        Top = 104
        Width = 497
        Height = 21
        DataField = 'c9'
        DataSource = DataModule1.ListDataSource
        ReadOnly = True
        TabOrder = 4
      end
      object PPUNumbEdit: TDBEdit
        Left = 104
        Top = 16
        Width = 145
        Height = 21
        DataField = 'c26'
        DataSource = DataModule1.ListDataSource
        ReadOnly = True
        TabOrder = 5
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1042#1082#1083#1072#1076#1082#1072' '#1076#1083#1103' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1075#1086
      ImageIndex = 1
      object Label6: TLabel
        Left = 72
        Top = 8
        Width = 65
        Height = 16
        Caption = #1044#1072#1090#1072' '#1074' '#1057#1057
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 0
        Top = 72
        Width = 106
        Height = 16
        Caption = #1058#1088#1077#1073#1091#1077#1084#1072#1103' '#1076#1072#1090#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 136
        Top = 72
        Width = 118
        Height = 16
        Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 296
        Top = 8
        Width = 112
        Height = 16
        Caption = #1057#1084#1077#1078#1085#1072#1103' '#1089#1083#1091#1078#1073#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 0
        Top = 120
        Width = 149
        Height = 16
        Caption = #1050#1086#1083'-'#1074#1086' '#1086#1087#1077#1088#1072#1094#1080#1081' '#1074' '#1075#1086#1076
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 160
        Top = 120
        Width = 201
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087'. '#1086#1087#1077#1088#1072#1094#1080#1080' '#1044#1054', '#1084#1080#1085
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 368
        Top = 120
        Width = 227
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087'. '#1086#1087#1077#1088#1072#1094#1080#1080' '#1055#1054#1057#1051#1045', '#1084#1080#1085
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 464
        Top = 8
        Width = 43
        Height = 16
        Caption = #1057#1090#1072#1090#1091#1089
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 0
        Top = 232
        Width = 82
        Height = 16
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 0
        Top = 416
        Width = 159
        Height = 16
        Caption = #1055#1088#1086#1073#1083#1077#1084#1072'('#1053#1057' '#1086#1087#1080#1089#1072#1085#1080#1077')'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 0
        Top = 168
        Width = 196
        Height = 16
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100'('#1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081')'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DateInSS: TDateTimePicker
        Left = 72
        Top = 24
        Width = 121
        Height = 21
        Date = 0.869451886574097400
        Time = 0.869451886574097400
        TabOrder = 0
      end
      object NeedDate: TDateTimePicker
        Left = 0
        Top = 88
        Width = 121
        Height = 21
        Date = 0.872710532406927100
        Time = 0.872710532406927100
        TabOrder = 1
      end
      object ExecutionDate: TDateTimePicker
        Left = 136
        Top = 88
        Width = 121
        Height = 21
        Date = 0.872917997687181900
        Time = 0.872917997687181900
        TabOrder = 2
      end
      object SS: TDBListBox
        Left = 296
        Top = 24
        Width = 121
        Height = 89
        DataField = 'c33'
        DataSource = DataModule1.ListDataSource
        ItemHeight = 13
        TabOrder = 3
      end
      object operationsAmount: TDBEdit
        Left = 0
        Top = 136
        Width = 121
        Height = 21
        DataField = 'c43'
        DataSource = DataModule1.ListDataSource
        TabOrder = 4
      end
      object ExecutionTimeBefore: TDBEdit
        Left = 160
        Top = 136
        Width = 121
        Height = 21
        DataField = 'c46'
        DataSource = DataModule1.ListDataSource
        TabOrder = 5
      end
      object ExecutionTimeAfter: TDBEdit
        Left = 368
        Top = 136
        Width = 121
        Height = 21
        DataField = 'c47'
        DataSource = DataModule1.ListDataSource
        TabOrder = 6
      end
      object Status: TDBListBox
        Left = 464
        Top = 24
        Width = 121
        Height = 89
        DataField = 'c52'
        DataSource = DataModule1.ListDataSource
        ItemHeight = 13
        TabOrder = 7
      end
      object noteMemo: TDBMemo
        Left = 0
        Top = 248
        Width = 593
        Height = 153
        DataField = 'c54'
        DataSource = DataModule1.ListDataSource
        TabOrder = 8
      end
      object DescriptionMemo: TDBMemo
        Left = 0
        Top = 440
        Width = 593
        Height = 153
        DataField = 'c220'
        DataSource = DataModule1.ListDataSource
        TabOrder = 9
      end
      object ExecutorBox: TComboBox
        Left = 0
        Top = 192
        Width = 593
        Height = 21
        ItemHeight = 0
        TabOrder = 10
      end
    end
  end
end
