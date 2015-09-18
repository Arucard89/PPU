unit dataUnit; // юнит только для вывода списка ППУ

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  TDataModule1 = class(TDataModule)
    ListDBConnection: TADOConnection;
    ListDBQuery: TADOQuery;
    ListDataSource: TDataSource;
    SQLConnection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure refresh_query;
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.refresh_query;
begin
  ListDBQuery.Close;
  try
    ListDBQuery.Open;
  except
    ShowMessage('Возникла ошибка при обновлении таблицы.')
  end;
end;

end.
