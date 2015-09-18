unit PPU_list_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, UtilitsUnit ,dataUnit, StdCtrls, Buttons,
  ComCtrls, PPUCard, EditPPUonAdminMode,cxGridStrs, ExtCtrls, PasswordUnit, EditDefaultInfo, screensaverunit;

type
  TPPU_list = class(TForm)
    PPUCxGridLevel1: TcxGridLevel;
    PPUCxGrid: TcxGrid;
    PPUCxGridDBTableView1: TcxGridDBTableView;
    PPUCxGridDBTableView1c4: TcxGridDBColumn;
    PPUCxGridDBTableView1c5: TcxGridDBColumn;
    PPUCxGridDBTableView1c9: TcxGridDBColumn;
    PPUCxGridDBTableView1c15: TcxGridDBColumn;
    PPUCxGridDBTableView1c27: TcxGridDBColumn;
    PPUCxGridDBTableView1c48: TcxGridDBColumn;
    PPUCxGridDBTableView1c52: TcxGridDBColumn;
    PPUCxGridDBTableView1c219: TcxGridDBColumn;
    PPUCxGridDBTableView1c16: TcxGridDBColumn;
    PPUCxGridDBTableView1c26: TcxGridDBColumn;
    PPUCxGridDBTableView1c32: TcxGridDBColumn;
    PPUCxGridDBTableView1c33: TcxGridDBColumn;
    PPUCxGridDBTableView1c38: TcxGridDBColumn;
    PPUCxGridDBTableView1c40: TcxGridDBColumn;
    PPUCxGridDBTableView1c43: TcxGridDBColumn;
    PPUCxGridDBTableView1c46: TcxGridDBColumn;
    PPUCxGridDBTableView1c47: TcxGridDBColumn;
    PPUCxGridDBTableView1c54: TcxGridDBColumn;
    PPUCxGridDBTableView1c220: TcxGridDBColumn;
    Panel1: TPanel;
    NewPPUButton: TBitBtn;
    EditPPUButton: TBitBtn;
    ViewPPUButton: TBitBtn;
    DeleteButton: TBitBtn;
    WorkWithPPUCheck: TCheckBox;
    AdmEditButton: TBitBtn;
    FullViewCheck: TCheckBox;
    WrapAllButton: TBitBtn;
    UnwrapAllButton: TBitBtn;
    Button1: TButton;
    PPUCxGridDBTableView1DBColumn1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure EditPPUButtonClick(Sender: TObject);
    procedure NewPPUButtonClick(Sender: TObject);
    procedure ViewPPUButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure PPUCxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure WorkWithPPUCheckClick(Sender: TObject);
    procedure AdmEditButtonClick(Sender: TObject);
    procedure FullViewCheckClick(Sender: TObject);
    procedure WrapAllButtonClick(Sender: TObject);
    procedure UnwrapAllButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PPUCxGridDBTableView1DBColumn1GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    PPUCardForm: TPPUCardForm;  //����� ����� ���
    element_font: TFont; //����� ��� ���������
    AdminModePPUForm: TAdminModePPUForm; //����� ����� ��� ��� ��������� ���������������
    PasswordForm: TPasswordForm; //����� ����� ������
    EditDefaultInfoForm: TEditDefaultInfoForm; //����� �������������� �������� ����������
  public
    { Public declarations }
    procedure disable_col_editing; //������ �������� ��������� � �������
    procedure hide_columns_for_user; //���� ������������ �� �����, �� �������� ������ �������
    procedure fulfill_new_PPU; //�������������� ���������� ����� �����
    procedure hide_WorkWithPPUCheck; //������ ������ ������ � ��� ��� �� ������
    procedure make_admin_table_view; //������ ������� ��� ������ � ������ ������
    procedure make_all_columns_visible; //������ ��� ������� ��������
    procedure make_user_table_view;   //������ ������� ��� �������� �����
    procedure set_columns_width(w : integer);  //��������� ������ ��������
    //procedure set_Font(f:TFont); //��������� ������ �� ���� ����������
    procedure write_service_information; //������ ��������� ���������� ��� ��������� �������� � ������ ��������������
    procedure copy_edited_record; //����������� ���������� ������ � ������ ��������������

