unit UtilitsUnit; //���� ��� ���������� ������ �������� � ��

interface

uses
  Messages, SysUtils, Variants, Classes, Dialogs, DB, ADODB,dataUnit ;

type
  TUtility = class(TObject)
    DBConnection: TADOConnection;
    DBQuery: TADOQuery;
    DBTable: TADOTable;
    ADConnection: TADOConnection;
    ADQuery: TADOQuery;


    constructor Create;
    destructor Destroy;
  private
    { Private declarations }
  public
    { Public declarations }
    domainName: string; //��� ������
    user:string; //��� ������������
    FIO:string;
    admin:boolean; //�������� �� ������������ �������
    //admin_service: string; //������ ������
    adm_services : TStringList; //������ ����� ������
    all_users: TStringList; //������ ���� ������������� ���
    Services_list: TStringList;//������ �����
    Statuses_list: TStringList;//������ �������� ���
    types_list: TStringList;//������ ����� ���
    Procedure DBOpen;
    procedure DBClose;
    Procedure ADOpen;
    procedure ADClose;
    function get_FIO_from_AD: integer; //�������� ��� ������������ �� �� �� ������
    function ask_admin_and_service (adminName:string; var services: TStringList): boolean;//������ �������� ��� ������ ������������ ������� � ����� ������
    function load_all_users_by_first_letter(first_letter:char):boolean; //��� ���� �������������  (��������-������ ����� �������(��-������), ��������� �� ��������� �� �� ������ 1000 ������� �� ���)
    function load_list(table: string; col: string; var list:TStringList ): boolean; //�������� ������ �����, ��������, �����
  end;

var
  Utility: TUtility;

implementation

{ TUtility }

constructor TUtility.Create;
var
  c: integer;
  ch : char;
