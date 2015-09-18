unit EditDefaultInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dataUnit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, ADODB, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, ChangeAdm, UtilitsUnit, UniversalDefaultFormUnit,
  Buttons;

type
  TEditDefaultInfoForm = class(TForm)
    GroupBox1: TGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    AdminDataSource: TDataSource;
    AdminQuery: TADOQuery;
    GroupBox2: TGroupBox;
    StatusQuery: TADOQuery;
    StatusSource: TDataSource;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    GroupBox3: TGroupBox;
    ServiceQuery: TADOQuery;
    ServiceSource: TDataSource;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    GroupBox4: TGroupBox;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    PPUTypeQuery: TADOQuery;
    PPUTypeSource: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid4DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid4DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid4DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid4DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid3DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    AddAdm: TButton;
    EditAdm: TButton;
    DeleteAdm: TButton;
    FullViewCheck: TCheckBox;
    BitBtn1: TBitBtn;
    procedure AddAdmClick(Sender: TObject);
    procedure EditAdmClick(Sender: TObject);
    procedure DeleteAdmClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject); //добавление нового статуса ППУ
    procedure Button5Click(Sender: TObject);  //изменение текущего статуса ППУ
    procedure Button6Click(Sender: TObject);  //удаление текущего статуса ППУ
    procedure Button7Click(Sender: TObject);  //добавление нового типа ППУ
    procedure Button8Click(Sender: TObject); //изменение текущего типа ППУ
    procedure Button9Click(Sender: TObject); //удаление текущего типа ППУ
    procedure Button10Click(Sender: TObject); //добавление новой службы
    procedure Button11Click(Sender: TObject); //изменение текущей службы
    procedure Button12Click(Sender: TObject); //удаление текущей службы
    procedure FullViewCheckClick(Sender: TObject);
  private
    { Private declarations }
    ChangeAdmForm: TChangeAdmForm;  //форма изменения информации об админах
    UniversalDefaultForm: TUniversalDefaultForm;  //форма изменения информации всего остального
    function deleterecord(tableName:string; fieldName:string; fieldValue:variant):boolean; //удаление записи из БД
    //tableName - имя таблицы; fieldName - имя поля по которому поиск идет; fieldValue - занчение поля
  public
    { Public declarations }
    Function find_value_in_querry(query:TADOQuery; paramName: string;
      param:Variant; searchFieldName: string; var res: variant):boolean;

  end;

{var
  EditDefaultInfoForm: TEditDefaultInfoForm;}

implementation

{$R *.dfm}

procedure TEditDefaultInfoForm.AddAdmClick(Sender: TObject);
var v: variant;
begin
  ChangeAdmForm := TChangeAdmForm.Create(self);
  if changeadmForm.ShowModal = mrOk then
  begin
    AdminQuery.Insert;
    if find_value_in_querry(ServiceQuery,'title',ChangeAdmForm.ServiceBox.Text,
      'id',v) = false then
    begin
      Showmessage('Возникла непредвиденная ошибка при добавлении данных администратора');
      AdminQuery.Cancel;
    end
    Else
    begin
      AdminQuery.FieldByName('login').AsString := ChangeAdmForm.HRBox.Text;
      AdminQuery.FieldByName('service').AsInteger := v;
      AdminQuery.FieldByName('DateOfChange').AsDateTime := Date;
      AdminQuery.FieldByName('Changer').AsString := Utility.user;
      AdminQuery.Post;
      AdminQuery.Close;
      AdminQuery.Open;
    end
  end;
  changeadmForm.Destroy;
end;

function TEditDefaultInfoForm.find_value_in_querry(query:TADOQuery; paramName: string;
      param:Variant; searchFieldName: string; var res: variant):boolean;
var f:boolean; //флаг окончания поиска
begin
  if query.RecordCount <= 0 then
    result := false
  else
  begin
    f:= false;
    query.First;
    While (not query.Eof) and (f = false) do //ищем перебором, пока не найдем
    begin
      if query.FieldByName(paramName).AsVariant = param then
      begin
        res := query.FieldByName(searchFieldName).AsVariant;
        f := true;
        result := true;
      end;
      query.Next;
    end
  end
end;

