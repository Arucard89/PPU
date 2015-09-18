unit PpuEditCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMemo, cxDBEdit, cxImageComboBox, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls, Buttons, UtilitsUnit,
  DBCtrls, dataUnit;

type
  TPPUEditCardForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CancelButton: TBitBtn;
    OKButton: TBitBtn;
    PPUTypeBox: TDBComboBox;
    ServiceBox: TDBComboBox;
    ProblemMemo: TDBMemo;
    OfferMemo: TDBMemo;

    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure load_Ppu_Types; //��������� ������ ����� ���
    procedure load_Services; // ��������� ������ �����
    function card_filling_checking: boolean;  //�������� ���������� ��������

  public
    { Public declarations }
  end;

var
  PPUEditCardForm: TPPUEditCardForm;

implementation

{$R *.dfm}

procedure TPPUEditCardForm.load_Ppu_Types;
begin
  PpuTypeBox.Clear;   //������ �����
  with Utility do
  Begin
    DBQuery.SQL.Text := 'SELECT * FROM t_ppuType'; //������ �� ������� �����
    try
      //DBQuery.Open;
      DBOpen;
      if not DBQuery.IsEmpty  then
      begin
        DBQuery.First;
        while not DBQuery.Eof do //��������� �����
        begin
          PpuTypeBox.Items.Add( DBQuery.FieldByName('type').AsString );
          DBQuery.Next;
        end
      end
      else
        ShowMessage('�� ������� ��������� ������ ����� ���');
    finally
      //DBQuery.Close;
      DBClose;
    end;
  End
end;

procedure TPPUEditCardForm.load_Services;
begin
  ServiceBox.Clear;   //������ �����
  with Utility do
  Begin
    DBQuery.SQL.Text := 'SELECT * FROM t_services'; //������ �� ������� ��������
    try
      //DBQuery.Open;
      DBOpen;
      if not DBQuery.IsEmpty  then
      begin
        DBQuery.First;
        while not DBQuery.Eof do //��������� �����
        begin
          ServiceBox.Items.Add( DBQuery.FieldByName('title').AsString );
          DBQuery.Next;
        end
      end
      else
        ShowMessage('�� ������� ��������� ������ �����');
    finally
      //DBQuery.Close;
      DBClose;
    end;
  End
end;


function TPPUEditCardForm.card_filling_checking: boolean;
var flag:boolean;
begin
  flag := true;
  if PpuTypeBox.ItemIndex = -1 then
  begin
    showMessage('�� ������ ��� ���.');
    flag := false;
  end;
  if ServiceBox.ItemIndex =  -1 then
  begin
    ShowMessage('�� ������� ������.');
    flag := false;
  end;
  if Trim(ProblemMemo.Lines.Text) = '' then
  begin
    ShowMessage('�� ��������� ��������.');
    flag := false;
  end;
  if Trim(OfferMemo.Lines.Text) = '' then
  begin
    ShowMessage('�� ��������� �����������.');
    flag := false;
  end;
  result := flag;
end;

procedure TPPUEditCardForm.FormCreate(Sender: TObject);
begin
  load_Ppu_Types;
  load_Services;
end;

end.