begin
  inherited;
  DomainName:='dc=gt,dc=npo-saturn,dc=int';
  user := GetEnvironmentVariable('username');
  user := 'revenkov_kyu';

  //������������� ����������� � ��
  DBConnection := TADOConnection.Create(nil);
  {DBConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;'+
  'Data Source=.\DB\MyBase.mdb;Persist Security Info=True';
  }
  //DBConnection.Open;
  DBConnection.ConnectionString := 'Provider=SQLOLEDB.1;Password=y76NPXCkUjsCJ7NxSnNZ;Persist Security Info=True;User ID=Ppu-service;Initial Catalog=ppu-service;Data Source=GT-SRV38;Use Procedure for Prepare=1;';
  DBConnection.LoginPrompt := false;
  //������������� ������ ������� � ��
  DBQuery := TADOQuery.Create(nil);
  DBQuery.Connection := DBConnection;
  //DBQuery.Close;
  DBClose;

  //������������� ������� ������
  DBTable := TADOTable.Create(nil);
  DBTable.Connection := DBConnection;
  DBTable.Name := 't_main';
  DBTable.Close;

 //������������� ����������� � ��
  ADConnection := TADOConnection.Create(nil);
  ADConnection.ConnectionString := 'Provider=ADsDSOObject;Password=Student1;'+
      'User ID=gt\student1;Encrypt Password=False;Mode=Read;'+
      'Bind Flags=0;ADSI Flag=-2147483648';
  ADConnection.LoginPrompt := false;

  //�������� ���
  if get_FIO_from_AD <> 0 then
    FIO := user;

  //������� ������ ����� ��������������
  adm_services := TStringList.Create;

  //���������� �������������� � ��� ������
  admin := ask_admin_and_service(user, adm_services);
  //��������� ���� ������������� � ������
  all_users := TStringList.Create;

  for ch:= '�' to '�' do
  begin
    if load_all_users_by_first_letter(ch) = false then
    begin
      ShowMessage('�������� �������� ��� ����������� � AD.' + #13#10 + '������ ������������� �� �������.');
      break;
    end;
  end;

  //�������� ������ �������� ���
  Statuses_list := TStringList.Create;
  load_list( 't_status','status',Statuses_list);
   //  �������� ������ �����
  Services_list := TStringList.Create;
  load_list('t_Services','title',Services_list);
  //�������� ������ ����� ���
  types_list := TStringList.Create;
  load_list('t_pputype','type',types_list);

end;

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

function TUtility.ask_admin_and_service(adminName: string;
  var services: TstringList): boolean;
begin
//������ ������ �� ��������� ������ �������
  DBQuery.SQL.Text := 'SELECT * from  T_admins INNER JOIN t_services ON service = id WHERE login = ' +QuotedStr(fio);
  result := false;
  try
    DBOpen;
    if not DBQuery.IsEmpty then
    begin
      //�������� ��� ������ ������
      result := true;
      DBQuery.First;
      while not DBQuery.Eof do
      begin
        services.Add (' '+DBQuery.fieldByName('title').AsString);
        DBQuery.Next;
      end;
    end
    {Else
      showmessage('������ �������������� �� ����������.');   }
  finally
    DBClose;
  end;
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

destructor TUtility.Destroy;
begin
// ������� ��� �������� ����������� � ��
  DBClose;
  DBTable.Close;
  DBTable.Destroy;
  DBQuery.Destroy;
  DBConnection.Destroy;

{// ������ ����������� � ��
  ADClose;
  ADQuery.Destroy; }
  ADConnection.Destroy;

  inherited;

end;


function TUtility.get_FIO_from_AD: integer;
var fault:integer;
begin
  //������������� ����������� � ��
  ADConnection := TADOConnection.Create(nil);
  ADConnection.ConnectionString := 'Provider=ADsDSOObject;Password=Student1;'+
      'User ID=gt\student1;Encrypt Password=False;Mode=Read;'+
      'Bind Flags=0;ADSI Flag=-2147483648';
  ADConnection.LoginPrompt := false;
  //ADConnection.Open;

  //������������� ������ ������� � AD
  ADQuery := TADOQuery.Create(nil);

  ADQuery.SQL.Text := 'SELECT DisplayName FROM  ''LDAP://'+domainName+''' where sAMAccountName='''+user+'''';
  ADQuery.Connection := ADConnection;
  try
    //ADQuery.Open;
    ADOpen;
    if not ADQuery.IsEmpty then
    begin
      ADQuery.First;
      FIO := ADQuery.FieldByName('DisplayName').AsString;
      fault := 0
    end
    else fault := 1;
  except    //�� ������ ������������ � ��
    ShowMessage('�������� �������� ��� ����������� � AD.' + #13#10 + '� �������� ����� ����� ������� �����.');
    fault := 2;
  end;
  ADClose;
  ADQuery.Destroy;
  result := fault;
end;

Function TUtility.load_all_users_by_first_letter(first_letter:char):boolean;
begin
    //������������� ����������� � ��
    ADConnection := TADOConnection.Create(nil);
    ADConnection.ConnectionString := 'Provider=ADsDSOObject;Password=Student1;'+
        'User ID=gt\student1;Encrypt Password=False;Mode=Read;'+
        'Bind Flags=0;ADSI Flag=-2147483648';
    ADConnection.LoginPrompt := false;

    result := true;

    //������������� ������ ������� � AD
    ADQuery := TADOQuery.Create(nil);
    ADQuery.SQL.Text := 'SELECT DisplayName FROM  ''LDAP://'+domainName+''' where DisplayName='''+first_letter+'*''';
    ADQuery.Connection := ADConnection;
    try
      ADOpen;
      if not ADQuery.IsEmpty then
      begin
        ADQuery.First;
        while not ADQuery.Eof do
        begin
          all_users.Add(ADQuery.fieldByName('DisplayName').AsString);
          ADQuery.Next;
        end
      end
    except    //�� ������ ������������ � ��
      result := false;
    end;
    ADClose;
    ADQuery.Destroy;
end;

function TUtility.load_list(table, col: string;
  var list: TStringList): boolean;
begin
  DBQuery.SQL.Text:= 'SELECT * FROM '+table;
  result := false;
  try
    DBOpen;
    if not DBQuery.IsEmpty then
    begin
      DBQuery.First;
      while not DBQuery.Eof do
      begin
        list.Add(DBQuery.fieldByName(col).AsString);
        DBQuery.Next;
        result := true;
      end;
    end;
  except
    ShowMessage('�������� �������� ��� ��������� ������ �� ��.');
  end;
  DBClose;
end;

end.