procedure TEditDefaultInfoForm.EditAdmClick(Sender: TObject);
var v: variant;
begin
  ChangeAdmForm := TChangeAdmForm.Create(self);
  ChangeAdmForm.Caption := ChangeAdmForm.Caption +' (изменение)';

  ChangeAdmForm.HRBox.Text := AdminQuery.FieldByName('login').AsString;
  ChangeAdmForm.ServiceBox.Text := AdminQuery.FieldByName('title').AsString;

  if changeadmForm.ShowModal = mrOk then
  begin
    AdminQuery.Edit;
    if find_value_in_querry(ServiceQuery,'title',ChangeAdmForm.ServiceBox.Text,
      'id',v) = false then
    begin
      Showmessage('Возникла непредвиденная ошибка при добавлении данных администратора');
      AdminQuery.Cancel;
    end
    Else
    begin
      AdminQuery.FieldByName('login').AsString := ChangeAdmForm.HRBox.Text;
      AdminQuery.FieldByName('service').AsInteger := v;
      AdminQuery.FieldByName('DateOfChange').AsDateTime := Date;
      AdminQuery.FieldByName('Changer').AsString := Utility.user;
      AdminQuery.Post;
      AdminQuery.Close;
      AdminQuery.Open;
    end
  end;
  changeadmForm.Destroy;
end;

procedure TEditDefaultInfoForm.DeleteAdmClick(Sender: TObject);
begin
  if MessageDlg('Вы действительно хотите удалить данную запись из базы?',mtwarning, mbOKCancel, 0) = mrOK then
  begin
    if not deleterecord('t_admins','id_n',AdminQuery.fieldByName('id_n').AsString) then
      ShowMessage('Возникла непредвиденная ошибка при удалении записи.');
    AdminQuery.Close;
    AdminQuery.Open;
  end
end;

procedure TEditDefaultInfoForm.FormCreate(Sender: TObject);
begin
//подключаем все таблицы к данным
  AdminQuery.Open;
  ServiceQuery.Open;
  PPUTypeQuery.Open;
  StatusQuery.Open;
  //скрываем информацию
  FullViewCheckClick(nil);
  //выравниваем форму по центру
  self.Left := (screen.Width - self.Width) div 2;
  self.Top := (screen.Height - self.Height) div 2;
end;

procedure TEditDefaultInfoForm.Button4Click(Sender: TObject);
begin
  UniversalDefaultForm := TUniversalDefaultForm.Create(self);
  UniversalDefaultForm.Set_config('Добавление статуса ППУ','Новый статус',Utility.Statuses_list);
  if UniversalDefaultForm.ShowModal = mrOk then
  begin
    //добавляем в базу
    StatusQuery.Insert;
    StatusQuery.FieldByName('status').AsString := UniversalDefaultForm.LabeledEdit1.Text;
    StatusQuery.FieldByName('DateOfChange').AsDateTime := Date;
    StatusQuery.FieldByName('Changer').AsString := Utility.user;
    StatusQuery.Post;
    //обновляем данные таблицы
    StatusQuery.Close;
    StatusQuery.Open;
    //обновляем список статусов
    Utility.Statuses_list.Clear;
    Utility.load_list( 't_status','status',Utility.Statuses_list);
  End;
  UniversalDefaultForm.Destroy;
end;

procedure TEditDefaultInfoForm.Button5Click(Sender: TObject);
begin
  UniversalDefaultForm := TUniversalDefaultForm.Create(self);
  UniversalDefaultForm.Set_config('Изменение статуса ППУ','Изменяемый статус',Utility.Statuses_list);
  UniversalDefaultForm.LabeledEdit1.Text := StatusQuery.FieldByName('status').AsString; //пишем текущий статус ППУ
  if UniversalDefaultForm.ShowModal = mrOk then
  begin
    //редактируем запись в БД
    StatusQuery.Edit;
    StatusQuery.FieldByName('status').AsString := UniversalDefaultForm.LabeledEdit1.Text;
    StatusQuery.FieldByName('DateOfChange').AsDateTime := Date;
    StatusQuery.FieldByName('Changer').AsString := Utility.user;
    StatusQuery.Post;
    //обновляем данные таблицы
    StatusQuery.Close;
    StatusQuery.Open;
    //обновляем список статусов
    Utility.Statuses_list.Clear;
    Utility.load_list( 't_status','status',Utility.Statuses_list);
  End;
  UniversalDefaultForm.Destroy;
end;

procedure TEditDefaultInfoForm.Button6Click(Sender: TObject);
begin
  if MessageDlg('Вы действительно хотите удалить данный статус из базы?',mtwarning, mbOKCancel, 0) = mrOK then
  Begin
    //Если ОК, то удаляем запись
    StatusQuery.Delete;
    //обновляем данные таблицы
    StatusQuery.Close;
    StatusQuery.Open;
    //обновляем список статусов
    Utility.Statuses_list.Clear;
    Utility.load_list( 't_status','status',Utility.Statuses_list);
  end
