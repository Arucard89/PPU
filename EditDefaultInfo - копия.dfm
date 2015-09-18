object EditDefaultInfoForm: TEditDefaultInfoForm
  Left = 354
  Top = 231
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 642
  ClientWidth = 890
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
    Width = 873
    Height = 225
    Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1099' '#1055#1055#1059
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 8
      Top = 24
      Width = 769
      Height = 193
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = AdminDataSource
        DataController.Filter.Criteria = {00000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ExpandMasterRowOnDblClick = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
          DataBinding.FieldName = 'id_n'
          SortOrder = soAscending
        end
        object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1051#1086#1075#1080#1085' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
          DataBinding.FieldName = 'login'
          Width = 214
        end
        object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1057#1083#1091#1078#1073#1072
          DataBinding.FieldName = 'title'
          Width = 73
        end
        object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1048#1079#1084#1077#1085#1080#1083
          DataBinding.FieldName = 't_admins.Changer'
          Width = 213
        end
        object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'DateOfChange'
          Width = 267
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object AddAdm: TButton
      Left = 784
      Top = 56
      Width = 81
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = AddAdmClick
    end
    object EditAdm: TButton
      Left = 784
      Top = 104
      Width = 81
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = EditAdmClick
    end
    object DeleteAdm: TButton
      Left = 784
      Top = 152
      Width = 81
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = DeleteAdmClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 240
    Width = 433
    Height = 193
    Caption = #1057#1090#1072#1090#1091#1089#1099' '#1055#1055#1059
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object cxGrid2: TcxGrid
      Left = 8
      Top = 24
      Width = 329
      Height = 161
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGrid2DBTableView1: TcxGridDBTableView
        DataController.DataSource = StatusSource
        DataController.Filter.Criteria = {00000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ExpandMasterRowOnDblClick = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          SortOrder = soAscending
          Width = 20
        end
        object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1091#1089
          DataBinding.FieldName = 'Status'
          Width = 105
        end
        object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1048#1079#1084#1077#1085#1080#1083
          DataBinding.FieldName = 'Changer'
          Width = 135
        end
        object cxGrid2DBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'DateOfChange'
          Width = 67
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object Button4: TButton
      Left = 344
      Top = 40
      Width = 81
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 344
      Top = 88
      Width = 81
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 344
      Top = 136
      Width = 81
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button6Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 440
    Width = 433
    Height = 193
    Caption = #1057#1083#1091#1078#1073#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object cxGrid3: TcxGrid
      Left = 8
      Top = 24
      Width = 329
      Height = 161
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGrid3DBTableView1: TcxGridDBTableView
        DataController.DataSource = ServiceSource
        DataController.Filter.Criteria = {00000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ExpandMasterRowOnDblClick = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        object cxGrid3DBTableView1DBColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          SortOrder = soAscending
          Width = 20
        end
        object cxGrid3DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1083#1091#1078#1073#1099
          DataBinding.FieldName = 'title'
          Width = 145
        end
        object cxGrid3DBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1048#1079#1084#1077#1085#1080#1083
          DataBinding.FieldName = 'Changer'
          Width = 103
        end
        object cxGrid3DBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'DateOfChange'
          Width = 59
        end
      end
      object cxGrid3Level1: TcxGridLevel
        GridView = cxGrid3DBTableView1
      end
    end
    object Button10: TButton
      Left = 344
      Top = 40
      Width = 81
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 344
      Top = 88
      Width = 81
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 344
      Top = 136
      Width = 81
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button12Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 448
    Top = 240
    Width = 433
    Height = 193
    Caption = #1058#1080#1087#1099' '#1055#1055#1059
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object cxGrid4: TcxGrid
      Left = 8
      Top = 24
      Width = 329
      Height = 161
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGrid4DBTableView1: TcxGridDBTableView
        DataController.DataSource = PPUTypeSource
        DataController.Filter.Criteria = {00000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ExpandMasterRowOnDblClick = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        object cxGrid4DBTableView1DBColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          SortOrder = soAscending
          Width = 36
        end
        object cxGrid4DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1055#1055#1059
          DataBinding.FieldName = 'Type'
          Width = 116
        end
        object cxGrid4DBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1048#1079#1084#1077#1085#1080#1083
          DataBinding.FieldName = 'Changer'
          Width = 173
        end
        object cxGrid4DBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.FieldName = 'DateOfChange'
          Width = 98
        end
      end
      object cxGrid4Level1: TcxGridLevel
        GridView = cxGrid4DBTableView1
      end
    end
    object Button7: TButton
      Left = 344
      Top = 40
      Width = 81
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 344
      Top = 88
      Width = 81
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 344
      Top = 136
      Width = 81
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button9Click
    end
  end
  object FullViewCheck: TCheckBox
    Left = 464
    Top = 448
    Width = 417
    Height = 129
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1076#1088#1086#1073#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086#1073' '#1080#1079#1084#1077#1085#1077#1085#1080#1103#1093
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = FullViewCheckClick
  end
  object BitBtn1: TBitBtn
    Left = 728
    Top = 600
    Width = 145
    Height = 33
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Kind = bkClose
  end
  object AdminDataSource: TDataSource
    DataSet = AdminQuery
    Left = 192
    Top = 160
  end
  object AdminQuery: TADOQuery
    Connection = DataModule1.SQLConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT * FROM t_admins INNER JOIN t_services ON t_admins.service' +
        ' = t_services.id')
    Left = 80
    Top = 192
  end
  object StatusQuery: TADOQuery
    Connection = DataModule1.SQLConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM t_status')
    Left = 72
    Top = 368
  end
  object StatusSource: TDataSource
    DataSet = StatusQuery
    Left = 120
    Top = 368
  end
  object ServiceQuery: TADOQuery
    Connection = DataModule1.SQLConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM t_services')
    Left = 32
    Top = 544
  end
  object ServiceSource: TDataSource
    DataSet = ServiceQuery
    Left = 72
    Top = 544
  end
  object PPUTypeQuery: TADOQuery
    Connection = DataModule1.SQLConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM t_ppuType')
    Left = 464
    Top = 384
  end
  object PPUTypeSource: TDataSource
    DataSet = PPUTypeQuery
    Left = 520
    Top = 384
  end
end
