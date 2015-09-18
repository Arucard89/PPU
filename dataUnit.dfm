object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 315
  Top = 174
  Height = 233
  Width = 278
  object ListDBConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\DB\MyBase.mdb;Per' +
      'sist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 16
  end
  object ListDBQuery: TADOQuery
    Connection = SQLConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM t_main')
    Left = 32
    Top = 72
  end
  object ListDataSource: TDataSource
    DataSet = ListDBQuery
    Left = 120
    Top = 72
  end
  object SQLConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=y76NPXCkUjsCJ7NxSnNZ;Persist Securi' +
      'ty Info=True;User ID=Ppu-service;Initial Catalog=ppu-service;Dat' +
      'a Source=GT-SRV38;Use Procedure for Prepare=1;Auto Translate=Tru' +
      'e;Packet Size=4096;Use Encryption for Data=False;Tag with column' +
      ' collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 136
    Top = 16
  end
end
