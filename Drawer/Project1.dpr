program Project1;

uses
  Forms,SysUtils,
  Main in 'Main.pas' {Form1},
  Unit2 in 'Unit2.pas' {frmSplash};

{$R *.res}

begin

 Application.Initialize;
  frmSplash := TfrmSplash.Create(nil) ;
  frmSplash.Show;
  frmSplash.Update;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  // sleep for 3 sec. So that we can see the Splash screen. The same we can use for any process//
  while frmSplash.ProgressBar1.Position < 100 do
  begin
    frmSplash.ProgressBar1.Position := frmSplash.ProgressBar1.Position+20;
    Sleep(1000);
  end;
  frmSplash.Hide;
  frmSplash.Free;
  Application.Run;

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
