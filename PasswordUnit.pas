unit PasswordUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TPasswordForm = class(TForm)
    PassEdit: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  PasswordForm: TPasswordForm; }

implementation

{$R *.dfm}

procedure TPasswordForm.BitBtn1Click(Sender: TObject);
begin
  if PassEdit.Text = 'admin123456789' then
    ModalResult := mrOk
  else
    ShowMessage('Ќеверный пароль!');
  PassEdit.Text := '';
end;

procedure TPasswordForm.FormCreate(Sender: TObject);
begin
  //выравниваем форму по центру
  self.Left := (screen.Width - self.Width) div 2;
  self.Top := (screen.Height - self.Height) div 2;

end;

end.
