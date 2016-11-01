program SplashText;

uses
  Forms,
  UnitM in 'UnitM.pas' {FrmSplashText},
  UnitText in 'UnitText.pas' {FrmText};

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.CreateForm(TFrmSplashText, FrmSplashText);
  Application.CreateForm(TFrmText, FrmText);
  Application.Run;
end.
