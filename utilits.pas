unit utilits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB;

type
  TUtility = class(TForm)
    DBConnection: TADOConnection;
    DBQuery: TADOQuery;
    ADConnection: TADOConnection;
    ADQuery: TADOQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    domainName: string; //имя домена
    user:string; //имя пользователя
    Procedure DBOpen;
    procedure DBClose;
    Procedure ADOpen;
    procedure ADClose;
  end;

var
  Utility: TUtility;

implementation

{$R *.dfm}

{ TUtility }

procedure TUtility.ADClose;
begin
  ADQuery.Close;
  ADConnection.Close;
end;

procedure TUtility.ADOpen;
begin
  ADConnection.Open;
  ADQuery.Open;
end;

procedure TUtility.DBClose;
begin
  DBQuery.Close;
  DBConnection.Close;
end;

procedure TUtility.DBOpen;
begin
  DBConnection.Open;
  DBQuery.Open;
end;

procedure TUtility.FormCreate(Sender: TObject);
begin
  Visible:= false;
  DomainName:='dc=gt,dc=npo-saturn,dc=int';
  //user := GetEnvironmentVariable('username');
  user := 'revenkov_kyu';
end;

end.