end;

const
  FONT_SIZE = 12;

var
  PPU_list: TPPU_list;



implementation

uses PpuEditCard;

{$R *.dfm}



procedure TPPU_list.FormCreate(Sender: TObject);
var font: TFont;
begin
  //��������
  Screensaver := TScreensaver.Create(self);
  Screensaver.Show;
  //������ ������ �� ����
  DataModule1.ListDBConnection.Open;
  DataModule1.ListDBQuery.Open;
  PPUCxGridDBTableView1.DataController.DataSource := DataModule1.ListDataSource;
  //��������� ��������������
 // disable_col_editing;
  //�������� �� ����� ��������
  hide_columns_for_user;
  //������ �������� ������ � ���, ���� ������������ �� �����
  hide_WorkWithPPUCheck;
  //������������� �����
  element_font := TFont.Create();
  element_font.Name := 'Arial';
  element_font.Size := 10;
  //set_Font(element_font);
  //����������� ���������� �������� �������
  //new_PPU.
  //����������� ����� �� ������
  self.Left := (screen.Width - self.Width) div 2;
  self.Top := (screen.Height - self.Height) div 2;
  Screensaver.Destroy;
end;



procedure TPPU_list.disable_col_editing;
var
  i: integer;
begin
  for i := 0 to PPUCxGridDBTableView1.ColumnCount - 1 do
    PPUCxGridDBTableView1.Columns[i].Options.Editing := false;
end;

procedure TPPU_list.hide_columns_for_user;
var i: integer;
  w: integer;
begin
  w := PPUCxGrid.Width div 8; //�������� ������ ������ �������
  set_columns_width(w);
  with PPUCxGridDBTableView1 do
  begin
      Columns[5].Visible := false;
      Columns[6].Visible := false;
      Columns[8].Visible := false;
      Columns[9].Visible := false;
      Columns[10].Visible := false;
      Columns[11].Visible := false;
      Columns[12].Visible := false;
      Columns[13].Visible := false;
      Columns[14].Visible := false;
      Columns[17].Visible := false;
      Columns[19].Visible := false;
  end
end;

procedure TPPU_list.EditPPUButtonClick(Sender: TObject);
begin
  if WorkWithPPUCheck.Checked = false then //���� � ������ �������� �����
  begin
    PPUCardForm := TPPUCardForm.Create(self);
    PPUCardForm.Caption := PPUCardForm.Caption + '(��������������)';
    DataModule1.ListDBQuery.Edit;
    if PPUCardForm.ShowModal = mrOk then
    begin
      //����� ��������� ��������� ������� ���� � ����� ���������
      DataModule1.ListDBQuery.FieldByName('serviceField_date_of_editing').Value := DateTostr(Date);
      DataModule1.ListDBQuery.FieldByName('serviceField_editor').Value := utility.FIO;
      DataModule1.ListDBQuery.Post;
    end
    else
      DataModule1.ListDBQuery.Cancel;
    PPUCardForm.Destroy;
  end;
end;

procedure TPPU_list.NewPPUButtonClick(Sender: TObject);
begin
  PPUCardForm := TPPUCardForm.Create(self);
  PPUCardForm.set_Font(element_font);
  PPUCardForm.Caption := PPUCardForm.Caption + '(�������� ������ ���)';
  DataModule1.ListDBQuery.Insert;
  if PPUcardForm.ShowModal = mrOK then
    with DataModule1.ListDBQuery do
    begin
      fulfill_new_PPU;
      Post;
    end
  else
    DataModule1.ListDBQuery.Cancel;
  PPUcardForm.Destroy;
  DataModule1.refresh_query;
end;

procedure TPPU_list.ViewPPUButtonClick(Sender: TObject); //������ ��� ���������
begin
  if DataModule1.ListDBQuery.IsEmpty then //���� ��� ������� � �������
    Exit;
  PPUCardForm := TPPUCardForm.Create(self);
  PPUCardForm.set_Font(element_font);
  PPUCardForm.Caption := PPUCardForm.Caption + '(�������� ���)';
  PPUCardForm.ShowModal;
  PPUCardForm.Destroy;
