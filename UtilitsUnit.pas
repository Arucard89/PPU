unit UtilitsUnit; //юнит для выполнения разных запросов к БД

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
    domainName: string; //имя домена
    user:string; //имя пользователя
    FIO:string;
    admin:boolean; //является ли пользователь админом
    //admin_service: string; //служба админа
    adm_services : TStringList; //Список служб админа
    all_users: TStringList; //список всех пользователей ФИО
    Services_list: TStringList;//список служб
    Statuses_list: TStringList;//список статусов ППУ
    types_list: TStringList;//список типов ППУ
    Procedure DBOpen;
    procedure DBClose;
    Procedure ADOpen;
    procedure ADClose;
    function get_FIO_from_AD: integer; //получаем ФИО пользователя из АД по логину
    function ask_admin_and_service (adminName:string; var services: TStringList): boolean;//узнаем является лми данный пользователь админом и какой службы
    function load_all_users_by_first_letter(first_letter:char):boolean; //ФИО всех пользователей  (параметр-первая буква фамилии(по-русски), поскольку не выгружает из АД больше 1000 записей за раз)
    function load_list(table: string; col: string; var list:TStringList ): boolean; //загрузка списка служб, статусов, служб
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

  //инициализация подключения к БД
  DBConnection := TADOConnection.Create(nil);
  {DBConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;'+
  'Data Source=.\DB\MyBase.mdb;Persist Security Info=True';
  }
  //DBConnection.Open;
  DBConnection.ConnectionString := 'Provider=SQLOLEDB.1;Password=y76NPXCkUjsCJ7NxSnNZ;Persist Security Info=True;User ID=Ppu-service;Initial Catalog=ppu-service;Data Source=GT-SRV38;Use Procedure for Prepare=1;';
  DBConnection.LoginPrompt := false;
  //инициализация строки запроса к БД
  DBQuery := TADOQuery.Create(nil);
  DBQuery.Connection := DBConnection;
  //DBQuery.Close;
  DBClose;

  //инициализация таблицы данных
  DBTable := TADOTable.Create(nil);
  DBTable.Connection := DBConnection;
  DBTable.Name := 't_main';
  DBTable.Close;

 //инициализация подключения к АД
  ADConnection := TADOConnection.Create(nil);
  ADConnection.ConnectionString := 'Provider=ADsDSOObject;Password=Student1;'+
      'User ID=gt\student1;Encrypt Password=False;Mode=Read;'+
      'Bind Flags=0;ADSI Flag=-2147483648';
  ADConnection.LoginPrompt := false;

  //получаем ФИО
  if get_FIO_from_AD <> 0 then
    FIO := user;

  //Создаем список служб администратора
  adm_services := TStringList.Create;

  //определяем ответственного и его службы
  admin := ask_admin_and_service(user, adm_services);
  //загружаем всех пользователей в список
  all_users := TStringList.Create;

  for ch:= 'а' to 'я' do
  begin
    if load_all_users_by_first_letter(ch) = false then
    begin
      ShowMessage('Возникли проблемы при подключении к AD.' + #13#10 + 'Список пользователей не получен.');
      break;
    end;
  end;

  //получаем список статусов ППУ
  Statuses_list := TStringList.Create;
  load_list( 't_status','status',Statuses_list);
   //  получаем список служб
  Services_list := TStringList.Create;
  load_list('t_Services','title',Services_list);
  //получаем список типов ППУ
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
//делаем запрос на получение списка админов
  DBQuery.SQL.Text := 'SELECT * from  T_admins INNER JOIN t_services ON service = id WHERE login = ' +QuotedStr(fio);
  result := false;
  try
    DBOpen;
    if not DBQuery.IsEmpty then
    begin
      //получаем имя службы админа
      result := true;
      DBQuery.First;
      while not DBQuery.Eof do
      begin
        services.Add (' '+DBQuery.fieldByName('title').AsString);
        DBQuery.Next;
      end;
    end
    {Else
      showmessage('Служба ответственного не определена.');   }
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
// убиваем все элементы подключения к БД
  DBClose;
  DBTable.Close;
  DBTable.Destroy;
  DBQuery.Destroy;
  DBConnection.Destroy;

{// убиаем подключение к АД
  ADClose;
  ADQuery.Destroy; }
  ADConnection.Destroy;

  inherited;

end;


function TUtility.get_FIO_from_AD: integer;
var fault:integer;
begin
  //инициализация подключения к АД
  ADConnection := TADOConnection.Create(nil);
  ADConnection.ConnectionString := 'Provider=ADsDSOObject;Password=Student1;'+
      'User ID=gt\student1;Encrypt Password=False;Mode=Read;'+
      'Bind Flags=0;ADSI Flag=-2147483648';
  ADConnection.LoginPrompt := false;
  //ADConnection.Open;

  //инициализация строки запроса к AD
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
  except    //не смогли подключиться к АД
    ShowMessage('Возникли проблемы при подключении к AD.' + #13#10 + 'В качестве имени будет записан логин.');
    fault := 2;
  end;
  ADClose;
  ADQuery.Destroy;
  result := fault;
end;

Function TUtility.load_all_users_by_first_letter(first_letter:char):boolean;
begin
    //инициализация подключения к АД
    ADConnection := TADOConnection.Create(nil);
    ADConnection.ConnectionString := 'Provider=ADsDSOObject;Password=Student1;'+
        'User ID=gt\student1;Encrypt Password=False;Mode=Read;'+
        'Bind Flags=0;ADSI Flag=-2147483648';
    ADConnection.LoginPrompt := false;

    result := true;

    //инициализация строки запроса к AD
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
    except    //не смогли подключиться к АД
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
    ShowMessage('Возникли проблемы при получении данных из БД.');
  end;
  DBClose;
end;

end.
