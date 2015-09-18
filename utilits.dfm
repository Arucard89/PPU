object Utility: TUtility
  Left = 1005
  Top = 188
  Width = 303
  Height = 334
  Caption = 'UtilityForm'
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
  object DBConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Working\MyProgra' +
      'ms\Delphi\'#1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1086#1076#1072#1095#1080' '#1055#1055#1059'\DB\MyBase.mdb;Persist Security In' +
      'fo=True'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 64
  end
  object DBQuery: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 56
    Top = 64
  end
  object ADConnection: TADOConnection
    ConnectionString = 
      'Provider=ADsDSOObject;Password=Student1;User ID=gt\student1;Encr' +
      'ypt Password=False;Mode=Read;Bind Flags=0;ADSI Flag=-2147483648'
    LoginPrompt = False
    Provider = 'ADsDSOObject'
    Left = 8
    Top = 16
  end
  object ADQuery: TADOQuery
    Connection = ADConnection
    Parameters = <>
    Left = 56
    Top = 16
  end
end
