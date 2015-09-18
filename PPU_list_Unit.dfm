object PPU_list: TPPU_list
  Left = 199
  Top = 205
  Width = 1305
  Height = 670
  Caption = #1057#1087#1080#1089#1086#1082' '#1055#1055#1059
  Color = clBtnFace
  Constraints.MinWidth = 1305
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 18
  object PPUCxGrid: TcxGrid
    Left = 0
    Top = 81
    Width = 1289
    Height = 551
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object PPUCxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataModule1.ListDataSource
      DataController.Filter.Criteria = {00000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
        end>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c4
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c4'
              Column = PPUCxGridDBTableView1c5
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c5
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c5'
              Column = PPUCxGridDBTableView1c5
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c9
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c9'
              Column = PPUCxGridDBTableView1c9
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c15
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c15'
              Column = PPUCxGridDBTableView1c15
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c16
            end>
          SummaryItems = <
            item
              Kind = skCount
              Column = PPUCxGridDBTableView1c16
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c26
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c26'
              Column = PPUCxGridDBTableView1c26
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c27
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c27'
              Column = PPUCxGridDBTableView1c27
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c32
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c32'
              Column = PPUCxGridDBTableView1c32
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c33
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c33'
              Column = PPUCxGridDBTableView1c33
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c38
            end>
          SummaryItems = <
            item
              FieldName = 'c38'
              Column = PPUCxGridDBTableView1c38
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c40
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c40'
              Column = PPUCxGridDBTableView1c40
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c43
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c43'
              Column = PPUCxGridDBTableView1c43
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c46
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c46'
              Column = PPUCxGridDBTableView1c46
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c47
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c47'
              Column = PPUCxGridDBTableView1c47
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c48
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c48'
              Column = PPUCxGridDBTableView1c48
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c52
            end>
          SummaryItems = <
            item
              FieldName = 'c52'
              Column = PPUCxGridDBTableView1c52
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c54
            end>
          SummaryItems = <
            item
              FieldName = 'c54'
              Column = PPUCxGridDBTableView1c54
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c219
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c219'
              Column = PPUCxGridDBTableView1c219
            end>
        end
        item
          Links = <
            item
              Column = PPUCxGridDBTableView1c220
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'c220'
              Column = PPUCxGridDBTableView1c220
            end>
        end>
      OnFocusedRecordChanged = PPUCxGridDBTableView1FocusedRecordChanged
      OptionsBehavior.ExpandMasterRowOnDblClick = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      object PPUCxGridDBTableView1DBColumn1: TcxGridDBColumn
        OnGetDisplayText = PPUCxGridDBTableView1DBColumn1GetDisplayText
        Options.Editing = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
      end
      object PPUCxGridDBTableView1c4: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1055#1055#1059
        DataBinding.FieldName = 'c4'
      end
      object PPUCxGridDBTableView1c5: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1087#1086#1076#1072#1095#1080
        DataBinding.FieldName = 'c5'
        SortOrder = soAscending
      end
      object PPUCxGridDBTableView1c9: TcxGridDBColumn
        Caption = #1040#1074#1090#1086#1088
        DataBinding.FieldName = 'c9'
        Width = 74
      end
      object PPUCxGridDBTableView1c15: TcxGridDBColumn
        Caption = #1050#1086#1084#1091
        DataBinding.FieldName = 'c15'
        Width = 63
      end
      object PPUCxGridDBTableView1c16: TcxGridDBColumn
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100'('#1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081')'
        DataBinding.FieldName = 'c16'
      end
      object PPUCxGridDBTableView1c26: TcxGridDBColumn
        Caption = #8470' '#1055#1055#1059
        DataBinding.FieldName = 'c26'
      end
      object PPUCxGridDBTableView1c27: TcxGridDBColumn
        Caption = #1055#1088#1086#1073#1083#1077#1084#1072
        DataBinding.FieldName = 'c27'
      end
      object PPUCxGridDBTableView1c32: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074' CC'
        DataBinding.FieldName = 'c32'
      end
      object PPUCxGridDBTableView1c33: TcxGridDBColumn
        Caption = #1057#1057
        DataBinding.FieldName = 'c33'
      end
      object PPUCxGridDBTableView1c38: TcxGridDBColumn
        Caption = #1058#1088#1077#1073#1091#1077#1084#1072#1103' '#1076#1072#1090#1072
        DataBinding.FieldName = 'c38'
        Options.Editing = False
      end
      object PPUCxGridDBTableView1c40: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        DataBinding.FieldName = 'c40'
      end
      object PPUCxGridDBTableView1c43: TcxGridDBColumn
        Caption = #1050#1086#1083'-'#1074#1086' '#1086#1087#1077#1088#1072#1094#1080#1081' '#1074' '#1075#1086#1076
        DataBinding.FieldName = 'c43'
      end
      object PPUCxGridDBTableView1c46: TcxGridDBColumn
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087'. '#1086#1087#1077#1088#1072#1094#1080#1080' '#1044#1054','#1084#1080#1085
        DataBinding.FieldName = 'c46'
      end
      object PPUCxGridDBTableView1c47: TcxGridDBColumn
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087'. '#1086#1087#1077#1088#1072#1094#1080#1080' '#1055#1054#1057#1051#1045','#1084#1080#1085
        DataBinding.FieldName = 'c47'
      end
      object PPUCxGridDBTableView1c48: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1055#1055#1059
        DataBinding.FieldName = 'c48'
        Width = 98
      end
      object PPUCxGridDBTableView1c52: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        DataBinding.FieldName = 'c52'
        Width = 54
      end
      object PPUCxGridDBTableView1c54: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        DataBinding.FieldName = 'c54'
      end
      object PPUCxGridDBTableView1c219: TcxGridDBColumn
        Caption = #1055#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077' '#1072#1074#1090#1086#1088#1072
        DataBinding.FieldName = 'c219'
      end
      object PPUCxGridDBTableView1c220: TcxGridDBColumn
        Caption = #1055#1088#1086#1073#1083#1077#1084#1072' ('#1053#1057'_'#1086#1087#1080#1089#1072#1085#1080#1077')'
        DataBinding.FieldName = 'c220'
      end
    end
    object PPUCxGridLevel1: TcxGridLevel
      GridView = PPUCxGridDBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1289
    Height = 81
    Align = alTop
    TabOrder = 1
    object NewPPUButton: TBitBtn
      Left = 8
      Top = 16
      Width = 121
      Height = 25
      Caption = #1053#1086#1074#1086#1077' '#1055#1055#1059
      TabOrder = 0
      OnClick = NewPPUButtonClick
    end
    object EditPPUButton: TBitBtn
      Left = 144
      Top = 48
      Width = 161
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1055#1055#1059
      Enabled = False
      TabOrder = 1
      OnClick = EditPPUButtonClick
    end
    object ViewPPUButton: TBitBtn
      Left = 8
      Top = 48
      Width = 121
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1055#1055#1059
      TabOrder = 2
      OnClick = ViewPPUButtonClick
    end
    object DeleteButton: TBitBtn
      Left = 144
      Top = 16
      Width = 161
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1055#1055#1059
      Enabled = False
      TabOrder = 3
      OnClick = DeleteButtonClick
    end
    object WorkWithPPUCheck: TCheckBox
      Left = 512
      Top = 56
      Width = 193
      Height = 17
      Caption = #1056#1077#1078#1080#1084' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
      TabOrder = 4
      OnClick = WorkWithPPUCheckClick
    end
    object AdmEditButton: TBitBtn
      Left = 728
      Top = 16
      Width = 233
      Height = 57
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1086#1077' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      TabOrder = 5
      Visible = False
      OnClick = AdmEditButtonClick
    end
    object FullViewCheck: TCheckBox
      Left = 512
      Top = 24
      Width = 193
      Height = 17
      Caption = #1055#1086#1083#1085#1086#1077' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1077
      TabOrder = 6
      OnClick = FullViewCheckClick
    end
    object WrapAllButton: TBitBtn
      Left = 320
      Top = 48
      Width = 177
      Height = 25
      Caption = #1057#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077
      TabOrder = 7
      OnClick = WrapAllButtonClick
    end
    object UnwrapAllButton: TBitBtn
      Left = 320
      Top = 16
      Width = 177
      Height = 25
      Caption = #1056#1072#1079#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077
      TabOrder = 8
      OnClick = UnwrapAllButtonClick
    end
    object Button1: TButton
      Left = 992
      Top = 16
      Width = 283
      Height = 57
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      TabOrder = 9
      OnClick = Button1Click
    end
  end
end
