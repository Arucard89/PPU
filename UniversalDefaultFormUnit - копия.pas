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
    valueList: TstringList;//������ ������� ��� �������� �� ������

  public
    { Public declarations }
    procedure Set_config(Title:String; LabelName:String; List: TStringList);//������������� ������ ��� ��������� �������� �������� �������� � ������ ���������
    //Title - ��� ��������� ����, labelName - ��� ������� ���� �����, List - ������ ��������� ��������
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
  valueList:= TStringList.Create; //�������� ������
  valueList.Text := list.Text;
end;

procedure TUniversalDefaultForm.OKBtnClick(Sender: TObject);
begin
//��������� ��������
  if (LabeledEdit1.Text = '') then
    ShowMessage('������ �� �������.')
  else
    if (valueList.IndexOfName(LabeledEdit1.Text) < 0) then
      ModalResult := mrOk
    else
      ShowMessage('������ �������� ��������� ��� ����������');
end;

destructor TUniversalDefaultForm.destroy;
begin
  valueList.Destroy;
  inherited;
end;

procedure TUniversalDefaultForm.FormCreate(Sender: TObject);
begin
  //����������� ����� �� ������
  self.Left := (screen.Width - self.Width) div 2;
  self.Top := (screen.Height - self.Height) div 2;

end;

end.
