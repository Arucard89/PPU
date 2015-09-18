unit ChangeAdm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UtilitsUnit;

type
  TChangeAdmForm = class(TForm)
    Label1: TLabel;
    ServiceBox: TComboBox;
    CancelBtn: TBitBtn;
    OKBtn: TBitBtn;
    Label2: TLabel;
    HRBox: TComboBox;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  ChangeAdmForm: TChangeAdmForm;
 }
implementation

{$R *.dfm}

procedure TChangeAdmForm.OKBtnClick(Sender: TObject);
begin
  if (serviceBox.ItemIndex < 0) or (HRBox.ItemIndex < 0) then
    ShowMessage('«аполнены не все пол€')
  else
    ModalResult := mrOk;
end;

procedure TChangeAdmForm.FormCreate(Sender: TObject);
begin
  ServiceBox.Items.Text := utility.Services_list.text;
  HRBox.Items.Text := utility.all_users.Text;
  //выравниваем форму по центру
  self.Left := (screen.Width - self.Width) div 2;
  self.Top := (screen.Height - self.Height) div 2;

end;

end.
