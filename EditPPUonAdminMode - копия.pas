unit EditPPUonAdminMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ComCtrls,UtilitsUnit, dataUnit, Mask,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TAdminModePPUForm = class(TForm)
    OKButton: TBitBtn;
    CancelButton: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ProblemMemo: TDBMemo;
    OfferMemo: TDBMemo;
    PpuTypeBox: TDBListBox;
    ServiceBox: TDBListBox;
    DateInSS: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    NeedDate: TDateTimePicker;
    ExecutionDate: TDateTimePicker;
    SS: TDBListBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    operationsAmount: TDBEdit;
    ExecutionTimeBefore: TDBEdit;
    ExecutionTimeAfter: TDBEdit;
    Label13: TLabel;
    Status: TDBListBox;
    noteMemo: TDBMemo;
    Label14: TLabel;
    Label15: TLabel;
    DescriptionMemo: TDBMemo;
    Label16: TLabel;
    ExecutorBox: TComboBox;
    Label17: TLabel;
    PPUAuthorEdit: TDBEdit;
    PPUNumbEdit: TDBEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    //procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    okFlag: boolean; //флаг нажатия на кнопку "ОК"

    procedure load_Ppu_Types; //загружаем список типов ппу
    procedure load_Services; // загружаем список служб
    Procedure load_statuses; // загружаем список статусов ППУ
    procedure load_dates; //загрузка дат
    Procedure load_executors;//заполняем исполнителей
    {function card_filling_checking: boolean;  //Проверка заполнения карточки  }
    procedure select_necessary_line;
    function check_fullfillment:boolean; //проверяем, заполнена ли карточка админом


  public
    { Public declarations }
    oldService:string; //имя ответственной службы на момент
    procedure set_Font(f:TFont); //установка шрифта во всем окне
  end;

{var
  AdminModePPUForm: TAdminModePPUForm;}

implementation

uses DB;

{$R *.dfm}

procedure TAdminModePPUForm.load_Ppu_Types;
begin
  PpuTypeBox.Clear;   //чистим комбо
  with Utility do
  Begin
    DBQuery.SQL.Text := 'SELECT * FROM t_ppuType'; //запрос на столбец типов
    try
      //DBQuery.Open;
      DBOpen;
      if not DBQuery.IsEmpty  then
      begin
        DBQuery.First;
        while not DBQuery.Eof do //заполняем комбо
        begin
          PpuTypeBox.Items.Add( DBQuery.FieldByName('type').AsString );
          DBQuery.Next;
        end
      end
      else
        ShowMessage('Не удалось загрузить список типов ППУ');
    finally
      //DBQuery.Close;
      DBClose;
    end;
  End
end;

procedure TAdminModePPUForm.load_Services;
begin
  ServiceBox.Clear;   //чистим комбо
  ss.Clear;
  with Utility do
  Begin
    DBQuery.SQL.Text := 'SELECT * FROM t_services'; //запрос на столбец названий
    try
      //DBQuery.Open;
      DBOpen;
      if not DBQuery.IsEmpty  then
      begin
        DBQuery.First;
        while not DBQuery.Eof do //заполняем комбо
        begin
          ServiceBox.Items.Add( DBQuery.FieldByName('title').AsString );
          SS.Items.Add( DBQuery.FieldByName('title').AsString );
          DBQuery.Next;
        end
      end
      else
        ShowMessage('Не удалось загрузить список Служб');
    finally
      //DBQuery.Close;
      DBClose;
    end;
  End
end;

procedure TAdminModePPUForm.load_statuses;
begin
  Status.Clear;   //чистим комбо
  with Utility do
  Begin
    DBQuery.SQL.Text := 'SELECT * FROM t_status'; //запрос на столбец статусов
    try
      //DBQuery.Open;
      DBOpen;
      if not DBQuery.IsEmpty  then
      begin
        DBQuery.First;
        while not DBQuery.Eof do //заполняем комбо
        begin
          Status.Items.Add( DBQuery.FieldByName('Status').AsString );
          DBQuery.Next;
        end
      end
      else
        ShowMessage('Не удалось загрузить список статусов');
    finally
      //DBQuery.Close;
      DBClose;
    end;
  End
end;

procedure TAdminModePPUForm.FormCreate(Sender: TObject);
begin
  load_Ppu_Types;
  load_Services;
  load_statuses;
  load_dates;
  load_executors;

  okFlag := false; //кнопарь не нажат

  //выравниваем форму по центру
  self.Left := (screen.Width - self.Width) div 2;
  self.Top := (screen.Height - self.Height) div 2;

end;

{function TAdminModePPUForm.card_filling_checking: boolean;
begin
  result := true;
  if PpuTypeBox.ItemIndex = -1 then
  begin
    showMessage('Не выбран тип ППУ.');
    result := false;
    Exit;
  end;
  if ServiceBox.ItemIndex =  -1 then
  begin
    ShowMessage('Не выбрана служба.');
    result := false;
  end;
  if Trim(ProblemMemo.Text) = '' then
  begin
    ShowMessage('Не заполнена проблема.');
    result := false;
  end;
  if Trim(OfferMemo.Text) = '' then
  begin
    ShowMessage('Не заполнено предложение.');
    result := false;
  end;
end;  }

procedure TAdminModePPUForm.select_necessary_line;
var
  i, j: integer;
begin
  with DataModule1.ListDBQuery do
  begin
    //выделяем тип ППУ
    PpuTypeBox.ItemIndex := PpuTypeBox.Items.IndexOf(FieldByName('c48').AsString);
    //выделяем службу
    ServiceBox.ItemIndex := ServiceBox.Items.IndexOf(FieldByName('c15').AsString);
    ss.ItemIndex := SS.Items.IndexOf(FieldByName('c33').AsString);
    //выделяем статус
    status.ItemIndex := status.Items.IndexOf(FieldByName('c52').AsString);
    //записываем Исполнителя
    ExecutorBox.Text := fieldByName('c16').AsString;
  end;
end;

procedure TAdminModePPUForm.FormShow(Sender: TObject);
begin
    select_necessary_line;
   // OfferMemo.ReadOnly := True;
   // ProblemMemo.ReadOnly := true;
end;

procedure TAdminModePPUForm.OKButtonClick(Sender: TObject);
begin
  //если статус "закрыто", то проверяем заполненность всех полей
  if status.Items.IndexOf('Закрыто') = status.ItemIndex then
  begin
    if check_fullfillment = true then
    begin
      with DataModule1.ListDBQuery do
      begin
        FieldByName('c32').AsDateTime := DateInSS.Date;
        FieldByName('c38').AsDateTime := NeedDate.Date;
        FieldByName('c40').AsDateTime := ExecutionDate.Date;
      end;
      self.ModalResult := mrOK;
    end
  end
  else  //при любом другом статусе
  begin
    with DataModule1.ListDBQuery do
      begin
        FieldByName('c32').AsDateTime := DateInSS.Date;
        FieldByName('c38').AsDateTime := NeedDate.Date;
        FieldByName('c40').AsDateTime := ExecutionDate.Date;
      end;
      okFlag := true; //нажали кнопку
      self.ModalResult := mrOK;
  end
end;

procedure TAdminModePPUForm.load_dates;
begin
  //если какое-то из полей пустое, то грузим сегодняшнюю дату
  with DataModule1.ListDBQuery do
  begin
    if fieldByName('c32').AsString = '' then
      DateInSS.Date := Date
    else
      DateInSS.DateTime := fieldByName('c32').AsDateTime;
    if fieldByName('c38').AsString = '' then
      NeedDate.DateTime := Date
    else
      NeedDate.DateTime := fieldByName('c38').AsDateTime;
    if fieldByName('c40').AsString = '' then
      ExecutionDate.DateTime := Date
    else
      ExecutionDate.DateTime := fieldByName('c40').AsDateTime;
  end;
end;

procedure TAdminModePPUForm.load_executors;

begin
  ExecutorBox.Items.Text := utility.all_users.Text;
end;

function TAdminModePPUForm.check_fullfillment: boolean;
begin
{  result := true;
  if trim(PPUNumbEdit.Text) = '' then
  begin
    result := false;
    ShowMessage('Не заполнен номер ППУ');
    exit;
  end;  }
  if trim(operationsAmount.Text) = '' then
  begin
    result := false;
    ShowMessage('Не заполнено количество операций в год');
    exit;
  end;
  if trim(ExecutionTimeBefore.Text) = '' then
  begin
    result := false;
    ShowMessage('Не заполнено время вып. операции ДО');
    exit;
  end;
  if trim(ExecutionTimeAfter.Text) = '' then
  begin
    result := false;
    ShowMessage('Не заполнено время вып. операции ПОСЛЕ');
    exit;
  end;

  if trim(ExecutorBox.Text) = '' then
  begin
    result := false;
    ShowMessage('Не выбран исполнитель смежной службы');
    exit;
  end;

  if trim(noteMemo.Lines.Text) = ''  then
  begin
    result := false;
    ShowMessage('Не заполнено примечание');
    exit;
  end;

  if trim(DescriptionMemo.Lines.Text) = '' then
  begin
    result := false;
    ShowMessage('Не заполнена проблема (НС описание)');
    exit;
  end;

end;

procedure TAdminModePPUForm.set_Font(f: TFont);
begin
  PpuTypeBox.Font := f;
  ServiceBox.Font := f;
  ProblemMemo.Font := f;
  OfferMemo.Font := f;
  PPUNumbEdit.Font := f;
  DateInSS.Font := f;
  ss.Font := f;
  Status.Font := f;
  NeedDate.Font := f;
  ExecutionDate.Font := f;
  operationsAmount.Font := f;
  ExecutionTimeBefore.Font := f;
  ExecutionTimeAfter.Font := f;
  ExecutorBox.Font := f;
  noteMemo.Font := f;
  DescriptionMemo.Font := f;
  PPUAuthorEdit.Font := f;
end;

procedure TAdminModePPUForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if okFlag = false then //если запрос на закрытие поступил не от кнопки ОК
    if MessageDlg('Данное действие приведет к закрытию окна без сохранения введенных данных.'+
                      #13#10 + 'Вы подтверждаете закрытие окна?',mtWarning,[mbYes, mbNo],0) = mrYes then
      CanClose := True
    else
      CanClose := False;
end;

end.
