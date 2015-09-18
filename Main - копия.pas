unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UtilitsUnit, PPUCard;

type
  TPPUMain = class(TForm) //форма карточки подачи ППУ
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  PPUMain: TPPUMain;

implementation

uses PPU_list_Unit;

{$R *.dfm}

procedure TPPUMain.FormCreate(Sender: TObject);
begin
//создаем формочку с утилитами
  //Application.CreateForm(TUtility, Utility);
  //utility.Close;
  //utility.Show;
  //utility.Visible := false;

  //Проверяем права пользователя
  utility.DBQuery.SQL.Text := 'SELECT * FROM t_admins where login = "'+
  utility.user+'"';
  try
    with utility do
    begin
      DBOpen;
      if DBQuery.IsEmpty then
      begin
        //BitBtn3.Enabled := false;
        BitBtn4.Enabled := false;
        self.Height := 179;
      end
    end;
    finally
      utility.DBClose;
    end;
end;

procedure TPPUMain.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TPPUCardForm, PPUCardForm);
  PPUcardForm.ShowModal;
  PPUcardForm.Destroy;
end;

procedure TPPUMain.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TPPU_list, PPU_list);
  PPU_List.ShowModal;

  PPU_List.Destroy;
end;

end.