end;

procedure TPPU_list.DeleteButtonClick(Sender: TObject);
begin
  if MessageDlg('������ �������� �������� � �������� ���������� ��� �� ���� ������!',
  mtWarning, mbOKCancel, 0 ) = mrOK then
  begin
    DataModule1.ListDBQuery.Delete;
  end
end;


procedure TPPU_list.PPUCxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
  str, str1, str3:string;
  b1,b2,b3:boolean;
begin
  if WorkWithPPUCheck.Checked = false then //���� �� � ������ ��������������
  begin
    with DataModule1.ListDBQuery do
    begin
      str := FieldByName('c9').AsString;
      str1 := FieldByname('c52').AsString;
      str3 := FieldByname('ServiceField_creator').AsString;
      b1 := str = Utility.FIO;
      b2 := str = Utility.user;
      b3 := str3 = Utility.FIO;
      if (b1 or b2 or b3) and (str1 = '�����')  then    //������ ������������� � ������� �������� ������ ����� ��� ������������ ����� � ��� ��� �����, ������� ��������� ������� ���
      begin
        DeleteButton.Enabled := true;
        EditPPUButton.Enabled := true;
        PPUCxGridDBTableView1.OptionsData.Deleting := true; //��������� �������� �� ����������
      end
      else
      begin
        DeleteButton.Enabled := false;
        EditPPUButton.Enabled := false;
        PPUCxGridDBTableView1.OptionsData.Deleting := false;
      end
    end
  end
end;



procedure TPPU_list.fulfill_new_PPU;
begin
  with DataModule1.ListDBQuery do
  begin
    FieldByName('c5').Value := DateToStr(Date);
    FieldByName('c9').Value := PPUCardForm.AuthorBox.Text;
    FieldByName('c52').Value := '�����';
    FieldByName('ServiceField_date_of_creation').Value := DateToStr(Date);
    FieldByName('ServiceField_creator').Value := utility.FIO;
  end
end;

procedure TPPU_list.hide_WorkWithPPUCheck;
begin
  if utility.admin then
    WorkWithPPUCheck.Visible := true
  else
    WorkWithPPUCheck.Visible := false;
end;

procedure TPPU_list.WorkWithPPUCheckClick(Sender: TObject);
begin
  if WorkWithPPUCheck.Checked then
    make_admin_table_view
  else
    make_user_table_view;
end;

procedure TPPU_list.make_admin_table_view;
var i:integer;
  s:string;
begin
  //������ ������ ������ �� ��� ���, � ������� ������ ������������ �������� �������
  with DataModule1.ListDBQuery do
  begin
    Close;
    SQL.Clear; //���������� ������ ��� ���������� �����
    s := 'SELECT * FROM t_main WHERE c15 =' + QuotedStr(utility.adm_services.ValueFromIndex[0]);
    for i:=1 to utility.adm_services.Count - 1 do
      s := s + ' OR c15 = ' + QuotedStr(utility.adm_services.ValueFromIndex[i]);
    SQL.Text := s;
    Open;
  end;
  //������ ��� ������� ��������
  make_all_columns_visible;
  //��������� ������ �������� ������
  NewPPUButton.Enabled := false;
  ViewPPUButton.Enabled := false;
  DeleteButton.Enabled := false;
  EditPPUButton.Enabled := false;
  FullViewCheck.Enabled := false;
  //�������� ������ ������
  AdmEditButton.Visible := true
end;

procedure TPPU_list.make_user_table_view;
begin
  hide_columns_for_user;
  //�������� ������ �������� ������
  NewPPUButton.Enabled := true;
  ViewPPUButton.Enabled := true;
  DeleteButton.Enabled := true;
  EditPPUButton.Enabled := true;
  FullViewCheck.Enabled := true;
  FullViewCheck.Checked := false;
  //��������� ������ ������
  AdmEditButton.Visible := false;
  //������ ������ �� ��������� ����� ������ ���
    with DataModule1.ListDBQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM t_main';
    Open;
  end;

