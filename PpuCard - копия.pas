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
    okFlag: boolean; //���� ������� �� ������ "��"

    procedure load_Ppu_Types; //��������� ������ ����� ���
    procedure load_Services; // ��������� ������ �����
    function card_filling_checking: boolean;  //�������� ���������� ��������
    procedure select_necessary_line; //����� ������� ������ ��� ���� � ������

    Procedure load_authors;//��������� �������

  public
    { Public declarations }
    procedure set_Font(f:TFont); //��������� ������ �� ���� ����
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

procedure TPPUCardForm.load_Services;
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

procedure TPPUCardForm.FormCreate(Sender: TObject);
begin
  load_Ppu_Types;
  load_Services;
  load_authors;
  //����������� ����� �� ������
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
    ShowMessage('�� �������� ����� ���');
    exit;
  end;
  if PpuTypeBox.ItemIndex = -1 then
  begin
    showMessage('�� ������ ��� ���.');
    result := false;
    Exit;
  end;
  if ServiceBox.ItemIndex =  -1 then
  begin
    ShowMessage('�� ������� ������.');
    result := false;
    Exit;
  end;
  if trim(AuthorBox.Text) = '' then
  begin
    ShowMessage('�� ������ �����.');
    result := false;
    Exit;
  end;
  if Trim(ProblemMemo.Text) = '' then
  begin
    ShowMessage('�� ��������� ��������.');
    result := false;
    Exit;
  end;
  if Trim(OfferMemo.Text) = '' then
  begin
    ShowMessage('�� ��������� �����������.');
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
    //�������� ��� ���
    PpuTypeBox.ItemIndex := PpuTypeBox.Items.IndexOf(DataModule1.ListDBQuery.FieldByName('c48').AsString);
    //�������� ������
    ServiceBox.ItemIndex := ServiceBox.Items.IndexOf(DataModule1.ListDBQuery.FieldByName('c15').AsString);
    //�������� ������
    AuthorBox.Text := DataModule1.ListDBQuery.FieldByName('c9').AsString;
  end;
end;

procedure TPPUCardForm.FormShow(Sender: TObject);
begin
  okFlag := false; //������ ����� �� �������

  if self.Caption = '�������� ������ ���(��������������)' then
    select_necessary_line;

  if self.Caption = '�������� ������ ���(�������� ���)' then //���� ��������� ����� � ������ ���������
  begin
    select_necessary_line;
    CancelButton.Visible := false;
    PpuTypeBox.ReadOnly := True;
    ServiceBox.ReadOnly := True;
    OfferMemo.ReadOnly := True;
    ProblemMemo.ReadOnly := true;
    AuthorBox.Enabled := false;

     okFlag := true; //����� ������ ����������� ��� �������.
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
    okFlag := true; //������ ������
    self.ModalResult := mrOK;
  end
end;

procedure TPPUCardForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if okFlag = false then //���� ������ �� �������� �������� �� �� ������ ��
    if MessageDlg('������ �������� �������� � �������� ���� ��� ���������� ��������� ������.'+
                      #13#10 + '�� ������������� �������� ����?',mtWarning,[mbYes, mbNo],0) = mrYes then
      CanClose := True
    else
      CanClose := False;
end;

end.
