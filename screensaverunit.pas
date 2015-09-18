unit screensaverunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TScreensaver = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Screensaver: TScreensaver;

implementation

{$R *.dfm}

procedure TScreensaver.FormCreate(Sender: TObject);
begin
  //выравниваем форму по центру
  self.Left := (screen.Width - self.Width) div 2;
  self.Top := (screen.Height - self.Height) div 2;

end;

end.