end;

procedure TEditDefaultInfoForm.Button7Click(Sender: TObject);
begin
  UniversalDefaultForm := TUniversalDefaultForm.Create(self);
  UniversalDefaultForm.Set_config('Добавление типа ППУ','Новый тип',Utility.types_list);
  if UniversalDefaultForm.ShowModal = mrOk then
  begin
    //добавляем в базу
    PPUTypeQuery.Insert;
    PPUTypeQuery.FieldByName('type').AsString := UniversalDefaultForm.LabeledEdit1.Text;
    PPUTypeQuery.FieldByName('DateOfChange').AsDateTime := Date;
    PPUTypeQuery.FieldByName('Changer').AsString := Utility.user;
    PPUTypeQuery.Post;
    //обновляем данные таблицы
    PPUTypeQuery.Close;
    PPUTypeQuery.Open;
    //обновляем список типов
    Utility.types_list.Clear;
    Utility.load_list( 't_pputype','type',Utility.Statuses_list);
  End;
  UniversalDefaultForm.Destroy;
end;

procedure TEditDefaultInfoForm.Button8Click(Sender: TObject);
begin
  UniversalDefaultForm := TUniversalDefaultForm.Create(self);
  UniversalDefaultForm.Set_config('Изменение типа ППУ','Изменяемый тип',Utility.Statuses_list);
  UniversalDefaultForm.LabeledEdit1.Text := PPUTypeQuery.FieldByName('type').AsString; //пишем текущий тип ППУ
  if UniversalDefaultForm.ShowModal = mrOk then
  begin
    //редактируем запись в БД
    PPUTypeQuery.Edit;
    PPUTypeQuery.FieldByName('type').AsString := UniversalDefaultForm.LabeledEdit1.Text;
    PPUTypeQuery.FieldByName('DateOfChange').AsDateTime := Date;
    PPUTypeQuery.FieldByName('Changer').AsString := Utility.user;
    PPUTypeQuery.Post;
    //обновляем данные таблицы
    PPUTypeQuery.Close;
    PPUTypeQuery.Open;
    //обновляем список типов
    Utility.Statuses_list.Clear;
    Utility.load_list( 't_pputype','type',Utility.Statuses_list);
  End;
  UniversalDefaultForm.Destroy;
end;


procedure TEditDefaultInfoForm.Button9Click(Sender: TObject);
begin
  if MessageDlg('Вы действительно хотите удалить данный тип из базы?',mtwarning, mbOKCancel, 0) = mrOK then
  Begin
    //Если ОК, то удаляем запись
    PPUTypeQuery.Delete;
    //обновляем данные таблицы
    PPUTypeQuery.Close;
    PPUTypeQuery.Open;
    //обновляем список типов
    Utility.Statuses_list.Clear;
    Utility.load_list( 't_pputype','type',Utility.Statuses_list);
  end
end;

procedure TEditDefaultInfoForm.Button10Click(Sender: TObject);
begin
  UniversalDefaultForm := TUniversalDefaultForm.Create(self);
  UniversalDefaultForm.Set_config('Добавление службы','Новая служба',Utility.Services_list);
  if UniversalDefaultForm.ShowModal = mrOk then
  begin
    //добавляем в базу
    ServiceQuery.Insert;
    ServiceQuery.FieldByName('title').AsString := UniversalDefaultForm.LabeledEdit1.Text;
    ServiceQuery.FieldByName('DateOfChange').AsDateTime := Date;
    ServiceQuery.FieldByName('Changer').AsString := Utility.user;
    ServiceQuery.Post;
    //обновляем данные таблицы
    ServiceQuery.Close;
    ServiceQuery.Open;
    //обновляем список служб
    Utility.Services_list.Clear;
    Utility.load_list( 't_services','title',Utility.Services_list);
  End;
  UniversalDefaultForm.Destroy;
end;

procedure TEditDefaultInfoForm.Button11Click(Sender: TObject);
begin
  UniversalDefaultForm := TUniversalDefaultForm.Create(self);
  UniversalDefaultForm.Set_config('Изменение названия службы','Изменяемое название',Utility.Statuses_list);
  UniversalDefaultForm.LabeledEdit1.Text := ServiceQuery.FieldByName('title').AsString; //пишем текущую службу
  if UniversalDefaultForm.ShowModal = mrOk then
  begin
    //редактируем запись в БД
    ServiceQuery.Edit;
    ServiceQuery.FieldByName('title').AsString := UniversalDefaultForm.LabeledEdit1.Text;
    ServiceQuery.FieldByName('DateOfChange').AsDateTime := Date;
    ServiceQuery.FieldByName('Changer').AsString := Utility.user;
    ServiceQuery.Post;
    //обновляем данные таблицы
    ServiceQuery.Close;
    ServiceQuery.Open;
    //обновляем список типов
    Utility.Services_list.Clear;
    Utility.load_list( 't_services','title',Utility.Services_list);
  End;
  UniversalDefaultForm.Destroy;
