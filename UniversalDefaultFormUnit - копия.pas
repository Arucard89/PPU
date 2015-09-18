unit UniversalDefaultFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TUniversalDefaultForm = class(TForm)
    LabeledEdit1: TLabeledEdit;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;

    procedure OKBtnClick(Sender: TObject);
    destructor Destroy;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    valueList: TstringList;//список величин для проверки на повтор

  public
    { Public declarations }
    procedure Set_config(Title:String; LabelName:String; List: TStringList);//устанавливает список уже имеющихся значений вводимой величины и другие параметры
    //Title - имя заголовка окна, labelName - имя подписи окна ввода, List - список имеющихся значений
  end;

{var
  UniversalDefaultForm: TUniversalDefaultForm;}

implementation

{$R *.dfm}

{ TUniversalDefaultForm }

procedure TUniversalDefaultForm.Set_config(Title:String; LabelName:String; List: TStringList);
begin
//  Inherited Create;
  self.Caption := title;
  LabeledEdit1.EditLabel.Caption := LabelName;
  valueList:= TStringList.Create; //копируем список
  valueList.Text := list.Text;
end;

procedure TUniversalDefaultForm.OKBtnClick(Sender: TObject);
begin
//выполняем проверку
  if (LabeledEdit1.Text = '') then
    ShowMessage('Данные не введены.')
  else
    if (valueList.IndexOfName(LabeledEdit1.Text) < 0) then
      ModalResult := mrOk
    else
      ShowMessage('Данное значение параметра уже существует');
end;

destructor TUniversalDefaultForm.destroy;
begin
  valueList.Destroy;
  inherited;
end;

procedure TUniversalDefaultForm.FormCreate(Sender: TObject);
begin
  //выравниваем форму по центру
  self.Left := (screen.Width - self.Width) div 2;
  self.Top := (screen.Height - self.Height) div 2;

end;

end.
