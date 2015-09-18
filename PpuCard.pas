unit PpuCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, UtilitsUnit, DB, ADODB, dataUnit,
  DBCtrls, Mask;

type
  TPPUCardForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CancelButton: TBitBtn;
    OKButton: TBitBtn;
    ProblemMemo: TDBMemo;
    OfferMemo: TDBMemo;
    PpuTypeBox: TDBListBox;
    ServiceBox: TDBListBox;
    Label6: TLabel;
    AuthorBox: TComboBox;
    PPUNumbEdit: TDBEdit;
    Label7: TLabel;
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
    function card_filling_checking: boolean;  //Проверка заполнения карточки
    procedure select_necessary_line; //Выбор нужного пункта для типа и службы

    Procedure load_authors;//заполняем авторов

  public
    { Public declarations }
    procedure set_Font(f:TFont); //установка шрифта во всем окне
  end;
                    {
var
  PPUCardForm: TPPUCardForm; }

implementation

uses DateUtils;

{$R *.dfm}

{ TPPUCardForm }

procedure TPPUCardForm.load_Ppu_Types;
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

procedure TPPUCardForm.load_Services;
begin
  ServiceBox.Clear;   //чистим комбо
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

procedure TPPUCardForm.FormCreate(Sender: TObject);
begin
  load_Ppu_Types;
  load_Services;
  load_authors;
  //выравниваем форму по центру
  self.Left := (screen.Width - self.Width) div 2;
  self.Top := (screen.Height - self.Height) div 2;

end;

function TPPUCardForm.card_filling_checking: boolean;
var flag:boolean;
begin
  result := true;
  if trim(PPUNumbEdit.Text) = '' then
  begin
    result := false;
    ShowMessage('Не заполнен номер ППУ');
    exit;
  end;
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
    Exit;
  end;
  if trim(AuthorBox.Text) = '' then
  begin
    ShowMessage('Не выбран автор.');
    result := false;
    Exit;
  end;
  if Trim(ProblemMemo.Text) = '' then
  begin
    ShowMessage('Не заполнена проблема.');
    result := false;
    Exit;
  end;
  if Trim(OfferMemo.Text) = '' then
  begin
    ShowMessage('Не заполнено предложение.');
    result := false;
    Exit;
  end;
end;

procedure TPPUCardForm.select_necessary_line;
var
  i, j: integer;
begin
  with DataModule1.ListDBQuery do
  begin
    //выделяем тип ППУ
    PpuTypeBox.ItemIndex := PpuTypeBox.Items.IndexOf(DataModule1.ListDBQuery.FieldByName('c48').AsString);
    //выделяем службу
    ServiceBox.ItemIndex := ServiceBox.Items.IndexOf(DataModule1.ListDBQuery.FieldByName('c15').AsString);
    //выделяем автора
    AuthorBox.Text := DataModule1.ListDBQuery.FieldByName('c9').AsString;
  end;
end;

procedure TPPUCardForm.FormShow(Sender: TObject);
begin
  okFlag := false; //кнопку никто не нажимал

  if self.Caption = 'Карточка подачи ППУ(редактирование)' then
    select_necessary_line;

  if self.Caption = 'Карточка подачи ППУ(Просмотр ППУ)' then //если появилась форма в режиме просмотра
  begin
    select_necessary_line;
    CancelButton.Visible := false;
    PpuTypeBox.ReadOnly := True;
    ServiceBox.ReadOnly := True;
    OfferMemo.ReadOnly := True;
    ProblemMemo.ReadOnly := true;
    AuthorBox.Enabled := false;

     okFlag := true; //чтобы всегда закрывалось без вопроса.
  end;
end;

procedure TPPUCardForm.set_Font(f: TFont);
begin

  PpuTypeBox.Font := f;
  ServiceBox.Font := f;
  ProblemMemo.Font := f;
  OfferMemo.Font := f;
  AuthorBox.Font := f;
end;

procedure TPPUCardForm.load_authors;
begin
  AuthorBox.Items.Text := utility.all_users.Text;
end;

procedure TPPUCardForm.OKButtonClick(Sender: TObject);
begin
  if card_filling_checking = true then
  begin
    okFlag := true; //нажали кнопку
    self.ModalResult := mrOK;
  end
end;

procedure TPPUCardForm.FormCloseQuery(Sender: TObject;
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