end;

procedure TEditDefaultInfoForm.Button12Click(Sender: TObject);
begin
if MessageDlg('Вы действительно хотите удалить данную службу из базы?',mtwarning, mbOKCancel, 0) = mrOK then
  Begin
    //Если ОК, то удаляем запись
    ServiceQuery.Delete;
    //обновляем данные таблицы
    ServiceQuery.Close;
    ServiceQuery.Open;
    //обновляем список типов
    Utility.Services_list.Clear;
    Utility.load_list( 't_services','title',Utility.Services_list);
  end;
end;

procedure TEditDefaultInfoForm.FullViewCheckClick(Sender: TObject);
begin
  If FullViewCheck.Checked then //если поставили галочку, то отображаем инфу по изменениям
  begin
  //таблица админов
    cxGrid1DBTableView1DBColumn3.Visible := true;
    cxGrid1DBTableView1DBColumn4.Visible := true;
    cxGrid1DBTableView1.OptionsView.CellAutoHeight := true;
    cxGrid1DBTableView1.OptionsView.ColumnAutoWidth := true;

    //таблицы статусов
    cxGrid2DBTableView1DBColumn3.Visible := true;
    cxGrid2DBTableView1DBColumn4.Visible := true;
    cxGrid2DBTableView1.OptionsView.CellAutoHeight := true;
    cxGrid2DBTableView1.OptionsView.ColumnAutoWidth := true;

    //таблицы типов
    cxGrid4DBTableView1DBColumn3.Visible := true;
    cxGrid4DBTableView1DBColumn4.Visible := true;
    cxGrid4DBTableView1.OptionsView.CellAutoHeight := true;
    cxGrid4DBTableView1.OptionsView.ColumnAutoWidth := true;

    //таблицы служб
    cxGrid3DBTableView1DBColumn3.Visible := true;
    cxGrid3DBTableView1DBColumn4.Visible := true;
    cxGrid3DBTableView1.OptionsView.CellAutoHeight := true;
    cxGrid3DBTableView1.OptionsView.ColumnAutoWidth := true;
  End
  else
  begin
  //таблица админов
    cxGrid1DBTableView1DBColumn3.Visible := false;
    cxGrid1DBTableView1DBColumn4.Visible := false;
    cxGrid1DBTableView1.OptionsView.CellAutoHeight := true;
    cxGrid1DBTableView1.OptionsView.ColumnAutoWidth := true;

    //таблицы статусов
    cxGrid2DBTableView1DBColumn3.Visible := false;
    cxGrid2DBTableView1DBColumn4.Visible := false;
    cxGrid2DBTableView1.OptionsView.CellAutoHeight := true;
    cxGrid2DBTableView1.OptionsView.ColumnAutoWidth := true;

    //таблицы типов
    cxGrid4DBTableView1DBColumn3.Visible := false;
    cxGrid4DBTableView1DBColumn4.Visible := false;
    cxGrid4DBTableView1.OptionsView.CellAutoHeight := true;
    cxGrid4DBTableView1.OptionsView.ColumnAutoWidth := true;

    //таблицы служб
    cxGrid3DBTableView1DBColumn3.Visible := false;
    cxGrid3DBTableView1DBColumn4.Visible := false;
    cxGrid3DBTableView1.OptionsView.CellAutoHeight := true;
    cxGrid3DBTableView1.OptionsView.ColumnAutoWidth := true;
  End;
end;

function TEditDefaultInfoForm.deleterecord(tableName, fieldName: string;
  fieldValue: variant): boolean;
var q:TADOQuery;
begin
  q:= TADOQuery.Create(nil);
  q.Connection := DataModule1.ListDBConnection;
  q.SQL.Text := 'SELECT * FROM ' + tableName +
    ' WHERE ' + fieldName + ' = ' + fieldValue;
  try
    q.Open;
    if not q.IsEmpty then
    begin
      q.Delete;
      result := true;
    end
    else
      result := false;
  except
    result:= false;
  end;
  q.Close
end;

end.
