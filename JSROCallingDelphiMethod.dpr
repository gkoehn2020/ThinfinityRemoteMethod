program JSROCallingDelphiMethod;

uses
  VirtualUI_AutoRun,
  Vcl.Forms,
  frmUIMain in 'frmUIMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