end;

procedure TPPU_list.make_all_columns_visible;
var i:integer;
  w: integer;
begin
  with PPUCxGridDBTableView1 do
  begin
    //�������� ������ �������
    w := PPUCxGrid.Width div ColumnCount;
    //set_columns_width(w);
    for i := 0 to ColumnCount - 1 do
    begin
      Columns[i].Visible := true;
    end;
  end
end;

procedure TPPU_list.set_columns_width(w: integer);
var i:integer;
begin
  for i := 0 to PPUCxGridDBTableView1.ColumnCount - 1 do
    PPUCxGridDBTableView1.Columns[i].Width := w;
end;

procedure TPPU_list.AdmEditButtonClick(Sender: TObject);
begin
  DataModule1.ListDBQuery.Edit;
  AdminModePPUForm := TAdminModePPUForm.Create(self);
  AdminModePPUForm.set_font(element_font);
  if AdminModePPUForm.ShowModal = mrOK then
  Begin  //����� ���������� � ����
    with DataModule1.ListDBQuery do
    begin
      FieldByName('c16').Value := AdminModePPUForm.ExecutorBox.Text;
      //����� ��������� ����
      write_service_information;
      Post;
      //���������� ������ � ������� ���������
      copy_edited_record;
    end
  end
  else
    DataModule1.ListDBQuery.Cancel;
  AdminModePPUForm.Destroy;
end;
{
procedure TPPU_list.set_Font(f:TFont);
begin
  //���� ����������� ����� ���������� �����
  PPUCxGrid.Font := f;
  NewPPUButton.Font := f;
  ViewPPUButton.Font := f;
  DeleteButton.Font := f;
  EditPPUButton.Font := f;
  WorkWithPPUCheck.Font := f;
  AdmEditButton.Font := f;
  FullViewCheck.Font := f;
end;       }

procedure TPPU_list.FullViewCheckClick(Sender: TObject);
begin
//������/�������� ���
  if FullViewCheck.Checked then
    make_all_columns_visible
  else
    hide_columns_for_user;
end;

procedure TPPU_list.write_service_information;
begin
  with DataModule1.ListDBQuery do
  begin
    FieldByName('ServiceField_editor').Value := utility.FIO;
    FieldByName('ServiceField_date_of_editing').Value := DateToStr(Date);
  end

end;

procedure TPPU_list.copy_edited_record;
begin
  with utility do
  begin
    DBQuery.SQL.Clear;
    DBQuery.SQL.Text := 'INSERT INTO t_main_history_of_changes SELECT * FROM t_main where t_main.id = '+
      DataModule1.ListDBQuery.fieldByName('id').AsString;
    DBQuery.ExecSQL;
  end
end;

procedure TPPU_list.WrapAllButtonClick(Sender: TObject);
begin
  PPUCxGridDBTableView1.ViewData.Collapse(true);
end;

procedure TPPU_list.UnwrapAllButtonClick(Sender: TObject);
begin
  PPUCxGridDBTableView1.ViewData.Expand(true);
end;

procedure TPPU_list.Button1Click(Sender: TObject);
begin
  PasswordForm := TPasswordForm.Create(self);
  if PasswordForm.ShowModal = mrOk then
  begin
    PasswordForm.Destroy;
    EditDefaultInfoForm := TEditDefaultInfoForm.Create(self);
    EditDefaultInfoForm.ShowModal;
    EditDefaultInfoForm.Destroy;
  end
  else
    PasswordForm.Destroy;
end;



procedure TPPU_list.PPUCxGridDBTableView1DBColumn1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  AText := IntToStr(Sender.GridView.DataController.GetRowIndexByRecordIndex(ARecord.RecordIndex, false)+1);
end;



procedure TPPU_list.FormResize(Sender: TObject);
begin
   //������������ ������ ������� ��� ���������� ������
  PPUCxGridDBTableView1.OptionsView.ColumnAutoWidth := true;
  PPUcxGridDBTableView1.OptionsView.CellAutoHeight := true;

end;

end.


