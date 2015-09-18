program PPU;

uses
  Forms,
  PpuCard in 'PpuCard.pas' {PPUCardForm},
  UtilitsUnit in 'UtilitsUnit.pas',
  PPU_list_Unit in 'PPU_list_Unit.pas' {PPU_list},
  dataUnit in 'dataUnit.pas' {DataModule1: TDataModule},
  EditPPUonAdminMode in 'EditPPUonAdminMode.pas' {AdminModePPUForm},
  EditDefaultInfo in 'EditDefaultInfo.pas' {EditDefaultInfoForm},
  ChangeAdm in 'ChangeAdm.pas' {ChangeAdmForm},
  UniversalDefaultFormUnit in 'UniversalDefaultFormUnit.pas' {UniversalDefaultForm},
  PasswordUnit in 'PasswordUnit.pas' {PasswordForm},
  screensaverunit in 'screensaverunit.pas' {Screensaver};

//translation in 'translation.pas';

// PpuEditCard in 'PpuEditCard.pas' {PPUEditCardForm};

{$R *.res}

begin
  Application.Initialize;
  utility := TUtility.Create;
 // Application.CreateForm(TPPUMain, PPUMain);
  Application.CreateForm(TDataModule1, DataModule1);
//  Application.CreateForm(TScreensaver, Screensaver);
  //Application.CreateForm(TPasswordForm, PasswordForm);
  // Application.CreateForm(TUniversalDefaultForm, UniversalDefaultForm);
  // Application.CreateForm(TChangeAdmForm, ChangeAdmForm);
  Application.CreateForm(TPPU_list, PPU_list);
  //Application.CreateForm(TEditDefaultInfoForm, EditDefaultInfoForm);
  //Application.CreateForm(TAdminModePPUForm, AdminModePPUForm);
  //Application.CreateForm(TPPUEditCardForm, PPUEditCardForm);
  //Application.CreateForm(TUtility, Utility);
  //Application.CreateForm(TPPUCardForm, PPUCardForm);
  Application.Run;
end.
